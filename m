From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 15:20:22 +0200
Subject: [Buildroot] [git commit] busybox: add hush patch for version 1.18.4
Message-ID: <20110516132327.6059E834CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e860d5f5d169d609c644d9e5d0e8c0a46a7bb68c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.4/busybox-1.18.4-hush.patch       |  160 ++++++++++++++++++++
 1 files changed, 160 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.4/busybox-1.18.4-hush.patch

diff --git a/package/busybox/busybox-1.18.4/busybox-1.18.4-hush.patch b/package/busybox/busybox-1.18.4/busybox-1.18.4-hush.patch
new file mode 100644
index 0000000..4e995af
--- /dev/null
+++ b/package/busybox/busybox-1.18.4/busybox-1.18.4-hush.patch
@@ -0,0 +1,160 @@
+--- busybox-1.18.4/shell/hush.c
++++ busybox-1.18.4-hush/shell/hush.c
+@@ -427,6 +427,15 @@ enum {
+ /* Used for initialization: o_string foo = NULL_O_STRING; */
+ #define NULL_O_STRING { NULL }
+ 
++#ifndef debug_printf_parse
++static const char *const assignment_flag[] = {
++	"MAYBE_ASSIGNMENT",
++	"DEFINITELY_ASSIGNMENT",
++	"NOT_ASSIGNMENT",
++	"WORD_IS_KEYWORD",
++};
++#endif
++
+ /* I can almost use ordinary FILE*.  Is open_memstream() universally
+  * available?  Where is it documented? */
+ typedef struct in_str {
+@@ -2885,24 +2894,24 @@ static const struct reserved_combo* matc
+ 	 */
+ 	static const struct reserved_combo reserved_list[] = {
+ # if ENABLE_HUSH_IF
+-		{ "!",     RES_NONE,  NOT_ASSIGNMENT , 0 },
+-		{ "if",    RES_IF,    WORD_IS_KEYWORD, FLAG_THEN | FLAG_START },
+-		{ "then",  RES_THEN,  WORD_IS_KEYWORD, FLAG_ELIF | FLAG_ELSE | FLAG_FI },
+-		{ "elif",  RES_ELIF,  WORD_IS_KEYWORD, FLAG_THEN },
+-		{ "else",  RES_ELSE,  WORD_IS_KEYWORD, FLAG_FI   },
+-		{ "fi",    RES_FI,    NOT_ASSIGNMENT , FLAG_END  },
++		{ "!",     RES_NONE,  NOT_ASSIGNMENT  , 0 },
++		{ "if",    RES_IF,    MAYBE_ASSIGNMENT, FLAG_THEN | FLAG_START },
++		{ "then",  RES_THEN,  MAYBE_ASSIGNMENT, FLAG_ELIF | FLAG_ELSE | FLAG_FI },
++		{ "elif",  RES_ELIF,  MAYBE_ASSIGNMENT, FLAG_THEN },
++		{ "else",  RES_ELSE,  MAYBE_ASSIGNMENT, FLAG_FI   },
++		{ "fi",    RES_FI,    NOT_ASSIGNMENT  , FLAG_END  },
+ # endif
+ # if ENABLE_HUSH_LOOPS
+-		{ "for",   RES_FOR,   NOT_ASSIGNMENT , FLAG_IN | FLAG_DO | FLAG_START },
+-		{ "while", RES_WHILE, WORD_IS_KEYWORD, FLAG_DO | FLAG_START },
+-		{ "until", RES_UNTIL, WORD_IS_KEYWORD, FLAG_DO | FLAG_START },
+-		{ "in",    RES_IN,    NOT_ASSIGNMENT , FLAG_DO   },
+-		{ "do",    RES_DO,    WORD_IS_KEYWORD, FLAG_DONE },
+-		{ "done",  RES_DONE,  NOT_ASSIGNMENT , FLAG_END  },
++		{ "for",   RES_FOR,   NOT_ASSIGNMENT  , FLAG_IN | FLAG_DO | FLAG_START },
++		{ "while", RES_WHILE, MAYBE_ASSIGNMENT, FLAG_DO | FLAG_START },
++		{ "until", RES_UNTIL, MAYBE_ASSIGNMENT, FLAG_DO | FLAG_START },
++		{ "in",    RES_IN,    NOT_ASSIGNMENT  , FLAG_DO   },
++		{ "do",    RES_DO,    MAYBE_ASSIGNMENT, FLAG_DONE },
++		{ "done",  RES_DONE,  NOT_ASSIGNMENT  , FLAG_END  },
+ # endif
+ # if ENABLE_HUSH_CASE
+-		{ "case",  RES_CASE,  NOT_ASSIGNMENT , FLAG_MATCH | FLAG_START },
+-		{ "esac",  RES_ESAC,  NOT_ASSIGNMENT , FLAG_END  },
++		{ "case",  RES_CASE,  NOT_ASSIGNMENT  , FLAG_MATCH | FLAG_START },
++		{ "esac",  RES_ESAC,  NOT_ASSIGNMENT  , FLAG_END  },
+ # endif
+ 	};
+ 	const struct reserved_combo *r;
+@@ -2968,6 +2977,7 @@ static int reserved_word(o_string *word,
+ 	ctx->ctx_res_w = r->res;
+ 	ctx->old_flag = r->flag;
+ 	word->o_assignment = r->assignment_flag;
++	debug_printf_parse("word->o_assignment='%s'\n", assignment_flag[word->o_assignment]);
+ 
+ 	if (ctx->old_flag & FLAG_END) {
+ 		struct parse_context *old;
+@@ -3034,18 +3044,6 @@ static int done_word(o_string *word, str
+ 		debug_printf_parse("word stored in rd_filename: '%s'\n", word->data);
+ 		ctx->pending_redirect = NULL;
+ 	} else {
+-		/* If this word wasn't an assignment, next ones definitely
+-		 * can't be assignments. Even if they look like ones. */
+-		if (word->o_assignment != DEFINITELY_ASSIGNMENT
+-		 && word->o_assignment != WORD_IS_KEYWORD
+-		) {
+-			word->o_assignment = NOT_ASSIGNMENT;
+-		} else {
+-			if (word->o_assignment == DEFINITELY_ASSIGNMENT)
+-				command->assignment_cnt++;
+-			word->o_assignment = MAYBE_ASSIGNMENT;
+-		}
+-
+ #if HAS_KEYWORDS
+ # if ENABLE_HUSH_CASE
+ 		if (ctx->ctx_dsemicolon
+@@ -3065,8 +3063,9 @@ static int done_word(o_string *word, str
+ 		 && ctx->ctx_res_w != RES_CASE
+ # endif
+ 		) {
+-			debug_printf_parse("checking '%s' for reserved-ness\n", word->data);
+-			if (reserved_word(word, ctx)) {
++			int reserved = reserved_word(word, ctx);
++			debug_printf_parse("checking for reserved-ness: %d\n", reserved);
++			if (reserved) {
+ 				o_reset_to_empty_unquoted(word);
+ 				debug_printf_parse("done_word return %d\n",
+ 						(ctx->ctx_res_w == RES_SNTX));
+@@ -3087,6 +3086,23 @@ static int done_word(o_string *word, str
+ 					"groups and arglists don't mix\n");
+ 			return 1;
+ 		}
++
++		/* If this word wasn't an assignment, next ones definitely
++		 * can't be assignments. Even if they look like ones. */
++		if (word->o_assignment != DEFINITELY_ASSIGNMENT
++		 && word->o_assignment != WORD_IS_KEYWORD
++		) {
++			word->o_assignment = NOT_ASSIGNMENT;
++		} else {
++			if (word->o_assignment == DEFINITELY_ASSIGNMENT) {
++				command->assignment_cnt++;
++				debug_printf_parse("++assignment_cnt=%d\n", command->assignment_cnt);
++			}
++			debug_printf_parse("word->o_assignment was:'%s'\n", assignment_flag[word->o_assignment]);
++			word->o_assignment = MAYBE_ASSIGNMENT;
++		}
++		debug_printf_parse("word->o_assignment='%s'\n", assignment_flag[word->o_assignment]);
++
+ 		if (word->has_quoted_part
+ 		 /* optimization: and if it's ("" or '') or ($v... or `cmd`...): */
+ 		 && (word->data[0] == '\0' || word->data[0] == SPECIAL_VAR_SYMBOL)
+@@ -4105,6 +4121,7 @@ static struct pipe *parse_stream(char **
+ 			 && is_well_formed_var_name(dest.data, '=')
+ 			) {
+ 				dest.o_assignment = DEFINITELY_ASSIGNMENT;
++				debug_printf_parse("dest.o_assignment='%s'\n", assignment_flag[dest.o_assignment]);
+ 			}
+ 			continue;
+ 		}
+@@ -4154,6 +4171,7 @@ static struct pipe *parse_stream(char **
+ 					heredoc_cnt = 0;
+ 				}
+ 				dest.o_assignment = MAYBE_ASSIGNMENT;
++				debug_printf_parse("dest.o_assignment='%s'\n", assignment_flag[dest.o_assignment]);
+ 				ch = ';';
+ 				/* note: if (is_blank) continue;
+ 				 * will still trigger for us */
+@@ -4203,6 +4221,7 @@ static struct pipe *parse_stream(char **
+ 			}
+ 			done_pipe(&ctx, PIPE_SEQ);
+ 			dest.o_assignment = MAYBE_ASSIGNMENT;
++			debug_printf_parse("dest.o_assignment='%s'\n", assignment_flag[dest.o_assignment]);
+ 			/* Do we sit outside of any if's, loops or case's? */
+ 			if (!HAS_KEYWORDS
+ 			 IF_HAS_KEYWORDS(|| (ctx.ctx_res_w == RES_NONE && ctx.old_flag == 0))
+@@ -4309,6 +4328,7 @@ static struct pipe *parse_stream(char **
+ 			/* ch is a special char and thus this word
+ 			 * cannot be an assignment */
+ 			dest.o_assignment = NOT_ASSIGNMENT;
++			debug_printf_parse("dest.o_assignment='%s'\n", assignment_flag[dest.o_assignment]);
+ 		}
+ 
+ 		/* Note: nommu_addchr(&ctx.as_string, ch) is already done */
+@@ -4406,6 +4426,7 @@ static struct pipe *parse_stream(char **
+ 			/* We just finished a cmd. New one may start
+ 			 * with an assignment */
+ 			dest.o_assignment = MAYBE_ASSIGNMENT;
++			debug_printf_parse("dest.o_assignment='%s'\n", assignment_flag[dest.o_assignment]);
+ 			break;
+ 		case '&':
+ 			if (done_word(&dest, &ctx)) {
-- 
1.7.3.4

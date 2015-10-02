From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 20:59:04 +0200
Subject: [Buildroot] [git commit] libnftnl: bump to version 1.0.5
Message-ID: <20151002190156.565C381775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f0d14b28a75b40c0e3a53fcfcf953a5da872cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-to-libnftnl_xfree-to-avoid-symbol-namin.patch |  436 ++++++++++++-------
 package/libnftnl/libnftnl.hash                     |    4 +-
 package/libnftnl/libnftnl.mk                       |    2 +-
 3 files changed, 278 insertions(+), 164 deletions(-)

diff --git a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index eda5b4b..26c9d2e 100644
--- a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -20,35 +20,48 @@ To solve this, this patch renames the libnftnl xfree() function to
 libnftnl_xfree().
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Gustavo: update for version 1.0.3]
+[Gustavo: update for version 1.0.5]
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- src/chain.c          | 18 +++++++++---------
+ include/utils.h      |  2 +-
+ src/chain.c          | 28 ++++++++++++++--------------
  src/common.c         |  2 +-
- src/expr.c           |  2 +-
- src/expr/data_reg.c  |  2 +-
+ src/expr.c           |  4 ++--
+ src/expr/data_reg.c  |  4 ++--
  src/expr/immediate.c |  2 +-
  src/expr/log.c       |  6 +++---
  src/expr/match.c     |  6 +++---
  src/expr/target.c    |  6 +++---
  src/gen.c            |  2 +-
- src/internal.h       |  2 +-
  src/mxml.c           |  2 +-
- src/rule.c           | 24 ++++++++++++------------
+ src/rule.c           | 26 +++++++++++++-------------
  src/ruleset.c        |  2 +-
- src/set.c            | 18 +++++++++---------
- src/set_elem.c       | 10 +++++-----
- src/table.c          | 12 ++++++------
+ src/set.c            | 22 +++++++++++-----------
+ src/set_elem.c       | 16 ++++++++--------
+ src/table.c          | 14 +++++++-------
  src/utils.c          |  2 +-
- 17 files changed, 59 insertions(+), 59 deletions(-)
+ 17 files changed, 73 insertions(+), 73 deletions(-)
 
+diff --git a/include/utils.h b/include/utils.h
+index f7436fa..e03ee3b 100644
+--- a/include/utils.h
++++ b/include/utils.h
+@@ -17,7 +17,7 @@
+ 
+ #define __noreturn	__attribute__((__noreturn__))
+ 
+-#define xfree(ptr)	free((void *)ptr);
++#define nftnl_xfree(ptr)	free((void *)ptr);
+ 
+ #define div_round_up(n, d)	(((n) + (d) - 1) / (d))
+ 
 diff --git a/src/chain.c b/src/chain.c
-index b67385e..9ccde54 100644
+index 8a8e8b8..37a27b1 100644
 --- a/src/chain.c
 +++ b/src/chain.c
-@@ -89,11 +89,11 @@ EXPORT_SYMBOL(nft_chain_alloc);
- void nft_chain_free(struct nft_chain *c)
+@@ -96,13 +96,13 @@ EXPORT_SYMBOL(nftnl_chain_alloc, nft_chain_alloc);
+ void nftnl_chain_free(struct nftnl_chain *c)
  {
  	if (c->table != NULL)
 -		xfree(c->table);
@@ -56,97 +69,143 @@ index b67385e..9ccde54 100644
  	if (c->type != NULL)
 -		xfree(c->type);
 +		nftnl_xfree(c->type);
+ 	if (c->dev != NULL)
+-		xfree(c->dev);
++		nftnl_xfree(c->dev);
  
 -	xfree(c);
 +	nftnl_xfree(c);
  }
- EXPORT_SYMBOL(nft_chain_free);
+ EXPORT_SYMBOL(nftnl_chain_free, nft_chain_free);
  
-@@ -111,7 +111,7 @@ void nft_chain_attr_unset(struct nft_chain *c, uint16_t attr)
+@@ -120,7 +120,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  	switch (attr) {
- 	case NFT_CHAIN_ATTR_TABLE:
+ 	case NFTNL_CHAIN_TABLE:
  		if (c->table) {
 -			xfree(c->table);
 +			nftnl_xfree(c->table);
  			c->table = NULL;
  		}
  		break;
-@@ -119,7 +119,7 @@ void nft_chain_attr_unset(struct nft_chain *c, uint16_t attr)
+@@ -128,7 +128,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  		break;
- 	case NFT_CHAIN_ATTR_TYPE:
+ 	case NFTNL_CHAIN_TYPE:
  		if (c->type) {
 -			xfree(c->type);
 +			nftnl_xfree(c->type);
  			c->type = NULL;
  		}
  		break;
-@@ -164,7 +164,7 @@ void nft_chain_attr_set_data(struct nft_chain *c, uint16_t attr,
+@@ -143,7 +143,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+ 		break;
+ 	case NFTNL_CHAIN_DEV:
+ 		if (c->dev) {
+-			xfree(c->dev);
++			nftnl_xfree(c->dev);
+ 			c->dev = NULL;
+ 		}
+ 		break;
+@@ -179,7 +179,7 @@ void nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
- 	case NFT_CHAIN_ATTR_TABLE:
+ 	case NFTNL_CHAIN_TABLE:
  		if (c->table)
 -			xfree(c->table);
 +			nftnl_xfree(c->table);
  
  		c->table = strdup(data);
  		break;
-@@ -194,7 +194,7 @@ void nft_chain_attr_set_data(struct nft_chain *c, uint16_t attr,
+@@ -209,13 +209,13 @@ void nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
- 	case NFT_CHAIN_ATTR_TYPE:
+ 	case NFTNL_CHAIN_TYPE:
  		if (c->type)
 -			xfree(c->type);
 +			nftnl_xfree(c->type);
  
  		c->type = strdup(data);
  		break;
-@@ -915,7 +915,7 @@ void nft_chain_list_free(struct nft_chain_list *list)
+ 	case NFTNL_CHAIN_DEV:
+ 		if (c->dev)
+-			xfree(c->dev);
++			nftnl_xfree(c->dev);
+ 
+ 		c->dev = strdup(data);
+ 		break;
+@@ -535,7 +535,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+ 		c->flags |= (1 << NFTNL_CHAIN_NAME);
+ 	}
+ 	if (tb[NFTA_CHAIN_TABLE]) {
+-		xfree(c->table);
++		nftnl_xfree(c->table);
+ 		c->table = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TABLE]));
+ 		c->flags |= (1 << NFTNL_CHAIN_TABLE);
+ 	}
+@@ -562,7 +562,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+ 		c->flags |= (1 << NFTNL_CHAIN_HANDLE);
+ 	}
+ 	if (tb[NFTA_CHAIN_TYPE]) {
+-		xfree(c->type);
++		nftnl_xfree(c->type);
+ 		c->type = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TYPE]));
+ 		c->flags |= (1 << NFTNL_CHAIN_TYPE);
+ 	}
+@@ -976,7 +976,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
  		list_del(&r->head);
- 		nft_chain_free(r);
+ 		nftnl_chain_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nft_chain_list_free);
+ EXPORT_SYMBOL(nftnl_chain_list_free, nft_chain_list_free);
  
-@@ -994,6 +994,6 @@ EXPORT_SYMBOL(nft_chain_list_iter_next);
+@@ -1061,6 +1061,6 @@ EXPORT_SYMBOL(nftnl_chain_list_iter_next, nft_chain_list_iter_next);
  
- void nft_chain_list_iter_destroy(struct nft_chain_list_iter *iter)
+ void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nft_chain_list_iter_destroy);
+ EXPORT_SYMBOL(nftnl_chain_list_iter_destroy, nft_chain_list_iter_destroy);
 diff --git a/src/common.c b/src/common.c
-index a6f2508..735b098 100644
+index 43d2cfd..0bc814d 100644
 --- a/src/common.c
 +++ b/src/common.c
-@@ -48,7 +48,7 @@ EXPORT_SYMBOL(nft_parse_err_alloc);
+@@ -58,7 +58,7 @@ EXPORT_SYMBOL(nftnl_parse_err_alloc, nft_parse_err_alloc);
  
- void nft_parse_err_free(struct nft_parse_err *err)
+ void nftnl_parse_err_free(struct nftnl_parse_err *err)
  {
 -	xfree(err);
 +	nftnl_xfree(err);
  }
- EXPORT_SYMBOL(nft_parse_err_free);
+ EXPORT_SYMBOL(nftnl_parse_err_free, nft_parse_err_free);
  
 diff --git a/src/expr.c b/src/expr.c
-index 55557da..d23af01 100644
+index 3249a5c..8563d9e 100644
 --- a/src/expr.c
 +++ b/src/expr.c
-@@ -52,7 +52,7 @@ void nft_rule_expr_free(struct nft_rule_expr *expr)
+@@ -50,7 +50,7 @@ void nftnl_expr_free(struct nftnl_expr *expr)
  	if (expr->ops->free)
  		expr->ops->free(expr);
  
 -	xfree(expr);
 +	nftnl_xfree(expr);
  }
- EXPORT_SYMBOL(nft_rule_expr_free);
+ EXPORT_SYMBOL(nftnl_expr_free, nft_rule_expr_free);
+ 
+@@ -257,7 +257,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
+ 	return expr;
  
+ err2:
+-	xfree(expr);
++	nftnl_xfree(expr);
+ err1:
+ 	return NULL;
+ }
 diff --git a/src/expr/data_reg.c b/src/expr/data_reg.c
-index 33b3346..a217d77 100644
+index b85d2ef..32becb4 100644
 --- a/src/expr/data_reg.c
 +++ b/src/expr/data_reg.c
-@@ -130,7 +130,7 @@ static int nft_data_reg_verdict_xml_parse(union nft_data_reg *reg,
- 				   NFT_XML_OPT, err);
+@@ -123,7 +123,7 @@ static int nftnl_data_reg_verdict_xml_parse(union nftnl_data_reg *reg,
+ 				   NFTNL_XML_OPT, err);
  	if (chain != NULL) {
  		if (reg->chain)
 -			xfree(reg->chain);
@@ -154,13 +213,22 @@ index 33b3346..a217d77 100644
  
  		reg->chain = strdup(chain);
  	}
+@@ -504,7 +504,7 @@ void nftnl_free_verdict(union nftnl_data_reg *data)
+ 	switch(data->verdict) {
+ 	case NFT_JUMP:
+ 	case NFT_GOTO:
+-		xfree(data->chain);
++		nftnl_xfree(data->chain);
+ 		break;
+ 	default:
+ 		break;
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index 3d4e48c..d48a4e1 100644
+index c2fb9ad..4a8cd83 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
-@@ -47,7 +47,7 @@ nft_rule_expr_immediate_set(struct nft_rule_expr *e, uint16_t type,
+@@ -44,7 +44,7 @@ nftnl_expr_immediate_set(struct nftnl_expr *e, uint16_t type,
  		break;
- 	case NFT_EXPR_IMM_CHAIN:
+ 	case NFTNL_EXPR_IMM_CHAIN:
  		if (imm->data.chain)
 -			xfree(imm->data.chain);
 +			nftnl_xfree(imm->data.chain);
@@ -168,19 +236,19 @@ index 3d4e48c..d48a4e1 100644
  		imm->data.chain = strdup(data);
  		break;
 diff --git a/src/expr/log.c b/src/expr/log.c
-index 0a324c4..0eec1dc 100644
+index f615d8e..1957aa6 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
-@@ -40,7 +40,7 @@ static int nft_rule_expr_log_set(struct nft_rule_expr *e, uint16_t type,
+@@ -38,7 +38,7 @@ static int nftnl_expr_log_set(struct nftnl_expr *e, uint16_t type,
  	switch(type) {
- 	case NFT_EXPR_LOG_PREFIX:
+ 	case NFTNL_EXPR_LOG_PREFIX:
  		if (log->prefix)
 -			xfree(log->prefix);
 +			nftnl_xfree(log->prefix);
  
  		log->prefix = strdup(data);
  		break;
-@@ -154,7 +154,7 @@ nft_rule_expr_log_parse(struct nft_rule_expr *e, struct nlattr *attr)
+@@ -152,7 +152,7 @@ nftnl_expr_log_parse(struct nftnl_expr *e, struct nlattr *attr)
  
  	if (tb[NFTA_LOG_PREFIX]) {
  		if (log->prefix)
@@ -188,10 +256,10 @@ index 0a324c4..0eec1dc 100644
 +			nftnl_xfree(log->prefix);
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
- 		e->flags |= (1 << NFT_EXPR_LOG_PREFIX);
-@@ -331,7 +331,7 @@ static void nft_rule_expr_log_free(struct nft_rule_expr *e)
+ 		e->flags |= (1 << NFTNL_EXPR_LOG_PREFIX);
+@@ -329,7 +329,7 @@ static void nftnl_expr_log_free(struct nftnl_expr *e)
  {
- 	struct nft_expr_log *log = nft_expr_data(e);
+ 	struct nftnl_expr_log *log = nftnl_expr_data(e);
  
 -	xfree(log->prefix);
 +	nftnl_xfree(log->prefix);
@@ -199,19 +267,19 @@ index 0a324c4..0eec1dc 100644
  
  struct expr_ops expr_ops_log = {
 diff --git a/src/expr/match.c b/src/expr/match.c
-index 26a368f..b452d06 100644
+index ddecb43..2071b3c 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
-@@ -53,7 +53,7 @@ nft_rule_expr_match_set(struct nft_rule_expr *e, uint16_t type,
+@@ -50,7 +50,7 @@ nftnl_expr_match_set(struct nftnl_expr *e, uint16_t type,
  		break;
- 	case NFT_EXPR_MT_INFO:
+ 	case NFTNL_EXPR_MT_INFO:
  		if (mt->data)
 -			xfree(mt->data);
 +			nftnl_xfree(mt->data);
  
  		mt->data = data;
  		mt->data_len = data_len;
-@@ -150,7 +150,7 @@ static int nft_rule_expr_match_parse(struct nft_rule_expr *e, struct nlattr *att
+@@ -147,7 +147,7 @@ static int nftnl_expr_match_parse(struct nftnl_expr *e, struct nlattr *attr)
  		void *match_data;
  
  		if (match->data)
@@ -220,9 +288,9 @@ index 26a368f..b452d06 100644
  
  		match_data = calloc(1, len);
  		if (match_data == NULL)
-@@ -240,7 +240,7 @@ static void nft_rule_expr_match_free(struct nft_rule_expr *e)
+@@ -237,7 +237,7 @@ static void nftnl_expr_match_free(struct nftnl_expr *e)
  {
- 	struct nft_expr_match *match = nft_expr_data(e);
+ 	struct nftnl_expr_match *match = nftnl_expr_data(e);
  
 -	xfree(match->data);
 +	nftnl_xfree(match->data);
@@ -230,19 +298,19 @@ index 26a368f..b452d06 100644
  
  struct expr_ops expr_ops_match = {
 diff --git a/src/expr/target.c b/src/expr/target.c
-index a79bc9e..bf836b7 100644
+index cbbee60..064f56a 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
-@@ -53,7 +53,7 @@ nft_rule_expr_target_set(struct nft_rule_expr *e, uint16_t type,
+@@ -50,7 +50,7 @@ nftnl_expr_target_set(struct nftnl_expr *e, uint16_t type,
  		break;
- 	case NFT_EXPR_TG_INFO:
+ 	case NFTNL_EXPR_TG_INFO:
  		if (tg->data)
 -			xfree(tg->data);
 +			nftnl_xfree(tg->data);
  
  		tg->data = data;
  		tg->data_len = data_len;
-@@ -150,7 +150,7 @@ static int nft_rule_expr_target_parse(struct nft_rule_expr *e, struct nlattr *at
+@@ -147,7 +147,7 @@ static int nftnl_expr_target_parse(struct nftnl_expr *e, struct nlattr *attr)
  		void *target_data;
  
  		if (target->data)
@@ -251,9 +319,9 @@ index a79bc9e..bf836b7 100644
  
  		target_data = calloc(1, len);
  		if (target_data == NULL)
-@@ -241,7 +241,7 @@ static void nft_rule_expr_target_free(struct nft_rule_expr *e)
+@@ -238,7 +238,7 @@ static void nftnl_expr_target_free(struct nftnl_expr *e)
  {
- 	struct nft_expr_target *target = nft_expr_data(e);
+ 	struct nftnl_expr_target *target = nftnl_expr_data(e);
  
 -	xfree(target->data);
 +	nftnl_xfree(target->data);
@@ -261,36 +329,23 @@ index a79bc9e..bf836b7 100644
  
  struct expr_ops expr_ops_target = {
 diff --git a/src/gen.c b/src/gen.c
-index 21d3a49..515abc4 100644
+index eb3b70d..dac3e47 100644
 --- a/src/gen.c
 +++ b/src/gen.c
-@@ -37,7 +37,7 @@ EXPORT_SYMBOL(nft_gen_alloc);
+@@ -37,7 +37,7 @@ EXPORT_SYMBOL(nftnl_gen_alloc, nft_gen_alloc);
  
- void nft_gen_free(struct nft_gen *gen)
+ void nftnl_gen_free(struct nftnl_gen *gen)
  {
 -	xfree(gen);
 +	nftnl_xfree(gen);
  }
- EXPORT_SYMBOL(nft_gen_free);
+ EXPORT_SYMBOL(nftnl_gen_free, nft_gen_free);
  
-diff --git a/src/internal.h b/src/internal.h
-index db9af11..898a7e7 100644
---- a/src/internal.h
-+++ b/src/internal.h
-@@ -16,7 +16,7 @@
- #include <libnftnl/common.h>
- #include <linux/netfilter/nf_tables.h>
- 
--#define xfree(ptr)	free((void *)ptr);
-+#define nftnl_xfree(ptr)	free((void *)ptr);
- 
- #define BASE_DEC 10
- #define BASE_HEX 16
 diff --git a/src/mxml.c b/src/mxml.c
-index a97d380..f4b5a05 100644
+index 51dbf1b..5b2aa57 100644
 --- a/src/mxml.c
 +++ b/src/mxml.c
-@@ -84,7 +84,7 @@ struct nft_rule_expr *nft_mxml_expr_parse(mxml_node_t *node,
+@@ -85,7 +85,7 @@ struct nftnl_expr *nftnl_mxml_expr_parse(mxml_node_t *node,
  		goto err_expr;
  
  	tree = mxmlLoadString(NULL, xml_text, MXML_OPAQUE_CALLBACK);
@@ -300,11 +355,11 @@ index a97d380..f4b5a05 100644
  	if (tree == NULL)
  		goto err_expr;
 diff --git a/src/rule.c b/src/rule.c
-index c974f8b..56bf6ef 100644
+index 0fb27ed..f8e33ff 100644
 --- a/src/rule.c
 +++ b/src/rule.c
-@@ -75,11 +75,11 @@ void nft_rule_free(struct nft_rule *r)
- 		nft_rule_expr_free(e);
+@@ -72,11 +72,11 @@ void nftnl_rule_free(struct nftnl_rule *r)
+ 		nftnl_expr_free(e);
  
  	if (r->table != NULL)
 -		xfree(r->table);
@@ -316,50 +371,56 @@ index c974f8b..56bf6ef 100644
 -	xfree(r);
 +	nftnl_xfree(r);
  }
- EXPORT_SYMBOL(nft_rule_free);
+ EXPORT_SYMBOL(nftnl_rule_free, nft_rule_free);
  
-@@ -97,13 +97,13 @@ void nft_rule_attr_unset(struct nft_rule *r, uint16_t attr)
+@@ -94,13 +94,13 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
  	switch (attr) {
- 	case NFT_RULE_ATTR_TABLE:
+ 	case NFTNL_RULE_TABLE:
  		if (r->table) {
 -			xfree(r->table);
 +			nftnl_xfree(r->table);
  			r->table = NULL;
  		}
  		break;
- 	case NFT_RULE_ATTR_CHAIN:
+ 	case NFTNL_RULE_CHAIN:
  		if (r->chain) {
 -			xfree(r->chain);
 +			nftnl_xfree(r->chain);
  			r->chain = NULL;
  		}
  		break;
-@@ -139,13 +139,13 @@ void nft_rule_attr_set_data(struct nft_rule *r, uint16_t attr,
+@@ -136,13 +136,13 @@ void nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  	switch(attr) {
- 	case NFT_RULE_ATTR_TABLE:
+ 	case NFTNL_RULE_TABLE:
  		if (r->table)
 -			xfree(r->table);
 +			nftnl_xfree(r->table);
  
  		r->table = strdup(data);
  		break;
- 	case NFT_RULE_ATTR_CHAIN:
+ 	case NFTNL_RULE_CHAIN:
  		if (r->chain)
 -			xfree(r->chain);
 +			nftnl_xfree(r->chain);
  
  		r->chain = strdup(data);
  		break;
-@@ -395,7 +395,7 @@ static int nft_rule_parse_expr2(struct nlattr *attr, struct nft_rule *r)
+@@ -425,12 +425,12 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+ 		return -1;
  
- 	if (tb[NFTA_EXPR_DATA]) {
- 		if (expr->ops->parse(expr, tb[NFTA_EXPR_DATA]) < 0) {
--			xfree(expr);
-+			nftnl_xfree(expr);
- 			return -1;
- 		}
+ 	if (tb[NFTA_RULE_TABLE]) {
+-		xfree(r->table);
++		nftnl_xfree(r->table);
+ 		r->table = strdup(mnl_attr_get_str(tb[NFTA_RULE_TABLE]));
+ 		r->flags |= (1 << NFTNL_RULE_TABLE);
+ 	}
+ 	if (tb[NFTA_RULE_CHAIN]) {
+-		xfree(r->chain);
++		nftnl_xfree(r->chain);
+ 		r->chain = strdup(mnl_attr_get_str(tb[NFTA_RULE_CHAIN]));
+ 		r->flags |= (1 << NFTNL_RULE_CHAIN);
  	}
-@@ -491,7 +491,7 @@ int nft_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nft_rule *r)
+@@ -451,7 +451,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
  		if (r->user.data)
@@ -368,51 +429,51 @@ index c974f8b..56bf6ef 100644
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -1064,7 +1064,7 @@ EXPORT_SYMBOL(nft_rule_expr_iter_next);
+@@ -1042,7 +1042,7 @@ EXPORT_SYMBOL(nftnl_expr_iter_next, nft_rule_expr_iter_next);
  
- void nft_rule_expr_iter_destroy(struct nft_rule_expr_iter *iter)
+ void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nft_rule_expr_iter_destroy);
+ EXPORT_SYMBOL(nftnl_expr_iter_destroy, nft_rule_expr_iter_destroy);
  
-@@ -1094,7 +1094,7 @@ void nft_rule_list_free(struct nft_rule_list *list)
+@@ -1072,7 +1072,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
  		list_del(&r->head);
- 		nft_rule_free(r);
+ 		nftnl_rule_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nft_rule_list_free);
+ EXPORT_SYMBOL(nftnl_rule_list_free, nft_rule_list_free);
  
-@@ -1179,6 +1179,6 @@ EXPORT_SYMBOL(nft_rule_list_iter_next);
+@@ -1163,6 +1163,6 @@ EXPORT_SYMBOL(nftnl_rule_list_iter_next, nft_rule_list_iter_next);
  
- void nft_rule_list_iter_destroy(struct nft_rule_list_iter *iter)
+ void nftnl_rule_list_iter_destroy(struct nftnl_rule_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nft_rule_list_iter_destroy);
+ EXPORT_SYMBOL(nftnl_rule_list_iter_destroy, nft_rule_list_iter_destroy);
 diff --git a/src/ruleset.c b/src/ruleset.c
-index 6bb7582..e482e18 100644
+index 7b1ab7a..b8188de 100644
 --- a/src/ruleset.c
 +++ b/src/ruleset.c
-@@ -48,7 +48,7 @@ void nft_ruleset_free(struct nft_ruleset *r)
- 		nft_set_list_free(r->set_list);
- 	if (r->flags & (1 << NFT_RULESET_ATTR_RULELIST))
- 		nft_rule_list_free(r->rule_list);
+@@ -74,7 +74,7 @@ void nftnl_ruleset_free(struct nftnl_ruleset *r)
+ 		nftnl_set_list_free(r->set_list);
+ 	if (r->flags & (1 << NFTNL_RULESET_RULELIST))
+ 		nftnl_rule_list_free(r->rule_list);
 -	xfree(r);
 +	nftnl_xfree(r);
  }
- EXPORT_SYMBOL(nft_ruleset_free);
+ EXPORT_SYMBOL(nftnl_ruleset_free, nft_ruleset_free);
  
 diff --git a/src/set.c b/src/set.c
-index 2385031..0355f99 100644
+index f5a9454..4eff325 100644
 --- a/src/set.c
 +++ b/src/set.c
-@@ -47,15 +47,15 @@ void nft_set_free(struct nft_set *s)
- 	struct nft_set_elem *elem, *tmp;
+@@ -45,15 +45,15 @@ void nftnl_set_free(struct nftnl_set *s)
+ 	struct nftnl_set_elem *elem, *tmp;
  
  	if (s->table != NULL)
 -		xfree(s->table);
@@ -423,165 +484,218 @@ index 2385031..0355f99 100644
  
  	list_for_each_entry_safe(elem, tmp, &s->element_list, head) {
  		list_del(&elem->head);
- 		nft_set_elem_free(elem);
+ 		nftnl_set_elem_free(elem);
  	}
 -	xfree(s);
 +	nftnl_xfree(s);
  }
- EXPORT_SYMBOL(nft_set_free);
+ EXPORT_SYMBOL(nftnl_set_free, nft_set_free);
  
-@@ -71,14 +71,14 @@ void nft_set_attr_unset(struct nft_set *s, uint16_t attr)
- 	case NFT_SET_ATTR_TABLE:
- 		if (s->flags & (1 << NFT_SET_ATTR_TABLE))
+@@ -69,14 +69,14 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+ 	case NFTNL_SET_TABLE:
+ 		if (s->flags & (1 << NFTNL_SET_TABLE))
  			if (s->table) {
 -				xfree(s->table);
 +				nftnl_xfree(s->table);
  				s->table = NULL;
  			}
  		break;
- 	case NFT_SET_ATTR_NAME:
- 		if (s->flags & (1 << NFT_SET_ATTR_NAME))
+ 	case NFTNL_SET_NAME:
+ 		if (s->flags & (1 << NFTNL_SET_NAME))
  			if (s->name) {
 -				xfree(s->name);
 +				nftnl_xfree(s->name);
  				s->name = NULL;
  			}
  		break;
-@@ -122,13 +122,13 @@ void nft_set_attr_set_data(struct nft_set *s, uint16_t attr, const void *data,
+@@ -124,13 +124,13 @@ void nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  	switch(attr) {
- 	case NFT_SET_ATTR_TABLE:
+ 	case NFTNL_SET_TABLE:
  		if (s->table)
 -			xfree(s->table);
 +			nftnl_xfree(s->table);
  
  		s->table = strdup(data);
  		break;
- 	case NFT_SET_ATTR_NAME:
+ 	case NFTNL_SET_NAME:
  		if (s->name)
 -			xfree(s->name);
 +			nftnl_xfree(s->name);
  
  		s->name = strdup(data);
  		break;
-@@ -963,7 +963,7 @@ void nft_set_list_free(struct nft_set_list *list)
+@@ -435,12 +435,12 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+ 		return -1;
+ 
+ 	if (tb[NFTA_SET_TABLE]) {
+-		xfree(s->table);
++		nftnl_xfree(s->table);
+ 		s->table = strdup(mnl_attr_get_str(tb[NFTA_SET_TABLE]));
+ 		s->flags |= (1 << NFTNL_SET_TABLE);
+ 	}
+ 	if (tb[NFTA_SET_NAME]) {
+-		xfree(s->name);
++		nftnl_xfree(s->name);
+ 		s->name = strdup(mnl_attr_get_str(tb[NFTA_SET_NAME]));
+ 		s->flags |= (1 << NFTNL_SET_NAME);
+ 	}
+@@ -1085,7 +1085,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
  		list_del(&s->head);
- 		nft_set_free(s);
+ 		nftnl_set_free(s);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nft_set_list_free);
+ EXPORT_SYMBOL(nftnl_set_list_free, nft_set_list_free);
  
-@@ -1047,7 +1047,7 @@ EXPORT_SYMBOL(nft_set_list_iter_next);
+@@ -1175,7 +1175,7 @@ EXPORT_SYMBOL(nftnl_set_list_iter_next, nft_set_list_iter_next);
  
- void nft_set_list_iter_destroy(struct nft_set_list_iter *iter)
+ void nftnl_set_list_iter_destroy(struct nftnl_set_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nft_set_list_iter_destroy);
+ EXPORT_SYMBOL(nftnl_set_list_iter_destroy, nft_set_list_iter_destroy);
  
 diff --git a/src/set_elem.c b/src/set_elem.c
-index 95f12bf..12d636e 100644
+index 293ce15..4e20159 100644
 --- a/src/set_elem.c
 +++ b/src/set_elem.c
-@@ -44,11 +44,11 @@ void nft_set_elem_free(struct nft_set_elem *s)
+@@ -43,7 +43,7 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
  {
- 	if (s->flags & (1 << NFT_SET_ELEM_ATTR_CHAIN)) {
+ 	if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN)) {
  		if (s->data.chain) {
 -			xfree(s->data.chain);
 +			nftnl_xfree(s->data.chain);
  			s->data.chain = NULL;
  		}
  	}
+@@ -51,7 +51,7 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
+ 	if (s->flags & (1 << NFTNL_SET_ELEM_EXPR))
+ 		nftnl_expr_free(s->expr);
+ 
 -	xfree(s);
 +	nftnl_xfree(s);
  }
- EXPORT_SYMBOL(nft_set_elem_free);
+ EXPORT_SYMBOL(nftnl_set_elem_free, nft_set_elem_free);
  
-@@ -64,7 +64,7 @@ void nft_set_elem_attr_unset(struct nft_set_elem *s, uint16_t attr)
- 	case NFT_SET_ELEM_ATTR_CHAIN:
- 		if (s->flags & (1 << NFT_SET_ELEM_ATTR_CHAIN)) {
+@@ -67,7 +67,7 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
+ 	case NFTNL_SET_ELEM_CHAIN:
+ 		if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN)) {
  			if (s->data.chain) {
 -				xfree(s->data.chain);
 +				nftnl_xfree(s->data.chain);
  				s->data.chain = NULL;
  			}
  		}
-@@ -98,7 +98,7 @@ void nft_set_elem_attr_set(struct nft_set_elem *s, uint16_t attr,
+@@ -110,7 +110,7 @@ void nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
- 	case NFT_SET_ELEM_ATTR_CHAIN:	/* NFTA_SET_ELEM_DATA */
+ 	case NFTNL_SET_ELEM_CHAIN:	/* NFTA_SET_ELEM_DATA */
  		if (s->data.chain)
 -			xfree(s->data.chain);
 +			nftnl_xfree(s->data.chain);
  
  		s->data.chain = strdup(data);
  		break;
-@@ -716,7 +716,7 @@ EXPORT_SYMBOL(nft_set_elems_iter_next);
+@@ -390,7 +390,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
+ 			mnl_attr_get_payload(tb[NFTA_SET_ELEM_USERDATA]);
+ 
+ 		if (e->user.data)
+-			xfree(e->user.data);
++			nftnl_xfree(e->user.data);
  
- void nft_set_elems_iter_destroy(struct nft_set_elems_iter *iter)
+ 		e->user.len  = mnl_attr_get_payload_len(tb[NFTA_SET_ELEM_USERDATA]);
+ 		e->user.data = malloc(e->user.len);
+@@ -462,13 +462,13 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+ 		return -1;
+ 
+ 	if (tb[NFTA_SET_ELEM_LIST_TABLE]) {
+-		xfree(s->table);
++		nftnl_xfree(s->table);
+ 		s->table =
+ 			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_TABLE]));
+ 		s->flags |= (1 << NFTNL_SET_TABLE);
+ 	}
+ 	if (tb[NFTA_SET_ELEM_LIST_SET]) {
+-		xfree(s->name);
++		nftnl_xfree(s->name);
+ 		s->name =
+ 			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_SET]));
+ 		s->flags |= (1 << NFTNL_SET_NAME);
+@@ -853,7 +853,7 @@ EXPORT_SYMBOL(nftnl_set_elems_iter_next, nft_set_elems_iter_next);
+ 
+ void nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nft_set_elems_iter_destroy);
+ EXPORT_SYMBOL(nftnl_set_elems_iter_destroy, nft_set_elems_iter_destroy);
  
 diff --git a/src/table.c b/src/table.c
-index c93e6fb..c89bca1 100644
+index 28f6bd6..6aa2eb5 100644
 --- a/src/table.c
 +++ b/src/table.c
-@@ -45,9 +45,9 @@ EXPORT_SYMBOL(nft_table_alloc);
- void nft_table_free(struct nft_table *t)
+@@ -45,9 +45,9 @@ EXPORT_SYMBOL(nftnl_table_alloc, nft_table_alloc);
+ void nftnl_table_free(struct nftnl_table *t)
  {
- 	if (t->flags & (1 << NFT_TABLE_ATTR_NAME))
+ 	if (t->flags & (1 << NFTNL_TABLE_NAME))
 -		xfree(t->name);
 +		nftnl_xfree(t->name);
  
 -	xfree(t);
 +	nftnl_xfree(t);
  }
- EXPORT_SYMBOL(nft_table_free);
+ EXPORT_SYMBOL(nftnl_table_free, nft_table_free);
  
-@@ -65,7 +65,7 @@ void nft_table_attr_unset(struct nft_table *t, uint16_t attr)
+@@ -65,7 +65,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
  	switch (attr) {
- 	case NFT_TABLE_ATTR_NAME:
+ 	case NFTNL_TABLE_NAME:
  		if (t->name) {
 -			xfree(t->name);
 +			nftnl_xfree(t->name);
  			t->name = NULL;
  		}
  		break;
-@@ -95,7 +95,7 @@ void nft_table_attr_set_data(struct nft_table *t, uint16_t attr,
+@@ -95,7 +95,7 @@ void nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
  	switch (attr) {
- 	case NFT_TABLE_ATTR_NAME:
+ 	case NFTNL_TABLE_NAME:
  		if (t->name)
 -			xfree(t->name);
 +			nftnl_xfree(t->name);
  
  		t->name = strdup(data);
  		break;
-@@ -486,7 +486,7 @@ void nft_table_list_free(struct nft_table_list *list)
+@@ -229,7 +229,7 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
+ 		return -1;
+ 
+ 	if (tb[NFTA_TABLE_NAME]) {
+-		xfree(t->name);
++		nftnl_xfree(t->name);
+ 		t->name = strdup(mnl_attr_get_str(tb[NFTA_TABLE_NAME]));
+ 		t->flags |= (1 << NFTNL_TABLE_NAME);
+ 	}
+@@ -496,7 +496,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
  		list_del(&r->head);
- 		nft_table_free(r);
+ 		nftnl_table_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nft_table_list_free);
+ EXPORT_SYMBOL(nftnl_table_list_free, nft_table_list_free);
  
-@@ -565,6 +565,6 @@ EXPORT_SYMBOL(nft_table_list_iter_next);
+@@ -581,6 +581,6 @@ EXPORT_SYMBOL(nftnl_table_list_iter_next, nft_table_list_iter_next);
  
- void nft_table_list_iter_destroy(struct nft_table_list_iter *iter)
+ void nftnl_table_list_iter_destroy(struct nftnl_table_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nft_table_list_iter_destroy);
+ EXPORT_SYMBOL(nftnl_table_list_iter_destroy, nft_table_list_iter_destroy);
 diff --git a/src/utils.c b/src/utils.c
-index 9013b68..7058269 100644
+index c241e5f..ba44a60 100644
 --- a/src/utils.c
 +++ b/src/utils.c
-@@ -206,7 +206,7 @@ int nft_fprintf(FILE *fp, void *obj, uint32_t type, uint32_t flags,
+@@ -249,7 +249,7 @@ int nftnl_fprintf(FILE *fp, void *obj, uint32_t cmd, uint32_t type, uint32_t fla
  
  out:
  	if (buf != _buf)
@@ -591,5 +705,5 @@ index 9013b68..7058269 100644
  	return ret;
  }
 -- 
-2.1.0
+2.4.9
 
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 0e857e5..50896fb 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,2 +1,2 @@
-# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.3
-sha1	11da04c6632c3b06728e2341cd9d7cfbb69a484d	libnftnl-1.0.3.tar.bz2
+# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.5
+sha1	2ae3172251574ee36077af760933ec0369960a17	libnftnl-1.0.5.tar.bz2
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 703bdee..37c82d3 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.3
+LIBNFTNL_VERSION = 1.0.5
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+

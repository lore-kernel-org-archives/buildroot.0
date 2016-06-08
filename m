From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jun 2016 14:58:24 +0200
Subject: [Buildroot] [git commit] libnftnl: bump to version 1.0.6
Message-ID: <20160608130159.318AB819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfcb6f40c34c20f3c47648289466621ae6d6de26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It now requires 3.12.x series headers so adjust the dependencies to
match.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/Config.in                         |   6 +-
 ...e-to-libnftnl_xfree-to-avoid-symbol-namin.patch | 256 ++++++++++++++-------
 package/libnftnl/Config.in                         |   6 +-
 package/libnftnl/libnftnl.hash                     |   4 +-
 package/libnftnl/libnftnl.mk                       |   2 +-
 package/nftables/Config.in                         |   6 +-
 6 files changed, 186 insertions(+), 94 deletions(-)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index c7b69a8..cdcd1c2 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -22,14 +22,14 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
 	# uses dlfcn
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
 	help
 	  Build nftables compat utilities.
 
-comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.4"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
+comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endif
diff --git a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index 26c9d2e..fc96a12 100644
--- a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -1,7 +1,7 @@
-From 85dfe7dcd20c54e6d75d66a400f7ae038a52239b Mon Sep 17 00:00:00 2001
+From 610d015143e88629eab07067a4ae0c1d7548cfaf Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Dec 2014 15:31:40 +0100
-Subject: [PATCH 1/2] Rename xfree() to libnftnl_xfree() to avoid symbol naming
+Date: Thu, 2 Jun 2016 23:03:27 -0300
+Subject: [PATCH] Rename xfree() to libnftnl_xfree() to avoid symbol naming
  conflict
 
 When ELF binaries and shared libraries are used, the internal
@@ -22,32 +22,36 @@ libnftnl_xfree().
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for version 1.0.5]
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  include/utils.h      |  2 +-
  src/chain.c          | 28 ++++++++++++++--------------
  src/common.c         |  2 +-
  src/expr.c           |  4 ++--
  src/expr/data_reg.c  |  4 ++--
+ src/expr/dynset.c    |  2 +-
  src/expr/immediate.c |  2 +-
  src/expr/log.c       |  6 +++---
+ src/expr/lookup.c    |  2 +-
  src/expr/match.c     |  6 +++---
  src/expr/target.c    |  6 +++---
  src/gen.c            |  2 +-
  src/mxml.c           |  2 +-
- src/rule.c           | 26 +++++++++++++-------------
+ src/rule.c           | 30 +++++++++++++++---------------
  src/ruleset.c        |  2 +-
  src/set.c            | 22 +++++++++++-----------
- src/set_elem.c       | 16 ++++++++--------
+ src/set_elem.c       | 20 ++++++++++----------
  src/table.c          | 14 +++++++-------
+ src/trace.c          | 14 +++++++-------
+ src/udata.c          |  2 +-
  src/utils.c          |  2 +-
- 17 files changed, 73 insertions(+), 73 deletions(-)
+ 21 files changed, 87 insertions(+), 87 deletions(-)
 
 diff --git a/include/utils.h b/include/utils.h
-index f7436fa..e03ee3b 100644
+index 46ff18a..0320c96 100644
 --- a/include/utils.h
 +++ b/include/utils.h
-@@ -17,7 +17,7 @@
+@@ -19,7 +19,7 @@
  
  #define __noreturn	__attribute__((__noreturn__))
  
@@ -57,11 +61,11 @@ index f7436fa..e03ee3b 100644
  #define div_round_up(n, d)	(((n) + (d) - 1) / (d))
  
 diff --git a/src/chain.c b/src/chain.c
-index 8a8e8b8..37a27b1 100644
+index 990c576..b8f1e1f 100644
 --- a/src/chain.c
 +++ b/src/chain.c
-@@ -96,13 +96,13 @@ EXPORT_SYMBOL(nftnl_chain_alloc, nft_chain_alloc);
- void nftnl_chain_free(struct nftnl_chain *c)
+@@ -96,13 +96,13 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_alloc, nft_chain_alloc);
+ void nftnl_chain_free(const struct nftnl_chain *c)
  {
  	if (c->table != NULL)
 -		xfree(c->table);
@@ -76,7 +80,7 @@ index 8a8e8b8..37a27b1 100644
 -	xfree(c);
 +	nftnl_xfree(c);
  }
- EXPORT_SYMBOL(nftnl_chain_free, nft_chain_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_chain_free, nft_chain_free);
  
 @@ -120,7 +120,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  	switch (attr) {
@@ -155,41 +159,41 @@ index 8a8e8b8..37a27b1 100644
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nftnl_chain_list_free, nft_chain_list_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_chain_list_free, nft_chain_list_free);
  
-@@ -1061,6 +1061,6 @@ EXPORT_SYMBOL(nftnl_chain_list_iter_next, nft_chain_list_iter_next);
+@@ -1061,6 +1061,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_list_iter_next, nft_chain_list_iter_next);
  
  void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_chain_list_iter_destroy, nft_chain_list_iter_destroy);
+ EXPORT_SYMBOL_ALIAS(nftnl_chain_list_iter_destroy, nft_chain_list_iter_destroy);
 diff --git a/src/common.c b/src/common.c
-index 43d2cfd..0bc814d 100644
+index bf4176c..98f8012 100644
 --- a/src/common.c
 +++ b/src/common.c
-@@ -58,7 +58,7 @@ EXPORT_SYMBOL(nftnl_parse_err_alloc, nft_parse_err_alloc);
+@@ -58,7 +58,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_parse_err_alloc, nft_parse_err_alloc);
  
  void nftnl_parse_err_free(struct nftnl_parse_err *err)
  {
 -	xfree(err);
 +	nftnl_xfree(err);
  }
- EXPORT_SYMBOL(nftnl_parse_err_free, nft_parse_err_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_parse_err_free, nft_parse_err_free);
  
 diff --git a/src/expr.c b/src/expr.c
-index 3249a5c..8563d9e 100644
+index ed07dc4..6c08bd0 100644
 --- a/src/expr.c
 +++ b/src/expr.c
-@@ -50,7 +50,7 @@ void nftnl_expr_free(struct nftnl_expr *expr)
+@@ -50,7 +50,7 @@ void nftnl_expr_free(const struct nftnl_expr *expr)
  	if (expr->ops->free)
  		expr->ops->free(expr);
  
 -	xfree(expr);
 +	nftnl_xfree(expr);
  }
- EXPORT_SYMBOL(nftnl_expr_free, nft_rule_expr_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_expr_free, nft_rule_expr_free);
  
 @@ -257,7 +257,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
  	return expr;
@@ -201,7 +205,7 @@ index 3249a5c..8563d9e 100644
  	return NULL;
  }
 diff --git a/src/expr/data_reg.c b/src/expr/data_reg.c
-index b85d2ef..32becb4 100644
+index 2a23285..2b1a87e 100644
 --- a/src/expr/data_reg.c
 +++ b/src/expr/data_reg.c
 @@ -123,7 +123,7 @@ static int nftnl_data_reg_verdict_xml_parse(union nftnl_data_reg *reg,
@@ -213,7 +217,7 @@ index b85d2ef..32becb4 100644
  
  		reg->chain = strdup(chain);
  	}
-@@ -504,7 +504,7 @@ void nftnl_free_verdict(union nftnl_data_reg *data)
+@@ -511,7 +511,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
  	switch(data->verdict) {
  	case NFT_JUMP:
  	case NFT_GOTO:
@@ -222,8 +226,21 @@ index b85d2ef..32becb4 100644
  		break;
  	default:
  		break;
+diff --git a/src/expr/dynset.c b/src/expr/dynset.c
+index c8d97a5..604600a 100644
+--- a/src/expr/dynset.c
++++ b/src/expr/dynset.c
+@@ -361,7 +361,7 @@ static void nftnl_expr_dynset_free(const struct nftnl_expr *e)
+ {
+ 	struct nftnl_expr_dynset *dynset = nftnl_expr_data(e);
+ 
+-	xfree(dynset->set_name);
++	nftnl_xfree(dynset->set_name);
+ }
+ 
+ struct expr_ops expr_ops_dynset = {
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index c2fb9ad..4a8cd83 100644
+index eb2ca0f..237f944 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
 @@ -44,7 +44,7 @@ nftnl_expr_immediate_set(struct nftnl_expr *e, uint16_t type,
@@ -236,7 +253,7 @@ index c2fb9ad..4a8cd83 100644
  		imm->data.chain = strdup(data);
  		break;
 diff --git a/src/expr/log.c b/src/expr/log.c
-index f615d8e..1957aa6 100644
+index c3dc0a6..ab24686 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
 @@ -38,7 +38,7 @@ static int nftnl_expr_log_set(struct nftnl_expr *e, uint16_t type,
@@ -257,7 +274,7 @@ index f615d8e..1957aa6 100644
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
  		e->flags |= (1 << NFTNL_EXPR_LOG_PREFIX);
-@@ -329,7 +329,7 @@ static void nftnl_expr_log_free(struct nftnl_expr *e)
+@@ -329,7 +329,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_log *log = nftnl_expr_data(e);
  
@@ -266,8 +283,21 @@ index f615d8e..1957aa6 100644
  }
  
  struct expr_ops expr_ops_log = {
+diff --git a/src/expr/lookup.c b/src/expr/lookup.c
+index ed32ba6..6e9b0e6 100644
+--- a/src/expr/lookup.c
++++ b/src/expr/lookup.c
+@@ -258,7 +258,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
+ {
+ 	struct nftnl_expr_lookup *lookup = nftnl_expr_data(e);
+ 
+-	xfree(lookup->set_name);
++	nftnl_xfree(lookup->set_name);
+ }
+ 
+ struct expr_ops expr_ops_lookup = {
 diff --git a/src/expr/match.c b/src/expr/match.c
-index ddecb43..2071b3c 100644
+index 2929b43..ec46394 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
 @@ -50,7 +50,7 @@ nftnl_expr_match_set(struct nftnl_expr *e, uint16_t type,
@@ -288,7 +318,7 @@ index ddecb43..2071b3c 100644
  
  		match_data = calloc(1, len);
  		if (match_data == NULL)
-@@ -237,7 +237,7 @@ static void nftnl_expr_match_free(struct nftnl_expr *e)
+@@ -237,7 +237,7 @@ static void nftnl_expr_match_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_match *match = nftnl_expr_data(e);
  
@@ -298,7 +328,7 @@ index ddecb43..2071b3c 100644
  
  struct expr_ops expr_ops_match = {
 diff --git a/src/expr/target.c b/src/expr/target.c
-index cbbee60..064f56a 100644
+index 68a7d8a..05f9e5a 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
 @@ -50,7 +50,7 @@ nftnl_expr_target_set(struct nftnl_expr *e, uint16_t type,
@@ -319,7 +349,7 @@ index cbbee60..064f56a 100644
  
  		target_data = calloc(1, len);
  		if (target_data == NULL)
-@@ -238,7 +238,7 @@ static void nftnl_expr_target_free(struct nftnl_expr *e)
+@@ -238,7 +238,7 @@ static void nftnl_expr_target_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_target *target = nftnl_expr_data(e);
  
@@ -329,17 +359,17 @@ index cbbee60..064f56a 100644
  
  struct expr_ops expr_ops_target = {
 diff --git a/src/gen.c b/src/gen.c
-index eb3b70d..dac3e47 100644
+index 115a105..576771a 100644
 --- a/src/gen.c
 +++ b/src/gen.c
-@@ -37,7 +37,7 @@ EXPORT_SYMBOL(nftnl_gen_alloc, nft_gen_alloc);
+@@ -37,7 +37,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_gen_alloc, nft_gen_alloc);
  
- void nftnl_gen_free(struct nftnl_gen *gen)
+ void nftnl_gen_free(const struct nftnl_gen *gen)
  {
 -	xfree(gen);
 +	nftnl_xfree(gen);
  }
- EXPORT_SYMBOL(nftnl_gen_free, nft_gen_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_gen_free, nft_gen_free);
  
 diff --git a/src/mxml.c b/src/mxml.c
 index 51dbf1b..5b2aa57 100644
@@ -355,10 +385,10 @@ index 51dbf1b..5b2aa57 100644
  	if (tree == NULL)
  		goto err_expr;
 diff --git a/src/rule.c b/src/rule.c
-index 0fb27ed..f8e33ff 100644
+index 8ee8648..8158c26 100644
 --- a/src/rule.c
 +++ b/src/rule.c
-@@ -72,11 +72,11 @@ void nftnl_rule_free(struct nftnl_rule *r)
+@@ -72,13 +72,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
  		nftnl_expr_free(e);
  
  	if (r->table != NULL)
@@ -367,13 +397,16 @@ index 0fb27ed..f8e33ff 100644
  	if (r->chain != NULL)
 -		xfree(r->chain);
 +		nftnl_xfree(r->chain);
+ 	if (r->user.data != NULL)
+-		xfree(r->user.data);
++		nftnl_xfree(r->user.data);
  
 -	xfree(r);
 +	nftnl_xfree(r);
  }
- EXPORT_SYMBOL(nftnl_rule_free, nft_rule_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_rule_free, nft_rule_free);
  
-@@ -94,13 +94,13 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+@@ -96,13 +96,13 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
  	switch (attr) {
  	case NFTNL_RULE_TABLE:
  		if (r->table) {
@@ -389,7 +422,7 @@ index 0fb27ed..f8e33ff 100644
  			r->chain = NULL;
  		}
  		break;
-@@ -136,13 +136,13 @@ void nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -138,13 +138,13 @@ void nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  	switch(attr) {
  	case NFTNL_RULE_TABLE:
  		if (r->table)
@@ -405,7 +438,16 @@ index 0fb27ed..f8e33ff 100644
  
  		r->chain = strdup(data);
  		break;
-@@ -425,12 +425,12 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -165,7 +165,7 @@ void nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+ 		break;
+ 	case NFTNL_RULE_USERDATA:
+ 		if (r->user.data != NULL)
+-			xfree(r->user.data);
++			nftnl_xfree(r->user.data);
+ 
+ 		r->user.data = malloc(data_len);
+ 		if (!r->user.data)
+@@ -434,12 +434,12 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  		return -1;
  
  	if (tb[NFTA_RULE_TABLE]) {
@@ -420,7 +462,7 @@ index 0fb27ed..f8e33ff 100644
  		r->chain = strdup(mnl_attr_get_str(tb[NFTA_RULE_CHAIN]));
  		r->flags |= (1 << NFTNL_RULE_CHAIN);
  	}
-@@ -451,7 +451,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -460,7 +460,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
  		if (r->user.data)
@@ -429,50 +471,50 @@ index 0fb27ed..f8e33ff 100644
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -1042,7 +1042,7 @@ EXPORT_SYMBOL(nftnl_expr_iter_next, nft_rule_expr_iter_next);
+@@ -1054,7 +1054,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_next, nft_rule_expr_iter_next);
  
  void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_expr_iter_destroy, nft_rule_expr_iter_destroy);
+ EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_destroy, nft_rule_expr_iter_destroy);
  
-@@ -1072,7 +1072,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
+@@ -1084,7 +1084,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
  		list_del(&r->head);
  		nftnl_rule_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nftnl_rule_list_free, nft_rule_list_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_rule_list_free, nft_rule_list_free);
  
-@@ -1163,6 +1163,6 @@ EXPORT_SYMBOL(nftnl_rule_list_iter_next, nft_rule_list_iter_next);
+@@ -1175,6 +1175,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_next, nft_rule_list_iter_next);
  
- void nftnl_rule_list_iter_destroy(struct nftnl_rule_list_iter *iter)
+ void nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_rule_list_iter_destroy, nft_rule_list_iter_destroy);
+ EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_destroy, nft_rule_list_iter_destroy);
 diff --git a/src/ruleset.c b/src/ruleset.c
-index 7b1ab7a..b8188de 100644
+index 414b7c4..6ec38c6 100644
 --- a/src/ruleset.c
 +++ b/src/ruleset.c
-@@ -74,7 +74,7 @@ void nftnl_ruleset_free(struct nftnl_ruleset *r)
+@@ -74,7 +74,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
  		nftnl_set_list_free(r->set_list);
  	if (r->flags & (1 << NFTNL_RULESET_RULELIST))
  		nftnl_rule_list_free(r->rule_list);
 -	xfree(r);
 +	nftnl_xfree(r);
  }
- EXPORT_SYMBOL(nftnl_ruleset_free, nft_ruleset_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_ruleset_free, nft_ruleset_free);
  
 diff --git a/src/set.c b/src/set.c
-index f5a9454..4eff325 100644
+index dbea93b..025d50c 100644
 --- a/src/set.c
 +++ b/src/set.c
-@@ -45,15 +45,15 @@ void nftnl_set_free(struct nftnl_set *s)
+@@ -45,15 +45,15 @@ void nftnl_set_free(const struct nftnl_set *s)
  	struct nftnl_set_elem *elem, *tmp;
  
  	if (s->table != NULL)
@@ -489,7 +531,7 @@ index f5a9454..4eff325 100644
 -	xfree(s);
 +	nftnl_xfree(s);
  }
- EXPORT_SYMBOL(nftnl_set_free, nft_set_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_set_free, nft_set_free);
  
 @@ -69,14 +69,14 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
  	case NFTNL_SET_TABLE:
@@ -539,26 +581,26 @@ index f5a9454..4eff325 100644
  		s->name = strdup(mnl_attr_get_str(tb[NFTA_SET_NAME]));
  		s->flags |= (1 << NFTNL_SET_NAME);
  	}
-@@ -1085,7 +1085,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
+@@ -1087,7 +1087,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
  		list_del(&s->head);
  		nftnl_set_free(s);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nftnl_set_list_free, nft_set_list_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_set_list_free, nft_set_list_free);
  
-@@ -1175,7 +1175,7 @@ EXPORT_SYMBOL(nftnl_set_list_iter_next, nft_set_list_iter_next);
+@@ -1177,7 +1177,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_next, nft_set_list_iter_next);
  
- void nftnl_set_list_iter_destroy(struct nftnl_set_list_iter *iter)
+ void nftnl_set_list_iter_destroy(const struct nftnl_set_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_set_list_iter_destroy, nft_set_list_iter_destroy);
+ EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_destroy, nft_set_list_iter_destroy);
  
 diff --git a/src/set_elem.c b/src/set_elem.c
-index 293ce15..4e20159 100644
+index b9c7e1e..c8ffeae 100644
 --- a/src/set_elem.c
 +++ b/src/set_elem.c
 @@ -43,7 +43,7 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
@@ -570,16 +612,19 @@ index 293ce15..4e20159 100644
  			s->data.chain = NULL;
  		}
  	}
-@@ -51,7 +51,7 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
- 	if (s->flags & (1 << NFTNL_SET_ELEM_EXPR))
+@@ -52,9 +52,9 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
  		nftnl_expr_free(s->expr);
  
+ 	if (s->flags & (1 << NFTNL_SET_ELEM_USERDATA))
+-		xfree(s->user.data);
++		nftnl_xfree(s->user.data);
+ 
 -	xfree(s);
 +	nftnl_xfree(s);
  }
- EXPORT_SYMBOL(nftnl_set_elem_free, nft_set_elem_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_set_elem_free, nft_set_elem_free);
  
-@@ -67,7 +67,7 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
+@@ -70,7 +70,7 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
  	case NFTNL_SET_ELEM_CHAIN:
  		if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN)) {
  			if (s->data.chain) {
@@ -588,7 +633,7 @@ index 293ce15..4e20159 100644
  				s->data.chain = NULL;
  			}
  		}
-@@ -110,7 +110,7 @@ void nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+@@ -113,7 +113,7 @@ void nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
  	case NFTNL_SET_ELEM_CHAIN:	/* NFTA_SET_ELEM_DATA */
  		if (s->data.chain)
@@ -597,7 +642,16 @@ index 293ce15..4e20159 100644
  
  		s->data.chain = strdup(data);
  		break;
-@@ -390,7 +390,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
+@@ -126,7 +126,7 @@ void nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+ 		break;
+ 	case NFTNL_SET_ELEM_USERDATA: /* NFTA_SET_ELEM_USERDATA */
+ 		if (s->user.data != NULL)
+-			xfree(s->user.data);
++			nftnl_xfree(s->user.data);
+ 
+ 		s->user.data = malloc(data_len);
+ 		if (!s->user.data)
+@@ -399,7 +399,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
  			mnl_attr_get_payload(tb[NFTA_SET_ELEM_USERDATA]);
  
  		if (e->user.data)
@@ -606,7 +660,7 @@ index 293ce15..4e20159 100644
  
  		e->user.len  = mnl_attr_get_payload_len(tb[NFTA_SET_ELEM_USERDATA]);
  		e->user.data = malloc(e->user.len);
-@@ -462,13 +462,13 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -471,13 +471,13 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  		return -1;
  
  	if (tb[NFTA_SET_ELEM_LIST_TABLE]) {
@@ -622,21 +676,21 @@ index 293ce15..4e20159 100644
  		s->name =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_SET]));
  		s->flags |= (1 << NFTNL_SET_NAME);
-@@ -853,7 +853,7 @@ EXPORT_SYMBOL(nftnl_set_elems_iter_next, nft_set_elems_iter_next);
+@@ -866,7 +866,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_next, nft_set_elems_iter_next);
  
  void nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_set_elems_iter_destroy, nft_set_elems_iter_destroy);
+ EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_destroy, nft_set_elems_iter_destroy);
  
 diff --git a/src/table.c b/src/table.c
-index 28f6bd6..6aa2eb5 100644
+index 42fe49f..7363853 100644
 --- a/src/table.c
 +++ b/src/table.c
-@@ -45,9 +45,9 @@ EXPORT_SYMBOL(nftnl_table_alloc, nft_table_alloc);
- void nftnl_table_free(struct nftnl_table *t)
+@@ -45,9 +45,9 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_alloc, nft_table_alloc);
+ void nftnl_table_free(const struct nftnl_table *t)
  {
  	if (t->flags & (1 << NFTNL_TABLE_NAME))
 -		xfree(t->name);
@@ -645,7 +699,7 @@ index 28f6bd6..6aa2eb5 100644
 -	xfree(t);
 +	nftnl_xfree(t);
  }
- EXPORT_SYMBOL(nftnl_table_free, nft_table_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_table_free, nft_table_free);
  
 @@ -65,7 +65,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
  	switch (attr) {
@@ -674,28 +728,66 @@ index 28f6bd6..6aa2eb5 100644
  		t->name = strdup(mnl_attr_get_str(tb[NFTA_TABLE_NAME]));
  		t->flags |= (1 << NFTNL_TABLE_NAME);
  	}
-@@ -496,7 +496,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
+@@ -497,7 +497,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
  		list_del(&r->head);
  		nftnl_table_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nftnl_table_list_free, nft_table_list_free);
+ EXPORT_SYMBOL_ALIAS(nftnl_table_list_free, nft_table_list_free);
  
-@@ -581,6 +581,6 @@ EXPORT_SYMBOL(nftnl_table_list_iter_next, nft_table_list_iter_next);
+@@ -582,6 +582,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_next, nft_table_list_iter_next);
  
- void nftnl_table_list_iter_destroy(struct nftnl_table_list_iter *iter)
+ void nftnl_table_list_iter_destroy(const struct nftnl_table_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_table_list_iter_destroy, nft_table_list_iter_destroy);
+ EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_destroy, nft_table_list_iter_destroy);
+diff --git a/src/trace.c b/src/trace.c
+index 921fa21..1933bb8 100644
+--- a/src/trace.c
++++ b/src/trace.c
+@@ -61,13 +61,13 @@ struct nftnl_trace *nftnl_trace_alloc(void)
+ EXPORT_SYMBOL(nftnl_trace_free);
+ void nftnl_trace_free(const struct nftnl_trace *t)
+ {
+-	xfree(t->chain);
+-	xfree(t->table);
+-	xfree(t->jump_target);
+-	xfree(t->ll.data);
+-	xfree(t->nh.data);
+-	xfree(t->th.data);
+-	xfree(t);
++	nftnl_xfree(t->chain);
++	nftnl_xfree(t->table);
++	nftnl_xfree(t->jump_target);
++	nftnl_xfree(t->ll.data);
++	nftnl_xfree(t->nh.data);
++	nftnl_xfree(t->th.data);
++	nftnl_xfree(t);
+ }
+ 
+ EXPORT_SYMBOL(nftnl_trace_is_set);
+diff --git a/src/udata.c b/src/udata.c
+index 60c2f34..ec1f7dc 100644
+--- a/src/udata.c
++++ b/src/udata.c
+@@ -32,7 +32,7 @@ EXPORT_SYMBOL(nftnl_udata_buf_alloc);
+ 
+ void nftnl_udata_buf_free(const struct nftnl_udata_buf *buf)
+ {
+-	xfree(buf);
++	nftnl_xfree(buf);
+ }
+ EXPORT_SYMBOL(nftnl_udata_buf_free);
+ 
 diff --git a/src/utils.c b/src/utils.c
-index c241e5f..ba44a60 100644
+index 22710b9..f29416e 100644
 --- a/src/utils.c
 +++ b/src/utils.c
-@@ -249,7 +249,7 @@ int nftnl_fprintf(FILE *fp, void *obj, uint32_t cmd, uint32_t type, uint32_t fla
+@@ -264,7 +264,7 @@ int nftnl_fprintf(FILE *fp, const void *obj, uint32_t cmd, uint32_t type,
  
  out:
  	if (buf != _buf)
@@ -705,5 +797,5 @@ index c241e5f..ba44a60 100644
  	return ret;
  }
 -- 
-2.4.9
+2.7.3
 
diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index 365ab10..d4c9a1b 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -1,9 +1,9 @@
-comment "libnftnl needs a toolchain w/ headers >= 3.1"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+comment "libnftnl needs a toolchain w/ headers >= 3.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 
 config BR2_PACKAGE_LIBNFTNL
 	bool "libnftnl"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnftnl is a userspace library providing a low-level
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 50896fb..66987e1 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,2 +1,2 @@
-# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.5
-sha1	2ae3172251574ee36077af760933ec0369960a17	libnftnl-1.0.5.tar.bz2
+# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.6
+sha1	453f1c2d99d219baeca4ba42aa874f02d2ddf2f7	libnftnl-1.0.6.tar.bz2
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 37c82d3..2f83204 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.5
+LIBNFTNL_VERSION = 1.0.6
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 9b20b90..d0a1b89 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NFTABLES
 	bool "nftables"
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
@@ -15,5 +15,5 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
-comment "nftables needs a toolchain w/ wchar, headers >= 3.4"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12

From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 28 Jan 2018 21:42:46 +0200
Subject: [Buildroot] [PATCH 1/2] libnftnl: bump to version 1.0.9
Message-ID: <01c6442f97f7c856822ab7c26a24182a0d731d9e.1517168567.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add SHA256 hash, and a license hash.

Drop mxml dependency since XML support has been removed upstream.

Refresh the patch.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...e-to-libnftnl_xfree-to-avoid-symbol-namin.patch | 243 +++++++++++----------
 package/libnftnl/libnftnl.hash                     |   8 +-
 package/libnftnl/libnftnl.mk                       |   9 +-
 package/nftables/nftables.mk                       |   3 -
 4 files changed, 129 insertions(+), 134 deletions(-)

diff --git a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index 6f5be4e7ef02..1062f2b01aab 100644
--- a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -1,4 +1,4 @@
-From 610d015143e88629eab07067a4ae0c1d7548cfaf Mon Sep 17 00:00:00 2001
+From a51cdce6fd271a5cc393c5e56996846d9c453d6a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Thu, 2 Jun 2016 23:03:27 -0300
 Subject: [PATCH] Rename xfree() to libnftnl_xfree() to avoid symbol naming
@@ -22,6 +22,8 @@ libnftnl_xfree().
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for version 1.0.7]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[baruch: update for version 1.0.9]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  include/utils.h      |  2 +-
  src/chain.c          | 36 ++++++++++++++++++------------------
@@ -38,19 +40,19 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  src/object.c         | 14 +++++++-------
  src/rule.c           | 32 ++++++++++++++++----------------
  src/ruleset.c        |  2 +-
- src/set.c            | 26 +++++++++++++-------------
+ src/set.c            | 28 ++++++++++++++--------------
  src/set_elem.c       | 28 ++++++++++++++--------------
  src/table.c          | 14 +++++++-------
  src/trace.c          | 14 +++++++-------
  src/udata.c          |  2 +-
  src/utils.c          |  2 +-
- 21 files changed, 103 insertions(+), 103 deletions(-)
+ 21 files changed, 104 insertions(+), 104 deletions(-)
 
 diff --git a/include/utils.h b/include/utils.h
-index 924df32..f02fce7 100644
+index 3cc659652fe2..820556715013 100644
 --- a/include/utils.h
 +++ b/include/utils.h
-@@ -19,7 +19,7 @@
+@@ -17,7 +17,7 @@
  
  #define __noreturn	__attribute__((__noreturn__))
  
@@ -60,10 +62,10 @@ index 924df32..f02fce7 100644
  #define div_round_up(n, d)	(((n) + (d) - 1) / (d))
  
 diff --git a/src/chain.c b/src/chain.c
-index 49cd094..444cb79 100644
+index eff518680873..03033bbcb93b 100644
 --- a/src/chain.c
 +++ b/src/chain.c
-@@ -96,14 +96,14 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_alloc, nft_chain_alloc);
+@@ -97,14 +97,14 @@ EXPORT_SYMBOL(nftnl_chain_free);
  void nftnl_chain_free(const struct nftnl_chain *c)
  {
  	if (c->flags & (1 << NFTNL_CHAIN_NAME))
@@ -81,9 +83,9 @@ index 49cd094..444cb79 100644
 +		nftnl_xfree(c->dev);
 +	nftnl_xfree(c);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_chain_free, nft_chain_free);
  
-@@ -120,15 +120,15 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+ EXPORT_SYMBOL(nftnl_chain_is_set);
+@@ -121,15 +121,15 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_CHAIN_NAME:
@@ -102,7 +104,7 @@ index 49cd094..444cb79 100644
  		break;
  	case NFTNL_CHAIN_HOOKNUM:
  	case NFTNL_CHAIN_PRIO:
-@@ -139,7 +139,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+@@ -140,7 +140,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  	case NFTNL_CHAIN_FAMILY:
  		break;
  	case NFTNL_CHAIN_DEV:
@@ -111,7 +113,7 @@ index 49cd094..444cb79 100644
  		break;
  	default:
  		return;
-@@ -168,7 +168,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -169,7 +169,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  	switch(attr) {
  	case NFTNL_CHAIN_NAME:
  		if (c->flags & (1 << NFTNL_CHAIN_NAME))
@@ -120,7 +122,7 @@ index 49cd094..444cb79 100644
  
  		c->name = strdup(data);
  		if (!c->name)
-@@ -176,7 +176,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -177,7 +177,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_TABLE:
  		if (c->flags & (1 << NFTNL_CHAIN_TABLE))
@@ -129,7 +131,7 @@ index 49cd094..444cb79 100644
  
  		c->table = strdup(data);
  		if (!c->table)
-@@ -208,7 +208,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -209,7 +209,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_TYPE:
  		if (c->flags & (1 << NFTNL_CHAIN_TYPE))
@@ -138,7 +140,7 @@ index 49cd094..444cb79 100644
  
  		c->type = strdup(data);
  		if (!c->type)
-@@ -216,7 +216,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -217,7 +217,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_DEV:
  		if (c->flags & (1 << NFTNL_CHAIN_DEV))
@@ -147,7 +149,7 @@ index 49cd094..444cb79 100644
  
  		c->dev = strdup(data);
  		if (!c->dev)
-@@ -540,7 +540,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+@@ -541,7 +541,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  
  	if (tb[NFTA_CHAIN_NAME]) {
  		if (c->flags & (1 << NFTNL_CHAIN_NAME))
@@ -156,7 +158,7 @@ index 49cd094..444cb79 100644
  		c->name = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_NAME]));
  		if (!c->name)
  			return -1;
-@@ -548,7 +548,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+@@ -549,7 +549,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  	}
  	if (tb[NFTA_CHAIN_TABLE]) {
  		if (c->flags & (1 << NFTNL_CHAIN_TABLE))
@@ -165,7 +167,7 @@ index 49cd094..444cb79 100644
  		c->table = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TABLE]));
  		if (!c->table)
  			return -1;
-@@ -578,7 +578,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+@@ -579,7 +579,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  	}
  	if (tb[NFTA_CHAIN_TYPE]) {
  		if (c->flags & (1 << NFTNL_CHAIN_TYPE))
@@ -174,49 +176,48 @@ index 49cd094..444cb79 100644
  		c->type = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TYPE]));
  		if (!c->type)
  			return -1;
-@@ -889,7 +889,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
+@@ -902,7 +902,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
  		list_del(&r->head);
  		nftnl_chain_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_chain_list_free, nft_chain_list_free);
- 
-@@ -975,6 +975,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_list_iter_next, nft_chain_list_iter_next);
  
+ EXPORT_SYMBOL(nftnl_chain_list_is_empty);
+@@ -988,5 +988,5 @@ struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *ite
+ EXPORT_SYMBOL(nftnl_chain_list_iter_destroy);
  void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_chain_list_iter_destroy, nft_chain_list_iter_destroy);
 diff --git a/src/common.c b/src/common.c
-index bf4176c..98f8012 100644
+index 561c95439114..d0124134ea29 100644
 --- a/src/common.c
 +++ b/src/common.c
-@@ -58,7 +58,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_parse_err_alloc, nft_parse_err_alloc);
- 
+@@ -68,7 +68,7 @@ struct nftnl_parse_err *nftnl_parse_err_alloc(void)
+ EXPORT_SYMBOL(nftnl_parse_err_free);
  void nftnl_parse_err_free(struct nftnl_parse_err *err)
  {
 -	xfree(err);
 +	nftnl_xfree(err);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_parse_err_free, nft_parse_err_free);
  
+ EXPORT_SYMBOL(nftnl_parse_perror);
 diff --git a/src/expr.c b/src/expr.c
-index 8d5c562..47ecd3d 100644
+index 62565e046996..97f16275f44f 100644
 --- a/src/expr.c
 +++ b/src/expr.c
-@@ -50,7 +50,7 @@ void nftnl_expr_free(const struct nftnl_expr *expr)
+@@ -51,7 +51,7 @@ void nftnl_expr_free(const struct nftnl_expr *expr)
  	if (expr->ops->free)
  		expr->ops->free(expr);
  
 -	xfree(expr);
 +	nftnl_xfree(expr);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_expr_free, nft_rule_expr_free);
  
+ EXPORT_SYMBOL(nftnl_expr_is_set);
 @@ -270,7 +270,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
  	return expr;
  
@@ -227,10 +228,10 @@ index 8d5c562..47ecd3d 100644
  	return NULL;
  }
 diff --git a/src/expr/data_reg.c b/src/expr/data_reg.c
-index 0249258..994b388 100644
+index 1b28b291617b..8c7abdb91d21 100644
 --- a/src/expr/data_reg.c
 +++ b/src/expr/data_reg.c
-@@ -376,7 +376,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
+@@ -379,7 +379,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
  	switch(data->verdict) {
  	case NFT_JUMP:
  	case NFT_GOTO:
@@ -240,7 +241,7 @@ index 0249258..994b388 100644
  	default:
  		break;
 diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index 20a5004..f3d46a7 100644
+index 160d0e15c151..614124d841c7 100644
 --- a/src/expr/dynset.c
 +++ b/src/expr/dynset.c
 @@ -330,7 +330,7 @@ static void nftnl_expr_dynset_free(const struct nftnl_expr *e)
@@ -253,7 +254,7 @@ index 20a5004..f3d46a7 100644
  
  static bool nftnl_expr_dynset_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index 0b188cc..6c17f68 100644
+index b0570bd539a4..6a0732c38ebd 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
 @@ -44,7 +44,7 @@ nftnl_expr_immediate_set(struct nftnl_expr *e, uint16_t type,
@@ -266,7 +267,7 @@ index 0b188cc..6c17f68 100644
  		imm->data.chain = strdup(data);
  		if (!imm->data.chain)
 diff --git a/src/expr/log.c b/src/expr/log.c
-index b642255..2b24b6d 100644
+index 86d965136cd4..0624a7712237 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
 @@ -39,7 +39,7 @@ static int nftnl_expr_log_set(struct nftnl_expr *e, uint16_t type,
@@ -287,7 +288,7 @@ index b642255..2b24b6d 100644
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
  		if (!log->prefix)
-@@ -316,7 +316,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
+@@ -317,7 +317,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_log *log = nftnl_expr_data(e);
  
@@ -297,10 +298,10 @@ index b642255..2b24b6d 100644
  
  static bool nftnl_expr_log_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index 861815f..1955ed3 100644
+index 5fcb81f3a7a2..45f5dfefd33f 100644
 --- a/src/expr/lookup.c
 +++ b/src/expr/lookup.c
-@@ -259,7 +259,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
+@@ -258,7 +258,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_lookup *lookup = nftnl_expr_data(e);
  
@@ -310,7 +311,7 @@ index 861815f..1955ed3 100644
  
  static bool nftnl_expr_lookup_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/match.c b/src/expr/match.c
-index dd09e1e..09e35c5 100644
+index dd09e1e85192..09e35c528aca 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
 @@ -50,7 +50,7 @@ nftnl_expr_match_set(struct nftnl_expr *e, uint16_t type,
@@ -341,7 +342,7 @@ index dd09e1e..09e35c5 100644
  
  static bool nftnl_expr_match_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/target.c b/src/expr/target.c
-index ed4bf7d..5e28925 100644
+index ed4bf7df6328..5e28925debeb 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
 @@ -50,7 +50,7 @@ nftnl_expr_target_set(struct nftnl_expr *e, uint16_t type,
@@ -372,23 +373,23 @@ index ed4bf7d..5e28925 100644
  
  static bool nftnl_expr_target_cmp(const struct nftnl_expr *e1,
 diff --git a/src/gen.c b/src/gen.c
-index c69d2f8..0143ea0 100644
+index f92180c7baf6..4fe078d3832c 100644
 --- a/src/gen.c
 +++ b/src/gen.c
-@@ -37,7 +37,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_gen_alloc, nft_gen_alloc);
- 
+@@ -38,7 +38,7 @@ struct nftnl_gen *nftnl_gen_alloc(void)
+ EXPORT_SYMBOL(nftnl_gen_free);
  void nftnl_gen_free(const struct nftnl_gen *gen)
  {
 -	xfree(gen);
 +	nftnl_xfree(gen);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_gen_free, nft_gen_free);
  
+ EXPORT_SYMBOL(nftnl_gen_is_set);
 diff --git a/src/object.c b/src/object.c
-index 0d3dc2b..542211c 100644
+index 30000f748da4..1b5965d7abdc 100644
 --- a/src/object.c
 +++ b/src/object.c
-@@ -47,11 +47,11 @@ EXPORT_SYMBOL(nftnl_obj_alloc);
+@@ -50,11 +50,11 @@ EXPORT_SYMBOL(nftnl_obj_free);
  void nftnl_obj_free(const struct nftnl_obj *obj)
  {
  	if (obj->flags & (1 << NFTNL_OBJ_TABLE))
@@ -401,9 +402,9 @@ index 0d3dc2b..542211c 100644
 -	xfree(obj);
 +	nftnl_xfree(obj);
  }
- EXPORT_SYMBOL(nftnl_obj_free);
  
-@@ -74,11 +74,11 @@ void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
+ EXPORT_SYMBOL(nftnl_obj_is_set);
+@@ -77,11 +77,11 @@ void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
  
  	switch (attr) {
  	case NFTNL_OBJ_TABLE:
@@ -417,28 +418,27 @@ index 0d3dc2b..542211c 100644
  		obj->name = strdup(data);
  		break;
  	case NFTNL_OBJ_TYPE:
-@@ -486,7 +486,7 @@ void nftnl_obj_list_free(struct nftnl_obj_list *list)
+@@ -523,7 +523,7 @@ void nftnl_obj_list_free(struct nftnl_obj_list *list)
  		list_del(&r->head);
  		nftnl_obj_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL(nftnl_obj_list_free);
- 
-@@ -573,6 +573,6 @@ EXPORT_SYMBOL(nftnl_obj_list_iter_next);
  
+ EXPORT_SYMBOL(nftnl_obj_list_is_empty);
+@@ -610,5 +610,5 @@ struct nftnl_obj *nftnl_obj_list_iter_next(struct nftnl_obj_list_iter *iter)
+ EXPORT_SYMBOL(nftnl_obj_list_iter_destroy);
  void nftnl_obj_list_iter_destroy(struct nftnl_obj_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL(nftnl_obj_list_iter_destroy);
 diff --git a/src/rule.c b/src/rule.c
-index 22026a4..256b699 100644
+index e4cba1f7a352..911f327a6f9f 100644
 --- a/src/rule.c
 +++ b/src/rule.c
-@@ -72,13 +72,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
+@@ -75,13 +75,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
  		nftnl_expr_free(e);
  
  	if (r->flags & (1 << (NFTNL_RULE_TABLE)))
@@ -454,9 +454,9 @@ index 22026a4..256b699 100644
 -	xfree(r);
 +	nftnl_xfree(r);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_rule_free, nft_rule_free);
  
-@@ -95,10 +95,10 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+ EXPORT_SYMBOL(nftnl_rule_is_set);
+@@ -98,10 +98,10 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_RULE_TABLE:
@@ -469,8 +469,8 @@ index 22026a4..256b699 100644
  		break;
  	case NFTNL_RULE_HANDLE:
  	case NFTNL_RULE_COMPAT_PROTO:
-@@ -107,7 +107,7 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
- 	case NFTNL_RULE_FAMILY:
+@@ -111,7 +111,7 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+ 	case NFTNL_RULE_ID:
  		break;
  	case NFTNL_RULE_USERDATA:
 -		xfree(r->user.data);
@@ -478,7 +478,7 @@ index 22026a4..256b699 100644
  		break;
  	}
  
-@@ -132,7 +132,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -137,7 +137,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  	switch(attr) {
  	case NFTNL_RULE_TABLE:
  		if (r->flags & (1 << NFTNL_RULE_TABLE))
@@ -487,7 +487,7 @@ index 22026a4..256b699 100644
  
  		r->table = strdup(data);
  		if (!r->table)
-@@ -140,7 +140,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -145,7 +145,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  		break;
  	case NFTNL_RULE_CHAIN:
  		if (r->flags & (1 << NFTNL_RULE_CHAIN))
@@ -496,7 +496,7 @@ index 22026a4..256b699 100644
  
  		r->chain = strdup(data);
  		if (!r->chain)
-@@ -163,7 +163,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -168,7 +168,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  		break;
  	case NFTNL_RULE_USERDATA:
  		if (r->flags & (1 << NFTNL_RULE_USERDATA))
@@ -505,7 +505,7 @@ index 22026a4..256b699 100644
  
  		r->user.data = malloc(data_len);
  		if (!r->user.data)
-@@ -436,7 +436,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -453,7 +453,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  
  	if (tb[NFTA_RULE_TABLE]) {
  		if (r->flags & (1 << NFTNL_RULE_TABLE))
@@ -514,7 +514,7 @@ index 22026a4..256b699 100644
  		r->table = strdup(mnl_attr_get_str(tb[NFTA_RULE_TABLE]));
  		if (!r->table)
  			return -1;
-@@ -444,7 +444,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -461,7 +461,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  	}
  	if (tb[NFTA_RULE_CHAIN]) {
  		if (r->flags & (1 << NFTNL_RULE_CHAIN))
@@ -523,7 +523,7 @@ index 22026a4..256b699 100644
  		r->chain = strdup(mnl_attr_get_str(tb[NFTA_RULE_CHAIN]));
  		if (!r->chain)
  			return -1;
-@@ -473,7 +473,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -490,7 +490,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
  		if (r->flags & (1 << NFTNL_RULE_USERDATA))
@@ -532,50 +532,49 @@ index 22026a4..256b699 100644
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -915,7 +915,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_next, nft_rule_expr_iter_next);
- 
+@@ -910,7 +910,7 @@ struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
+ EXPORT_SYMBOL(nftnl_expr_iter_destroy);
  void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_destroy, nft_rule_expr_iter_destroy);
  
-@@ -976,7 +976,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
+ EXPORT_SYMBOL(nftnl_rule_cmp);
+@@ -971,7 +971,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
  		list_del(&r->head);
  		nftnl_rule_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_rule_list_free, nft_rule_list_free);
- 
-@@ -1068,6 +1068,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_next, nft_rule_list_iter_next);
  
+ EXPORT_SYMBOL(nftnl_rule_list_is_empty);
+@@ -1063,5 +1063,5 @@ struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
+ EXPORT_SYMBOL(nftnl_rule_list_iter_destroy);
  void nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_destroy, nft_rule_list_iter_destroy);
 diff --git a/src/ruleset.c b/src/ruleset.c
-index b6ca565..0867e2a 100644
+index eb49fde582c2..1639cae68c61 100644
 --- a/src/ruleset.c
 +++ b/src/ruleset.c
-@@ -71,7 +71,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
+@@ -72,7 +72,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
  		nftnl_set_list_free(r->set_list);
  	if (r->flags & (1 << NFTNL_RULESET_RULELIST))
  		nftnl_rule_list_free(r->rule_list);
 -	xfree(r);
 +	nftnl_xfree(r);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_ruleset_free, nft_ruleset_free);
  
+ EXPORT_SYMBOL(nftnl_ruleset_is_set);
 diff --git a/src/set.c b/src/set.c
-index 14d28b5..0e93503 100644
+index ac24eae6bb16..2b758c4ec89a 100644
 --- a/src/set.c
 +++ b/src/set.c
-@@ -45,15 +45,15 @@ void nftnl_set_free(const struct nftnl_set *s)
+@@ -46,17 +46,17 @@ void nftnl_set_free(const struct nftnl_set *s)
  	struct nftnl_set_elem *elem, *tmp;
  
  	if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -584,6 +583,9 @@ index 14d28b5..0e93503 100644
  	if (s->flags & (1 << NFTNL_SET_NAME))
 -		xfree(s->name);
 +		nftnl_xfree(s->name);
+ 	if (s->flags & (1 << NFTNL_SET_USERDATA))
+-		xfree(s->user.data);
++		nftnl_xfree(s->user.data);
  
  	list_for_each_entry_safe(elem, tmp, &s->element_list, head) {
  		list_del(&elem->head);
@@ -592,9 +594,9 @@ index 14d28b5..0e93503 100644
 -	xfree(s);
 +	nftnl_xfree(s);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_set_free, nft_set_free);
  
-@@ -70,10 +70,10 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+ EXPORT_SYMBOL(nftnl_set_is_set);
+@@ -73,10 +73,10 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_SET_TABLE:
@@ -607,7 +609,7 @@ index 14d28b5..0e93503 100644
  		break;
  	case NFTNL_SET_FLAGS:
  	case NFTNL_SET_KEY_TYPE:
-@@ -89,7 +89,7 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+@@ -92,7 +92,7 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
  	case NFTNL_SET_GC_INTERVAL:
  		break;
  	case NFTNL_SET_USERDATA:
@@ -616,7 +618,7 @@ index 14d28b5..0e93503 100644
  		break;
  	default:
  		return;
-@@ -122,7 +122,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+@@ -125,7 +125,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  	switch(attr) {
  	case NFTNL_SET_TABLE:
  		if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -625,7 +627,7 @@ index 14d28b5..0e93503 100644
  
  		s->table = strdup(data);
  		if (!s->table)
-@@ -130,7 +130,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+@@ -133,7 +133,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  		break;
  	case NFTNL_SET_NAME:
  		if (s->flags & (1 << NFTNL_SET_NAME))
@@ -634,7 +636,7 @@ index 14d28b5..0e93503 100644
  
  		s->name = strdup(data);
  		if (!s->name)
-@@ -174,7 +174,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+@@ -177,7 +177,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  		break;
  	case NFTNL_SET_USERDATA:
  		if (s->flags & (1 << NFTNL_SET_USERDATA))
@@ -643,7 +645,7 @@ index 14d28b5..0e93503 100644
  
  		s->user.data = malloc(data_len);
  		if (!s->user.data)
-@@ -474,7 +474,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -478,7 +478,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  
  	if (tb[NFTA_SET_TABLE]) {
  		if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -652,7 +654,7 @@ index 14d28b5..0e93503 100644
  		s->table = strdup(mnl_attr_get_str(tb[NFTA_SET_TABLE]));
  		if (!s->table)
  			return -1;
-@@ -482,7 +482,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -486,7 +486,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  	}
  	if (tb[NFTA_SET_NAME]) {
  		if (s->flags & (1 << NFTNL_SET_NAME))
@@ -661,29 +663,29 @@ index 14d28b5..0e93503 100644
  		s->name = strdup(mnl_attr_get_str(tb[NFTA_SET_NAME]));
  		if (!s->name)
  			return -1;
-@@ -972,7 +972,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
+@@ -982,7 +982,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
  		list_del(&s->head);
  		nftnl_set_free(s);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_set_list_free, nft_set_list_free);
- 
-@@ -1064,7 +1064,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_next, nft_set_list_iter_next);
  
+ EXPORT_SYMBOL(nftnl_set_list_is_empty);
+@@ -1074,7 +1074,7 @@ struct nftnl_set *nftnl_set_list_iter_next(struct nftnl_set_list_iter *iter)
+ EXPORT_SYMBOL(nftnl_set_list_iter_destroy);
  void nftnl_set_list_iter_destroy(const struct nftnl_set_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_destroy, nft_set_list_iter_destroy);
  
+ static struct nftnl_set *nftnl_set_lookup(const char *this_set_name,
 diff --git a/src/set_elem.c b/src/set_elem.c
-index fa87476..6d404bd 100644
+index e02a38791c9a..100ccda699c6 100644
 --- a/src/set_elem.c
 +++ b/src/set_elem.c
-@@ -42,18 +42,18 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_elem_alloc, nft_set_elem_alloc);
+@@ -43,18 +43,18 @@ EXPORT_SYMBOL(nftnl_set_elem_free);
  void nftnl_set_elem_free(struct nftnl_set_elem *s)
  {
  	if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN))
@@ -704,9 +706,9 @@ index fa87476..6d404bd 100644
 -	xfree(s);
 +	nftnl_xfree(s);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_set_elem_free, nft_set_elem_free);
  
-@@ -70,7 +70,7 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
+ EXPORT_SYMBOL(nftnl_set_elem_is_set);
+@@ -71,7 +71,7 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_SET_ELEM_CHAIN:
@@ -715,7 +717,7 @@ index fa87476..6d404bd 100644
  		break;
  	case NFTNL_SET_ELEM_FLAGS:
  	case NFTNL_SET_ELEM_KEY:	/* NFTA_SET_ELEM_KEY */
-@@ -80,13 +80,13 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
+@@ -81,13 +81,13 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
  	case NFTNL_SET_ELEM_EXPIRATION:	/* NFTA_SET_ELEM_EXPIRATION */
  		break;
  	case NFTNL_SET_ELEM_USERDATA:	/* NFTA_SET_ELEM_USERDATA */
@@ -731,7 +733,7 @@ index fa87476..6d404bd 100644
  		break;
  	default:
  		return;
-@@ -112,7 +112,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+@@ -113,7 +113,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
  	case NFTNL_SET_ELEM_CHAIN:	/* NFTA_SET_ELEM_DATA */
  		if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN))
@@ -740,7 +742,7 @@ index fa87476..6d404bd 100644
  
  		s->data.chain = strdup(data);
  		if (!s->data.chain)
-@@ -127,7 +127,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+@@ -128,7 +128,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
  	case NFTNL_SET_ELEM_USERDATA: /* NFTA_SET_ELEM_USERDATA */
  		if (s->flags & (1 << NFTNL_SET_ELEM_USERDATA))
@@ -749,7 +751,7 @@ index fa87476..6d404bd 100644
  
  		s->user.data = malloc(data_len);
  		if (!s->user.data)
-@@ -137,7 +137,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+@@ -138,7 +138,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
  	case NFTNL_SET_ELEM_OBJREF:
  		if (s->flags & (1 << NFTNL_SET_ELEM_OBJREF))
@@ -767,7 +769,7 @@ index fa87476..6d404bd 100644
  
  		e->user.len  = mnl_attr_get_payload_len(tb[NFTA_SET_ELEM_USERDATA]);
  		e->user.data = malloc(e->user.len);
-@@ -515,7 +515,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -516,7 +516,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  
  	if (tb[NFTA_SET_ELEM_LIST_TABLE]) {
  		if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -776,7 +778,7 @@ index fa87476..6d404bd 100644
  		s->table =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_TABLE]));
  		if (!s->table)
-@@ -524,7 +524,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -525,7 +525,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  	}
  	if (tb[NFTA_SET_ELEM_LIST_SET]) {
  		if (s->flags & (1 << NFTNL_SET_NAME))
@@ -785,20 +787,20 @@ index fa87476..6d404bd 100644
  		s->name =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_SET]));
  		if (!s->name)
-@@ -810,7 +810,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_next, nft_set_elems_iter_next);
- 
+@@ -816,7 +816,7 @@ struct nftnl_set_elem *nftnl_set_elems_iter_next(struct nftnl_set_elems_iter *it
+ EXPORT_SYMBOL(nftnl_set_elems_iter_destroy);
  void nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_destroy, nft_set_elems_iter_destroy);
  
+ static bool nftnl_attr_nest_overflow(struct nlmsghdr *nlh,
 diff --git a/src/table.c b/src/table.c
-index 4286d51..1e15ea7 100644
+index 7f97ca4e5807..7ac57c33021b 100644
 --- a/src/table.c
 +++ b/src/table.c
-@@ -45,9 +45,9 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_alloc, nft_table_alloc);
+@@ -46,9 +46,9 @@ EXPORT_SYMBOL(nftnl_table_free);
  void nftnl_table_free(const struct nftnl_table *t)
  {
  	if (t->flags & (1 << NFTNL_TABLE_NAME))
@@ -808,9 +810,9 @@ index 4286d51..1e15ea7 100644
 -	xfree(t);
 +	nftnl_xfree(t);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_table_free, nft_table_free);
  
-@@ -64,7 +64,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
+ EXPORT_SYMBOL(nftnl_table_is_set);
+@@ -65,7 +65,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_TABLE_NAME:
@@ -819,7 +821,7 @@ index 4286d51..1e15ea7 100644
  		break;
  	case NFTNL_TABLE_FLAGS:
  	case NFTNL_TABLE_FAMILY:
-@@ -90,7 +90,7 @@ int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
+@@ -91,7 +91,7 @@ int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
  	switch (attr) {
  	case NFTNL_TABLE_NAME:
  		if (t->flags & (1 << NFTNL_TABLE_NAME))
@@ -828,7 +830,7 @@ index 4286d51..1e15ea7 100644
  
  		t->name = strdup(data);
  		if (!t->name)
-@@ -229,7 +229,7 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
+@@ -230,7 +230,7 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
  
  	if (tb[NFTA_TABLE_NAME]) {
  		if (t->flags & (1 << NFTNL_TABLE_NAME))
@@ -837,25 +839,24 @@ index 4286d51..1e15ea7 100644
  		t->name = strdup(mnl_attr_get_str(tb[NFTA_TABLE_NAME]));
  		if (!t->name)
  			return -1;
-@@ -448,7 +448,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
+@@ -452,7 +452,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
  		list_del(&r->head);
  		nftnl_table_free(r);
  	}
 -	xfree(list);
 +	nftnl_xfree(list);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_table_list_free, nft_table_list_free);
- 
-@@ -534,6 +534,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_next, nft_table_list_iter_next);
  
+ EXPORT_SYMBOL(nftnl_table_list_is_empty);
+@@ -538,5 +538,5 @@ struct nftnl_table *nftnl_table_list_iter_next(struct nftnl_table_list_iter *ite
+ EXPORT_SYMBOL(nftnl_table_list_iter_destroy);
  void nftnl_table_list_iter_destroy(const struct nftnl_table_list_iter *iter)
  {
 -	xfree(iter);
 +	nftnl_xfree(iter);
  }
- EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_destroy, nft_table_list_iter_destroy);
 diff --git a/src/trace.c b/src/trace.c
-index bd05d3c..abfc533 100644
+index f4264377508e..8a18391d83d1 100644
 --- a/src/trace.c
 +++ b/src/trace.c
 @@ -61,13 +61,13 @@ struct nftnl_trace *nftnl_trace_alloc(void)
@@ -880,20 +881,20 @@ index bd05d3c..abfc533 100644
  
  EXPORT_SYMBOL(nftnl_trace_is_set);
 diff --git a/src/udata.c b/src/udata.c
-index 60c2f34..ec1f7dc 100644
+index 6bd965161c43..049819304ef5 100644
 --- a/src/udata.c
 +++ b/src/udata.c
-@@ -32,7 +32,7 @@ EXPORT_SYMBOL(nftnl_udata_buf_alloc);
- 
+@@ -33,7 +33,7 @@ struct nftnl_udata_buf *nftnl_udata_buf_alloc(uint32_t data_size)
+ EXPORT_SYMBOL(nftnl_udata_buf_free);
  void nftnl_udata_buf_free(const struct nftnl_udata_buf *buf)
  {
 -	xfree(buf);
 +	nftnl_xfree(buf);
  }
- EXPORT_SYMBOL(nftnl_udata_buf_free);
  
+ EXPORT_SYMBOL(nftnl_udata_buf_len);
 diff --git a/src/utils.c b/src/utils.c
-index 3e44960..08f668f 100644
+index 3e449609395e..08f668f56a95 100644
 --- a/src/utils.c
 +++ b/src/utils.c
 @@ -264,7 +264,7 @@ int nftnl_fprintf(FILE *fp, const void *obj, uint32_t cmd, uint32_t type,
@@ -906,5 +907,5 @@ index 3e44960..08f668f 100644
  	return ret;
  }
 -- 
-2.10.2
+2.15.1
 
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 63271e0f757d..c798dd2bb1ed 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,2 +1,6 @@
-# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.7
-sha1	381b2b3cbb3fad186cb3f57bbf32d70f0b3c3c8e	libnftnl-1.0.7.tar.bz2
+# From http://www.netfilter.org/projects/libnftnl/downloads.html
+sha1	90b70f52a26f88ab1106671e797faac21265fa6a	libnftnl-1.0.9.tar.bz2
+# Locally calculated after checking pgp signature
+# http://www.netfilter.org/projects/libnftnl/files/libnftnl-1.0.9.tar.bz2.sig
+sha256	fec1d824aee301e59a11aeaae2a2d429cb99ead81e6bafab791a4dd6569b3635	libnftnl-1.0.9.tar.bz2
+sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index bde3ee4211a6..8c8b3f8243c8 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.7
+LIBNFTNL_VERSION = 1.0.9
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
@@ -19,11 +19,4 @@ else
 LIBNFTNL_CONF_OPTS += --without-json-parsing
 endif
 
-ifeq ($(BR2_PACKAGE_LIBNFTNL_XML),y)
-LIBNFTNL_CONF_OPTS += --with-xml-parsing
-LIBNFTNL_DEPENDENCIES += mxml
-else
-LIBNFTNL_CONF_OPTS += --without-xml-parsing
-endif
-
 $(eval $(autotools-package))
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index d1e605565e8c..50ffa0012951 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -22,9 +22,6 @@ endif
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
 NFTABLES_LIBS += -ljansson -lm
 endif
-ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_XML),yy)
-NFTABLES_LIBS += -lmxml -lpthread
-endif
 
 NFTABLES_CONF_ENV = \
 	ac_cv_prog_CONFIG_PDF=no \
-- 
2.15.1

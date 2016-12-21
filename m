From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 17:14:38 +0100
Subject: [Buildroot] [git commit] libnftnl: bump to version 1.0.7
Message-ID: <20161221165223.9847981E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47943a71446158056459a7e10195c89d222e7824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-to-libnftnl_xfree-to-avoid-symbol-namin.patch | 563 ++++++++++++---------
 package/libnftnl/libnftnl.hash                     |   4 +-
 package/libnftnl/libnftnl.mk                       |   2 +-
 3 files changed, 339 insertions(+), 230 deletions(-)

diff --git a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index fc96a12..6f5be4e 100644
--- a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -20,15 +20,14 @@ To solve this, this patch renames the libnftnl xfree() function to
 libnftnl_xfree().
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Gustavo: update for version 1.0.5]
-
+[Gustavo: update for version 1.0.7]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  include/utils.h      |  2 +-
- src/chain.c          | 28 ++++++++++++++--------------
+ src/chain.c          | 36 ++++++++++++++++++------------------
  src/common.c         |  2 +-
  src/expr.c           |  4 ++--
- src/expr/data_reg.c  |  4 ++--
+ src/expr/data_reg.c  |  2 +-
  src/expr/dynset.c    |  2 +-
  src/expr/immediate.c |  2 +-
  src/expr/log.c       |  6 +++---
@@ -36,19 +35,19 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  src/expr/match.c     |  6 +++---
  src/expr/target.c    |  6 +++---
  src/gen.c            |  2 +-
- src/mxml.c           |  2 +-
- src/rule.c           | 30 +++++++++++++++---------------
+ src/object.c         | 14 +++++++-------
+ src/rule.c           | 32 ++++++++++++++++----------------
  src/ruleset.c        |  2 +-
- src/set.c            | 22 +++++++++++-----------
- src/set_elem.c       | 20 ++++++++++----------
+ src/set.c            | 26 +++++++++++++-------------
+ src/set_elem.c       | 28 ++++++++++++++--------------
  src/table.c          | 14 +++++++-------
  src/trace.c          | 14 +++++++-------
  src/udata.c          |  2 +-
  src/utils.c          |  2 +-
- 21 files changed, 87 insertions(+), 87 deletions(-)
+ 21 files changed, 103 insertions(+), 103 deletions(-)
 
 diff --git a/include/utils.h b/include/utils.h
-index 46ff18a..0320c96 100644
+index 924df32..f02fce7 100644
 --- a/include/utils.h
 +++ b/include/utils.h
 @@ -19,7 +19,7 @@
@@ -61,98 +60,121 @@ index 46ff18a..0320c96 100644
  #define div_round_up(n, d)	(((n) + (d) - 1) / (d))
  
 diff --git a/src/chain.c b/src/chain.c
-index 990c576..b8f1e1f 100644
+index 49cd094..444cb79 100644
 --- a/src/chain.c
 +++ b/src/chain.c
-@@ -96,13 +96,13 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_alloc, nft_chain_alloc);
+@@ -96,14 +96,14 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_alloc, nft_chain_alloc);
  void nftnl_chain_free(const struct nftnl_chain *c)
  {
- 	if (c->table != NULL)
+ 	if (c->flags & (1 << NFTNL_CHAIN_NAME))
+-		xfree(c->name);
++		nftnl_xfree(c->name);
+ 	if (c->flags & (1 << NFTNL_CHAIN_TABLE))
 -		xfree(c->table);
 +		nftnl_xfree(c->table);
- 	if (c->type != NULL)
+ 	if (c->flags & (1 << NFTNL_CHAIN_TYPE))
 -		xfree(c->type);
 +		nftnl_xfree(c->type);
- 	if (c->dev != NULL)
+ 	if (c->flags & (1 << NFTNL_CHAIN_DEV))
 -		xfree(c->dev);
-+		nftnl_xfree(c->dev);
- 
 -	xfree(c);
++		nftnl_xfree(c->dev);
 +	nftnl_xfree(c);
  }
  EXPORT_SYMBOL_ALIAS(nftnl_chain_free, nft_chain_free);
  
-@@ -120,7 +120,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+@@ -120,15 +120,15 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+ 
  	switch (attr) {
+ 	case NFTNL_CHAIN_NAME:
+-		xfree(c->name);
++		nftnl_xfree(c->name);
+ 		break;
  	case NFTNL_CHAIN_TABLE:
- 		if (c->table) {
--			xfree(c->table);
-+			nftnl_xfree(c->table);
- 			c->table = NULL;
- 		}
+-		xfree(c->table);
++		nftnl_xfree(c->table);
  		break;
-@@ -128,7 +128,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+ 	case NFTNL_CHAIN_USE:
  		break;
  	case NFTNL_CHAIN_TYPE:
- 		if (c->type) {
--			xfree(c->type);
-+			nftnl_xfree(c->type);
- 			c->type = NULL;
- 		}
+-		xfree(c->type);
++		nftnl_xfree(c->type);
  		break;
-@@ -143,7 +143,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+ 	case NFTNL_CHAIN_HOOKNUM:
+ 	case NFTNL_CHAIN_PRIO:
+@@ -139,7 +139,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+ 	case NFTNL_CHAIN_FAMILY:
  		break;
  	case NFTNL_CHAIN_DEV:
- 		if (c->dev) {
--			xfree(c->dev);
-+			nftnl_xfree(c->dev);
- 			c->dev = NULL;
- 		}
+-		xfree(c->dev);
++		nftnl_xfree(c->dev);
  		break;
-@@ -179,7 +179,7 @@ void nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+ 	default:
+ 		return;
+@@ -168,7 +168,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+ 	switch(attr) {
+ 	case NFTNL_CHAIN_NAME:
+ 		if (c->flags & (1 << NFTNL_CHAIN_NAME))
+-			xfree(c->name);
++			nftnl_xfree(c->name);
+ 
+ 		c->name = strdup(data);
+ 		if (!c->name)
+@@ -176,7 +176,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_TABLE:
- 		if (c->table)
+ 		if (c->flags & (1 << NFTNL_CHAIN_TABLE))
 -			xfree(c->table);
 +			nftnl_xfree(c->table);
  
  		c->table = strdup(data);
- 		break;
-@@ -209,13 +209,13 @@ void nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+ 		if (!c->table)
+@@ -208,7 +208,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_TYPE:
- 		if (c->type)
+ 		if (c->flags & (1 << NFTNL_CHAIN_TYPE))
 -			xfree(c->type);
 +			nftnl_xfree(c->type);
  
  		c->type = strdup(data);
+ 		if (!c->type)
+@@ -216,7 +216,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_DEV:
- 		if (c->dev)
+ 		if (c->flags & (1 << NFTNL_CHAIN_DEV))
 -			xfree(c->dev);
 +			nftnl_xfree(c->dev);
  
  		c->dev = strdup(data);
- 		break;
-@@ -535,7 +535,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
- 		c->flags |= (1 << NFTNL_CHAIN_NAME);
+ 		if (!c->dev)
+@@ -540,7 +540,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+ 
+ 	if (tb[NFTA_CHAIN_NAME]) {
+ 		if (c->flags & (1 << NFTNL_CHAIN_NAME))
+-			xfree(c->name);
++			nftnl_xfree(c->name);
+ 		c->name = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_NAME]));
+ 		if (!c->name)
+ 			return -1;
+@@ -548,7 +548,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  	}
  	if (tb[NFTA_CHAIN_TABLE]) {
--		xfree(c->table);
-+		nftnl_xfree(c->table);
+ 		if (c->flags & (1 << NFTNL_CHAIN_TABLE))
+-			xfree(c->table);
++			nftnl_xfree(c->table);
  		c->table = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TABLE]));
- 		c->flags |= (1 << NFTNL_CHAIN_TABLE);
- 	}
-@@ -562,7 +562,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
- 		c->flags |= (1 << NFTNL_CHAIN_HANDLE);
+ 		if (!c->table)
+ 			return -1;
+@@ -578,7 +578,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  	}
  	if (tb[NFTA_CHAIN_TYPE]) {
--		xfree(c->type);
-+		nftnl_xfree(c->type);
+ 		if (c->flags & (1 << NFTNL_CHAIN_TYPE))
+-			xfree(c->type);
++			nftnl_xfree(c->type);
  		c->type = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TYPE]));
- 		c->flags |= (1 << NFTNL_CHAIN_TYPE);
- 	}
-@@ -976,7 +976,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
+ 		if (!c->type)
+ 			return -1;
+@@ -889,7 +889,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
  		list_del(&r->head);
  		nftnl_chain_free(r);
  	}
@@ -161,7 +183,7 @@ index 990c576..b8f1e1f 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_chain_list_free, nft_chain_list_free);
  
-@@ -1061,6 +1061,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_list_iter_next, nft_chain_list_iter_next);
+@@ -975,6 +975,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_chain_list_iter_next, nft_chain_list_iter_next);
  
  void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
  {
@@ -183,7 +205,7 @@ index bf4176c..98f8012 100644
  EXPORT_SYMBOL_ALIAS(nftnl_parse_err_free, nft_parse_err_free);
  
 diff --git a/src/expr.c b/src/expr.c
-index ed07dc4..6c08bd0 100644
+index 8d5c562..47ecd3d 100644
 --- a/src/expr.c
 +++ b/src/expr.c
 @@ -50,7 +50,7 @@ void nftnl_expr_free(const struct nftnl_expr *expr)
@@ -195,7 +217,7 @@ index ed07dc4..6c08bd0 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_expr_free, nft_rule_expr_free);
  
-@@ -257,7 +257,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
+@@ -270,7 +270,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
  	return expr;
  
  err2:
@@ -205,19 +227,10 @@ index ed07dc4..6c08bd0 100644
  	return NULL;
  }
 diff --git a/src/expr/data_reg.c b/src/expr/data_reg.c
-index 2a23285..2b1a87e 100644
+index 0249258..994b388 100644
 --- a/src/expr/data_reg.c
 +++ b/src/expr/data_reg.c
-@@ -123,7 +123,7 @@ static int nftnl_data_reg_verdict_xml_parse(union nftnl_data_reg *reg,
- 				   NFTNL_XML_OPT, err);
- 	if (chain != NULL) {
- 		if (reg->chain)
--			xfree(reg->chain);
-+			nftnl_xfree(reg->chain);
- 
- 		reg->chain = strdup(chain);
- 	}
-@@ -511,7 +511,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
+@@ -376,7 +376,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
  	switch(data->verdict) {
  	case NFT_JUMP:
  	case NFT_GOTO:
@@ -227,10 +240,10 @@ index 2a23285..2b1a87e 100644
  	default:
  		break;
 diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index c8d97a5..604600a 100644
+index 20a5004..f3d46a7 100644
 --- a/src/expr/dynset.c
 +++ b/src/expr/dynset.c
-@@ -361,7 +361,7 @@ static void nftnl_expr_dynset_free(const struct nftnl_expr *e)
+@@ -330,7 +330,7 @@ static void nftnl_expr_dynset_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_dynset *dynset = nftnl_expr_data(e);
  
@@ -238,34 +251,34 @@ index c8d97a5..604600a 100644
 +	nftnl_xfree(dynset->set_name);
  }
  
- struct expr_ops expr_ops_dynset = {
+ static bool nftnl_expr_dynset_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index eb2ca0f..237f944 100644
+index 0b188cc..6c17f68 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
 @@ -44,7 +44,7 @@ nftnl_expr_immediate_set(struct nftnl_expr *e, uint16_t type,
  		break;
  	case NFTNL_EXPR_IMM_CHAIN:
- 		if (imm->data.chain)
+ 		if (e->flags & (1 << NFTNL_EXPR_IMM_CHAIN))
 -			xfree(imm->data.chain);
 +			nftnl_xfree(imm->data.chain);
  
  		imm->data.chain = strdup(data);
- 		break;
+ 		if (!imm->data.chain)
 diff --git a/src/expr/log.c b/src/expr/log.c
-index c3dc0a6..ab24686 100644
+index b642255..2b24b6d 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
-@@ -38,7 +38,7 @@ static int nftnl_expr_log_set(struct nftnl_expr *e, uint16_t type,
+@@ -39,7 +39,7 @@ static int nftnl_expr_log_set(struct nftnl_expr *e, uint16_t type,
  	switch(type) {
  	case NFTNL_EXPR_LOG_PREFIX:
- 		if (log->prefix)
+ 		if (log->flags & (1 << NFTNL_EXPR_LOG_PREFIX))
 -			xfree(log->prefix);
 +			nftnl_xfree(log->prefix);
  
  		log->prefix = strdup(data);
- 		break;
-@@ -152,7 +152,7 @@ nftnl_expr_log_parse(struct nftnl_expr *e, struct nlattr *attr)
+ 		if (!log->prefix)
+@@ -155,7 +155,7 @@ nftnl_expr_log_parse(struct nftnl_expr *e, struct nlattr *attr)
  
  	if (tb[NFTA_LOG_PREFIX]) {
  		if (log->prefix)
@@ -273,8 +286,8 @@ index c3dc0a6..ab24686 100644
 +			nftnl_xfree(log->prefix);
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
- 		e->flags |= (1 << NFTNL_EXPR_LOG_PREFIX);
-@@ -329,7 +329,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
+ 		if (!log->prefix)
+@@ -316,7 +316,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_log *log = nftnl_expr_data(e);
  
@@ -282,12 +295,12 @@ index c3dc0a6..ab24686 100644
 +	nftnl_xfree(log->prefix);
  }
  
- struct expr_ops expr_ops_log = {
+ static bool nftnl_expr_log_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index ed32ba6..6e9b0e6 100644
+index 861815f..1955ed3 100644
 --- a/src/expr/lookup.c
 +++ b/src/expr/lookup.c
-@@ -258,7 +258,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
+@@ -259,7 +259,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_lookup *lookup = nftnl_expr_data(e);
  
@@ -295,15 +308,15 @@ index ed32ba6..6e9b0e6 100644
 +	nftnl_xfree(lookup->set_name);
  }
  
- struct expr_ops expr_ops_lookup = {
+ static bool nftnl_expr_lookup_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/match.c b/src/expr/match.c
-index 2929b43..ec46394 100644
+index dd09e1e..09e35c5 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
 @@ -50,7 +50,7 @@ nftnl_expr_match_set(struct nftnl_expr *e, uint16_t type,
  		break;
  	case NFTNL_EXPR_MT_INFO:
- 		if (mt->data)
+ 		if (e->flags & (1 << NFTNL_EXPR_MT_INFO))
 -			xfree(mt->data);
 +			nftnl_xfree(mt->data);
  
@@ -312,13 +325,13 @@ index 2929b43..ec46394 100644
 @@ -147,7 +147,7 @@ static int nftnl_expr_match_parse(struct nftnl_expr *e, struct nlattr *attr)
  		void *match_data;
  
- 		if (match->data)
+ 		if (e->flags & (1 << NFTNL_EXPR_MT_INFO))
 -			xfree(match->data);
 +			nftnl_xfree(match->data);
  
  		match_data = calloc(1, len);
  		if (match_data == NULL)
-@@ -237,7 +237,7 @@ static void nftnl_expr_match_free(const struct nftnl_expr *e)
+@@ -217,7 +217,7 @@ static void nftnl_expr_match_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_match *match = nftnl_expr_data(e);
  
@@ -326,15 +339,15 @@ index 2929b43..ec46394 100644
 +	nftnl_xfree(match->data);
  }
  
- struct expr_ops expr_ops_match = {
+ static bool nftnl_expr_match_cmp(const struct nftnl_expr *e1,
 diff --git a/src/expr/target.c b/src/expr/target.c
-index 68a7d8a..05f9e5a 100644
+index ed4bf7d..5e28925 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
 @@ -50,7 +50,7 @@ nftnl_expr_target_set(struct nftnl_expr *e, uint16_t type,
  		break;
  	case NFTNL_EXPR_TG_INFO:
- 		if (tg->data)
+ 		if (e->flags & (1 << NFTNL_EXPR_TG_INFO))
 -			xfree(tg->data);
 +			nftnl_xfree(tg->data);
  
@@ -349,7 +362,7 @@ index 68a7d8a..05f9e5a 100644
  
  		target_data = calloc(1, len);
  		if (target_data == NULL)
-@@ -238,7 +238,7 @@ static void nftnl_expr_target_free(const struct nftnl_expr *e)
+@@ -217,7 +217,7 @@ static void nftnl_expr_target_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_target *target = nftnl_expr_data(e);
  
@@ -357,9 +370,9 @@ index 68a7d8a..05f9e5a 100644
 +	nftnl_xfree(target->data);
  }
  
- struct expr_ops expr_ops_target = {
+ static bool nftnl_expr_target_cmp(const struct nftnl_expr *e1,
 diff --git a/src/gen.c b/src/gen.c
-index 115a105..576771a 100644
+index c69d2f8..0143ea0 100644
 --- a/src/gen.c
 +++ b/src/gen.c
 @@ -37,7 +37,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_gen_alloc, nft_gen_alloc);
@@ -371,33 +384,70 @@ index 115a105..576771a 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_gen_free, nft_gen_free);
  
-diff --git a/src/mxml.c b/src/mxml.c
-index 51dbf1b..5b2aa57 100644
---- a/src/mxml.c
-+++ b/src/mxml.c
-@@ -85,7 +85,7 @@ struct nftnl_expr *nftnl_mxml_expr_parse(mxml_node_t *node,
- 		goto err_expr;
+diff --git a/src/object.c b/src/object.c
+index 0d3dc2b..542211c 100644
+--- a/src/object.c
++++ b/src/object.c
+@@ -47,11 +47,11 @@ EXPORT_SYMBOL(nftnl_obj_alloc);
+ void nftnl_obj_free(const struct nftnl_obj *obj)
+ {
+ 	if (obj->flags & (1 << NFTNL_OBJ_TABLE))
+-		xfree(obj->table);
++		nftnl_xfree(obj->table);
+ 	if (obj->flags & (1 << NFTNL_OBJ_NAME))
+-		xfree(obj->name);
++		nftnl_xfree(obj->name);
+ 
+-	xfree(obj);
++	nftnl_xfree(obj);
+ }
+ EXPORT_SYMBOL(nftnl_obj_free);
+ 
+@@ -74,11 +74,11 @@ void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
  
- 	tree = mxmlLoadString(NULL, xml_text, MXML_OPAQUE_CALLBACK);
--	xfree(xml_text);
-+	nftnl_xfree(xml_text);
+ 	switch (attr) {
+ 	case NFTNL_OBJ_TABLE:
+-		xfree(obj->table);
++		nftnl_xfree(obj->table);
+ 		obj->table = strdup(data);
+ 		break;
+ 	case NFTNL_OBJ_NAME:
+-		xfree(obj->name);
++		nftnl_xfree(obj->name);
+ 		obj->name = strdup(data);
+ 		break;
+ 	case NFTNL_OBJ_TYPE:
+@@ -486,7 +486,7 @@ void nftnl_obj_list_free(struct nftnl_obj_list *list)
+ 		list_del(&r->head);
+ 		nftnl_obj_free(r);
+ 	}
+-	xfree(list);
++	nftnl_xfree(list);
+ }
+ EXPORT_SYMBOL(nftnl_obj_list_free);
  
- 	if (tree == NULL)
- 		goto err_expr;
+@@ -573,6 +573,6 @@ EXPORT_SYMBOL(nftnl_obj_list_iter_next);
+ 
+ void nftnl_obj_list_iter_destroy(struct nftnl_obj_list_iter *iter)
+ {
+-	xfree(iter);
++	nftnl_xfree(iter);
+ }
+ EXPORT_SYMBOL(nftnl_obj_list_iter_destroy);
 diff --git a/src/rule.c b/src/rule.c
-index 8ee8648..8158c26 100644
+index 22026a4..256b699 100644
 --- a/src/rule.c
 +++ b/src/rule.c
 @@ -72,13 +72,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
  		nftnl_expr_free(e);
  
- 	if (r->table != NULL)
+ 	if (r->flags & (1 << (NFTNL_RULE_TABLE)))
 -		xfree(r->table);
 +		nftnl_xfree(r->table);
- 	if (r->chain != NULL)
+ 	if (r->flags & (1 << (NFTNL_RULE_CHAIN)))
 -		xfree(r->chain);
 +		nftnl_xfree(r->chain);
- 	if (r->user.data != NULL)
+ 	if (r->flags & (1 << (NFTNL_RULE_USERDATA)))
 -		xfree(r->user.data);
 +		nftnl_xfree(r->user.data);
  
@@ -406,72 +456,83 @@ index 8ee8648..8158c26 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_rule_free, nft_rule_free);
  
-@@ -96,13 +96,13 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+@@ -95,10 +95,10 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+ 
  	switch (attr) {
  	case NFTNL_RULE_TABLE:
- 		if (r->table) {
--			xfree(r->table);
-+			nftnl_xfree(r->table);
- 			r->table = NULL;
- 		}
+-		xfree(r->table);
++		nftnl_xfree(r->table);
  		break;
  	case NFTNL_RULE_CHAIN:
- 		if (r->chain) {
--			xfree(r->chain);
-+			nftnl_xfree(r->chain);
- 			r->chain = NULL;
- 		}
+-		xfree(r->chain);
++		nftnl_xfree(r->chain);
+ 		break;
+ 	case NFTNL_RULE_HANDLE:
+ 	case NFTNL_RULE_COMPAT_PROTO:
+@@ -107,7 +107,7 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+ 	case NFTNL_RULE_FAMILY:
+ 		break;
+ 	case NFTNL_RULE_USERDATA:
+-		xfree(r->user.data);
++		nftnl_xfree(r->user.data);
  		break;
-@@ -138,13 +138,13 @@ void nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+ 	}
+ 
+@@ -132,7 +132,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  	switch(attr) {
  	case NFTNL_RULE_TABLE:
- 		if (r->table)
+ 		if (r->flags & (1 << NFTNL_RULE_TABLE))
 -			xfree(r->table);
 +			nftnl_xfree(r->table);
  
  		r->table = strdup(data);
+ 		if (!r->table)
+@@ -140,7 +140,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  		break;
  	case NFTNL_RULE_CHAIN:
- 		if (r->chain)
+ 		if (r->flags & (1 << NFTNL_RULE_CHAIN))
 -			xfree(r->chain);
 +			nftnl_xfree(r->chain);
  
  		r->chain = strdup(data);
- 		break;
-@@ -165,7 +165,7 @@ void nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+ 		if (!r->chain)
+@@ -163,7 +163,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  		break;
  	case NFTNL_RULE_USERDATA:
- 		if (r->user.data != NULL)
+ 		if (r->flags & (1 << NFTNL_RULE_USERDATA))
 -			xfree(r->user.data);
 +			nftnl_xfree(r->user.data);
  
  		r->user.data = malloc(data_len);
  		if (!r->user.data)
-@@ -434,12 +434,12 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
- 		return -1;
+@@ -436,7 +436,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  
  	if (tb[NFTA_RULE_TABLE]) {
--		xfree(r->table);
-+		nftnl_xfree(r->table);
+ 		if (r->flags & (1 << NFTNL_RULE_TABLE))
+-			xfree(r->table);
++			nftnl_xfree(r->table);
  		r->table = strdup(mnl_attr_get_str(tb[NFTA_RULE_TABLE]));
- 		r->flags |= (1 << NFTNL_RULE_TABLE);
+ 		if (!r->table)
+ 			return -1;
+@@ -444,7 +444,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  	}
  	if (tb[NFTA_RULE_CHAIN]) {
--		xfree(r->chain);
-+		nftnl_xfree(r->chain);
+ 		if (r->flags & (1 << NFTNL_RULE_CHAIN))
+-			xfree(r->chain);
++			nftnl_xfree(r->chain);
  		r->chain = strdup(mnl_attr_get_str(tb[NFTA_RULE_CHAIN]));
- 		r->flags |= (1 << NFTNL_RULE_CHAIN);
- 	}
-@@ -460,7 +460,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+ 		if (!r->chain)
+ 			return -1;
+@@ -473,7 +473,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
- 		if (r->user.data)
+ 		if (r->flags & (1 << NFTNL_RULE_USERDATA))
 -			xfree(r->user.data);
 +			nftnl_xfree(r->user.data);
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -1054,7 +1054,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_next, nft_rule_expr_iter_next);
+@@ -915,7 +915,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_next, nft_rule_expr_iter_next);
  
  void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
  {
@@ -480,7 +541,7 @@ index 8ee8648..8158c26 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_expr_iter_destroy, nft_rule_expr_iter_destroy);
  
-@@ -1084,7 +1084,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
+@@ -976,7 +976,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
  		list_del(&r->head);
  		nftnl_rule_free(r);
  	}
@@ -489,7 +550,7 @@ index 8ee8648..8158c26 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_rule_list_free, nft_rule_list_free);
  
-@@ -1175,6 +1175,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_next, nft_rule_list_iter_next);
+@@ -1068,6 +1068,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_next, nft_rule_list_iter_next);
  
  void nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
  {
@@ -498,10 +559,10 @@ index 8ee8648..8158c26 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_rule_list_iter_destroy, nft_rule_list_iter_destroy);
 diff --git a/src/ruleset.c b/src/ruleset.c
-index 414b7c4..6ec38c6 100644
+index b6ca565..0867e2a 100644
 --- a/src/ruleset.c
 +++ b/src/ruleset.c
-@@ -74,7 +74,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
+@@ -71,7 +71,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
  		nftnl_set_list_free(r->set_list);
  	if (r->flags & (1 << NFTNL_RULESET_RULELIST))
  		nftnl_rule_list_free(r->rule_list);
@@ -511,16 +572,16 @@ index 414b7c4..6ec38c6 100644
  EXPORT_SYMBOL_ALIAS(nftnl_ruleset_free, nft_ruleset_free);
  
 diff --git a/src/set.c b/src/set.c
-index dbea93b..025d50c 100644
+index 14d28b5..0e93503 100644
 --- a/src/set.c
 +++ b/src/set.c
 @@ -45,15 +45,15 @@ void nftnl_set_free(const struct nftnl_set *s)
  	struct nftnl_set_elem *elem, *tmp;
  
- 	if (s->table != NULL)
+ 	if (s->flags & (1 << NFTNL_SET_TABLE))
 -		xfree(s->table);
 +		nftnl_xfree(s->table);
- 	if (s->name != NULL)
+ 	if (s->flags & (1 << NFTNL_SET_NAME))
 -		xfree(s->name);
 +		nftnl_xfree(s->name);
  
@@ -533,55 +594,74 @@ index dbea93b..025d50c 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_set_free, nft_set_free);
  
-@@ -69,14 +69,14 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+@@ -70,10 +70,10 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+ 
+ 	switch (attr) {
  	case NFTNL_SET_TABLE:
- 		if (s->flags & (1 << NFTNL_SET_TABLE))
- 			if (s->table) {
--				xfree(s->table);
-+				nftnl_xfree(s->table);
- 				s->table = NULL;
- 			}
+-		xfree(s->table);
++		nftnl_xfree(s->table);
  		break;
  	case NFTNL_SET_NAME:
- 		if (s->flags & (1 << NFTNL_SET_NAME))
- 			if (s->name) {
--				xfree(s->name);
-+				nftnl_xfree(s->name);
- 				s->name = NULL;
- 			}
+-		xfree(s->name);
++		nftnl_xfree(s->name);
+ 		break;
+ 	case NFTNL_SET_FLAGS:
+ 	case NFTNL_SET_KEY_TYPE:
+@@ -89,7 +89,7 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+ 	case NFTNL_SET_GC_INTERVAL:
  		break;
-@@ -124,13 +124,13 @@ void nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+ 	case NFTNL_SET_USERDATA:
+-		xfree(s->user.data);
++		nftnl_xfree(s->user.data);
+ 		break;
+ 	default:
+ 		return;
+@@ -122,7 +122,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  	switch(attr) {
  	case NFTNL_SET_TABLE:
- 		if (s->table)
+ 		if (s->flags & (1 << NFTNL_SET_TABLE))
 -			xfree(s->table);
 +			nftnl_xfree(s->table);
  
  		s->table = strdup(data);
+ 		if (!s->table)
+@@ -130,7 +130,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  		break;
  	case NFTNL_SET_NAME:
- 		if (s->name)
+ 		if (s->flags & (1 << NFTNL_SET_NAME))
 -			xfree(s->name);
 +			nftnl_xfree(s->name);
  
  		s->name = strdup(data);
+ 		if (!s->name)
+@@ -174,7 +174,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  		break;
-@@ -435,12 +435,12 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
- 		return -1;
+ 	case NFTNL_SET_USERDATA:
+ 		if (s->flags & (1 << NFTNL_SET_USERDATA))
+-			xfree(s->user.data);
++			nftnl_xfree(s->user.data);
+ 
+ 		s->user.data = malloc(data_len);
+ 		if (!s->user.data)
+@@ -474,7 +474,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  
  	if (tb[NFTA_SET_TABLE]) {
--		xfree(s->table);
-+		nftnl_xfree(s->table);
+ 		if (s->flags & (1 << NFTNL_SET_TABLE))
+-			xfree(s->table);
++			nftnl_xfree(s->table);
  		s->table = strdup(mnl_attr_get_str(tb[NFTA_SET_TABLE]));
- 		s->flags |= (1 << NFTNL_SET_TABLE);
+ 		if (!s->table)
+ 			return -1;
+@@ -482,7 +482,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  	}
  	if (tb[NFTA_SET_NAME]) {
--		xfree(s->name);
-+		nftnl_xfree(s->name);
+ 		if (s->flags & (1 << NFTNL_SET_NAME))
+-			xfree(s->name);
++			nftnl_xfree(s->name);
  		s->name = strdup(mnl_attr_get_str(tb[NFTA_SET_NAME]));
- 		s->flags |= (1 << NFTNL_SET_NAME);
- 	}
-@@ -1087,7 +1087,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
+ 		if (!s->name)
+ 			return -1;
+@@ -972,7 +972,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
  		list_del(&s->head);
  		nftnl_set_free(s);
  	}
@@ -590,7 +670,7 @@ index dbea93b..025d50c 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_set_list_free, nft_set_list_free);
  
-@@ -1177,7 +1177,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_next, nft_set_list_iter_next);
+@@ -1064,7 +1064,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_next, nft_set_list_iter_next);
  
  void nftnl_set_list_iter_destroy(const struct nftnl_set_list_iter *iter)
  {
@@ -600,83 +680,112 @@ index dbea93b..025d50c 100644
  EXPORT_SYMBOL_ALIAS(nftnl_set_list_iter_destroy, nft_set_list_iter_destroy);
  
 diff --git a/src/set_elem.c b/src/set_elem.c
-index b9c7e1e..c8ffeae 100644
+index fa87476..6d404bd 100644
 --- a/src/set_elem.c
 +++ b/src/set_elem.c
-@@ -43,7 +43,7 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
+@@ -42,18 +42,18 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_elem_alloc, nft_set_elem_alloc);
+ void nftnl_set_elem_free(struct nftnl_set_elem *s)
  {
- 	if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN)) {
- 		if (s->data.chain) {
--			xfree(s->data.chain);
-+			nftnl_xfree(s->data.chain);
- 			s->data.chain = NULL;
- 		}
- 	}
-@@ -52,9 +52,9 @@ void nftnl_set_elem_free(struct nftnl_set_elem *s)
+ 	if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN))
+-		xfree(s->data.chain);
++		nftnl_xfree(s->data.chain);
+ 
+ 	if (s->flags & (1 << NFTNL_SET_ELEM_EXPR))
  		nftnl_expr_free(s->expr);
  
  	if (s->flags & (1 << NFTNL_SET_ELEM_USERDATA))
 -		xfree(s->user.data);
 +		nftnl_xfree(s->user.data);
  
+ 	if (s->flags & (1 << NFTNL_SET_ELEM_OBJREF))
+-		xfree(s->objref);
++		nftnl_xfree(s->objref);
+ 
 -	xfree(s);
 +	nftnl_xfree(s);
  }
  EXPORT_SYMBOL_ALIAS(nftnl_set_elem_free, nft_set_elem_free);
  
 @@ -70,7 +70,7 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
+ 
+ 	switch (attr) {
  	case NFTNL_SET_ELEM_CHAIN:
- 		if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN)) {
- 			if (s->data.chain) {
--				xfree(s->data.chain);
-+				nftnl_xfree(s->data.chain);
- 				s->data.chain = NULL;
- 			}
- 		}
-@@ -113,7 +113,7 @@ void nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+-		xfree(s->data.chain);
++		nftnl_xfree(s->data.chain);
+ 		break;
+ 	case NFTNL_SET_ELEM_FLAGS:
+ 	case NFTNL_SET_ELEM_KEY:	/* NFTA_SET_ELEM_KEY */
+@@ -80,13 +80,13 @@ void nftnl_set_elem_unset(struct nftnl_set_elem *s, uint16_t attr)
+ 	case NFTNL_SET_ELEM_EXPIRATION:	/* NFTA_SET_ELEM_EXPIRATION */
+ 		break;
+ 	case NFTNL_SET_ELEM_USERDATA:	/* NFTA_SET_ELEM_USERDATA */
+-		xfree(s->user.data);
++		nftnl_xfree(s->user.data);
+ 		break;
+ 	case NFTNL_SET_ELEM_EXPR:
+ 		nftnl_expr_free(s->expr);
+ 		break;
+ 	case NFTNL_SET_ELEM_OBJREF:
+-		xfree(s->objref);
++		nftnl_xfree(s->objref);
+ 		break;
+ 	default:
+ 		return;
+@@ -112,7 +112,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
  	case NFTNL_SET_ELEM_CHAIN:	/* NFTA_SET_ELEM_DATA */
- 		if (s->data.chain)
+ 		if (s->flags & (1 << NFTNL_SET_ELEM_CHAIN))
 -			xfree(s->data.chain);
 +			nftnl_xfree(s->data.chain);
  
  		s->data.chain = strdup(data);
- 		break;
-@@ -126,7 +126,7 @@ void nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+ 		if (!s->data.chain)
+@@ -127,7 +127,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
  		break;
  	case NFTNL_SET_ELEM_USERDATA: /* NFTA_SET_ELEM_USERDATA */
- 		if (s->user.data != NULL)
+ 		if (s->flags & (1 << NFTNL_SET_ELEM_USERDATA))
 -			xfree(s->user.data);
 +			nftnl_xfree(s->user.data);
  
  		s->user.data = malloc(data_len);
  		if (!s->user.data)
-@@ -399,7 +399,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
+@@ -137,7 +137,7 @@ int nftnl_set_elem_set(struct nftnl_set_elem *s, uint16_t attr,
+ 		break;
+ 	case NFTNL_SET_ELEM_OBJREF:
+ 		if (s->flags & (1 << NFTNL_SET_ELEM_OBJREF))
+-			xfree(s->objref);
++			nftnl_xfree(s->objref);
+ 
+ 		s->objref = strdup(data);
+ 		if (!s->objref)
+@@ -431,7 +431,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
  			mnl_attr_get_payload(tb[NFTA_SET_ELEM_USERDATA]);
  
- 		if (e->user.data)
+ 		if (e->flags & (1 << NFTNL_RULE_USERDATA))
 -			xfree(e->user.data);
 +			nftnl_xfree(e->user.data);
  
  		e->user.len  = mnl_attr_get_payload_len(tb[NFTA_SET_ELEM_USERDATA]);
  		e->user.data = malloc(e->user.len);
-@@ -471,13 +471,13 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
- 		return -1;
+@@ -515,7 +515,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  
  	if (tb[NFTA_SET_ELEM_LIST_TABLE]) {
--		xfree(s->table);
-+		nftnl_xfree(s->table);
+ 		if (s->flags & (1 << NFTNL_SET_TABLE))
+-			xfree(s->table);
++			nftnl_xfree(s->table);
  		s->table =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_TABLE]));
- 		s->flags |= (1 << NFTNL_SET_TABLE);
+ 		if (!s->table)
+@@ -524,7 +524,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  	}
  	if (tb[NFTA_SET_ELEM_LIST_SET]) {
--		xfree(s->name);
-+		nftnl_xfree(s->name);
+ 		if (s->flags & (1 << NFTNL_SET_NAME))
+-			xfree(s->name);
++			nftnl_xfree(s->name);
  		s->name =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_SET]));
- 		s->flags |= (1 << NFTNL_SET_NAME);
-@@ -866,7 +866,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_next, nft_set_elems_iter_next);
+ 		if (!s->name)
+@@ -810,7 +810,7 @@ EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_next, nft_set_elems_iter_next);
  
  void nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
  {
@@ -686,7 +795,7 @@ index b9c7e1e..c8ffeae 100644
  EXPORT_SYMBOL_ALIAS(nftnl_set_elems_iter_destroy, nft_set_elems_iter_destroy);
  
 diff --git a/src/table.c b/src/table.c
-index 42fe49f..7363853 100644
+index 4286d51..1e15ea7 100644
 --- a/src/table.c
 +++ b/src/table.c
 @@ -45,9 +45,9 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_alloc, nft_table_alloc);
@@ -701,34 +810,34 @@ index 42fe49f..7363853 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_table_free, nft_table_free);
  
-@@ -65,7 +65,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
+@@ -64,7 +64,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
+ 
  	switch (attr) {
  	case NFTNL_TABLE_NAME:
- 		if (t->name) {
--			xfree(t->name);
-+			nftnl_xfree(t->name);
- 			t->name = NULL;
- 		}
+-		xfree(t->name);
++		nftnl_xfree(t->name);
  		break;
-@@ -95,7 +95,7 @@ void nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
+ 	case NFTNL_TABLE_FLAGS:
+ 	case NFTNL_TABLE_FAMILY:
+@@ -90,7 +90,7 @@ int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
  	switch (attr) {
  	case NFTNL_TABLE_NAME:
- 		if (t->name)
+ 		if (t->flags & (1 << NFTNL_TABLE_NAME))
 -			xfree(t->name);
 +			nftnl_xfree(t->name);
  
  		t->name = strdup(data);
- 		break;
+ 		if (!t->name)
 @@ -229,7 +229,7 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
- 		return -1;
  
  	if (tb[NFTA_TABLE_NAME]) {
--		xfree(t->name);
-+		nftnl_xfree(t->name);
+ 		if (t->flags & (1 << NFTNL_TABLE_NAME))
+-			xfree(t->name);
++			nftnl_xfree(t->name);
  		t->name = strdup(mnl_attr_get_str(tb[NFTA_TABLE_NAME]));
- 		t->flags |= (1 << NFTNL_TABLE_NAME);
- 	}
-@@ -497,7 +497,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
+ 		if (!t->name)
+ 			return -1;
+@@ -448,7 +448,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
  		list_del(&r->head);
  		nftnl_table_free(r);
  	}
@@ -737,7 +846,7 @@ index 42fe49f..7363853 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_table_list_free, nft_table_list_free);
  
-@@ -582,6 +582,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_next, nft_table_list_iter_next);
+@@ -534,6 +534,6 @@ EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_next, nft_table_list_iter_next);
  
  void nftnl_table_list_iter_destroy(const struct nftnl_table_list_iter *iter)
  {
@@ -746,7 +855,7 @@ index 42fe49f..7363853 100644
  }
  EXPORT_SYMBOL_ALIAS(nftnl_table_list_iter_destroy, nft_table_list_iter_destroy);
 diff --git a/src/trace.c b/src/trace.c
-index 921fa21..1933bb8 100644
+index bd05d3c..abfc533 100644
 --- a/src/trace.c
 +++ b/src/trace.c
 @@ -61,13 +61,13 @@ struct nftnl_trace *nftnl_trace_alloc(void)
@@ -784,7 +893,7 @@ index 60c2f34..ec1f7dc 100644
  EXPORT_SYMBOL(nftnl_udata_buf_free);
  
 diff --git a/src/utils.c b/src/utils.c
-index 22710b9..f29416e 100644
+index 3e44960..08f668f 100644
 --- a/src/utils.c
 +++ b/src/utils.c
 @@ -264,7 +264,7 @@ int nftnl_fprintf(FILE *fp, const void *obj, uint32_t cmd, uint32_t type,
@@ -797,5 +906,5 @@ index 22710b9..f29416e 100644
  	return ret;
  }
 -- 
-2.7.3
+2.10.2
 
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 66987e1..63271e0 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,2 +1,2 @@
-# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.6
-sha1	453f1c2d99d219baeca4ba42aa874f02d2ddf2f7	libnftnl-1.0.6.tar.bz2
+# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.7
+sha1	381b2b3cbb3fad186cb3f57bbf32d70f0b3c3c8e	libnftnl-1.0.7.tar.bz2
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 2f83204..0e1ddf8 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.6
+LIBNFTNL_VERSION = 1.0.7
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+

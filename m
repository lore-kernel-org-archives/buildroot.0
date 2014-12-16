From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 23:49:03 +0100
Subject: [Buildroot] [git commit] libnftnl: bump to version 1.0.3
Message-ID: <20141216225030.83B9F7FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d081d439c958be903a2b520acda11f7328318b3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnftnl/libnftnl-0001-rename-xfree.patch |  280 +++++++++------------
 package/libnftnl/libnftnl.hash                    |    2 +
 package/libnftnl/libnftnl.mk                      |    2 +-
 3 files changed, 120 insertions(+), 164 deletions(-)

diff --git a/package/libnftnl/libnftnl-0001-rename-xfree.patch b/package/libnftnl/libnftnl-0001-rename-xfree.patch
index ed0acf0..5816a6b 100644
--- a/package/libnftnl/libnftnl-0001-rename-xfree.patch
+++ b/package/libnftnl/libnftnl-0001-rename-xfree.patch
@@ -16,12 +16,12 @@ To solve this, this patch renames the libnftnl xfree() function to
 libnftnl_xfree().
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Gustavo: update for version 1.0.3]
 
-Index: b/src/chain.c
-===================================================================
---- a/src/chain.c
-+++ b/src/chain.c
-@@ -88,11 +88,11 @@
+diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
+--- libnftnl-1.0.3.orig/src/chain.c	2014-12-16 08:16:44.082395482 -0300
++++ libnftnl-1.0.3/src/chain.c	2014-12-16 08:17:05.994151598 -0300
+@@ -89,11 +89,11 @@
  void nft_chain_free(struct nft_chain *c)
  {
  	if (c->table != NULL)
@@ -36,7 +36,7 @@ Index: b/src/chain.c
  }
  EXPORT_SYMBOL(nft_chain_free);
  
-@@ -110,7 +110,7 @@
+@@ -111,7 +111,7 @@
  	switch (attr) {
  	case NFT_CHAIN_ATTR_TABLE:
  		if (c->table) {
@@ -46,7 +46,7 @@ Index: b/src/chain.c
  		}
  		break;
 @@ -119,7 +119,7 @@
- 		return;
+ 		break;
  	case NFT_CHAIN_ATTR_TYPE:
  		if (c->type) {
 -			xfree(c->type);
@@ -72,25 +72,7 @@ Index: b/src/chain.c
  
  		c->type = strdup(data);
  		break;
-@@ -714,7 +714,7 @@
- 		return -1;
- 
- 	if (c->table)
--		xfree(c->table);
-+		nftnl_xfree(c->table);
- 
- 	c->table = strdup(table);
- 	c->flags |= (1 << NFT_CHAIN_ATTR_TABLE);
-@@ -743,7 +743,7 @@
- 			return -1;
- 
- 		if (c->type)
--			xfree(c->type);
-+			nftnl_xfree(c->type);
- 
- 		c->type = strdup(type);
- 		c->flags |= (1 << NFT_CHAIN_ATTR_TYPE);
-@@ -991,7 +991,7 @@
+@@ -915,7 +915,7 @@
  		list_del(&r->head);
  		nft_chain_free(r);
  	}
@@ -99,7 +81,7 @@ Index: b/src/chain.c
  }
  EXPORT_SYMBOL(nft_chain_list_free);
  
-@@ -1070,6 +1070,6 @@
+@@ -994,6 +994,6 @@
  
  void nft_chain_list_iter_destroy(struct nft_chain_list_iter *iter)
  {
@@ -107,11 +89,10 @@ Index: b/src/chain.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_chain_list_iter_destroy);
-Index: b/src/common.c
-===================================================================
---- a/src/common.c
-+++ b/src/common.c
-@@ -45,7 +45,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/common.c libnftnl-1.0.3/src/common.c
+--- libnftnl-1.0.3.orig/src/common.c	2014-12-16 08:16:44.082395482 -0300
++++ libnftnl-1.0.3/src/common.c	2014-12-16 08:17:05.997151702 -0300
+@@ -48,7 +48,7 @@
  
  void nft_parse_err_free(struct nft_parse_err *err)
  {
@@ -120,23 +101,9 @@ Index: b/src/common.c
  }
  EXPORT_SYMBOL(nft_parse_err_free);
  
-Index: b/src/expr.c
-===================================================================
---- a/src/expr.c
-+++ b/src/expr.c
-@@ -52,7 +52,7 @@
- 	if (expr->ops->free)
- 		expr->ops->free(expr);
- 
--	xfree(expr);
-+	nftnl_xfree(expr);
- }
- EXPORT_SYMBOL(nft_rule_expr_free);
- 
-Index: b/src/expr/data_reg.c
-===================================================================
---- a/src/expr/data_reg.c
-+++ b/src/expr/data_reg.c
+diff -Nura libnftnl-1.0.3.orig/src/expr/data_reg.c libnftnl-1.0.3/src/expr/data_reg.c
+--- libnftnl-1.0.3.orig/src/expr/data_reg.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/expr/data_reg.c	2014-12-16 08:17:06.055153703 -0300
 @@ -130,7 +130,7 @@
  				   NFT_XML_OPT, err);
  	if (chain != NULL) {
@@ -146,11 +113,10 @@ Index: b/src/expr/data_reg.c
  
  		reg->chain = strdup(chain);
  	}
-Index: b/src/expr/immediate.c
-===================================================================
---- a/src/expr/immediate.c
-+++ b/src/expr/immediate.c
-@@ -46,7 +46,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/expr/immediate.c libnftnl-1.0.3/src/expr/immediate.c
+--- libnftnl-1.0.3.orig/src/expr/immediate.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/expr/immediate.c	2014-12-16 08:17:06.052153599 -0300
+@@ -47,7 +47,7 @@
  		break;
  	case NFT_EXPR_IMM_CHAIN:
  		if (imm->data.chain)
@@ -159,11 +125,10 @@ Index: b/src/expr/immediate.c
  
  		imm->data.chain = strdup(data);
  		break;
-Index: b/src/expr/log.c
-===================================================================
---- a/src/expr/log.c
-+++ b/src/expr/log.c
-@@ -37,7 +37,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/expr/log.c libnftnl-1.0.3/src/expr/log.c
+--- libnftnl-1.0.3.orig/src/expr/log.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/expr/log.c	2014-12-16 08:17:06.038153116 -0300
+@@ -40,7 +40,7 @@
  	switch(type) {
  	case NFT_EXPR_LOG_PREFIX:
  		if (log->prefix)
@@ -172,7 +137,7 @@ Index: b/src/expr/log.c
  
  		log->prefix = strdup(data);
  		break;
-@@ -139,7 +139,7 @@
+@@ -154,7 +154,7 @@
  
  	if (tb[NFTA_LOG_PREFIX]) {
  		if (log->prefix)
@@ -181,7 +146,7 @@ Index: b/src/expr/log.c
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
  		e->flags |= (1 << NFT_EXPR_LOG_PREFIX);
-@@ -320,7 +320,7 @@
+@@ -331,7 +331,7 @@
  {
  	struct nft_expr_log *log = nft_expr_data(e);
  
@@ -190,11 +155,10 @@ Index: b/src/expr/log.c
  }
  
  struct expr_ops expr_ops_log = {
-Index: b/src/expr/match.c
-===================================================================
---- a/src/expr/match.c
-+++ b/src/expr/match.c
-@@ -50,7 +50,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/expr/match.c libnftnl-1.0.3/src/expr/match.c
+--- libnftnl-1.0.3.orig/src/expr/match.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/expr/match.c	2014-12-16 08:17:06.043153289 -0300
+@@ -53,7 +53,7 @@
  		break;
  	case NFT_EXPR_MT_INFO:
  		if (mt->data)
@@ -203,7 +167,7 @@ Index: b/src/expr/match.c
  
  		mt->data = data;
  		mt->data_len = data_len;
-@@ -153,7 +153,7 @@
+@@ -150,7 +150,7 @@
  		void *match_data;
  
  		if (match->data)
@@ -212,7 +176,7 @@ Index: b/src/expr/match.c
  
  		match_data = calloc(1, len);
  		if (match_data == NULL)
-@@ -261,7 +261,7 @@
+@@ -240,7 +240,7 @@
  {
  	struct nft_expr_match *match = nft_expr_data(e);
  
@@ -221,11 +185,10 @@ Index: b/src/expr/match.c
  }
  
  struct expr_ops expr_ops_match = {
-Index: b/src/expr/target.c
-===================================================================
---- a/src/expr/target.c
-+++ b/src/expr/target.c
-@@ -50,7 +50,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/expr/target.c libnftnl-1.0.3/src/expr/target.c
+--- libnftnl-1.0.3.orig/src/expr/target.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/expr/target.c	2014-12-16 08:17:06.026152702 -0300
+@@ -53,7 +53,7 @@
  		break;
  	case NFT_EXPR_TG_INFO:
  		if (tg->data)
@@ -234,7 +197,7 @@ Index: b/src/expr/target.c
  
  		tg->data = data;
  		tg->data_len = data_len;
-@@ -153,7 +153,7 @@
+@@ -150,7 +150,7 @@
  		void *target_data;
  
  		if (target->data)
@@ -243,7 +206,7 @@ Index: b/src/expr/target.c
  
  		target_data = calloc(1, len);
  		if (target_data == NULL)
-@@ -262,7 +262,7 @@
+@@ -241,7 +241,7 @@
  {
  	struct nft_expr_target *target = nft_expr_data(e);
  
@@ -252,24 +215,46 @@ Index: b/src/expr/target.c
  }
  
  struct expr_ops expr_ops_target = {
-Index: b/src/internal.h
-===================================================================
---- a/src/internal.h
-+++ b/src/internal.h
-@@ -143,7 +143,7 @@
- 			      uint32_t format, uint32_t flags);
- int nft_event_footer_fprintf(FILE *fp, uint32_t format, uint32_t flags);
- 
--void xfree(const void *ptr);
-+void nftnl_xfree(const void *ptr);
- 
- struct expr_ops;
- 
-Index: b/src/mxml.c
-===================================================================
---- a/src/mxml.c
-+++ b/src/mxml.c
-@@ -82,7 +82,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/expr.c libnftnl-1.0.3/src/expr.c
+--- libnftnl-1.0.3.orig/src/expr.c	2014-12-16 08:16:44.082395482 -0300
++++ libnftnl-1.0.3/src/expr.c	2014-12-16 08:17:05.996151667 -0300
+@@ -52,7 +52,7 @@
+ 	if (expr->ops->free)
+ 		expr->ops->free(expr);
+ 
+-	xfree(expr);
++	nftnl_xfree(expr);
+ }
+ EXPORT_SYMBOL(nft_rule_expr_free);
+ 
+diff -Nura libnftnl-1.0.3.orig/src/gen.c libnftnl-1.0.3/src/gen.c
+--- libnftnl-1.0.3.orig/src/gen.c	2014-12-16 08:16:44.082395482 -0300
++++ libnftnl-1.0.3/src/gen.c	2014-12-16 08:17:05.999151770 -0300
+@@ -37,7 +37,7 @@
+ 
+ void nft_gen_free(struct nft_gen *gen)
+ {
+-	xfree(gen);
++	nftnl_xfree(gen);
+ }
+ EXPORT_SYMBOL(nft_gen_free);
+ 
+diff -Nura libnftnl-1.0.3.orig/src/internal.h libnftnl-1.0.3/src/internal.h
+--- libnftnl-1.0.3.orig/src/internal.h	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/internal.h	2014-12-16 08:17:06.014152288 -0300
+@@ -16,7 +16,7 @@
+ #include <libnftnl/common.h>
+ #include <linux/netfilter/nf_tables.h>
+ 
+-#define xfree(ptr)	free((void *)ptr);
++#define nftnl_xfree(ptr)	free((void *)ptr);
+ 
+ #define BASE_DEC 10
+ #define BASE_HEX 16
+diff -Nura libnftnl-1.0.3.orig/src/mxml.c libnftnl-1.0.3/src/mxml.c
+--- libnftnl-1.0.3.orig/src/mxml.c	2014-12-16 08:16:44.084395550 -0300
++++ libnftnl-1.0.3/src/mxml.c	2014-12-16 08:17:06.079154531 -0300
+@@ -84,7 +84,7 @@
  		goto err_expr;
  
  	tree = mxmlLoadString(NULL, xml_text, MXML_OPAQUE_CALLBACK);
@@ -278,11 +263,10 @@ Index: b/src/mxml.c
  
  	if (tree == NULL)
  		goto err_expr;
-Index: b/src/rule.c
-===================================================================
---- a/src/rule.c
-+++ b/src/rule.c
-@@ -74,11 +74,11 @@
+diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
+--- libnftnl-1.0.3.orig/src/rule.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/rule.c	2014-12-16 08:17:06.062153945 -0300
+@@ -75,11 +75,11 @@
  		nft_rule_expr_free(e);
  
  	if (r->table != NULL)
@@ -297,7 +281,7 @@ Index: b/src/rule.c
  }
  EXPORT_SYMBOL(nft_rule_free);
  
-@@ -96,13 +96,13 @@
+@@ -97,13 +97,13 @@
  	switch (attr) {
  	case NFT_RULE_ATTR_TABLE:
  		if (r->table) {
@@ -313,7 +297,7 @@ Index: b/src/rule.c
  			r->chain = NULL;
  		}
  		break;
-@@ -138,13 +138,13 @@
+@@ -139,13 +139,13 @@
  	switch(attr) {
  	case NFT_RULE_ATTR_TABLE:
  		if (r->table)
@@ -329,7 +313,7 @@ Index: b/src/rule.c
  
  		r->chain = strdup(data);
  		break;
-@@ -408,7 +408,7 @@
+@@ -395,7 +395,7 @@
  
  	if (tb[NFTA_EXPR_DATA]) {
  		if (expr->ops->parse(expr, tb[NFTA_EXPR_DATA]) < 0) {
@@ -338,7 +322,7 @@ Index: b/src/rule.c
  			return -1;
  		}
  	}
-@@ -506,7 +506,7 @@
+@@ -491,7 +491,7 @@
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
  		if (r->user.data)
@@ -347,7 +331,7 @@ Index: b/src/rule.c
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -1074,7 +1074,7 @@
+@@ -1064,7 +1064,7 @@
  
  void nft_rule_expr_iter_destroy(struct nft_rule_expr_iter *iter)
  {
@@ -356,7 +340,7 @@ Index: b/src/rule.c
  }
  EXPORT_SYMBOL(nft_rule_expr_iter_destroy);
  
-@@ -1104,7 +1104,7 @@
+@@ -1094,7 +1094,7 @@
  		list_del(&r->head);
  		nft_rule_free(r);
  	}
@@ -365,7 +349,7 @@ Index: b/src/rule.c
  }
  EXPORT_SYMBOL(nft_rule_list_free);
  
-@@ -1189,6 +1189,6 @@
+@@ -1179,6 +1179,6 @@
  
  void nft_rule_list_iter_destroy(struct nft_rule_list_iter *iter)
  {
@@ -373,10 +357,9 @@ Index: b/src/rule.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_rule_list_iter_destroy);
-Index: b/src/ruleset.c
-===================================================================
---- a/src/ruleset.c
-+++ b/src/ruleset.c
+diff -Nura libnftnl-1.0.3.orig/src/ruleset.c libnftnl-1.0.3/src/ruleset.c
+--- libnftnl-1.0.3.orig/src/ruleset.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/ruleset.c	2014-12-16 08:17:06.008152081 -0300
 @@ -48,7 +48,7 @@
  		nft_set_list_free(r->set_list);
  	if (r->flags & (1 << NFT_RULESET_ATTR_RULELIST))
@@ -386,11 +369,10 @@ Index: b/src/ruleset.c
  }
  EXPORT_SYMBOL(nft_ruleset_free);
  
-Index: b/src/set.c
-===================================================================
---- a/src/set.c
-+++ b/src/set.c
-@@ -46,15 +46,15 @@
+diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
+--- libnftnl-1.0.3.orig/src/set.c	2014-12-16 08:16:44.084395550 -0300
++++ libnftnl-1.0.3/src/set.c	2014-12-16 08:17:06.077154462 -0300
+@@ -47,15 +47,15 @@
  	struct nft_set_elem *elem, *tmp;
  
  	if (s->table != NULL)
@@ -409,7 +391,7 @@ Index: b/src/set.c
  }
  EXPORT_SYMBOL(nft_set_free);
  
-@@ -70,14 +70,14 @@
+@@ -71,14 +71,14 @@
  	case NFT_SET_ATTR_TABLE:
  		if (s->flags & (1 << NFT_SET_ATTR_TABLE))
  			if (s->table) {
@@ -426,7 +408,7 @@ Index: b/src/set.c
  				s->name = NULL;
  			}
  		break;
-@@ -117,13 +117,13 @@
+@@ -122,13 +122,13 @@
  	switch(attr) {
  	case NFT_SET_ATTR_TABLE:
  		if (s->table)
@@ -442,7 +424,7 @@ Index: b/src/set.c
  
  		s->name = strdup(data);
  		break;
-@@ -827,7 +827,7 @@
+@@ -963,7 +963,7 @@
  		list_del(&s->head);
  		nft_set_free(s);
  	}
@@ -451,7 +433,7 @@ Index: b/src/set.c
  }
  EXPORT_SYMBOL(nft_set_list_free);
  
-@@ -911,6 +911,6 @@
+@@ -1047,7 +1047,7 @@
  
  void nft_set_list_iter_destroy(struct nft_set_list_iter *iter)
  {
@@ -459,10 +441,10 @@ Index: b/src/set.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_set_list_iter_destroy);
-Index: b/src/set_elem.c
-===================================================================
---- a/src/set_elem.c
-+++ b/src/set_elem.c
+ 
+diff -Nura libnftnl-1.0.3.orig/src/set_elem.c libnftnl-1.0.3/src/set_elem.c
+--- libnftnl-1.0.3.orig/src/set_elem.c	2014-12-16 08:16:44.084395550 -0300
++++ libnftnl-1.0.3/src/set_elem.c	2014-12-16 08:17:06.072154290 -0300
 @@ -44,11 +44,11 @@
  {
  	if (s->flags & (1 << NFT_SET_ELEM_ATTR_CHAIN)) {
@@ -495,16 +477,7 @@ Index: b/src/set_elem.c
  
  		s->data.chain = strdup(data);
  		break;
-@@ -290,7 +290,7 @@
- 		}
-         }
- 	if (ret < 0) {
--		xfree(e);
-+		nftnl_xfree(e);
- 		return -1;
- 	}
- 
-@@ -708,6 +708,6 @@
+@@ -716,7 +716,7 @@
  
  void nft_set_elems_iter_destroy(struct nft_set_elems_iter *iter)
  {
@@ -512,11 +485,11 @@ Index: b/src/set_elem.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_set_elems_iter_destroy);
-Index: b/src/table.c
-===================================================================
---- a/src/table.c
-+++ b/src/table.c
-@@ -44,9 +44,9 @@
+ 
+diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
+--- libnftnl-1.0.3.orig/src/table.c	2014-12-16 08:16:44.082395482 -0300
++++ libnftnl-1.0.3/src/table.c	2014-12-16 08:17:06.001151840 -0300
+@@ -45,9 +45,9 @@
  void nft_table_free(struct nft_table *t)
  {
  	if (t->flags & (1 << NFT_TABLE_ATTR_NAME))
@@ -528,7 +501,7 @@ Index: b/src/table.c
  }
  EXPORT_SYMBOL(nft_table_free);
  
-@@ -64,7 +64,7 @@
+@@ -65,7 +65,7 @@
  	switch (attr) {
  	case NFT_TABLE_ATTR_NAME:
  		if (t->name) {
@@ -546,16 +519,7 @@ Index: b/src/table.c
  
  		t->name = strdup(data);
  		break;
-@@ -270,7 +270,7 @@
- 		return -1;
- 
- 	if (t->name)
--		xfree(t->name);
-+		nftnl_xfree(t->name);
- 
- 	t->name = strdup(name);
- 	t->flags |= (1 << NFT_TABLE_ATTR_NAME);
-@@ -507,7 +507,7 @@
+@@ -486,7 +486,7 @@
  		list_del(&r->head);
  		nft_table_free(r);
  	}
@@ -564,7 +528,7 @@ Index: b/src/table.c
  }
  EXPORT_SYMBOL(nft_table_list_free);
  
-@@ -586,6 +586,6 @@
+@@ -565,6 +565,6 @@
  
  void nft_table_list_iter_destroy(struct nft_table_list_iter *iter)
  {
@@ -572,20 +536,10 @@ Index: b/src/table.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_table_list_iter_destroy);
-Index: b/src/utils.c
-===================================================================
---- a/src/utils.c
-+++ b/src/utils.c
-@@ -180,7 +180,7 @@
- 	return -1;
- }
- 
--void xfree(const void *ptr)
-+void nftnl_xfree(const void *ptr)
- {
- 	free((void *)ptr);
- }
-@@ -214,7 +214,7 @@
+diff -Nura libnftnl-1.0.3.orig/src/utils.c libnftnl-1.0.3/src/utils.c
+--- libnftnl-1.0.3.orig/src/utils.c	2014-12-16 08:16:44.083395516 -0300
++++ libnftnl-1.0.3/src/utils.c	2014-12-16 08:17:06.064154014 -0300
+@@ -206,7 +206,7 @@
  
  out:
  	if (buf != _buf)
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
new file mode 100644
index 0000000..0e857e5
--- /dev/null
+++ b/package/libnftnl/libnftnl.hash
@@ -0,0 +1,2 @@
+# From http://www.netfilter.org/projects/libnftnl/downloads.html#libnftnl-1.0.3
+sha1	11da04c6632c3b06728e2341cd9d7cfbb69a484d	libnftnl-1.0.3.tar.bz2
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index c35e514..703bdee 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.2
+LIBNFTNL_VERSION = 1.0.3
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPLv2+

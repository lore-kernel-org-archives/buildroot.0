From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] libnftnl: bump to version 1.1.2
Message-ID: <20181202071555.2B4568A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ed88d30c785dcf176a9b6452cb49ca73abab3b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch 0001.

Switch to https for download site to save a redirect.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-to-libnftnl_xfree-to-avoid-symbol-namin.patch | 297 +++++++++++++++------
 package/libnftnl/libnftnl.hash                     |   5 +-
 package/libnftnl/libnftnl.mk                       |   4 +-
 3 files changed, 212 insertions(+), 94 deletions(-)

diff --git a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index 1062f2b01a..213aab79eb 100644
--- a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -1,4 +1,4 @@
-From a51cdce6fd271a5cc393c5e56996846d9c453d6a Mon Sep 17 00:00:00 2001
+From 90a0152c224fa90f648b27187859bd84f6426e1b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Thu, 2 Jun 2016 23:03:27 -0300
 Subject: [PATCH] Rename xfree() to libnftnl_xfree() to avoid symbol naming
@@ -22,31 +22,33 @@ libnftnl_xfree().
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for version 1.0.7]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[baruch: update for version 1.0.9]
+[baruch: update for versions 1.0.9, 1.1.2]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
- include/utils.h      |  2 +-
- src/chain.c          | 36 ++++++++++++++++++------------------
- src/common.c         |  2 +-
- src/expr.c           |  4 ++--
- src/expr/data_reg.c  |  2 +-
- src/expr/dynset.c    |  2 +-
- src/expr/immediate.c |  2 +-
- src/expr/log.c       |  6 +++---
- src/expr/lookup.c    |  2 +-
- src/expr/match.c     |  6 +++---
- src/expr/target.c    |  6 +++---
- src/gen.c            |  2 +-
- src/object.c         | 14 +++++++-------
- src/rule.c           | 32 ++++++++++++++++----------------
- src/ruleset.c        |  2 +-
- src/set.c            | 28 ++++++++++++++--------------
- src/set_elem.c       | 28 ++++++++++++++--------------
- src/table.c          | 14 +++++++-------
- src/trace.c          | 14 +++++++-------
- src/udata.c          |  2 +-
- src/utils.c          |  2 +-
- 21 files changed, 104 insertions(+), 104 deletions(-)
+ include/utils.h         |  2 +-
+ src/chain.c             | 36 ++++++++++++++++++------------------
+ src/common.c            |  2 +-
+ src/expr.c              |  4 ++--
+ src/expr/data_reg.c     |  2 +-
+ src/expr/dynset.c       |  2 +-
+ src/expr/flow_offload.c |  2 +-
+ src/expr/immediate.c    |  2 +-
+ src/expr/log.c          |  6 +++---
+ src/expr/lookup.c       |  2 +-
+ src/expr/match.c        |  6 +++---
+ src/expr/target.c       |  6 +++---
+ src/flowtable.c         | 32 ++++++++++++++++----------------
+ src/gen.c               |  2 +-
+ src/object.c            | 14 +++++++-------
+ src/rule.c              | 32 ++++++++++++++++----------------
+ src/ruleset.c           |  2 +-
+ src/set.c               | 28 ++++++++++++++--------------
+ src/set_elem.c          | 28 ++++++++++++++--------------
+ src/table.c             | 14 +++++++-------
+ src/trace.c             | 14 +++++++-------
+ src/udata.c             |  2 +-
+ src/utils.c             |  2 +-
+ 23 files changed, 121 insertions(+), 121 deletions(-)
 
 diff --git a/include/utils.h b/include/utils.h
 index 3cc659652fe2..820556715013 100644
@@ -62,7 +64,7 @@ index 3cc659652fe2..820556715013 100644
  #define div_round_up(n, d)	(((n) + (d) - 1) / (d))
  
 diff --git a/src/chain.c b/src/chain.c
-index eff518680873..03033bbcb93b 100644
+index 01d62c84f140..93e193955934 100644
 --- a/src/chain.c
 +++ b/src/chain.c
 @@ -97,14 +97,14 @@ EXPORT_SYMBOL(nftnl_chain_free);
@@ -176,7 +178,7 @@ index eff518680873..03033bbcb93b 100644
  		c->type = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TYPE]));
  		if (!c->type)
  			return -1;
-@@ -902,7 +902,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
+@@ -711,7 +711,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
  		list_del(&r->head);
  		nftnl_chain_free(r);
  	}
@@ -185,7 +187,7 @@ index eff518680873..03033bbcb93b 100644
  }
  
  EXPORT_SYMBOL(nftnl_chain_list_is_empty);
-@@ -988,5 +988,5 @@ struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *ite
+@@ -797,5 +797,5 @@ struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *ite
  EXPORT_SYMBOL(nftnl_chain_list_iter_destroy);
  void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
  {
@@ -193,7 +195,7 @@ index eff518680873..03033bbcb93b 100644
 +	nftnl_xfree(iter);
  }
 diff --git a/src/common.c b/src/common.c
-index 561c95439114..d0124134ea29 100644
+index feb13b2aa836..de7e9d08b9e2 100644
 --- a/src/common.c
 +++ b/src/common.c
 @@ -68,7 +68,7 @@ struct nftnl_parse_err *nftnl_parse_err_alloc(void)
@@ -206,7 +208,7 @@ index 561c95439114..d0124134ea29 100644
  
  EXPORT_SYMBOL(nftnl_parse_perror);
 diff --git a/src/expr.c b/src/expr.c
-index 62565e046996..97f16275f44f 100644
+index 80c4c36a9bd7..f5e44cd16349 100644
 --- a/src/expr.c
 +++ b/src/expr.c
 @@ -51,7 +51,7 @@ void nftnl_expr_free(const struct nftnl_expr *expr)
@@ -218,7 +220,7 @@ index 62565e046996..97f16275f44f 100644
  }
  
  EXPORT_SYMBOL(nftnl_expr_is_set);
-@@ -270,7 +270,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
+@@ -260,7 +260,7 @@ struct nftnl_expr *nftnl_expr_parse(struct nlattr *attr)
  	return expr;
  
  err2:
@@ -228,10 +230,10 @@ index 62565e046996..97f16275f44f 100644
  	return NULL;
  }
 diff --git a/src/expr/data_reg.c b/src/expr/data_reg.c
-index 1b28b291617b..8c7abdb91d21 100644
+index 67165feb931f..c6f3cec48caf 100644
 --- a/src/expr/data_reg.c
 +++ b/src/expr/data_reg.c
-@@ -379,7 +379,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
+@@ -225,7 +225,7 @@ void nftnl_free_verdict(const union nftnl_data_reg *data)
  	switch(data->verdict) {
  	case NFT_JUMP:
  	case NFT_GOTO:
@@ -241,10 +243,10 @@ index 1b28b291617b..8c7abdb91d21 100644
  	default:
  		break;
 diff --git a/src/expr/dynset.c b/src/expr/dynset.c
-index 160d0e15c151..614124d841c7 100644
+index 68115ba50c94..4e8093b7e9db 100644
 --- a/src/expr/dynset.c
 +++ b/src/expr/dynset.c
-@@ -330,7 +330,7 @@ static void nftnl_expr_dynset_free(const struct nftnl_expr *e)
+@@ -276,7 +276,7 @@ static void nftnl_expr_dynset_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_dynset *dynset = nftnl_expr_data(e);
  
@@ -252,9 +254,22 @@ index 160d0e15c151..614124d841c7 100644
 +	nftnl_xfree(dynset->set_name);
  }
  
- static bool nftnl_expr_dynset_cmp(const struct nftnl_expr *e1,
+ struct expr_ops expr_ops_dynset = {
+diff --git a/src/expr/flow_offload.c b/src/expr/flow_offload.c
+index 6ccec9a13396..877ad072ba53 100644
+--- a/src/expr/flow_offload.c
++++ b/src/expr/flow_offload.c
+@@ -122,7 +122,7 @@ static void nftnl_expr_flow_free(const struct nftnl_expr *e)
+ {
+ 	struct nftnl_expr_flow *flow = nftnl_expr_data(e);
+ 
+-	xfree(flow->table_name);
++	nftnl_xfree(flow->table_name);
+ }
+ 
+ struct expr_ops expr_ops_flow = {
 diff --git a/src/expr/immediate.c b/src/expr/immediate.c
-index b0570bd539a4..6a0732c38ebd 100644
+index 47106ae86675..b0289f9397fb 100644
 --- a/src/expr/immediate.c
 +++ b/src/expr/immediate.c
 @@ -44,7 +44,7 @@ nftnl_expr_immediate_set(struct nftnl_expr *e, uint16_t type,
@@ -267,7 +282,7 @@ index b0570bd539a4..6a0732c38ebd 100644
  		imm->data.chain = strdup(data);
  		if (!imm->data.chain)
 diff --git a/src/expr/log.c b/src/expr/log.c
-index 86d965136cd4..0624a7712237 100644
+index bbe43d2dc6bc..a5952ce10ccc 100644
 --- a/src/expr/log.c
 +++ b/src/expr/log.c
 @@ -39,7 +39,7 @@ static int nftnl_expr_log_set(struct nftnl_expr *e, uint16_t type,
@@ -288,7 +303,7 @@ index 86d965136cd4..0624a7712237 100644
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
  		if (!log->prefix)
-@@ -317,7 +317,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
+@@ -255,7 +255,7 @@ static void nftnl_expr_log_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_log *log = nftnl_expr_data(e);
  
@@ -296,12 +311,12 @@ index 86d965136cd4..0624a7712237 100644
 +	nftnl_xfree(log->prefix);
  }
  
- static bool nftnl_expr_log_cmp(const struct nftnl_expr *e1,
+ struct expr_ops expr_ops_log = {
 diff --git a/src/expr/lookup.c b/src/expr/lookup.c
-index 5fcb81f3a7a2..45f5dfefd33f 100644
+index a495ac0fdcfc..4fce24288c57 100644
 --- a/src/expr/lookup.c
 +++ b/src/expr/lookup.c
-@@ -258,7 +258,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
+@@ -209,7 +209,7 @@ static void nftnl_expr_lookup_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_lookup *lookup = nftnl_expr_data(e);
  
@@ -309,9 +324,9 @@ index 5fcb81f3a7a2..45f5dfefd33f 100644
 +	nftnl_xfree(lookup->set_name);
  }
  
- static bool nftnl_expr_lookup_cmp(const struct nftnl_expr *e1,
+ struct expr_ops expr_ops_lookup = {
 diff --git a/src/expr/match.c b/src/expr/match.c
-index dd09e1e85192..09e35c528aca 100644
+index 4fa74b2da893..7ee706753b68 100644
 --- a/src/expr/match.c
 +++ b/src/expr/match.c
 @@ -50,7 +50,7 @@ nftnl_expr_match_set(struct nftnl_expr *e, uint16_t type,
@@ -332,7 +347,7 @@ index dd09e1e85192..09e35c528aca 100644
  
  		match_data = calloc(1, len);
  		if (match_data == NULL)
-@@ -217,7 +217,7 @@ static void nftnl_expr_match_free(const struct nftnl_expr *e)
+@@ -186,7 +186,7 @@ static void nftnl_expr_match_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_match *match = nftnl_expr_data(e);
  
@@ -340,9 +355,9 @@ index dd09e1e85192..09e35c528aca 100644
 +	nftnl_xfree(match->data);
  }
  
- static bool nftnl_expr_match_cmp(const struct nftnl_expr *e1,
+ struct expr_ops expr_ops_match = {
 diff --git a/src/expr/target.c b/src/expr/target.c
-index ed4bf7df6328..5e28925debeb 100644
+index 91000386704a..5d0763edf63f 100644
 --- a/src/expr/target.c
 +++ b/src/expr/target.c
 @@ -50,7 +50,7 @@ nftnl_expr_target_set(struct nftnl_expr *e, uint16_t type,
@@ -363,7 +378,7 @@ index ed4bf7df6328..5e28925debeb 100644
  
  		target_data = calloc(1, len);
  		if (target_data == NULL)
-@@ -217,7 +217,7 @@ static void nftnl_expr_target_free(const struct nftnl_expr *e)
+@@ -186,7 +186,7 @@ static void nftnl_expr_target_free(const struct nftnl_expr *e)
  {
  	struct nftnl_expr_target *target = nftnl_expr_data(e);
  
@@ -371,9 +386,115 @@ index ed4bf7df6328..5e28925debeb 100644
 +	nftnl_xfree(target->data);
  }
  
- static bool nftnl_expr_target_cmp(const struct nftnl_expr *e1,
+ struct expr_ops expr_ops_target = {
+diff --git a/src/flowtable.c b/src/flowtable.c
+index c939306b56c4..f1b3eef48b73 100644
+--- a/src/flowtable.c
++++ b/src/flowtable.c
+@@ -45,16 +45,16 @@ void nftnl_flowtable_free(const struct nftnl_flowtable *c)
+ 	int i;
+ 
+ 	if (c->flags & (1 << NFTNL_FLOWTABLE_NAME))
+-		xfree(c->name);
++		nftnl_xfree(c->name);
+ 	if (c->flags & (1 << NFTNL_FLOWTABLE_TABLE))
+-		xfree(c->table);
++		nftnl_xfree(c->table);
+ 	if (c->flags & (1 << NFTNL_FLOWTABLE_DEVICES)) {
+ 		for (i = 0; i < c->dev_array_len; i++)
+-			xfree(c->dev_array[i]);
++			nftnl_xfree(c->dev_array[i]);
+ 
+-		xfree(c->dev_array);
++		nftnl_xfree(c->dev_array);
+ 	}
+-	xfree(c);
++	nftnl_xfree(c);
+ }
+ EXPORT_SYMBOL(nftnl_flowtable_free);
+ 
+@@ -73,10 +73,10 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
+ 
+ 	switch (attr) {
+ 	case NFTNL_FLOWTABLE_NAME:
+-		xfree(c->name);
++		nftnl_xfree(c->name);
+ 		break;
+ 	case NFTNL_FLOWTABLE_TABLE:
+-		xfree(c->table);
++		nftnl_xfree(c->table);
+ 		break;
+ 	case NFTNL_FLOWTABLE_HOOKNUM:
+ 	case NFTNL_FLOWTABLE_PRIO:
+@@ -86,8 +86,8 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
+ 		break;
+ 	case NFTNL_FLOWTABLE_DEVICES:
+ 		for (i = 0; i < c->dev_array_len; i++) {
+-			xfree(c->dev_array[i]);
+-			xfree(c->dev_array);
++			nftnl_xfree(c->dev_array[i]);
++			nftnl_xfree(c->dev_array);
+ 		}
+ 		break;
+ 	default:
+@@ -117,7 +117,7 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+ 	switch(attr) {
+ 	case NFTNL_FLOWTABLE_NAME:
+ 		if (c->flags & (1 << NFTNL_FLOWTABLE_NAME))
+-			xfree(c->name);
++			nftnl_xfree(c->name);
+ 
+ 		c->name = strdup(data);
+ 		if (!c->name)
+@@ -125,7 +125,7 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+ 		break;
+ 	case NFTNL_FLOWTABLE_TABLE:
+ 		if (c->flags & (1 << NFTNL_FLOWTABLE_TABLE))
+-			xfree(c->table);
++			nftnl_xfree(c->table);
+ 
+ 		c->table = strdup(data);
+ 		if (!c->table)
+@@ -147,8 +147,8 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+ 
+ 		if (c->flags & (1 << NFTNL_FLOWTABLE_DEVICES)) {
+ 			for (i = 0; i < c->dev_array_len; i++) {
+-				xfree(c->dev_array[i]);
+-				xfree(c->dev_array);
++				nftnl_xfree(c->dev_array[i]);
++				nftnl_xfree(c->dev_array);
+ 			}
+ 		}
+ 
+@@ -423,7 +423,7 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
+ 
+ 	if (tb[NFTA_FLOWTABLE_NAME]) {
+ 		if (c->flags & (1 << NFTNL_FLOWTABLE_NAME))
+-			xfree(c->name);
++			nftnl_xfree(c->name);
+ 		c->name = strdup(mnl_attr_get_str(tb[NFTA_FLOWTABLE_NAME]));
+ 		if (!c->name)
+ 			return -1;
+@@ -431,7 +431,7 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
+ 	}
+ 	if (tb[NFTA_FLOWTABLE_TABLE]) {
+ 		if (c->flags & (1 << NFTNL_FLOWTABLE_TABLE))
+-			xfree(c->table);
++			nftnl_xfree(c->table);
+ 		c->table = strdup(mnl_attr_get_str(tb[NFTA_FLOWTABLE_TABLE]));
+ 		if (!c->table)
+ 			return -1;
+@@ -635,7 +635,7 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
+ 		list_del(&s->head);
+ 		nftnl_flowtable_free(s);
+ 	}
+-	xfree(list);
++	nftnl_xfree(list);
+ }
+ EXPORT_SYMBOL(nftnl_flowtable_list_free);
+ 
 diff --git a/src/gen.c b/src/gen.c
-index f92180c7baf6..4fe078d3832c 100644
+index 1fc909930d86..c69f6f87deae 100644
 --- a/src/gen.c
 +++ b/src/gen.c
 @@ -38,7 +38,7 @@ struct nftnl_gen *nftnl_gen_alloc(void)
@@ -386,10 +507,10 @@ index f92180c7baf6..4fe078d3832c 100644
  
  EXPORT_SYMBOL(nftnl_gen_is_set);
 diff --git a/src/object.c b/src/object.c
-index 30000f748da4..1b5965d7abdc 100644
+index e88203a82441..28e04486c76c 100644
 --- a/src/object.c
 +++ b/src/object.c
-@@ -50,11 +50,11 @@ EXPORT_SYMBOL(nftnl_obj_free);
+@@ -53,11 +53,11 @@ EXPORT_SYMBOL(nftnl_obj_free);
  void nftnl_obj_free(const struct nftnl_obj *obj)
  {
  	if (obj->flags & (1 << NFTNL_OBJ_TABLE))
@@ -404,7 +525,7 @@ index 30000f748da4..1b5965d7abdc 100644
  }
  
  EXPORT_SYMBOL(nftnl_obj_is_set);
-@@ -77,11 +77,11 @@ void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
+@@ -81,11 +81,11 @@ void nftnl_obj_set_data(struct nftnl_obj *obj, uint16_t attr,
  
  	switch (attr) {
  	case NFTNL_OBJ_TABLE:
@@ -418,7 +539,7 @@ index 30000f748da4..1b5965d7abdc 100644
  		obj->name = strdup(data);
  		break;
  	case NFTNL_OBJ_TYPE:
-@@ -523,7 +523,7 @@ void nftnl_obj_list_free(struct nftnl_obj_list *list)
+@@ -452,7 +452,7 @@ void nftnl_obj_list_free(struct nftnl_obj_list *list)
  		list_del(&r->head);
  		nftnl_obj_free(r);
  	}
@@ -427,7 +548,7 @@ index 30000f748da4..1b5965d7abdc 100644
  }
  
  EXPORT_SYMBOL(nftnl_obj_list_is_empty);
-@@ -610,5 +610,5 @@ struct nftnl_obj *nftnl_obj_list_iter_next(struct nftnl_obj_list_iter *iter)
+@@ -539,5 +539,5 @@ struct nftnl_obj *nftnl_obj_list_iter_next(struct nftnl_obj_list_iter *iter)
  EXPORT_SYMBOL(nftnl_obj_list_iter_destroy);
  void nftnl_obj_list_iter_destroy(struct nftnl_obj_list_iter *iter)
  {
@@ -435,7 +556,7 @@ index 30000f748da4..1b5965d7abdc 100644
 +	nftnl_xfree(iter);
  }
 diff --git a/src/rule.c b/src/rule.c
-index e4cba1f7a352..911f327a6f9f 100644
+index 9af8fae2a803..0fce46e5c944 100644
 --- a/src/rule.c
 +++ b/src/rule.c
 @@ -75,13 +75,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
@@ -532,7 +653,7 @@ index e4cba1f7a352..911f327a6f9f 100644
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -910,7 +910,7 @@ struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
+@@ -737,7 +737,7 @@ struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
  EXPORT_SYMBOL(nftnl_expr_iter_destroy);
  void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
  {
@@ -540,8 +661,8 @@ index e4cba1f7a352..911f327a6f9f 100644
 +	nftnl_xfree(iter);
  }
  
- EXPORT_SYMBOL(nftnl_rule_cmp);
-@@ -971,7 +971,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
+ struct nftnl_rule_list {
+@@ -767,7 +767,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
  		list_del(&r->head);
  		nftnl_rule_free(r);
  	}
@@ -550,7 +671,7 @@ index e4cba1f7a352..911f327a6f9f 100644
  }
  
  EXPORT_SYMBOL(nftnl_rule_list_is_empty);
-@@ -1063,5 +1063,5 @@ struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
+@@ -865,5 +865,5 @@ struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
  EXPORT_SYMBOL(nftnl_rule_list_iter_destroy);
  void nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
  {
@@ -558,10 +679,10 @@ index e4cba1f7a352..911f327a6f9f 100644
 +	nftnl_xfree(iter);
  }
 diff --git a/src/ruleset.c b/src/ruleset.c
-index eb49fde582c2..1639cae68c61 100644
+index 2468bd46cd5d..16059a305309 100644
 --- a/src/ruleset.c
 +++ b/src/ruleset.c
-@@ -72,7 +72,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
+@@ -70,7 +70,7 @@ void nftnl_ruleset_free(const struct nftnl_ruleset *r)
  		nftnl_set_list_free(r->set_list);
  	if (r->flags & (1 << NFTNL_RULESET_RULELIST))
  		nftnl_rule_list_free(r->rule_list);
@@ -571,7 +692,7 @@ index eb49fde582c2..1639cae68c61 100644
  
  EXPORT_SYMBOL(nftnl_ruleset_is_set);
 diff --git a/src/set.c b/src/set.c
-index ac24eae6bb16..2b758c4ec89a 100644
+index d1bdb165ab4b..53e54715d4b8 100644
 --- a/src/set.c
 +++ b/src/set.c
 @@ -46,17 +46,17 @@ void nftnl_set_free(const struct nftnl_set *s)
@@ -607,9 +728,9 @@ index ac24eae6bb16..2b758c4ec89a 100644
 -		xfree(s->name);
 +		nftnl_xfree(s->name);
  		break;
+ 	case NFTNL_SET_HANDLE:
  	case NFTNL_SET_FLAGS:
- 	case NFTNL_SET_KEY_TYPE:
-@@ -92,7 +92,7 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
+@@ -93,7 +93,7 @@ void nftnl_set_unset(struct nftnl_set *s, uint16_t attr)
  	case NFTNL_SET_GC_INTERVAL:
  		break;
  	case NFTNL_SET_USERDATA:
@@ -618,7 +739,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  		break;
  	default:
  		return;
-@@ -125,7 +125,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+@@ -127,7 +127,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  	switch(attr) {
  	case NFTNL_SET_TABLE:
  		if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -627,7 +748,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  
  		s->table = strdup(data);
  		if (!s->table)
-@@ -133,7 +133,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+@@ -135,7 +135,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  		break;
  	case NFTNL_SET_NAME:
  		if (s->flags & (1 << NFTNL_SET_NAME))
@@ -636,7 +757,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  
  		s->name = strdup(data);
  		if (!s->name)
-@@ -177,7 +177,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
+@@ -182,7 +182,7 @@ int nftnl_set_set_data(struct nftnl_set *s, uint16_t attr, const void *data,
  		break;
  	case NFTNL_SET_USERDATA:
  		if (s->flags & (1 << NFTNL_SET_USERDATA))
@@ -645,7 +766,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  
  		s->user.data = malloc(data_len);
  		if (!s->user.data)
-@@ -478,7 +478,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -492,7 +492,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  
  	if (tb[NFTA_SET_TABLE]) {
  		if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -654,7 +775,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  		s->table = strdup(mnl_attr_get_str(tb[NFTA_SET_TABLE]));
  		if (!s->table)
  			return -1;
-@@ -486,7 +486,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -500,7 +500,7 @@ int nftnl_set_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  	}
  	if (tb[NFTA_SET_NAME]) {
  		if (s->flags & (1 << NFTNL_SET_NAME))
@@ -663,7 +784,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  		s->name = strdup(mnl_attr_get_str(tb[NFTA_SET_NAME]));
  		if (!s->name)
  			return -1;
-@@ -982,7 +982,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
+@@ -742,7 +742,7 @@ void nftnl_set_list_free(struct nftnl_set_list *list)
  		list_del(&s->head);
  		nftnl_set_free(s);
  	}
@@ -672,7 +793,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  }
  
  EXPORT_SYMBOL(nftnl_set_list_is_empty);
-@@ -1074,7 +1074,7 @@ struct nftnl_set *nftnl_set_list_iter_next(struct nftnl_set_list_iter *iter)
+@@ -834,7 +834,7 @@ struct nftnl_set *nftnl_set_list_iter_next(struct nftnl_set_list_iter *iter)
  EXPORT_SYMBOL(nftnl_set_list_iter_destroy);
  void nftnl_set_list_iter_destroy(const struct nftnl_set_list_iter *iter)
  {
@@ -682,7 +803,7 @@ index ac24eae6bb16..2b758c4ec89a 100644
  
  static struct nftnl_set *nftnl_set_lookup(const char *this_set_name,
 diff --git a/src/set_elem.c b/src/set_elem.c
-index e02a38791c9a..100ccda699c6 100644
+index ff983a67d62a..fac96cd368f1 100644
 --- a/src/set_elem.c
 +++ b/src/set_elem.c
 @@ -43,18 +43,18 @@ EXPORT_SYMBOL(nftnl_set_elem_free);
@@ -760,7 +881,7 @@ index e02a38791c9a..100ccda699c6 100644
  
  		s->objref = strdup(data);
  		if (!s->objref)
-@@ -431,7 +431,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
+@@ -436,7 +436,7 @@ static int nftnl_set_elems_parse2(struct nftnl_set *s, const struct nlattr *nest
  			mnl_attr_get_payload(tb[NFTA_SET_ELEM_USERDATA]);
  
  		if (e->flags & (1 << NFTNL_RULE_USERDATA))
@@ -769,7 +890,7 @@ index e02a38791c9a..100ccda699c6 100644
  
  		e->user.len  = mnl_attr_get_payload_len(tb[NFTA_SET_ELEM_USERDATA]);
  		e->user.data = malloc(e->user.len);
-@@ -516,7 +516,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -521,7 +521,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  
  	if (tb[NFTA_SET_ELEM_LIST_TABLE]) {
  		if (s->flags & (1 << NFTNL_SET_TABLE))
@@ -778,7 +899,7 @@ index e02a38791c9a..100ccda699c6 100644
  		s->table =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_TABLE]));
  		if (!s->table)
-@@ -525,7 +525,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
+@@ -530,7 +530,7 @@ int nftnl_set_elems_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_set *s)
  	}
  	if (tb[NFTA_SET_ELEM_LIST_SET]) {
  		if (s->flags & (1 << NFTNL_SET_NAME))
@@ -787,7 +908,7 @@ index e02a38791c9a..100ccda699c6 100644
  		s->name =
  			strdup(mnl_attr_get_str(tb[NFTA_SET_ELEM_LIST_SET]));
  		if (!s->name)
-@@ -816,7 +816,7 @@ struct nftnl_set_elem *nftnl_set_elems_iter_next(struct nftnl_set_elems_iter *it
+@@ -729,7 +729,7 @@ struct nftnl_set_elem *nftnl_set_elems_iter_next(struct nftnl_set_elems_iter *it
  EXPORT_SYMBOL(nftnl_set_elems_iter_destroy);
  void nftnl_set_elems_iter_destroy(struct nftnl_set_elems_iter *iter)
  {
@@ -797,10 +918,10 @@ index e02a38791c9a..100ccda699c6 100644
  
  static bool nftnl_attr_nest_overflow(struct nlmsghdr *nlh,
 diff --git a/src/table.c b/src/table.c
-index 7f97ca4e5807..7ac57c33021b 100644
+index 54259eec7d06..888991b1b80d 100644
 --- a/src/table.c
 +++ b/src/table.c
-@@ -46,9 +46,9 @@ EXPORT_SYMBOL(nftnl_table_free);
+@@ -47,9 +47,9 @@ EXPORT_SYMBOL(nftnl_table_free);
  void nftnl_table_free(const struct nftnl_table *t)
  {
  	if (t->flags & (1 << NFTNL_TABLE_NAME))
@@ -812,7 +933,7 @@ index 7f97ca4e5807..7ac57c33021b 100644
  }
  
  EXPORT_SYMBOL(nftnl_table_is_set);
-@@ -65,7 +65,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
+@@ -66,7 +66,7 @@ void nftnl_table_unset(struct nftnl_table *t, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_TABLE_NAME:
@@ -820,8 +941,8 @@ index 7f97ca4e5807..7ac57c33021b 100644
 +		nftnl_xfree(t->name);
  		break;
  	case NFTNL_TABLE_FLAGS:
- 	case NFTNL_TABLE_FAMILY:
-@@ -91,7 +91,7 @@ int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
+ 	case NFTNL_TABLE_HANDLE:
+@@ -94,7 +94,7 @@ int nftnl_table_set_data(struct nftnl_table *t, uint16_t attr,
  	switch (attr) {
  	case NFTNL_TABLE_NAME:
  		if (t->flags & (1 << NFTNL_TABLE_NAME))
@@ -830,7 +951,7 @@ index 7f97ca4e5807..7ac57c33021b 100644
  
  		t->name = strdup(data);
  		if (!t->name)
-@@ -230,7 +230,7 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
+@@ -258,7 +258,7 @@ int nftnl_table_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_table *t)
  
  	if (tb[NFTA_TABLE_NAME]) {
  		if (t->flags & (1 << NFTNL_TABLE_NAME))
@@ -839,7 +960,7 @@ index 7f97ca4e5807..7ac57c33021b 100644
  		t->name = strdup(mnl_attr_get_str(tb[NFTA_TABLE_NAME]));
  		if (!t->name)
  			return -1;
-@@ -452,7 +452,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
+@@ -395,7 +395,7 @@ void nftnl_table_list_free(struct nftnl_table_list *list)
  		list_del(&r->head);
  		nftnl_table_free(r);
  	}
@@ -848,7 +969,7 @@ index 7f97ca4e5807..7ac57c33021b 100644
  }
  
  EXPORT_SYMBOL(nftnl_table_list_is_empty);
-@@ -538,5 +538,5 @@ struct nftnl_table *nftnl_table_list_iter_next(struct nftnl_table_list_iter *ite
+@@ -481,5 +481,5 @@ struct nftnl_table *nftnl_table_list_iter_next(struct nftnl_table_list_iter *ite
  EXPORT_SYMBOL(nftnl_table_list_iter_destroy);
  void nftnl_table_list_iter_destroy(const struct nftnl_table_list_iter *iter)
  {
@@ -881,7 +1002,7 @@ index f4264377508e..8a18391d83d1 100644
  
  EXPORT_SYMBOL(nftnl_trace_is_set);
 diff --git a/src/udata.c b/src/udata.c
-index 6bd965161c43..049819304ef5 100644
+index b5a47295b40d..3b3be548036d 100644
 --- a/src/udata.c
 +++ b/src/udata.c
 @@ -33,7 +33,7 @@ struct nftnl_udata_buf *nftnl_udata_buf_alloc(uint32_t data_size)
@@ -894,10 +1015,10 @@ index 6bd965161c43..049819304ef5 100644
  
  EXPORT_SYMBOL(nftnl_udata_buf_len);
 diff --git a/src/utils.c b/src/utils.c
-index 3e449609395e..08f668f56a95 100644
+index f641bf93ec68..02e7476a0ced 100644
 --- a/src/utils.c
 +++ b/src/utils.c
-@@ -264,7 +264,7 @@ int nftnl_fprintf(FILE *fp, const void *obj, uint32_t cmd, uint32_t type,
+@@ -304,7 +304,7 @@ int nftnl_fprintf(FILE *fp, const void *obj, uint32_t cmd, uint32_t type,
  
  out:
  	if (buf != _buf)
@@ -907,5 +1028,5 @@ index 3e449609395e..08f668f56a95 100644
  	return ret;
  }
 -- 
-2.15.1
+2.19.1
 
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index c798dd2bb1..3ecaeb8a11 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,6 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha1	90b70f52a26f88ab1106671e797faac21265fa6a	libnftnl-1.0.9.tar.bz2
-# Locally calculated after checking pgp signature
-# http://www.netfilter.org/projects/libnftnl/files/libnftnl-1.0.9.tar.bz2.sig
-sha256	fec1d824aee301e59a11aeaae2a2d429cb99ead81e6bafab791a4dd6569b3635	libnftnl-1.0.9.tar.bz2
+sha256	a5c7b7a6c13c9c5898b13fcb1126fefce2015d5a96d7c354b19aaa40b6aece5d 	libnftnl-1.1.2.tar.bz2
 sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 8c8b3f8243..b8e015baf8 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.0.9
-LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
+LIBNFTNL_VERSION = 1.1.2
+LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
 LIBNFTNL_LICENSE_FILES = COPYING

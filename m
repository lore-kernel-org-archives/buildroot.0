From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 14:22:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libnftnl: bump to
 version 1.1.3
Message-ID: <20190925121957.AF9B68050E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9a935047f5b191425e1e5847a03905b027700bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Rebase patch #1.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1208e41561da7c8347d430c5af3efcd271ad5260)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-to-libnftnl_xfree-to-avoid-symbol-namin.patch | 118 ++++++++++++---------
 package/libnftnl/libnftnl.hash                     |   2 +-
 package/libnftnl/libnftnl.mk                       |   2 +-
 3 files changed, 70 insertions(+), 52 deletions(-)

diff --git a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index 213aab79eb..e1ef576285 100644
--- a/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -22,11 +22,11 @@ libnftnl_xfree().
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for version 1.0.7]
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[baruch: update for versions 1.0.9, 1.1.2]
+[baruch: update for versions 1.0.9, 1.1.2, 1.1.3]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  include/utils.h         |  2 +-
- src/chain.c             | 36 ++++++++++++++++++------------------
+ src/chain.c             | 38 +++++++++++++++++++-------------------
  src/common.c            |  2 +-
  src/expr.c              |  4 ++--
  src/expr/data_reg.c     |  2 +-
@@ -37,7 +37,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  src/expr/lookup.c       |  2 +-
  src/expr/match.c        |  6 +++---
  src/expr/target.c       |  6 +++---
- src/flowtable.c         | 32 ++++++++++++++++----------------
+ src/flowtable.c         | 34 +++++++++++++++++-----------------
  src/gen.c               |  2 +-
  src/object.c            | 14 +++++++-------
  src/rule.c              | 32 ++++++++++++++++----------------
@@ -48,7 +48,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  src/trace.c             | 14 +++++++-------
  src/udata.c             |  2 +-
  src/utils.c             |  2 +-
- 23 files changed, 121 insertions(+), 121 deletions(-)
+ 23 files changed, 123 insertions(+), 123 deletions(-)
 
 diff --git a/include/utils.h b/include/utils.h
 index 3cc659652fe2..820556715013 100644
@@ -64,12 +64,12 @@ index 3cc659652fe2..820556715013 100644
  #define div_round_up(n, d)	(((n) + (d) - 1) / (d))
  
 diff --git a/src/chain.c b/src/chain.c
-index 01d62c84f140..93e193955934 100644
+index 26f9b9d61053..06316a26b075 100644
 --- a/src/chain.c
 +++ b/src/chain.c
-@@ -97,14 +97,14 @@ EXPORT_SYMBOL(nftnl_chain_free);
- void nftnl_chain_free(const struct nftnl_chain *c)
- {
+@@ -114,14 +114,14 @@ void nftnl_chain_free(const struct nftnl_chain *c)
+ 		nftnl_rule_free(r);
+ 
  	if (c->flags & (1 << NFTNL_CHAIN_NAME))
 -		xfree(c->name);
 +		nftnl_xfree(c->name);
@@ -87,7 +87,7 @@ index 01d62c84f140..93e193955934 100644
  }
  
  EXPORT_SYMBOL(nftnl_chain_is_set);
-@@ -121,15 +121,15 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+@@ -138,15 +138,15 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_CHAIN_NAME:
@@ -106,7 +106,7 @@ index 01d62c84f140..93e193955934 100644
  		break;
  	case NFTNL_CHAIN_HOOKNUM:
  	case NFTNL_CHAIN_PRIO:
-@@ -140,7 +140,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
+@@ -157,7 +157,7 @@ void nftnl_chain_unset(struct nftnl_chain *c, uint16_t attr)
  	case NFTNL_CHAIN_FAMILY:
  		break;
  	case NFTNL_CHAIN_DEV:
@@ -115,7 +115,7 @@ index 01d62c84f140..93e193955934 100644
  		break;
  	default:
  		return;
-@@ -169,7 +169,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -186,7 +186,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  	switch(attr) {
  	case NFTNL_CHAIN_NAME:
  		if (c->flags & (1 << NFTNL_CHAIN_NAME))
@@ -124,7 +124,7 @@ index 01d62c84f140..93e193955934 100644
  
  		c->name = strdup(data);
  		if (!c->name)
-@@ -177,7 +177,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -194,7 +194,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_TABLE:
  		if (c->flags & (1 << NFTNL_CHAIN_TABLE))
@@ -133,7 +133,7 @@ index 01d62c84f140..93e193955934 100644
  
  		c->table = strdup(data);
  		if (!c->table)
-@@ -209,7 +209,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -226,7 +226,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_TYPE:
  		if (c->flags & (1 << NFTNL_CHAIN_TYPE))
@@ -142,7 +142,7 @@ index 01d62c84f140..93e193955934 100644
  
  		c->type = strdup(data);
  		if (!c->type)
-@@ -217,7 +217,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
+@@ -234,7 +234,7 @@ int nftnl_chain_set_data(struct nftnl_chain *c, uint16_t attr,
  		break;
  	case NFTNL_CHAIN_DEV:
  		if (c->flags & (1 << NFTNL_CHAIN_DEV))
@@ -151,7 +151,7 @@ index 01d62c84f140..93e193955934 100644
  
  		c->dev = strdup(data);
  		if (!c->dev)
-@@ -541,7 +541,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+@@ -588,7 +588,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  
  	if (tb[NFTA_CHAIN_NAME]) {
  		if (c->flags & (1 << NFTNL_CHAIN_NAME))
@@ -160,7 +160,7 @@ index 01d62c84f140..93e193955934 100644
  		c->name = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_NAME]));
  		if (!c->name)
  			return -1;
-@@ -549,7 +549,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+@@ -596,7 +596,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  	}
  	if (tb[NFTA_CHAIN_TABLE]) {
  		if (c->flags & (1 << NFTNL_CHAIN_TABLE))
@@ -169,7 +169,7 @@ index 01d62c84f140..93e193955934 100644
  		c->table = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TABLE]));
  		if (!c->table)
  			return -1;
-@@ -579,7 +579,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
+@@ -626,7 +626,7 @@ int nftnl_chain_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_chain *c)
  	}
  	if (tb[NFTA_CHAIN_TYPE]) {
  		if (c->flags & (1 << NFTNL_CHAIN_TYPE))
@@ -178,8 +178,17 @@ index 01d62c84f140..93e193955934 100644
  		c->type = strdup(mnl_attr_get_str(tb[NFTA_CHAIN_TYPE]));
  		if (!c->type)
  			return -1;
-@@ -711,7 +711,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
- 		list_del(&r->head);
+@@ -810,7 +810,7 @@ struct nftnl_rule *nftnl_rule_iter_next(struct nftnl_rule_iter *iter)
+ EXPORT_SYMBOL(nftnl_rule_iter_destroy);
+ void nftnl_rule_iter_destroy(struct nftnl_rule_iter *iter)
+ {
+-	xfree(iter);
++	nftnl_xfree(iter);
+ }
+ 
+ #define CHAIN_NAME_HSIZE	512
+@@ -848,7 +848,7 @@ void nftnl_chain_list_free(struct nftnl_chain_list *list)
+ 		hlist_del(&r->hnode);
  		nftnl_chain_free(r);
  	}
 -	xfree(list);
@@ -187,7 +196,7 @@ index 01d62c84f140..93e193955934 100644
  }
  
  EXPORT_SYMBOL(nftnl_chain_list_is_empty);
-@@ -797,5 +797,5 @@ struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *ite
+@@ -967,5 +967,5 @@ struct nftnl_chain *nftnl_chain_list_iter_next(struct nftnl_chain_list_iter *ite
  EXPORT_SYMBOL(nftnl_chain_list_iter_destroy);
  void nftnl_chain_list_iter_destroy(struct nftnl_chain_list_iter *iter)
  {
@@ -388,7 +397,7 @@ index 91000386704a..5d0763edf63f 100644
  
  struct expr_ops expr_ops_target = {
 diff --git a/src/flowtable.c b/src/flowtable.c
-index c939306b56c4..f1b3eef48b73 100644
+index 1f7ba3052d4f..7f3f6bbcfd13 100644
 --- a/src/flowtable.c
 +++ b/src/flowtable.c
 @@ -45,16 +45,16 @@ void nftnl_flowtable_free(const struct nftnl_flowtable *c)
@@ -429,15 +438,15 @@ index c939306b56c4..f1b3eef48b73 100644
 @@ -86,8 +86,8 @@ void nftnl_flowtable_unset(struct nftnl_flowtable *c, uint16_t attr)
  		break;
  	case NFTNL_FLOWTABLE_DEVICES:
- 		for (i = 0; i < c->dev_array_len; i++) {
+ 		for (i = 0; i < c->dev_array_len; i++)
 -			xfree(c->dev_array[i]);
--			xfree(c->dev_array);
+-		xfree(c->dev_array);
 +			nftnl_xfree(c->dev_array[i]);
-+			nftnl_xfree(c->dev_array);
- 		}
++		nftnl_xfree(c->dev_array);
  		break;
  	default:
-@@ -117,7 +117,7 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+ 		return;
+@@ -116,7 +116,7 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
  	switch(attr) {
  	case NFTNL_FLOWTABLE_NAME:
  		if (c->flags & (1 << NFTNL_FLOWTABLE_NAME))
@@ -446,7 +455,7 @@ index c939306b56c4..f1b3eef48b73 100644
  
  		c->name = strdup(data);
  		if (!c->name)
-@@ -125,7 +125,7 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+@@ -124,7 +124,7 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
  		break;
  	case NFTNL_FLOWTABLE_TABLE:
  		if (c->flags & (1 << NFTNL_FLOWTABLE_TABLE))
@@ -455,18 +464,27 @@ index c939306b56c4..f1b3eef48b73 100644
  
  		c->table = strdup(data);
  		if (!c->table)
-@@ -147,8 +147,8 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
+@@ -146,8 +146,8 @@ int nftnl_flowtable_set_data(struct nftnl_flowtable *c, uint16_t attr,
  
  		if (c->flags & (1 << NFTNL_FLOWTABLE_DEVICES)) {
- 			for (i = 0; i < c->dev_array_len; i++) {
+ 			for (i = 0; i < c->dev_array_len; i++)
 -				xfree(c->dev_array[i]);
--				xfree(c->dev_array);
+-			xfree(c->dev_array);
 +				nftnl_xfree(c->dev_array[i]);
-+				nftnl_xfree(c->dev_array);
- 			}
++			nftnl_xfree(c->dev_array);
  		}
  
-@@ -423,7 +423,7 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
+ 		c->dev_array = calloc(len + 1, sizeof(char *));
+@@ -385,7 +385,7 @@ static int nftnl_flowtable_parse_devs(struct nlattr *nest,
+ 	return 0;
+ err:
+ 	while (len--)
+-		xfree(dev_array[len]);
++		nftnl_xfree(dev_array[len]);
+ 	return -1;
+ }
+ 
+@@ -426,7 +426,7 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
  
  	if (tb[NFTA_FLOWTABLE_NAME]) {
  		if (c->flags & (1 << NFTNL_FLOWTABLE_NAME))
@@ -475,7 +493,7 @@ index c939306b56c4..f1b3eef48b73 100644
  		c->name = strdup(mnl_attr_get_str(tb[NFTA_FLOWTABLE_NAME]));
  		if (!c->name)
  			return -1;
-@@ -431,7 +431,7 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
+@@ -434,7 +434,7 @@ int nftnl_flowtable_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_flowtab
  	}
  	if (tb[NFTA_FLOWTABLE_TABLE]) {
  		if (c->flags & (1 << NFTNL_FLOWTABLE_TABLE))
@@ -484,7 +502,7 @@ index c939306b56c4..f1b3eef48b73 100644
  		c->table = strdup(mnl_attr_get_str(tb[NFTA_FLOWTABLE_TABLE]));
  		if (!c->table)
  			return -1;
-@@ -635,7 +635,7 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
+@@ -638,7 +638,7 @@ void nftnl_flowtable_list_free(struct nftnl_flowtable_list *list)
  		list_del(&s->head);
  		nftnl_flowtable_free(s);
  	}
@@ -507,7 +525,7 @@ index 1fc909930d86..c69f6f87deae 100644
  
  EXPORT_SYMBOL(nftnl_gen_is_set);
 diff --git a/src/object.c b/src/object.c
-index e88203a82441..28e04486c76c 100644
+index 5c8d1835ca97..1de1b35d2217 100644
 --- a/src/object.c
 +++ b/src/object.c
 @@ -53,11 +53,11 @@ EXPORT_SYMBOL(nftnl_obj_free);
@@ -556,10 +574,10 @@ index e88203a82441..28e04486c76c 100644
 +	nftnl_xfree(iter);
  }
 diff --git a/src/rule.c b/src/rule.c
-index 9af8fae2a803..0fce46e5c944 100644
+index 8173fcdd863d..36446de29dbe 100644
 --- a/src/rule.c
 +++ b/src/rule.c
-@@ -75,13 +75,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
+@@ -53,13 +53,13 @@ void nftnl_rule_free(const struct nftnl_rule *r)
  		nftnl_expr_free(e);
  
  	if (r->flags & (1 << (NFTNL_RULE_TABLE)))
@@ -577,7 +595,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  }
  
  EXPORT_SYMBOL(nftnl_rule_is_set);
-@@ -98,10 +98,10 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+@@ -76,10 +76,10 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
  
  	switch (attr) {
  	case NFTNL_RULE_TABLE:
@@ -590,8 +608,8 @@ index 9af8fae2a803..0fce46e5c944 100644
  		break;
  	case NFTNL_RULE_HANDLE:
  	case NFTNL_RULE_COMPAT_PROTO:
-@@ -111,7 +111,7 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
- 	case NFTNL_RULE_ID:
+@@ -90,7 +90,7 @@ void nftnl_rule_unset(struct nftnl_rule *r, uint16_t attr)
+ 	case NFTNL_RULE_POSITION_ID:
  		break;
  	case NFTNL_RULE_USERDATA:
 -		xfree(r->user.data);
@@ -599,7 +617,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  		break;
  	}
  
-@@ -137,7 +137,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -117,7 +117,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  	switch(attr) {
  	case NFTNL_RULE_TABLE:
  		if (r->flags & (1 << NFTNL_RULE_TABLE))
@@ -608,7 +626,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  
  		r->table = strdup(data);
  		if (!r->table)
-@@ -145,7 +145,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -125,7 +125,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  		break;
  	case NFTNL_RULE_CHAIN:
  		if (r->flags & (1 << NFTNL_RULE_CHAIN))
@@ -617,7 +635,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  
  		r->chain = strdup(data);
  		if (!r->chain)
-@@ -168,7 +168,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
+@@ -148,7 +148,7 @@ int nftnl_rule_set_data(struct nftnl_rule *r, uint16_t attr,
  		break;
  	case NFTNL_RULE_USERDATA:
  		if (r->flags & (1 << NFTNL_RULE_USERDATA))
@@ -626,7 +644,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  
  		r->user.data = malloc(data_len);
  		if (!r->user.data)
-@@ -453,7 +453,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -442,7 +442,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  
  	if (tb[NFTA_RULE_TABLE]) {
  		if (r->flags & (1 << NFTNL_RULE_TABLE))
@@ -635,7 +653,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  		r->table = strdup(mnl_attr_get_str(tb[NFTA_RULE_TABLE]));
  		if (!r->table)
  			return -1;
-@@ -461,7 +461,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -450,7 +450,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  	}
  	if (tb[NFTA_RULE_CHAIN]) {
  		if (r->flags & (1 << NFTNL_RULE_CHAIN))
@@ -644,7 +662,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  		r->chain = strdup(mnl_attr_get_str(tb[NFTA_RULE_CHAIN]));
  		if (!r->chain)
  			return -1;
-@@ -490,7 +490,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
+@@ -479,7 +479,7 @@ int nftnl_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nftnl_rule *r)
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
  		if (r->flags & (1 << NFTNL_RULE_USERDATA))
@@ -653,7 +671,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -737,7 +737,7 @@ struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
+@@ -735,7 +735,7 @@ struct nftnl_expr *nftnl_expr_iter_next(struct nftnl_expr_iter *iter)
  EXPORT_SYMBOL(nftnl_expr_iter_destroy);
  void nftnl_expr_iter_destroy(struct nftnl_expr_iter *iter)
  {
@@ -662,7 +680,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  }
  
  struct nftnl_rule_list {
-@@ -767,7 +767,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
+@@ -765,7 +765,7 @@ void nftnl_rule_list_free(struct nftnl_rule_list *list)
  		list_del(&r->head);
  		nftnl_rule_free(r);
  	}
@@ -671,7 +689,7 @@ index 9af8fae2a803..0fce46e5c944 100644
  }
  
  EXPORT_SYMBOL(nftnl_rule_list_is_empty);
-@@ -865,5 +865,5 @@ struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
+@@ -863,5 +863,5 @@ struct nftnl_rule *nftnl_rule_list_iter_next(struct nftnl_rule_list_iter *iter)
  EXPORT_SYMBOL(nftnl_rule_list_iter_destroy);
  void nftnl_rule_list_iter_destroy(const struct nftnl_rule_list_iter *iter)
  {
diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 3ecaeb8a11..64bd07a235 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256	a5c7b7a6c13c9c5898b13fcb1126fefce2015d5a96d7c354b19aaa40b6aece5d 	libnftnl-1.1.2.tar.bz2
+sha256	22dd97d3b06ae8c67499506e2bfd6803ce116479076ec3700e7a4c7cd9fcba0f  	libnftnl-1.1.3.tar.bz2
 sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index b8e015baf8..a3fba488c4 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.2
+LIBNFTNL_VERSION = 1.1.3
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+

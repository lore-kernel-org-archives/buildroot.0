From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Aug 2020 23:10:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/open-lldp: fix build with gcc 10
Message-ID: <20200813211001.522492-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b6aaaa1e72ba9ce0c29730970911431558181c6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...004-lldp_head-rename-and-make-extern.patch | 500 ++++++++++++++++++
 ...05-lldp-add-packed-struct-definition.patch |  49 ++
 .../open-lldp/0006-lldptool-make-extern.patch |  41 ++
 ...ake-enum-a-type-rather-than-instance.patch |  33 ++
 ...08-lldp_8021qaz-extern-config-object.patch |  29 +
 5 files changed, 652 insertions(+)
 create mode 100644 package/open-lldp/0004-lldp_head-rename-and-make-extern.patch
 create mode 100644 package/open-lldp/0005-lldp-add-packed-struct-definition.patch
 create mode 100644 package/open-lldp/0006-lldptool-make-extern.patch
 create mode 100644 package/open-lldp/0007-ecp22-make-enum-a-type-rather-than-instance.patch
 create mode 100644 package/open-lldp/0008-lldp_8021qaz-extern-config-object.patch

diff --git a/package/open-lldp/0004-lldp_head-rename-and-make-extern.patch b/package/open-lldp/0004-lldp_head-rename-and-make-extern.patch
new file mode 100644
index 0000000000..151a1d0b34
--- /dev/null
+++ b/package/open-lldp/0004-lldp_head-rename-and-make-extern.patch
@@ -0,0 +1,500 @@
+From 07a83c583b9d508c7040dc6254a6a7113b2ce55f Mon Sep 17 00:00:00 2001
+From: Aaron Conole <aconole@redhat.com>
+Date: Mon, 3 Aug 2020 15:05:42 -0400
+Subject: [PATCH] lldp_head: rename and make extern
+
+Try to resolve this silly mod issue
+
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+[Retrieved from:
+https://github.com/intel/openlldp/pull/55/commits/07a83c583b9d508c7040dc6254a6a7113b2ce55f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config.c           |  4 ++--
+ event_iface.c      |  4 ++--
+ include/lldp_mod.h |  2 +-
+ lldp/agent.c       |  2 +-
+ lldp/rx.c          |  4 ++--
+ lldp/tx.c          |  4 ++--
+ lldp_dcbx.c        |  8 ++++----
+ lldp_mand_cmds.c   |  8 ++++----
+ lldpad.c           | 12 +++++++-----
+ lldptool.c         | 14 ++++++++------
+ lldptool_cmds.c    |  2 +-
+ qbg/ecp22.c        |  8 ++++----
+ qbg/vdp.c          |  4 ++--
+ qbg/vdp22.c        |  6 +++---
+ qbg/vdp22_cmds.c   |  2 +-
+ vdptool.c          | 16 +++++++++-------
+ 16 files changed, 53 insertions(+), 47 deletions(-)
+
+diff --git a/config.c b/config.c
+index be458fd..bc3fbae 100644
+--- a/config.c
++++ b/config.c
+@@ -185,7 +185,7 @@ void scan_port(UNUSED void *eloop_data, UNUSED void *user_ctx)
+ 		LIST_FOREACH(agent, &port->agent_head, entry) {
+ 			LLDPAD_DBG("%s: calling ifdown for agent %p.\n",
+ 				   __func__, agent);
+-			LIST_FOREACH(np, &lldp_head, lldp) {
++			LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 				ops = np->ops;
+ 				if (ops->lldp_mod_ifdown)
+ 					ops->lldp_mod_ifdown(ifname, agent);
+@@ -394,7 +394,7 @@ void init_ports(void)
+ 		LIST_FOREACH(agent, &port->agent_head, entry) {
+ 			LLDPAD_DBG("%s: calling ifup for agent %p.\n",
+ 				   __func__, agent);
+-			LIST_FOREACH(np, &lldp_head, lldp) {
++			LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 				if (np->ops->lldp_mod_ifup)
+ 					np->ops->lldp_mod_ifup(p->if_name, agent);
+ 			}
+diff --git a/event_iface.c b/event_iface.c
+index 43a95c7..1be2963 100644
+--- a/event_iface.c
++++ b/event_iface.c
+@@ -216,7 +216,7 @@ int oper_add_device(char *device_name)
+ 	LIST_FOREACH(agent, &port->agent_head, entry) {
+ 		LLDPAD_DBG("%s: calling ifup for agent %p.\n",
+ 			   __func__, agent);
+-		LIST_FOREACH(np, &lldp_head, lldp) {
++		LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 			if (np->ops->lldp_mod_ifup)
+ 				np->ops->lldp_mod_ifup(device_name, agent);
+ 		}
+@@ -283,7 +283,7 @@ static void event_if_decode_nlmsg(int route_type, void *data, int len)
+ 			LIST_FOREACH(agent, &port->agent_head, entry) {
+ 				LLDPAD_DBG("%s: calling ifdown for agent %p.\n",
+ 					   __func__, agent);
+-				LIST_FOREACH(np, &lldp_head, lldp) {
++				LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 					ops = np->ops;
+ 					if (ops->lldp_mod_ifdown)
+ 						ops->lldp_mod_ifdown(device_name,
+diff --git a/include/lldp_mod.h b/include/lldp_mod.h
+index 49a50e4..9733595 100644
+--- a/include/lldp_mod.h
++++ b/include/lldp_mod.h
+@@ -96,7 +96,7 @@ struct lldp_module {
+ };
+ 
+ LIST_HEAD(lldp_head, lldp_module);
+-struct lldp_head lldp_head;
++extern struct lldp_head lldp_mod_head;
+ 
+ static inline struct lldp_module *find_module_by_id(struct lldp_head *head, int id)
+ {
+diff --git a/lldp/agent.c b/lldp/agent.c
+index 333929a..aa4a8d1 100644
+--- a/lldp/agent.c
++++ b/lldp/agent.c
+@@ -163,7 +163,7 @@ static void timer(UNUSED void *eloop_data, UNUSED void *user_ctx)
+ 			run_rx_sm(port, agent);
+ 			update_rx_timers(agent);
+ 
+-			LIST_FOREACH(n, &lldp_head, lldp) {
++			LIST_FOREACH(n, &lldp_mod_head, lldp) {
+ 				if (n->ops && n->ops->timer)
+ 					n->ops->timer(port, agent);
+ 			}
+diff --git a/lldp/rx.c b/lldp/rx.c
+index 12d07bc..43aeeba 100644
+--- a/lldp/rx.c
++++ b/lldp/rx.c
+@@ -359,7 +359,7 @@ void rxProcessFrame(struct port *port, struct lldp_agent *agent)
+ 		}
+ 
+ 		/* rx per lldp module */
+-		LIST_FOREACH(np, &lldp_head, lldp) {
++		LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 			if (!np->ops || !np->ops->lldp_mod_rchange)
+ 				continue;
+ 
+@@ -402,7 +402,7 @@ u8 mibDeleteObjects(struct port *port, struct lldp_agent *agent)
+ {
+ 	struct lldp_module *np;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (!np->ops || !np->ops->lldp_mod_mibdelete)
+ 			continue;
+ 		np->ops->lldp_mod_mibdelete(port, agent);
+diff --git a/lldp/tx.c b/lldp/tx.c
+index c3a5c62..0746e34 100644
+--- a/lldp/tx.c
++++ b/lldp/tx.c
+@@ -71,7 +71,7 @@ bool mibConstrInfoLLDPDU(struct port *port, struct lldp_agent *agent)
+ 	fb_offset += sizeof(struct l2_ethhdr);
+ 
+ 	/* Generic TLV Pack */
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (!np->ops || !np->ops->lldp_mod_gettlv)
+ 			continue;
+ 
+@@ -206,7 +206,7 @@ bool mibConstrShutdownLLDPDU(struct port *port, struct lldp_agent *agent)
+ 	memcpy(agent->tx.frameout, (void *)&eth, sizeof(struct l2_ethhdr));
+ 	fb_offset += sizeof(struct l2_ethhdr);
+ 
+-	np = find_module_by_id(&lldp_head, LLDP_MOD_MAND);
++	np = find_module_by_id(&lldp_mod_head, LLDP_MOD_MAND);
+ 	if (!np)
+ 		goto error;
+ 	if (!np->ops || !np->ops->lldp_mod_gettlv)
+diff --git a/lldp_dcbx.c b/lldp_dcbx.c
+index 7e53c0f..809086f 100644
+--- a/lldp_dcbx.c
++++ b/lldp_dcbx.c
+@@ -129,7 +129,7 @@ struct dcbx_tlvs *dcbx_data(const char *ifname)
+ 	struct dcbd_user_data *dud;
+ 	struct dcbx_tlvs *tlv = NULL;
+ 
+-	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
++	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
+ 	if (dud) {
+ 		LIST_FOREACH(tlv, &dud->head, entry) {
+ 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
+@@ -148,7 +148,7 @@ int dcbx_tlvs_rxed(const char *ifname, struct lldp_agent *agent)
+ 	if (agent->type != NEAREST_BRIDGE)
+ 		return 0;
+ 
+-	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
++	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
+ 	if (dud) {
+ 		LIST_FOREACH(tlv, &dud->head, entry) {
+ 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
+@@ -172,7 +172,7 @@ int dcbx_check_active(const char *ifname)
+ 	struct dcbd_user_data *dud;
+ 	struct dcbx_tlvs *tlv = NULL;
+ 
+-	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
++	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
+ 	if (dud) {
+ 		LIST_FOREACH(tlv, &dud->head, entry) {
+ 			if (!strncmp(tlv->ifname, ifname, IFNAMSIZ))
+@@ -507,7 +507,7 @@ void dcbx_ifup(char *ifname, struct lldp_agent *agent)
+ 	ifindex = get_ifidx(ifname);
+ 	port = port_find_by_ifindex(ifindex);
+ 
+-	dud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_DCBX);
++	dud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_DCBX);
+ 	tlvs = dcbx_data(ifname);
+ 
+ 	if (!port)
+diff --git a/lldp_mand_cmds.c b/lldp_mand_cmds.c
+index 8a88177..1c43bf4 100644
+--- a/lldp_mand_cmds.c
++++ b/lldp_mand_cmds.c
+@@ -466,7 +466,7 @@ int handle_get_args(struct cmd *cmd, UNUSED char *arg, char *argvalue,
+ 	nbuf = obuf;
+ 	nbuf_len = obuf_len;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (!np->ops->get_arg_handler)
+ 			continue;
+ 		if (!(ah = np->ops->get_arg_handler()))
+@@ -496,7 +496,7 @@ int handle_get_arg(struct cmd *cmd, char *arg, char *argvalue,
+ 	struct arg_handlers *ah;
+ 	int rval, status = cmd_not_applicable;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (!np->ops->get_arg_handler)
+ 			continue;
+ 		if (!(ah = np->ops->get_arg_handler()))
+@@ -593,7 +593,7 @@ int handle_test_arg(struct cmd *cmd, char *arg, char *argvalue,
+ 	struct arg_handlers *ah;
+ 	int rval, status = cmd_not_applicable;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (!np->ops->get_arg_handler)
+ 			continue;
+ 		if (!(ah = np->ops->get_arg_handler()))
+@@ -626,7 +626,7 @@ int handle_set_arg(struct cmd *cmd, char *arg, char *argvalue,
+ 	struct arg_handlers *ah;
+ 	int rval, status = cmd_not_applicable;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (!np->ops->get_arg_handler)
+ 			continue;
+ 		if (!(ah = np->ops->get_arg_handler()))
+diff --git a/lldpad.c b/lldpad.c
+index 01fb588..65e92c7 100644
+--- a/lldpad.c
++++ b/lldpad.c
+@@ -80,6 +80,8 @@ struct lldp_module *(*register_tlv_table[])(void) = {
+ 	NULL,
+ };
+ 
++struct lldp_head lldp_mod_head;
++
+ char *cfg_file_name = NULL;
+ bool daemonize = 0;
+ int loglvl = LOG_WARNING;
+@@ -98,7 +100,7 @@ static void init_modules(void)
+ 	struct lldp_module *premod = NULL;
+ 	int i = 0;
+ 
+-	LIST_INIT(&lldp_head);
++	LIST_INIT(&lldp_mod_head);
+ 	for (i = 0; register_tlv_table[i]; i++) {
+ 		module = register_tlv_table[i]();
+ 		if (!module)
+@@ -106,7 +108,7 @@ static void init_modules(void)
+ 		if (premod)
+ 			LIST_INSERT_AFTER(premod, module, lldp);
+ 		else
+-			LIST_INSERT_HEAD(&lldp_head, module, lldp);
++			LIST_INSERT_HEAD(&lldp_mod_head, module, lldp);
+ 		premod = module;
+ 	}
+ }
+@@ -115,9 +117,9 @@ void deinit_modules(void)
+ {
+ 	struct lldp_module *module;
+ 
+-	while (lldp_head.lh_first != NULL) {
+-		module = lldp_head.lh_first;
+-		LIST_REMOVE(lldp_head.lh_first, lldp);
++	while (lldp_mod_head.lh_first != NULL) {
++		module = lldp_mod_head.lh_first;
++		LIST_REMOVE(lldp_mod_head.lh_first, lldp);
+ 		module->ops->lldp_mod_unregister(module);
+ 	}
+ }
+diff --git a/lldptool.c b/lldptool.c
+index 2b14f61..664a248 100644
+--- a/lldptool.c
++++ b/lldptool.c
+@@ -64,6 +64,8 @@
+ #include "lldp_util.h"
+ #include "lldpad_status.h"
+ 
++struct lldp_head lldp_mod_head;
++
+ static int show_raw;
+ 
+ static const char *cli_version =
+@@ -199,7 +201,7 @@ static void init_modules(void)
+ 		if (premod)
+ 			LIST_INSERT_AFTER(premod, module, lldp);
+ 		else
+-			LIST_INSERT_HEAD(&lldp_head, module, lldp);
++			LIST_INSERT_HEAD(&lldp_mod_head, module, lldp);
+ 		premod = module;
+ 	}
+ }
+@@ -208,9 +210,9 @@ void deinit_modules(void)
+ {
+ 	struct lldp_module *module;
+ 
+-	while (lldp_head.lh_first != NULL) {
+-		module = lldp_head.lh_first;
+-		LIST_REMOVE(lldp_head.lh_first, lldp);
++	while (lldp_mod_head.lh_first != NULL) {
++		module = lldp_mod_head.lh_first;
++		LIST_REMOVE(lldp_mod_head.lh_first, lldp);
+ 		module->ops->lldp_mod_unregister(module);
+ 	}
+ }
+@@ -346,7 +348,7 @@ cli_cmd_help(UNUSED struct clif *clif, UNUSED int argc, UNUSED char *argv[],
+ 	printf("%s\n%s\n%s", commands_usage, commands_options, commands_help);
+ 
+ 	printf("\nTLV identifiers:\n");
+-	LIST_FOREACH(np, &lldp_head, lldp)
++	LIST_FOREACH(np, &lldp_mod_head, lldp)
+ 		if (np->ops->print_help)
+ 			np->ops->print_help();
+ 	return 0;
+@@ -406,7 +408,7 @@ u32 lookup_tlvid(char *tlvid_str)
+ 	struct lldp_module *np;
+ 	u32 tlvid = INVALID_TLVID;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (np->ops->lookup_tlv_name) {
+ 			tlvid = np->ops->lookup_tlv_name(tlvid_str);
+ 			if (tlvid != INVALID_TLVID)
+diff --git a/lldptool_cmds.c b/lldptool_cmds.c
+index daef8c8..70b7b0d 100644
+--- a/lldptool_cmds.c
++++ b/lldptool_cmds.c
+@@ -464,7 +464,7 @@ static void print_tlvs(struct cmd *cmd, char *ibuf)
+ 			offset += 8;
+ 		
+ 		printed = 0;
+-		LIST_FOREACH(np, &lldp_head, lldp) {
++		LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 			if (np->ops->print_tlv(tlvid, tlv_len, ibuf+offset)) {
+ 					printed = 1;
+ 					break;
+diff --git a/qbg/ecp22.c b/qbg/ecp22.c
+index 6561d14..825392b 100644
+--- a/qbg/ecp22.c
++++ b/qbg/ecp22.c
+@@ -774,7 +774,7 @@ void ecp22_start(char *ifname)
+ 	struct ecp22 *ecp;
+ 
+ 	LLDPAD_DBG("%s:%s start ecp\n", __func__, ifname);
+-	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
++	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
+ 	if (!eud) {
+ 		LLDPAD_DBG("%s:%s no ECP module\n", __func__, ifname);
+ 		return;
+@@ -837,7 +837,7 @@ void ecp22_stop(char *ifname)
+ 	struct ecp22 *ecp;
+ 
+ 	LLDPAD_DBG("%s:%s stop ecp\n", __func__, ifname);
+-	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
++	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
+ 	ecp = find_ecpdata(ifname, eud);
+ 	if (ecp)
+ 		ecp22_remove(ecp);
+@@ -852,7 +852,7 @@ static int ecp22_data_from_evb(char *ifname, struct evb22_to_ecp22 *ptr)
+ 	struct ecp22_user_data *eud;
+ 	struct ecp22 *ecp;
+ 
+-	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
++	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
+ 	ecp = find_ecpdata(ifname, eud);
+ 	if (ecp) {
+ 		ecp->max_rte = ptr->max_rte;
+@@ -930,7 +930,7 @@ static int ecp22_req2send(char *ifname, unsigned short subtype,
+ 
+ 	LLDPAD_DBG("%s:%s subtype:%d\n", __func__, ifname, subtype);
+ 
+-	eud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_ECP22);
++	eud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_ECP22);
+ 	ecp = find_ecpdata(ifname, eud);
+ 	if (!ecp) {
+ 		rc = -ENODEV;
+diff --git a/qbg/vdp.c b/qbg/vdp.c
+index d131560..c26bbd6 100644
+--- a/qbg/vdp.c
++++ b/qbg/vdp.c
+@@ -188,7 +188,7 @@ struct vdp_data *vdp_data(char *ifname)
+ 	struct vdp_user_data *ud;
+ 	struct vdp_data *vd = NULL;
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP02);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP02);
+ 	if (ud) {
+ 		LIST_FOREACH(vd, &ud->head, entry) {
+ 			if (!strncmp(ifname, vd->ifname, IFNAMSIZ))
+@@ -1624,7 +1624,7 @@ void vdp_ifup(char *ifname, struct lldp_agent *agent)
+ 
+ 	LIST_INIT(&vd->profile_head);
+ 
+-	ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP02);
++	ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP02);
+ 	LIST_INSERT_HEAD(&ud->head, vd, entry);
+ 
+ out_start_again:
+diff --git a/qbg/vdp22.c b/qbg/vdp22.c
+index cf02310..81ea3a8 100644
+--- a/qbg/vdp22.c
++++ b/qbg/vdp22.c
+@@ -694,7 +694,7 @@ static struct vdp22 *vdp22_findif(const char *ifname,
+ 	struct vdp22 *vdp = 0;
+ 
+ 	if (!ud) {
+-		ud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP22);
++		ud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP22);
+ 		if (!ud)
+ 			LLDPAD_DBG("%s:%s no VDP22 module\n", __func__,
+ 				   ifname);
+@@ -794,7 +794,7 @@ void vdp22_stop(char *ifname)
+ 	struct vsi22 *vsi;
+ 
+ 	LLDPAD_DBG("%s:%s stop vdp\n", __func__, ifname);
+-	vud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP22);
++	vud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP22);
+ 	if (!vud) {
+ 		LLDPAD_ERR("%s:%s no VDP22 module\n", __func__, ifname);
+ 		return;
+@@ -874,7 +874,7 @@ void vdp22_start(const char *ifname, int role)
+ 	struct vsi22 *vsi;
+ 
+ 	LLDPAD_DBG("%s:%s start vdp\n", __func__, ifname);
+-	vud = find_module_user_data_by_id(&lldp_head, LLDP_MOD_VDP22);
++	vud = find_module_user_data_by_id(&lldp_mod_head, LLDP_MOD_VDP22);
+ 	if (!vud) {
+ 		LLDPAD_ERR("%s:%s no VDP22 module\n", __func__, ifname);
+ 		return;
+diff --git a/qbg/vdp22_cmds.c b/qbg/vdp22_cmds.c
+index 2e1bbbd..a8025ee 100644
+--- a/qbg/vdp22_cmds.c
++++ b/qbg/vdp22_cmds.c
+@@ -57,7 +57,7 @@ static struct lldp_module *get_my_module(int thisid)
+ {
+ 	struct lldp_module *np = NULL;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp)
++	LIST_FOREACH(np, &lldp_mod_head, lldp)
+ 		if (thisid == np->id)
+ 			break;
+ 	return np;
+diff --git a/vdptool.c b/vdptool.c
+index 8f36277..f1d946c 100644
+--- a/vdptool.c
++++ b/vdptool.c
+@@ -61,6 +61,8 @@
+ #define OUI_ENCODE_HNDLR(name) name##_oui_encode_hndlr
+ #define OUI_PRNT_DECODE_HNDLR(name) name##_oui_print_decode_hndlr
+ 
++struct lldp_head lldp_mod_head;
++
+ #define EXTERN_OUI_FN(name) \
+ 	extern bool name##_oui_encode_hndlr(char *, char *, size_t); \
+ 	extern void name##_oui_print_decode_hndlr(char *)
+@@ -796,13 +798,13 @@ static void init_modules(void)
+ 	struct lldp_module *premod = NULL;
+ 	int i = 0;
+ 
+-	LIST_INIT(&lldp_head);
++	LIST_INIT(&lldp_mod_head);
+ 	for (i = 0; register_tlv_table[i]; i++) {
+ 		module = register_tlv_table[i]();
+ 		if (premod)
+ 			LIST_INSERT_AFTER(premod, module, lldp);
+ 		else
+-			LIST_INSERT_HEAD(&lldp_head, module, lldp);
++			LIST_INSERT_HEAD(&lldp_mod_head, module, lldp);
+ 		premod = module;
+ 	}
+ }
+@@ -811,9 +813,9 @@ void deinit_modules(void)
+ {
+ 	struct lldp_module *module;
+ 
+-	while (lldp_head.lh_first != NULL) {
+-		module = lldp_head.lh_first;
+-		LIST_REMOVE(lldp_head.lh_first, lldp);
++	while (lldp_mod_head.lh_first != NULL) {
++		module = lldp_mod_head.lh_first;
++		LIST_REMOVE(lldp_mod_head.lh_first, lldp);
+ 		module->ops->lldp_mod_unregister(module);
+ 	}
+ }
+@@ -953,7 +955,7 @@ cli_cmd_help(UNUSED struct clif *clif, UNUSED int argc, UNUSED char *argv[],
+ 	printf("%s\n%s\n%s", commands_usage, commands_options, commands_help);
+ 
+ 	printf("\nTLV identifiers:\n");
+-	LIST_FOREACH(np, &lldp_head, lldp)
++	LIST_FOREACH(np, &lldp_mod_head, lldp)
+ 		if (np->ops->print_help)
+ 			np->ops->print_help();
+ 	return 0;
+@@ -1006,7 +1008,7 @@ u32 lookup_tlvid(char *tlvid_str)
+ 	struct lldp_module *np;
+ 	u32 tlvid = INVALID_TLVID;
+ 
+-	LIST_FOREACH(np, &lldp_head, lldp) {
++	LIST_FOREACH(np, &lldp_mod_head, lldp) {
+ 		if (np->ops->lookup_tlv_name) {
+ 			tlvid = np->ops->lookup_tlv_name(tlvid_str);
+ 			if (tlvid != INVALID_TLVID)
diff --git a/package/open-lldp/0005-lldp-add-packed-struct-definition.patch b/package/open-lldp/0005-lldp-add-packed-struct-definition.patch
new file mode 100644
index 0000000000..56e40fd44f
--- /dev/null
+++ b/package/open-lldp/0005-lldp-add-packed-struct-definition.patch
@@ -0,0 +1,49 @@
+From 702dd20f43d9ca7e0bcb917e8acfec3f1acdcb5c Mon Sep 17 00:00:00 2001
+From: Aaron Conole <aconole@redhat.com>
+Date: Mon, 3 Aug 2020 15:14:50 -0400
+Subject: [PATCH] lldp: add packed struct definition
+
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+[Retrieved from:
+https://github.com/intel/openlldp/pull/55/commits/702dd20f43d9ca7e0bcb917e8acfec3f1acdcb5c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/lldp.h   | 6 ++++++
+ lldp/l2_packet.h | 5 ++---
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/include/lldp.h b/include/lldp.h
+index fb5ee93..de6a4ad 100644
+--- a/include/lldp.h
++++ b/include/lldp.h
+@@ -255,5 +255,11 @@ enum {
+ #define LLDP_EVB_DEFAULT_RTE				15
+ #define LLDP_EVB_DEFAULT_MAX_RTE			31
+ 
++#ifndef _MSC_VER
++#define STRUCT_PACKED(STRUCT) STRUCT __attribute__((__packed__))
++#else
++#define STRUCT_PACKED(STRUCT) __pragma(pack(push, 1)) STRUCT __pragma(pack(pop))
++#endif
++
+ void somethingChangedLocal(const char *ifname, int type);
+ #endif /* _LLDP_H */
+diff --git a/lldp/l2_packet.h b/lldp/l2_packet.h
+index 607b8a3..831958c 100644
+--- a/lldp/l2_packet.h
++++ b/lldp/l2_packet.h
+@@ -58,12 +58,11 @@
+  */
+ struct l2_packet_data;
+ 
+-
+-struct l2_ethhdr {
++STRUCT_PACKED(struct l2_ethhdr {
+ 	u8 h_dest[ETH_ALEN];
+ 	u8 h_source[ETH_ALEN];
+ 	u16 h_proto;
+-} STRUCT_PACKED;
++});
+ 
+ /**
+  * l2_packet_init - Initialize l2_packet interface
diff --git a/package/open-lldp/0006-lldptool-make-extern.patch b/package/open-lldp/0006-lldptool-make-extern.patch
new file mode 100644
index 0000000000..6e1761d966
--- /dev/null
+++ b/package/open-lldp/0006-lldptool-make-extern.patch
@@ -0,0 +1,41 @@
+From 8229f4fb700ba4fcb2ec3e9956491bf5ee8c0ae2 Mon Sep 17 00:00:00 2001
+From: Aaron Conole <aconole@redhat.com>
+Date: Mon, 3 Aug 2020 15:17:31 -0400
+Subject: [PATCH] lldptool: make extern
+
+This should only exist per final linked object.
+
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+[Retrieved from:
+https://github.com/intel/openlldp/pull/55/commits/8229f4fb700ba4fcb2ec3e9956491bf5ee8c0ae2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/lldptool.h | 2 +-
+ lldptool.c         | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/lldptool.h b/include/lldptool.h
+index c919873..a190009 100644
+--- a/include/lldptool.h
++++ b/include/lldptool.h
+@@ -29,7 +29,7 @@
+ 
+ #include "clif.h"
+ 
+-struct lldp_head lldp_cli_head;
++extern struct lldp_head lldp_cli_head;
+ 
+ int clif_command(struct clif *clif, char *cmd, int raw);
+ void print_raw_message(char *msg, int print);
+diff --git a/lldptool.c b/lldptool.c
+index 664a248..d76cc48 100644
+--- a/lldptool.c
++++ b/lldptool.c
+@@ -64,6 +64,7 @@
+ #include "lldp_util.h"
+ #include "lldpad_status.h"
+ 
++struct lldp_head lldp_cli_head;
+ struct lldp_head lldp_mod_head;
+ 
+ static int show_raw;
diff --git a/package/open-lldp/0007-ecp22-make-enum-a-type-rather-than-instance.patch b/package/open-lldp/0007-ecp22-make-enum-a-type-rather-than-instance.patch
new file mode 100644
index 0000000000..9c81e7553b
--- /dev/null
+++ b/package/open-lldp/0007-ecp22-make-enum-a-type-rather-than-instance.patch
@@ -0,0 +1,33 @@
+From 2723219c08726efa08a6bad04ffb775f850a96bc Mon Sep 17 00:00:00 2001
+From: Aaron Conole <aconole@redhat.com>
+Date: Mon, 3 Aug 2020 15:23:28 -0400
+Subject: [PATCH] ecp22: make enum a type rather than instance
+
+The enum defined in the qbg header is setup as a discreet instance
+rather than a type.  Fix this.
+
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+[Retrieved from:
+https://github.com/intel/openlldp/pull/55/commits/2723219c08726efa08a6bad04ffb775f850a96bc]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/qbg_ecp22.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/qbg_ecp22.h b/include/qbg_ecp22.h
+index 567f6df..fe66bb3 100644
+--- a/include/qbg_ecp22.h
++++ b/include/qbg_ecp22.h
+@@ -49,10 +49,10 @@ enum {					/* ECP Transmit states */
+ 	ECP22_TX_ERROR
+ };
+ 
+-enum {
++enum ecp22_mode {
+ 	ECP22_REQUEST = 0,
+ 	ECP22_ACK
+-} ecp22_mode;
++};
+ 
+ struct ecp22_hdr {		/* ECP22 header */
+ 	u16 ver_op_sub;		/* ECP22 version, operation, subtype */
diff --git a/package/open-lldp/0008-lldp_8021qaz-extern-config-object.patch b/package/open-lldp/0008-lldp_8021qaz-extern-config-object.patch
new file mode 100644
index 0000000000..09d0c2674f
--- /dev/null
+++ b/package/open-lldp/0008-lldp_8021qaz-extern-config-object.patch
@@ -0,0 +1,29 @@
+From 275fe9da663193a843de450f03e810daedc06955 Mon Sep 17 00:00:00 2001
+From: Aaron Conole <aconole@redhat.com>
+Date: Mon, 3 Aug 2020 15:25:38 -0400
+Subject: [PATCH] lldp_8021qaz: extern config object
+
+The config object only exists as part of the config translation unit
+so remove the extra config object in the 8021qaz module.
+
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+[Retrieved from:
+https://github.com/intel/openlldp/pull/55/commits/275fe9da663193a843de450f03e810daedc06955]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lldp_8021qaz.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lldp_8021qaz.c b/lldp_8021qaz.c
+index a42fd11..673d758 100644
+--- a/lldp_8021qaz.c
++++ b/lldp_8021qaz.c
+@@ -49,7 +49,7 @@
+ 
+ 
+ struct lldp_head lldp_head;
+-struct config_t lldpad_cfg;
++extern config_t lldpad_cfg;
+ extern bool read_only_8021qaz;
+ 
+ static int ieee8021qaz_check_pending(struct port *port, struct lldp_agent *);
-- 
2.27.0

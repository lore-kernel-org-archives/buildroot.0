From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:28:52 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/rtl8821au: add
 two patches fixing compile/runtime for kernels >= 5.3
Message-ID: <20200715212519.62898819CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d502e572cac17e7437038937a0dc43c08db0aa80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Add two patches from upstream merge request ([1] to fix compile
and runtime failures in case of linux kernel >= 5.3.

[1] https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/316

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de61548933c693afbf246f2ad67c2bed29c41de5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...licit-fallthrough-comments-for-kernel-5.3.patch |  28 ++++
 ...5.3-driver-crashes-from-aircrack-ng-rtl88.patch | 168 +++++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch b/package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
new file mode 100644
index 0000000000..d323e8f938
--- /dev/null
+++ b/package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
@@ -0,0 +1,28 @@
+From f41695e4069404639690d98c7aadfe72117965a6 Mon Sep 17 00:00:00 2001
+From: Jesper Skov <jb1811@jyskebank.dk>
+Date: Fri, 25 Oct 2019 10:05:41 +0200
+Subject: [PATCH] Fix implicit fallthrough comments for kernel 5.3
+
+[Upstram: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/commit/e8a30a4c5a80efbbd5b1dbfe11b22916df4492f9.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ core/rtw_mlme_ext.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/core/rtw_mlme_ext.c b/core/rtw_mlme_ext.c
+index 24565ea..380f507 100644
+--- a/core/rtw_mlme_ext.c
++++ b/core/rtw_mlme_ext.c
+@@ -758,7 +758,9 @@ void mgt_dispatcher(_adapter *padapter, union recv_frame *precv_frame)
+ 		else
+ 			ptable->func = &OnAuthClient;
+ 	//pass through
++	//fallthrough
+ 	case WIFI_ASSOCREQ:
++	//fallthrough
+ 	case WIFI_REASSOCREQ:
+ 		_mgt_dispatcher(padapter, ptable, precv_frame);
+ #ifdef CONFIG_HOSTAPD_MLME
+-- 
+2.26.0
+
diff --git a/package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch b/package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
new file mode 100644
index 0000000000..6b1b70270a
--- /dev/null
+++ b/package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
@@ -0,0 +1,168 @@
+From b7f8f8572d5abca6e1f0163a583628c0207d0be4 Mon Sep 17 00:00:00 2001
+From: Jesper Skov <jb1811@jyskebank.dk>
+Date: Fri, 25 Oct 2019 10:10:29 +0200
+Subject: [PATCH] Fix kernel 5.3 driver crashes, from aircrack-ng/rtl8812au#421
+
+[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/commit/822b485d36d6f72304a219c3be228f40968b542b.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ os_dep/linux/rtw_cfgvendor.c | 45 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/os_dep/linux/rtw_cfgvendor.c b/os_dep/linux/rtw_cfgvendor.c
+index e7ba90a..81fc8af 100644
+--- a/os_dep/linux/rtw_cfgvendor.c
++++ b/os_dep/linux/rtw_cfgvendor.c
+@@ -1173,6 +1173,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = BRCM_VENDOR_SCMD_PRIV_STR
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_priv_string_handler
+ 	},
+ #if defined(GSCAN_SUPPORT) && 0
+@@ -1182,6 +1185,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_GET_CAPABILITIES
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_gscan_get_capabilities
+ 	},
+ 	{
+@@ -1190,6 +1196,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_SET_CONFIG
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_set_scan_cfg
+ 	},
+ 	{
+@@ -1198,6 +1207,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_SET_SCAN_CONFIG
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_set_batch_scan_cfg
+ 	},
+ 	{
+@@ -1206,6 +1218,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_ENABLE_GSCAN
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_initiate_gscan
+ 	},
+ 	{
+@@ -1214,6 +1229,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_ENABLE_FULL_SCAN_RESULTS
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_enable_full_scan_result
+ 	},
+ 	{
+@@ -1222,6 +1240,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_SET_HOTLIST
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_hotlist_cfg
+ 	},
+ 	{
+@@ -1230,6 +1251,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_SET_SIGNIFICANT_CHANGE_CONFIG
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_significant_change_cfg
+ 	},
+ 	{
+@@ -1238,6 +1262,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_GET_SCAN_RESULTS
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_gscan_get_batch_results
+ 	},
+ 	{
+@@ -1246,6 +1273,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = GSCAN_SUBCMD_GET_CHANNEL_LIST
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_gscan_get_channel_list
+ 	},
+ #endif /* GSCAN_SUPPORT */
+@@ -1256,6 +1286,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = RTT_SUBCMD_SET_CONFIG
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_rtt_set_config
+ 	},
+ 	{
+@@ -1264,6 +1297,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = RTT_SUBCMD_CANCEL_CONFIG
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_rtt_cancel_config
+ 	},
+ 	{
+@@ -1272,6 +1308,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = RTT_SUBCMD_GETCAPABILITY
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = wl_cfgvendor_rtt_get_capability
+ 	},
+ #endif /* RTT_SUPPORT */
+@@ -1281,6 +1320,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = ANDR_WIFI_SUBCMD_GET_FEATURE_SET
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = rtw_cfgvendor_get_feature_set
+ 	},
+ 	{
+@@ -1289,6 +1331,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
+ 			.subcmd = ANDR_WIFI_SUBCMD_GET_FEATURE_SET_MATRIX
+ 		},
+ 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
++		.policy = VENDOR_CMD_RAW_DATA,
++#endif
+ 		.doit = rtw_cfgvendor_get_feature_set_matrix
+ 	}
+ };
+-- 
+2.26.0
+

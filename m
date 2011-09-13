From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 13:40:16 -0300
Subject: [Buildroot] [PATCH 6/7] iptables: bump to version 1.4.12.1
In-Reply-To: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
References: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1315932017-20307-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...libxt_TCPMSS.c-unbreak-build-without-ipv6.patch |   72 --------------------
 package/iptables/iptables.mk                       |    2 +-
 2 files changed, 1 insertions(+), 73 deletions(-)
 delete mode 100644 package/iptables/iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch

diff --git a/package/iptables/iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch b/package/iptables/iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch
deleted file mode 100644
index 4d3c88f..0000000
--- a/package/iptables/iptables-1.4.12-libxt_TCPMSS.c-unbreak-build-without-ipv6.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From b5bfbb9fcac3d4c87bcf6da55ed40d63d456017d Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 22 Jul 2011 07:19:09 +0200
-Subject: [PATCH] libxt_TCPMSS.c: unbreak build without ipv6 after ea2a02f7
-
-ea2a02f7 (libxt_TCPMSS: use guided option parser) added an netinet/ip6.h
-include, which is not available on systems without ipv6.
-
-The ip.h / ipv6.h includes are only used to know the size of struct
-iphdr / ip6_hdr, so simply hardcode those instead.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- extensions/libxt_TCPMSS.c |   13 +++++++------
- 1 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/extensions/libxt_TCPMSS.c b/extensions/libxt_TCPMSS.c
-index 2266326..310dd17 100644
---- a/extensions/libxt_TCPMSS.c
-+++ b/extensions/libxt_TCPMSS.c
-@@ -4,8 +4,6 @@
- */
- #include <stdio.h>
- #include <xtables.h>
--#include <netinet/ip.h>
--#include <netinet/ip6.h>
- #include <linux/netfilter/xt_TCPMSS.h>
- 
- enum {
-@@ -13,6 +11,9 @@ enum {
- 	O_CLAMP_MSS,
- };
- 
-+#define IPHDRSIZE	20	/* sizeof(struct iphdr) */
-+#define IP6HDRSIZE	40	/* sizeof(struct ip6_hdr) */
-+
- struct mssinfo {
- 	struct xt_entry_target t;
- 	struct xt_tcpmss_info mss;
-@@ -29,17 +30,17 @@ hdrsize);
- 
- static void TCPMSS_help(void)
- {
--	__TCPMSS_help(sizeof(struct iphdr));
-+	__TCPMSS_help(IPHDRSIZE);
- }
- 
- static void TCPMSS_help6(void)
- {
--	__TCPMSS_help(sizeof(struct ip6_hdr));
-+	__TCPMSS_help(IP6HDRSIZE);
- }
- 
- static const struct xt_option_entry TCPMSS4_opts[] = {
- 	{.name = "set-mss", .id = O_SET_MSS, .type = XTTYPE_UINT16,
--	 .min = 0, .max = UINT16_MAX - sizeof(struct iphdr),
-+	 .min = 0, .max = UINT16_MAX - IPHDRSIZE,
- 	 .flags = XTOPT_PUT, XTOPT_POINTER(struct xt_tcpmss_info, mss)},
- 	{.name = "clamp-mss-to-pmtu", .id = O_CLAMP_MSS, .type = XTTYPE_NONE},
- 	XTOPT_TABLEEND,
-@@ -47,7 +48,7 @@ static const struct xt_option_entry TCPMSS4_opts[] = {
- 
- static const struct xt_option_entry TCPMSS6_opts[] = {
- 	{.name = "set-mss", .id = O_SET_MSS, .type = XTTYPE_UINT16,
--	 .min = 0, .max = UINT16_MAX - sizeof(struct ip6_hdr),
-+	 .min = 0, .max = UINT16_MAX - IP6HDRSIZE,
- 	 .flags = XTOPT_PUT, XTOPT_POINTER(struct xt_tcpmss_info, mss)},
- 	{.name = "clamp-mss-to-pmtu", .id = O_CLAMP_MSS, .type = XTTYPE_NONE},
- 	XTOPT_TABLEEND,
--- 
-1.7.5.4
-
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1ee8828..c6d1a07 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.12
+IPTABLES_VERSION = 1.4.12.1
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.3.4

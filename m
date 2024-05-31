Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022FAC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 16:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6AD3423B6;
	Fri, 31 May 2024 16:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwCfnLUlOOSq; Fri, 31 May 2024 16:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C614240A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C614240A;
	Fri, 31 May 2024 16:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED9AB1D550B
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 16:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E548081298
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 16:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GCPCd7rAZEm for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 16:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08DC81284
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A08DC81284
 for <buildroot@buildroot.org>; Fri, 31 May 2024 16:53:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE1A878D1; Fri, 31 May 2024 16:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 18:52:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f4a7b485a3454d0f3cc42e26d98b12d2025178d9
X-Git-Newrev: 2e18fd6f074b36e5174635cb3a960de79cc4b592
X-Patchwork-Hint: ignore
Message-Id: <20240531165359.5BE1A878D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pppd: bump
 package to fix startup issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0163948596762442161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0163948596762442161==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2e18fd6f074b36e5174635cb3a960de79cc4b592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

pppd fails to start on a systems with buildroot 2024.02.x because of
missing pppd directory in /var/run. There are some logs hinting at this
issue:
Warning: couldn't open ppp database /var/run/pppd/pppd2.tdb
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory
Can't create lock file /var/run/pppd/lock/LCK..ppp-tty-fifo1: No such file or directory

The issue has already been detected and fixed upstream (see [1]) and is
expected to be released on a v2.5.1, but this release seems to be stalled
for now (see [2]). Bump on current master, which currently reflects what
will likely be the 2.5.1.

[1] https://github.com/ppp-project/ppp/issues/419
[2] https://github.com/ppp-project/ppp/issues/460

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c1b04a325447a3eca456856cadbff8f9d90ec362)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re-check-to-see-if-we-have-struct-sockadd.patch | 44 ---------------
 ...11-Fixing-up-parsing-in-radiusclient.conf.patch | 56 ------------------
 ...-429-stray-include-of-an-openssl-header-w.patch | 31 ----------
 ...-sha1.c-use-uint32_t-instead-of-u_int32_t.patch | 64 ---------------------
 ...x-compile-with-older-Linux-kernel-headers.patch | 66 ----------------------
 package/pppd/pppd.hash                             |  2 +-
 package/pppd/pppd.mk                               |  4 +-
 7 files changed, 3 insertions(+), 264 deletions(-)

diff --git a/package/pppd/0001-Add-configure-check-to-see-if-we-have-struct-sockadd.patch b/package/pppd/0001-Add-configure-check-to-see-if-we-have-struct-sockadd.patch
deleted file mode 100644
index 9e41110400..0000000000
--- a/package/pppd/0001-Add-configure-check-to-see-if-we-have-struct-sockadd.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9d6d326b2530cffb1414e4c401675117c42d43ce Mon Sep 17 00:00:00 2001
-From: Eivind Naess <eivnaes@yahoo.com>
-Date: Sun, 23 Apr 2023 11:30:43 -0700
-Subject: [PATCH] Add configure check to see if we have struct sockaddr_ll
-
-Fixes issue #411.
-
-Signed-off-by: Eivind Naess <eivnaes@yahoo.com>
-
-Upstream: https://github.com/ppp-project/ppp/commit/9d6d326b2530cffb1414e4c401675117c42d43ce
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac                   | 3 ++-
- pppd/plugins/pppoe/config.h.in | 2 ++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1180f64..38b24af 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -75,7 +75,8 @@ AM_COND_IF([LINUX], [
-         linux/if_ether.h        \
-         linux/if_packet.h       \
-         netinet/if_ether.h      \
--        netpacket/packet.h])])
-+        netpacket/packet.h])
-+    AC_CHECK_TYPES([struct sockaddr_ll], [], [], [#include <linux/if_packet.h>])])
- 
- AC_CHECK_SIZEOF(unsigned int)
- AC_CHECK_SIZEOF(unsigned long)
-diff --git a/pppd/plugins/pppoe/config.h.in b/pppd/plugins/pppoe/config.h.in
-index d447f5e..d7d61c0 100644
---- a/pppd/plugins/pppoe/config.h.in
-+++ b/pppd/plugins/pppoe/config.h.in
-@@ -69,3 +69,5 @@
- /* The size of `unsigned short', as computed by sizeof. */
- #undef SIZEOF_UNSIGNED_SHORT
- 
-+/* Define to 1 if the system has the type `struct sockaddr_ll'. */
-+#undef HAVE_STRUCT_SOCKADDR_LL
--- 
-2.39.2
-
diff --git a/package/pppd/0002-Closes-411-Fixing-up-parsing-in-radiusclient.conf.patch b/package/pppd/0002-Closes-411-Fixing-up-parsing-in-radiusclient.conf.patch
deleted file mode 100644
index 5fa3ded756..0000000000
--- a/package/pppd/0002-Closes-411-Fixing-up-parsing-in-radiusclient.conf.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7f89208b860ea0c41636410bfdb6a609b2772f47 Mon Sep 17 00:00:00 2001
-From: Eivind Naess <eivnaes@yahoo.com>
-Date: Sun, 23 Apr 2023 11:37:01 -0700
-Subject: [PATCH] Closes #411, Fixing up parsing in radiusclient.conf
-
-Adding curly braces to fix the code.
-
-Signed-off-by: Eivind Naess <eivnaes@yahoo.com>
-
-Upstream: https://github.com/ppp-project/ppp/commit/7f89208b860ea0c41636410bfdb6a609b2772f47
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- pppd/plugins/radius/config.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/pppd/plugins/radius/config.c b/pppd/plugins/radius/config.c
-index 39744fc..e1a4814 100644
---- a/pppd/plugins/radius/config.c
-+++ b/pppd/plugins/radius/config.c
-@@ -235,24 +235,28 @@ int rc_read_config(char *filename)
- 
- 		switch (option->type) {
- 			case OT_STR:
--				 if (set_option_str(filename, line, option, p) < 0)
-+				if (set_option_str(filename, line, option, p) < 0) {
- 					fclose(configfd);
- 					return (-1);
-+				}
- 				break;
- 			case OT_INT:
--				 if (set_option_int(filename, line, option, p) < 0)
-+				if (set_option_int(filename, line, option, p) < 0) {
- 					fclose(configfd);
- 					return (-1);
-+				}
- 				break;
- 			case OT_SRV:
--				 if (set_option_srv(filename, line, option, p) < 0)
-+				if (set_option_srv(filename, line, option, p) < 0) {
- 					fclose(configfd);
- 					return (-1);
-+				}
- 				break;
- 			case OT_AUO:
--				 if (set_option_auo(filename, line, option, p) < 0)
-+				if (set_option_auo(filename, line, option, p) < 0) {
- 					fclose(configfd);
- 					return (-1);
-+				}
- 				break;
- 			default:
- 				fatal("rc_read_config: impossible case branch!");
--- 
-2.39.2
-
diff --git a/package/pppd/0003-Fixes-issue-429-stray-include-of-an-openssl-header-w.patch b/package/pppd/0003-Fixes-issue-429-stray-include-of-an-openssl-header-w.patch
deleted file mode 100644
index b5f9f319f9..0000000000
--- a/package/pppd/0003-Fixes-issue-429-stray-include-of-an-openssl-header-w.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cf7ac82a610bbfee57512cba345f7d49c02563a2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eivind=20N=C3=A6ss?= <eivnaes@yahoo.com>
-Date: Wed, 14 Jun 2023 23:19:46 +0000
-Subject: [PATCH] Fixes issue #429, stray include of an openssl header was
- removed
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Eivind Næss <eivnaes@yahoo.com>
-
-Upstream: https://github.com/ppp-project/ppp/pull/431
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- pppd/crypto_ms.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/pppd/crypto_ms.c b/pppd/crypto_ms.c
-index a9ddd5fda..ccf8129d4 100644
---- a/pppd/crypto_ms.c
-+++ b/pppd/crypto_ms.c
-@@ -122,8 +122,6 @@ MakeKey(const unsigned char *key, unsigned char *des_key)
- 	DES_set_odd_parity((DES_cblock *)des_key);
- }
- 
--#include <openssl/evp.h>
--
- int
- DesEncrypt(const unsigned char *clear, const unsigned char *key, unsigned char *cipher)
- {
diff --git a/package/pppd/0004-pppd-ppp-sha1.c-use-uint32_t-instead-of-u_int32_t.patch b/package/pppd/0004-pppd-ppp-sha1.c-use-uint32_t-instead-of-u_int32_t.patch
deleted file mode 100644
index bce7687b9e..0000000000
--- a/package/pppd/0004-pppd-ppp-sha1.c-use-uint32_t-instead-of-u_int32_t.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7eb0cc63e38a1fcaff24bc3ca146c13414a1420e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 18 Jun 2023 15:53:43 +0200
-Subject: [PATCH] pppd/ppp-sha1.c: use uint32_t instead of u_int32_t
-
-Fixes build with musl-libc toolchains.
-
-Upstream: https://github.com/ppp-project/ppp/pull/432
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- pppd/ppp-sha1.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/pppd/ppp-sha1.c b/pppd/ppp-sha1.c
-index ab4dcd5..9ff3a24 100644
---- a/pppd/ppp-sha1.c
-+++ b/pppd/ppp-sha1.c
-@@ -110,14 +110,14 @@ static void sha1_clean(PPP_MD_CTX *ctx)
- #include <netinet/in.h>	/* htonl() */
- 
- typedef struct {
--    u_int32_t state[5];
--    u_int32_t count[2];
-+    uint32_t state[5];
-+    uint32_t count[2];
-     unsigned char buffer[64];
- } SHA1_CTX;
- 
- 
- static void
--SHA1_Transform(u_int32_t[5], const unsigned char[64]);
-+SHA1_Transform(uint32_t[5], const unsigned char[64]);
- 
- #define rol(value, bits) (((value) << (bits)) | ((value) >> (32 - (bits))))
- 
-@@ -138,12 +138,12 @@ SHA1_Transform(u_int32_t[5], const unsigned char[64]);
- /* Hash a single 512-bit block. This is the core of the algorithm. */
- 
- static void
--SHA1_Transform(u_int32_t state[5], const unsigned char buffer[64])
-+SHA1_Transform(uint32_t state[5], const unsigned char buffer[64])
- {
--    u_int32_t a, b, c, d, e;
-+    uint32_t a, b, c, d, e;
-     typedef union {
- 	unsigned char c[64];
--	u_int32_t l[16];
-+	uint32_t l[16];
-     } CHAR64LONG16;
-     CHAR64LONG16 *block;
- 
-@@ -236,7 +236,7 @@ SHA1_Update(SHA1_CTX *context, const unsigned char *data, unsigned int len)
- static void
- SHA1_Final(unsigned char digest[20], SHA1_CTX *context)
- {
--    u_int32_t i, j;
-+    uint32_t i, j;
-     unsigned char finalcount[8];
- 
-     for (i = 0; i < 8; i++) {
--- 
-2.39.2
-
diff --git a/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch b/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch
deleted file mode 100644
index 46c293103a..0000000000
--- a/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 7a3f478a4b7128d4f70ea64d99fedec766b1c009 Mon Sep 17 00:00:00 2001
-From: Jaco Kroon <jaco@uls.co.za>
-Date: Tue, 31 Oct 2023 11:47:21 +0200
-Subject: [PATCH] pppd/sys-linux: Fix compile with older Linux kernel headers
- (#452)
-
-When compiling pppd against kernel headers which don't provide
-the definitions for the NETLINK mechanisms, leave out the code
-which uses NETLINK, so as to avoid getting compile errors.
-
-Upstream commit in Linux refers.
-
-commit 10c9ead9f3c6bb24bddc9a96681f7d58e6623966
-Author: Roopa Prabhu <roopa@cumulusnetworks.com>
-Date:   Wed Apr 20 08:43:43 2016 -0700
-rtnetlink: add new RTM_GETSTATS message to dump link stats
-
-This commit adds the #defines and structs used, so simply not compiling
-this code if the required #defines isn't there should solve the problem.
-
-Closes: #450
-
-Signed-off-by: Jaco Kroon <jaco@uls.co.za>
-Upstream: https://github.com/ppp-project/ppp/commit/7a3f478a4b7128d4f70ea64d99fedec766b1c009
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pppd/sys-linux.c | 12 ++----------
- 1 file changed, 2 insertions(+), 10 deletions(-)
-
-diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
-index 561b150f2..a8d6cd95b 100644
---- a/pppd/sys-linux.c
-+++ b/pppd/sys-linux.c
-@@ -131,16 +131,6 @@
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
- #include <linux/if_link.h>
--
--/* Attempt at retaining compile-support with older than 4.7 kernels, or kernels
-- * where RTM_NEWSTATS isn't defined for whatever reason.
-- */
--#ifndef RTM_NEWSTATS
--#define RTM_NEWSTATS 92
--#define RTM_GETSTATS 94
--#define IFLA_STATS_LINK_64 1
--#endif
--
- #include <linux/if_addr.h>
- 
- /* glibc versions prior to 2.24 do not define SOL_NETLINK */
-@@ -1776,6 +1766,7 @@ get_ppp_stats_ioctl(int u, struct pppd_stats *stats)
- static int
- get_ppp_stats_rtnetlink(int u, struct pppd_stats *stats)
- {
-+#ifdef RTM_NEWSTATS
-     static int fd = -1;
- 
-     struct {
-@@ -1825,6 +1816,7 @@ get_ppp_stats_rtnetlink(int u, struct pppd_stats *stats)
- err:
-     close(fd);
-     fd = -1;
-+#endif
-     return 0;
- }
- 
diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index 9a293e7d8d..bf22650884 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  425a5b2df592f4b79e251e5b0d3af48265904162cb0906691a5d35ec355b426d  pppd-2.5.0.tar.gz
+sha256  535efa0e7c36e9d443b1b52c296d63ab2c1ec9458816ea0e37c701e0a921466d  pppd-e1266c76d1ad39f98f11676e34f180f78c5a510c.tar.gz
 sha256  5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008  LICENSE.BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0a1eaf9209..d996a39120 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -6,8 +6,8 @@
 
 # The tarball provided at https://download.samba.org/pub/ppp/ does not
 # include the license files yet so we use the github tarball.
-PPPD_VERSION = 2.5.0
-PPPD_SITE = $(call github,ppp-project,ppp,ppp-$(PPPD_VERSION))
+PPPD_VERSION = e1266c76d1ad39f98f11676e34f180f78c5a510c
+PPPD_SITE = $(call github,ppp-project,ppp,$(PPPD_VERSION))
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = LICENSE.BSD LICENSE.GPL-2
 PPPD_CPE_ID_VENDOR = point-to-point_protocol_project

--===============0163948596762442161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0163948596762442161==--

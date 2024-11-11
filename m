Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC05ED3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 453BE80E2F;
	Mon, 11 Nov 2024 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faO5nwCbDSms; Mon, 11 Nov 2024 20:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1324F80E19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1324F80E19;
	Mon, 11 Nov 2024 20:27:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81961E0D
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70CC380E19
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnWPTDjEAaTP for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C10780DB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C10780DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73BAF8611A; Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 21:25:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d358fe180d98f581c6cdb79340b2e06e553eecb
X-Git-Newrev: 5456830db9d1e897b38195eb8e2933f4478d71d4
X-Patchwork-Hint: ignore
Message-Id: <20241111202736.73BAF8611A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: bump to version 2.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5456830db9d1e897b38195eb8e2933f4478d71d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see after the file list at:
https://sourceforge.net/projects/iperf2/files/

This commit also adds a package patch to fix the build with musl
libc toolchains.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-checksums.c-needs-to-define-_GNU_SOURCE.patch | 53 ++++++++++++++++++++++
 package/iperf/iperf.hash                           |  6 +--
 package/iperf/iperf.mk                             |  2 +-
 3 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch b/package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..5233be0f7c
--- /dev/null
+++ b/package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch
@@ -0,0 +1,53 @@
+From 3ac9376c2bc67433b9cd21e7d7650c1c7e939bcc Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 11 Nov 2024 11:41:28 +0100
+Subject: [PATCH] checksums.c needs to define _GNU_SOURCE
+
+When compiling with musl libc [1], iperf2 fail to build with error:
+
+    checksums.c: In function 'udpchecksum':
+    checksums.c:175:17: error: 'const struct udphdr' has no member named 'check'
+      175 |     if (!udp_hdr->check) {
+          |                 ^~
+
+This failure was introduced in commit [2], in version 2.2.1. This is
+due to the switch from using <linux/udp.h> (which always define "struct
+udphdr" members), to <netinet/udp.h> which define members in musl libc
+only when _GNU_SOURCE is defined. See [3].
+
+Note: those use of udphdr members in checksums.c were introduced in
+commit [4], in version 2.1.1.
+
+This commit fixes the issue by defining _GNU_SOURCE in checksums.c.
+
+This issue was found in the iperf integration in Buildroot Linux [5].
+
+[1] https://www.musl-libc.org/
+[2] https://sourceforge.net/p/iperf2/code/ci/2a5fe6ffd4519ef3c6fc95704096646f897bd124/
+[3] https://git.musl-libc.org/cgit/musl/tree/include/netinet/udp.h?h=v1.2.5#n11
+[4] https://sourceforge.net/p/iperf2/code/ci/2ba97baecb4930e373ee5f51fc84115246e85096/
+[5] https://buildroot.org/
+
+Upstream: https://sourceforge.net/p/iperf2/tickets/342/
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/checksums.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/checksums.c b/src/checksums.c
+index 852f1952..d7a8109e 100644
+--- a/src/checksums.c
++++ b/src/checksums.c
+@@ -47,6 +47,9 @@
+  * by Robert J. McMahon (rjmcmahon@rjmcmahon.com, bob.mcmahon@broadcom.com)
+  * -------------------------------------------------------------------
+  */
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
+ #include "headers.h"
+ 
+ /*
+-- 
+2.47.0
+
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index e4d40d5940..626f23f387 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/iperf2/files/
-md5  34bb6ac1abeb801bf3f729794dc5ac36  iperf-2.2.0.tar.gz
-sha1  bcbd101ab36f3faacaab1a765a96806ca49a1495  iperf-2.2.0.tar.gz
+md5  dc7ef2413a09b619e52cad199ad038ba  iperf-2.2.1.tar.gz
+sha1  9b30b1f3140d4f714555fee5ed21aa2bf4046aee  iperf-2.2.1.tar.gz
 
 # Locally computed:
-sha256  16810a9575e4c6dd65e4a18ab5df3cdac6730b3c832cf080a8990f132f68364a  iperf-2.2.0.tar.gz
+sha256  754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb  iperf-2.2.1.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 303614668a..62ed9d6e5f 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.2.0
+IPERF_VERSION = 2.2.1
 IPERF_SITE = https://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

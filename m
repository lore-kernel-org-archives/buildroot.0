Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0127CC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95C780BF7;
	Sun, 28 Jul 2024 10:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPqaDdWLAV9k; Sun, 28 Jul 2024 10:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0804580F00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0804580F00;
	Sun, 28 Jul 2024 10:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96D5D1BF94D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 830AC80C4B
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27-ivE6EC7Pu for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAAC080B7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAAC080B7C
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A510F87544; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:10:43 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: fc0499a23c8fcf0d48d50602b7c41a6b6d63d8f4
X-Git-Newrev: 3918d46a260f4731aeb99fe0fa6a4008cf3426aa
X-Patchwork-Hint: ignore
Message-Id: <20240728102559.A510F87544@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/tftpd: bump to
 latest git commit
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
Content-Type: multipart/mixed; boundary="===============3837693510379436713=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3837693510379436713==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3918d46a260f4731aeb99fe0fa6a4008cf3426aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes the following error when compiled against GCC 14.x:

tftp.c: In function ‘tftp_sendfile’:
tftp.c:88:5: error: implicit declaration of function ‘bsd_signal’; did
you mean ‘ssignal’? [-Wimplicit-function-declaration]
   88 |     bsd_signal(SIGALRM, timer);
      |     ^~~~~~~~~~
      |     ssignal
tftp.c:88:5: warning: nested extern declaration of ‘bsd_signal’ [-Wnested-externs]
main.c: In function ‘main’:
main.c:308:5: error: implicit declaration of function ‘bsd_signal’;
did you mean ‘ssignal’? [-Wimplicit-function-declaration]
  308 |     bsd_signal(SIGINT, intr);
      |     ^~~~~~~~~~
      |     ssignal
main.c:308:5: warning: nested extern declaration of ‘bsd_signal’ [-Wnested-externs]

Remove an upstreamed patch.

tftpd/tftpd.c has changed, hence, change its checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...se-extern-qualifier-to-fix-gcc-10.x-build.patch | 29 ----------------------
 package/tftpd/tftpd.hash                           |  4 +--
 package/tftpd/tftpd.mk                             |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a755319824..1006b7cfe8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1458,7 +1458,6 @@ package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch lib_patch.Up
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch lib_patch.Upstream
 package/tcf-agent/S55tcf-agent Shellcheck lib_sysv.Variables
 package/tcl/0001-Disable-tcl-compatibility-layers.patch lib_patch.Upstream
-package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch lib_patch.Upstream
 package/tftpd/S80tftpd-hpa Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/ti-gfx/0001-newclkapi.patch lib_patch.Upstream
 package/ti-gfx/0002-fix-build-omaplfb-linux.patch lib_patch.Upstream
diff --git a/package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch b/package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch
deleted file mode 100644
index c964555347..0000000000
--- a/package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6f994166d8571961a08479736ae86c5baa2bb47f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 7 Aug 2020 12:07:45 +0200
-Subject: [PATCH] Use "extern" qualifier to fix gcc 10.x build
-
-Patch from
-https://src.fedoraproject.org/rpms/tftp/raw/master/f/tftp-hpa-5.2-gcc10.patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tftp/tftp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tftp/tftp.c b/tftp/tftp.c
-index d15da22..d067f96 100644
---- a/tftp/tftp.c
-+++ b/tftp/tftp.c
-@@ -48,7 +48,7 @@ extern int maxtimeout;
- #define PKTSIZE    SEGSIZE+4
- char ackbuf[PKTSIZE];
- int timeout;
--sigjmp_buf toplevel;
-+extern sigjmp_buf toplevel;
- sigjmp_buf timeoutbuf;
- 
- static void nak(int, const char *);
--- 
-2.26.2
-
diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index 66e6b0d26c..3fab9dba07 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0eb23ceca54eac3648ca4254a4664241483ddc6bef36958e1cf23bc994d15863  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-git4.tar.gz
+sha256  9bdb3e2ab2b68e4d8cd057d102395c362baf07c7b052f1d5e40e5190afecc15e  tftpd-e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0-git4.tar.gz
 
 # Hash for license file
-sha256  67754ebd8f265571d3226ac97e521b1bd6fd8a61363ecd4ab7806a6f90efab92  tftpd/tftpd.c
+sha256  5936d0764cb6e8f2f5ce8a11c249d81037b5f275f5983e8538ee4fbe57195369  tftpd/tftpd.c
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index ceac24119e..81b67f82ce 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TFTPD_VERSION = b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7
+TFTPD_VERSION = e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0
 TFTPD_SITE = https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
 TFTPD_SITE_METHOD = git
 TFTPD_CONF_OPTS = --without-tcpwrappers

--===============3837693510379436713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3837693510379436713==--

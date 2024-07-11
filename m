Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4002C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C65E4043E;
	Thu, 11 Jul 2024 22:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWVEquDKUgOZ; Thu, 11 Jul 2024 22:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D911241115
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D911241115;
	Thu, 11 Jul 2024 22:11:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9622B1BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F46F40964
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1h2e7AEt0iRH for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F38740929
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F38740929
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:11:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 484BA852D1; Thu, 11 Jul 2024 22:11:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 23:58:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0263c9be2cd811ffc29a6116502af966101849e4
X-Git-Newrev: ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb
X-Patchwork-Hint: ignore
Message-Id: <20240711221147.484BA852D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tftpd: bump to latest git commit
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5494768000996669497=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5494768000996669497==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 .checkpackageignore                                |  1 -
 ...se-extern-qualifier-to-fix-gcc-10.x-build.patch | 29 ----------------------
 package/tftpd/tftpd.hash                           |  4 +--
 package/tftpd/tftpd.mk                             |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9a46840422..4d4fbd340f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1368,7 +1368,6 @@ package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch lib_p
 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch lib_patch.Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch lib_patch.Upstream
 package/tcf-agent/S55tcf-agent Shellcheck lib_sysv.Variables
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

--===============5494768000996669497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5494768000996669497==--

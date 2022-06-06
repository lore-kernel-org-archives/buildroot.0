Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B80CC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF037416E2;
	Mon,  6 Jun 2022 12:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXSG9spRZSod; Mon,  6 Jun 2022 12:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BB0416D8;
	Mon,  6 Jun 2022 12:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88EA81BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E49416D2
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNzppdG2toxw for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:46:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D71416D1
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:46:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 128C886D45; Mon,  6 Jun 2022 12:35:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:29:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 638341dbbebba0b47403e1f3508c3f6f8802737f
X-Git-Newrev: b79cefcb007d8d3279208f27d46426262f105c04
X-Patchwork-Hint: ignore
Message-Id: <20220606123505.128C886D45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: fix pam build with musl
 and libressl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b79cefcb007d8d3279208f27d46426262f105c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised with pam and libressl:

auth-pam.c: In function 'pam_server':
auth-pam.c:894:23: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
  894 |     char ac_file_name[PATH_MAX];
      |                       ^~~~~~~~
      |                       AF_MAX
auth-pam.c:894:23: note: each undeclared identifier is reported only once for each function it appears in
auth-pam.c:894:10: warning: unused variable 'ac_file_name' [-Wunused-variable]
  894 |     char ac_file_name[PATH_MAX];
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c8834fa5ddcac6fd22fc9406e10221e64cdb8856

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...1-auth-pam-c-add-missing-include-limits-h.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
new file mode 100644
index 0000000000..34a6dbd034
--- /dev/null
+++ b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
@@ -0,0 +1,41 @@
+From 0fed64a91d894b46105bf7e8b16edea4d90ab70c Mon Sep 17 00:00:00 2001
+From: Antonio Quartulli <a@unstable.cc>
+Date: Thu, 21 Apr 2022 15:19:09 +0200
+Subject: [PATCH] auth-pam.c: add missing include limits.h
+
+On most systems limits.h is pulled in by some other header and thus no
+error is ever triggered, but it's possible to find the right environment
+which lackis this and prevents compiling auth-pam.c (possibly when using
+LibreSSL).
+
+Include the header explicitly as it includes the definition of PATH_MAX.
+
+(note that this bug is fixed in Gentoo since 2020 by including a custom
+patch, but apparently the issue was never reported upstream)
+
+Reported-by: Michelangelo Scopelliti <kernelpanic@gmx.com>
+Signed-off-by: Antonio Quartulli <a@unstable.cc>
+Acked-by: Gert Doering <gert@greenie.muc.de>
+Message-Id: <20220421131909.32053-1-a@unstable.cc>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg24136.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+
+[Retrieved from:
+https://github.com/OpenVPN/openvpn/commit/0fed64a91d894b46105bf7e8b16edea4d90ab70c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/plugins/auth-pam/auth-pam.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/auth-pam/auth-pam.c b/src/plugins/auth-pam/auth-pam.c
+index f893b51fe3..7033944568 100644
+--- a/src/plugins/auth-pam/auth-pam.c
++++ b/src/plugins/auth-pam/auth-pam.c
+@@ -47,6 +47,7 @@
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <syslog.h>
++#include <limits.h>
+ #include "utils.h"
+ 
+ #include <openvpn-plugin.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

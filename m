Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69FDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:08:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E991260F9C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E991260F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C6E40255;
	Sat,  9 Oct 2021 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G33tqZN96jdR; Sat,  9 Oct 2021 20:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83A0C40018;
	Sat,  9 Oct 2021 20:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8ED91BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B4040018
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmxvjlFMIpxL for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:08:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD30540012
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:08:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 53D8F94C05; Sat,  9 Oct 2021 20:05:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 22:07:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96db7735f7ade4ee68ee73157500b4b8b739f53d
X-Git-Newrev: 4a49697761b8270866e7a9ff99aa0d921cbf153a
X-Patchwork-Hint: ignore
Message-Id: <20211009200527.53D8F94C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltrace: fix autoreconf with
 autoconf >= 2.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a49697761b8270866e7a9ff99aa0d921cbf153a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

autoreconf: error: cannot create config/autoconf: No such file or
directory

Indeed, the config/autoconf directory does not exist, and therefore
the AC_CONFIG_AUX_DIR invocation serves no purpose.

Fixes:
 - http://autobuild.buildroot.org/results/433599039d6e1ee301465f9867e169c121a0646f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...gure.ac-fix-autoreconf-with-autoconf-2.70.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..efe993ec88
--- /dev/null
+++ b/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
@@ -0,0 +1,35 @@
+From b8d5d086489ff20339e221323a60c140a9820e67 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 09:39:52 +0200
+Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
+
+Drop AC_CONFIG_AUX_DIR to avoid the following build failure with
+autoconf >= 2.70:
+
+autoreconf: error: cannot create config/autoconf: No such file or directory
+
+Fixes:
+ - http://autobuild.buildroot.org/results/433599039d6e1ee301465f9867e169c121a0646f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent as upstream is unmaintained:
+https://gitlab.com/cespedes/ltrace/-/issues/8]
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b9c39fa..486589b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,6 @@ AC_INIT([ltrace],[0.7.91],[ltrace-devel@lists.alioth.debian.org],
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_SRCDIR(libltrace.c)
+ AC_CONFIG_MACRO_DIR([config/m4])
+-AC_CONFIG_AUX_DIR([config/autoconf])
+ AC_CANONICAL_BUILD
+ AC_CANONICAL_HOST
+ 
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

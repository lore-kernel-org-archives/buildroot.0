Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145B1C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D983261040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D983261040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D2D83366;
	Tue,  3 Aug 2021 21:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ac7PITIgQsas; Tue,  3 Aug 2021 21:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D0A82F32;
	Tue,  3 Aug 2021 21:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7CD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D8B4048C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xA7DEq-mknr for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18EAB40435
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 70DA685E09; Tue,  3 Aug 2021 21:09:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 08:30:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9c108afab81b675eddc1f71cc496b47d9077bdb1
X-Git-Newrev: 7320e5dd6269149869b542aa9d0db62bae31709b
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.70DA685E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxslt: fix build
 with latest libxml2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7320e5dd6269149869b542aa9d0db62bae31709b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build is broken since bump of libxml2 to version 2.9.11 in commit
a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04 because libxslt calls the
following command "${XML_CONFIG} --libs print" which will return an
error code since
https://github.com/GNOME/libxml2/commit/2a357ab99e6f5c9196384b11cd91dd993f93014c

Fixes:
 - http://autobuild.buildroot.org/results/47ceb8c24c9ead8a450b7fea3266f760d6b77b4f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-xml2-config-check-in-configure-script.patch | 31 ++++++++++++++++++++++
 package/libxslt/libxslt.mk                         |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
new file mode 100644
index 0000000000..3848dcb235
--- /dev/null
+++ b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
@@ -0,0 +1,31 @@
+From 90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 15 Nov 2019 11:53:11 +0100
+Subject: [PATCH] Fix xml2-config check in configure script
+
+A 'print' option has never been supported. After a recent change to
+libxml2, invalid options cause xml2-config to fail.
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/libxslt/-/commit/90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3da57b18..585b9d7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -548,7 +548,7 @@ dnl make sure xml2-config is executable,
+ dnl test version and init our variables
+ dnl
+ 
+-if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs print > /dev/null 2>&1
++if test "x$LIBXML_LIBS" = "x" && ${XML_CONFIG} --libs > /dev/null 2>&1
+ then
+     AC_MSG_CHECKING(for libxml libraries >= $LIBXML_REQUIRED_VERSION)
+     XMLVERS=`$XML_CONFIG --version`
+-- 
+GitLab
+
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 3c603ad9f6..d0f79d2521 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -10,6 +10,8 @@ LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
 LIBXSLT_CPE_ID_VENDOR = xmlsoft
+# We're patching configure.ac
+LIBXSLT_AUTORECONF = YES
 
 LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

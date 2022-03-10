Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11BCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C12847A2;
	Thu, 10 Mar 2022 21:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7Qodw2OO_N2; Thu, 10 Mar 2022 21:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E6684792;
	Thu, 10 Mar 2022 21:50:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A26A1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0766F84792
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLPwM405rk-5 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:50:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04BE68434F
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 61D6B83C48; Thu, 10 Mar 2022 21:42:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:49:21 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3d357990204241bc832a8543ad1007a5789d8f62
X-Git-Newrev: 9884d674d1788124194e0dc8757830ad832af320
X-Patchwork-Hint: ignore
Message-Id: <20220310214214.61D6B83C48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gdk-pixbuf: fix
 run with per-package directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=9884d674d1788124194e0dc8757830ad832af320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

gdk-pixbuf is based on plugins (modules in gdk-pixbuf parlance) that are
provided either by the gdk-pixbuf package itself, or be installed by
third-party packages, like librsvg. At runtime, those plugins get loaded
by helper function in the gdk-pixbuf library.

The location where to find those modules is currently hard-coded at
build time, to the location where gdb-pixbuf is installed.. This means
that host-packages that install image-conversion utilities will try to
look in the path where gdk-pixbuf was installed.

With per-package directories, this fails to find any module that was
installed bu a third-party package. For example, the module for loading
an SVG provided by librsvg, so it is not present in the PPD of
gdk-pixbuf, and thus loading an SVG (e.g. to convert it to another
format, like adwaita-icon-theme does) will fail with:

    Can't load file: Unrecognized image file format

However, gdk-pixbuf can be configured so as to look for the modules
relative to where the program is run from, rather than hard-coding the
location at build time. This is exactly what we need in the PPD case

Additionally, even without PPD, this would fail in a similar manner in
the SDK, as that can be relocated too.

So we unconditionally enable the relocatable option, but only for the
host variant (there is no reason to enable it for the target, as it is
not going to be relocated).

Fixes:
 - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: reword the already-good commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 75361a9aba042799040591fb84192802b137fc3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index cd30d450d5..b22e9568c9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -26,6 +26,7 @@ HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
 	-Dinstalled_tests=false \
 	-Dintrospection=disabled \
+	-Drelocatable=true \
 	-Dman=false
 
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

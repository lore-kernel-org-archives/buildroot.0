Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246BECA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC52980EB8;
	Thu, 14 Aug 2025 20:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVG7WLMg6BHl; Thu, 14 Aug 2025 20:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1774080EC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1774080EC8;
	Thu, 14 Aug 2025 20:06:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62EF4228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1B5404AF
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mENugsG9d94 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A232404CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A232404CE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5819787609; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:59 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 465c75af76b51636d09751f4faae939ef4488fe8
X-Git-Newrev: 5cada211a9054c47f49ddc75ce124f0accd6ff13
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.5819787609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ghostscript: fix
 xlib dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cada211a9054c47f49ddc75ce124f0accd6ff13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since the package bump to v10.05.0 the xlib libraries detection has been
improved to error missing x libraries (see [2]).

The following error is happening on the autobuilder when building
ghostscript with xlib_libX11:

```
checking for XOpenDisplay in -lX11... yes
checking for XdbeQueryExtension in -lXext... yes
checking for XtAppCreateShell in -lXt... no
configure: error: X11 libraries (libX11, libXt, libXext) not available, either install them, or rerun configure with "--without-x"
make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/ghostscript-10.05.1/.stamp_configured] Error 1
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XLIB_LIBX11=y
BR2_PACKAGE_GHOSTSCRIPT=y
EOF
make olddefconfig
make
```

This patch fixes the xlib dependencies of the ghostscript package to
correctly build with X support:

- The 'XtAppCreateShell' function is provided by the package
  'xlib_libXt'.
- The 'XdbeQueryExtension' function is provided by the package
  'xlib_libXext'.

They both select the 'xlib_libX11' package.

[1] 9abf662cfd package/ghostscript: security bump to version 10.05.0
[2] https://github.com/ArtifexSoftware/ghostpdl/commit/37eede31e12814fae69744e7842a5640004e5a65

Fixes: https://autobuild.buildroot.org/results/45d/45d0414f341feb2354478b145396fe137f9cc6a6
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 9adc8a05707f743c659cc6fb25d0a213498d0868)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ghostscript/ghostscript.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 0ddcb950ff..c9d13f5545 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -85,8 +85,8 @@ else
 GHOSTSCRIPT_CONF_OPTS += --disable-cups
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_XLIB_LIBXT)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
+GHOSTSCRIPT_DEPENDENCIES += xlib_libXt xlib_libXext
 GHOSTSCRIPT_CONF_OPTS += --with-x
 else
 GHOSTSCRIPT_CONF_OPTS += --without-x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF7C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFC840A88;
	Sun, 10 Aug 2025 17:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIj6WMpk1Zmn; Sun, 10 Aug 2025 17:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A118240E24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A118240E24;
	Sun, 10 Aug 2025 17:35:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72DAD138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 645614089E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffboB6LmoYq4 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 17:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD60C40896
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD60C40896
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:35:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A452887141; Sun, 10 Aug 2025 17:35:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 19:33:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b10b7346c9d96ac7a3eb98f3f3c83472f63ff55c
X-Git-Newrev: 9adc8a05707f743c659cc6fb25d0a213498d0868
X-Patchwork-Hint: ignore
Message-Id: <20250810173515.A452887141@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: fix xlib dependency
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9adc8a05707f743c659cc6fb25d0a213498d0868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

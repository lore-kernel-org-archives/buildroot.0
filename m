Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB364C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB1980F6E;
	Fri, 28 Aug 2026 14:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQAasVNxwLYo; Fri, 28 Aug 2026 14:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927145;
	bh=m3cpuY/kz0n/8G2D+cxA+0LXrB15nHRLcm5GPCo2QDE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hgEwP73f+xXraITsNeD7ZW7U9BI/ZuKZIlvWiSRZhLQ6wRx8YBAX2tQRhrJd7hlDJ
	 s54cp7T121s3w8SwoFOEeu93gOyy8ftGJN/BGr9Hn8VdFNjtSCRLtKIRWnYM7/18yp
	 MOtcm8zHSOByWvIFwlCvJqCNCtgcJ7aLu/GXVTzD6l1YY/mzBNfNBN4FX0mAqE+qvi
	 HRyLG1RNWBoMK1NYT06yBj8444JNXUxPZYtNQIDnAXLHpUKPDxQhEaM1g8KhY2iwsU
	 7g5PD2l78vBGAxB0vavV8k69vUetfF4HYlvdu9yD+v865SAwGwjVJFe3uJoKSqmSPV
	 2kNvsdHCTnNrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F42C80F85;
	Fri, 28 Aug 2026 14:25:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B84E386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 810C160831
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-RuShVSVTUE for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C866D6078A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B0D921FA; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 7fee4818cddcc8df32b30610abfcab59c92c1d62
X-Git-Newrev: 92c3e21893ae9de832f7aa629f4ea863bc4b854e
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.C6B0D921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libxkbcommon:
 build libxkbregistry when libxml2 is available
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92c3e21893ae9de832f7aa629f4ea863bc4b854e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

libxkbregistry is the keyboard layout catalogue half of the library. It
parses the XML layout registry and so needs libxml2, which is presumably
why it was disabled unconditionally rather than wired to a dependency.

wine needs it. Its configure.ac requires XKBREGISTRY_LIBS alongside
wayland-client, wayland-scanner, xkbcommon and linux/input.h before it
will build the Wayland driver, and wine.mk passes --with-wayland for any
build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard
error:

  checking for wayland-client.h... yes
  checking for wl_display_connect in -lwayland-client... yes
  checking for wayland-scanner... .../host/bin/wayland-scanner
  checking for xkb_context_new in -lxkbcommon... yes
  checking for wayland-egl.h... yes
  checking for wl_egl_window_create in -lwayland-egl... yes
  configure: error: Wayland development files not found, the Wayland
    driver won't be supported.
  This is an error since --with-wayland was requested.

Every other term of that test passes; only XKBREGISTRY_LIBS is empty, so
wine and wayland together could not be built on any architecture.

Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because
meson.build takes dependency('libxml-2.0') unconditionally once
enable-xkbregistry is set, so a target without libxml2 would fail to
configure.

Regarding since when this is broken, three pieces had to come together:

 - libxkbcommon has passed -Denable-xkbregistry=false since commit
   1791bc30a5 ("package/libxkbcommon: bump version to 1.0.1", Sep 2020),
   i.e. Buildroot 2020.11. libxkbregistry has therefore never been built
   in Buildroot.

 - wine's configure gained the XKBREGISTRY_LIBS term in its Wayland
   test in wine 9.0, with upstream commit d64ea8e4a6c9
   ("winewayland.drv: Enumerate Xkb layouts and create matching HKL.",
   Nov 2023).

 - wine.mk started passing --with-wayland in commit 7cb49e7712
   ("package/wine: bump to version 9.19", Oct 2024), which is what turns
   the missing XKBREGISTRY_LIBS from a notice into a hard error.

The breakage therefore dates from Buildroot 2024.11, and every branch
since is affected, including the LTS one: 2025.02.x carries wine 10.0,
whose configure has the XKBREGISTRY_LIBS check, together with
libxkbcommon 1.9.2 built with -Denable-xkbregistry=false, and its wine.mk
passes --with-wayland. 2025.05.x and 2025.08.x are in the same state.
A backport to 2025.02.x is thus needed.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4349b22b918b61cc8271167750c8ed53a7747a79)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libxkbcommon/libxkbcommon.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 21a2b937ef..406affe401 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -12,8 +12,14 @@ LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
-	-Denable-docs=false \
-	-Denable-xkbregistry=false
+	-Denable-docs=false
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-xkbregistry=true
+LIBXKBCOMMON_DEPENDENCIES += libxml2
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-xkbregistry=false
+endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

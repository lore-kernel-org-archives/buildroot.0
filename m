Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9C0FF6E8D
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5204980D16;
	Tue, 17 Mar 2026 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2taGM-2SyGd; Tue, 17 Mar 2026 22:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 551A883D42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785054;
	bh=PyGXbSEAqHL3xjD81WBbTYhPmXb+SRYpAAhP4lpCxIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AK3CIrT060x1ipuw2Fn0CO4FKjk/ycQvJUnED+acKF6x1hg6jmOwWJfPpeIQHPl1Z
	 FZ6nKwbS5wikaevrsi2/whRi3kwM+n88QwFeXyYG7hcAIwHlBLVY0NCsN4zQb7e09r
	 M+XwYfDtoHLALhVf0/iN0b7WC1MC3SAToS6SI8EYWu95yq+SOZ5exCiINokziMCy9T
	 qCg1DQ4r6DW+AIcgLmDWeTs/mEaZZNijYR6LYbjH5DXhdogYrZGdIlUD/6baFyobPK
	 3NYt6+JOrbCi0W0Nv1D98Uj8PiK64mFqr/3+9Qyo+m3Mu0vx2VRkWYDvvLsDPDyA3F
	 gAgfB3SSEVs/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 551A883D42;
	Tue, 17 Mar 2026 22:04:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD01A1B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB7140176
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTbBTOaCGgYH for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FDF40071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FDF40071
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:04:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E79F8472B; Tue, 17 Mar 2026 22:04:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 22:51:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 026074163934a5d563449cacf1d3d6768f8b5caa
X-Git-Newrev: c89743874276426f6542f5b98cae5e3ee4564749
X-Patchwork-Hint: ignore
Message-Id: <20260317220411.2E79F8472B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: fix
 EGL_NOT_INITIALIZED crash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c89743874276426f6542f5b98cae5e3ee4564749
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 4cd4b2e1e6e8816555db38771d18daad46df3a6c updated mesa3d
past version 25.2.0 which deprecated the legacy wayland
EGL_WL_bind_wayland_display interface, as wpebackend-fdo
currently still relies on this functionality ensure that we
enable EGL_WL_bind_wayland_display in mesa3d.

Fixes:
 - https://lore.kernel.org/all/CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/wpebackend-fdo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 9b4dd28741..bd0ab5421e 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBWPE
 	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY if BR2_PACKAGE_MESA3D
 	help
 	  WPEBackend interface using freedesktop.org API.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C5610ED654
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38631612DF;
	Fri, 27 Mar 2026 10:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qhl73M2G0MCE; Fri, 27 Mar 2026 10:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5FD612D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605708;
	bh=KsknfNDYwnALhARgt9qdrWWg0fKpLTLW+qKNqMKPOr0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hpMle46BBqW1H67yCKHsdxkkicea9ZZchlr3HyIr5Ll6Wm3tegynL3ZQTEyMQA7Yr
	 SnhiIkpvdnZWKFIH0P8pVZ+ADqtoSkQdCKmG+Du8y2I1BbtD2gc/7CCj1xJ8CE0rM3
	 NR8whDr1lgxqT5hD7ShmDw4RuGSRQgcptpy3q6DN56utvYVur/QO0MLeSVZ9mDmCiC
	 sQPEcUm56kAtzyc2wAMPrDKWTITFmTFa3VYoUl6MtwEqFeDeu1h8lx1BhkrA0Bs40o
	 A/QraPdmxZZdsnC+wRLK0RYMIW2gq1/CsjTTDJJOHkjndEJ/zbxaBUZMshypD0oZVR
	 hi/qF9ZPZshpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5FD612D5;
	Fri, 27 Mar 2026 10:01:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2239C249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7439415D1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQ4scnza7o0o for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26DC741678
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26DC741678
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E0CC7FBC6; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:48 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8061b9f4f76f44d7dccc6f6904a7a1d35972e6ad
X-Git-Newrev: 955a57bda71a5761f23040a5114cce7ca1811f35
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.6E0CC7FBC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/wpebackend-fdo:
 fix EGL_NOT_INITIALIZED crash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/955a57bda71a5761f23040a5114cce7ca1811f35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit c89743874276426f6542f5b98cae5e3ee4564749)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

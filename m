Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2695E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7730560C07;
	Mon, 29 Dec 2025 18:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHHl8dx7P8wU; Mon, 29 Dec 2025 18:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD28E60B57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031510;
	bh=czMG8dWNAUOlfcQ0mK6Gnh1raUwQc113P/wh+JuybZM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C3coeFQTmJ01kyYsCo6JX0SmuyNeop3JO8xLdfSnIaWrWXTxZ4FbNh2MfCdca6IYR
	 V01a9w1KSNZ+q/JYOjBlZVdy7RViMKCG2QU73n+dxE/nOdRttjBTpvOln3F8Ot/IJ6
	 MKw+7Ntb4iMw3pbqnxtoL0oRThptJB0QgCCyQhQ/Sdr/ZXqqAey6mbv1FzIa3KJYQe
	 gG6EJ37uP+kdvJxuJlkMNShFzIhP/L1kkcYnJep2dpgbCVQuVIxJzm6l+9+3t2fvUU
	 mnFllA3drwFCJl9ADDKy4L5a9rTQwfnklgFt4TRibgslPTWoRFl6ZS0nLVHSi7iG5K
	 GHb7BgO+tSCNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD28E60B57;
	Mon, 29 Dec 2025 18:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B3E5177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D4834055D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHWtVLoqfBbQ for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21665400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21665400BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21665400BA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED7DDA4C26CB;
 Mon, 29 Dec 2025 18:59:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWx-000000002P5-0ffn;
 Mon, 29 Dec 2025 17:59:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:35 +0100
Message-ID: <20251229175938.3549882-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031190;
 bh=QONKBY4FZlrFnlW14sjqKCMfb/4rLEklKkjKbEDfvhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=t+q6hrVqxIdIZtuYHehMWY2S9fBtB3iJgvtDTtbg5ZeWGst5GdPGUSLk5MDuK9hQH
 fG2r6/VMVkC9Ot4aqfjGm7FQoWZ5JdDzjRPCNFiClhkTzzpfWaewuPlrQNXMtQVH53
 ADqT+hVWERZ5iY+D2n2jwZsH5iSXIvNq7/lZ4j3NKrq1P/a6pgf/KKel0J+63zFli2
 kbajNxexEh3LORkQVjld6gonWQG7HHcBUwBjlhRqzuRaz69Aqdj7cS+I+6fgNL8b74
 1caTkV/gP+6qwudzOmRFmYbwsrg4GDEi589VY0KGhAk71c5ywEJh1VhPwQ7nPQVHWE
 mkK4apaMrE4Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=t+q6hrVq
Subject: [Buildroot] [PATCH v8 27/29] package/ogre: remove dependency to
 libfreeimage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libfreeimage is not a mandatory dependency of ogre.

Due to the upcoming removal of libfreeimage due to security reasons from
buildroot we do not transform libfreeimage into an optional dependency:
https://github.com/OGRECave/ogre/issues/3069

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ogre/Config.in | 2 --
 package/ogre/ogre.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/ogre/Config.in b/package/ogre/Config.in
index e00d76d93d..3a3f2426a3 100644
--- a/package/ogre/Config.in
+++ b/package/ogre/Config.in
@@ -8,9 +8,7 @@ config BR2_PACKAGE_OGRE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
-	depends on !BR2_arc # libfreeimage
 	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBFREEIMAGE
 	select BR2_PACKAGE_PUGIXML
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_OPENGL
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 4e5d5f6d72..f3e3fc1d8e 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -16,7 +16,6 @@ OGRE_GIT_SUBMODULES = YES
 
 OGRE_DEPENDENCIES = host-pkgconf \
 	freetype \
-	libfreeimage \
 	libgl \
 	pugixml \
 	sdl2 \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

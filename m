Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18EFD25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AA3380D5D;
	Mon, 12 Jan 2026 08:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S33XVYT3fM44; Mon, 12 Jan 2026 08:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CFE8446D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206035;
	bh=eKHRi1J6w3AILFbnekaAEe3OBJjZrqVCcncQNqT76u8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1pa1UfUOiGaZYyAczHwddKVHOoBZXFzruToQFW5Gab4lVRsdiLZ92fMGjXnD90Q8
	 9Hkgjywsyn/34yTFAxk1QVmY+0miWL8KGR8XPewzb/xKZ43ur9+dspTIbU1HOZKzBP
	 NXIkfoOg6q4zpwK/9NY5NsGkyMriwwyN8sex93Gp3m5pWkjFoDUpiK9Z6M0q6oGcWJ
	 TARbfeCQXhxrMq3QgZizAEXBi9UCIo9VdEhh8IjNQ+tPr4n9LJkSwF11CdtWIWeoU/
	 siLTB6GauEYso69EYiEEqhvHOmAMb8cT+gAwLw6fx0Z7+0kpWtdNecUiksw4N4jxyS
	 goVO32Am7f1sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CFE8446D;
	Mon, 12 Jan 2026 08:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B09DA18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3267414E3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKojq1zGrY2I for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C4D0414E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C4D0414E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C4D0414E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C746DA4C4176
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-2Mfa
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:05 +0100
Message-ID: <20260112080419.2516889-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205145;
 bh=qht45f96FDsV/9T4gBo0iHFVCb96z2yXnjNnoHgp24w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=K+FihoVD/+YTLA05c7wvwaEgBrCYE1gRkwwmHY5UCAAIZB8QzOXcjA2NjOhQTjubN
 /jHEnDfzjuStL3fJ+qnCeqj2CQv/Zuh/bT7EVKumQjiKnHXJKjd2NRTpyDa0O4TiCK
 yJ3XVLWNUypDBQIkgElduox2Aj1iTBGV6A/HTh9wnreihDimQe1j4KhP3iLLHDEwzt
 okq+HYZ1rrLDD3FAq/5qvMzFjJUa5bi4HgBb/totNZnbkOYTOaRkcQ0cf5g2FPM9Un
 ME7WYyj6FdbBc/hngFnBf6Q98oXYNXG0a0UEwwH+XMpZ0H2R1YBnMV5vuHp1SR/Ab6
 QeJ94IBotwB/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=K+FihoVD
Subject: [Buildroot] [PATCH 030/104] package/x11r7/xapp_xinit: bump version
 to 1.4.4
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

https://lists.x.org/archives/xorg-announce/2025-March/003593.html
https://lists.x.org/archives/xorg-announce/2025-January/003577.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xinit/xapp_xinit.hash | 6 +++---
 package/x11r7/xapp_xinit/xapp_xinit.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index 4b7d8feb5d..624df77d7a 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003268.html
-sha256  b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23  xinit-1.4.2.tar.xz
-sha512  4b62c2edd97b40133577cbba88b3f31b36c5634b4eb667ef0c302e8358dc1c55a255abe42aaadc910d8aa9ea0e3add157a12a301382f1cdbe091df4e1215fae0  xinit-1.4.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-March/003593.html
+sha256  40a47c7a164c7f981ce3787b4b37f7e411fb43231dcde543d70094075dacfef9  xinit-1.4.4.tar.xz
+sha512  387285c952bbe074d2ed2dbbf745d1634763bb71f7f7edb22b3306b9e96ae4e28e59ecd6c48cc646b12dbdbcc68d42036bd127da75ef3c16fabdae87794ad6d1  xinit-1.4.4.tar.xz
 # Locally computed
 sha256  c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7  COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 795a1b541b..772342ff6d 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.4.2
+XAPP_XINIT_VERSION = 1.4.4
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.xz
 XAPP_XINIT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

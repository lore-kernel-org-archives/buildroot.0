Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7DBFD9E1A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 22:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2DE40759;
	Thu, 26 Feb 2026 22:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szYIvyXsaH_4; Thu, 26 Feb 2026 22:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C790840291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772143932;
	bh=zCxZVtJB1vGrTrhHk3uJhNKEGMlX5yc4NlW/xWdQlhk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HjguQZVspVhrtIjkXfRAwm2+4CIAP0M1Iy5iDpFfNfS67kgCZUMfBcLS1cC7VrkQI
	 BQ6mH3F/t1TFebAG619INe0dqMZxR3Pe5hjaORhIM1hSEsgLEHdW8oI3JXp/ktaxx1
	 8kEIkOdFiaheTwLFDJpn8eOdEJY0HHez+Zoa39Je+YJ8EWeDVoJ6OS9ty7ikFVsXuL
	 AdlkJAITbxE28aetLnOUOFmDZInwW6vjLjKQT0+aagpcK35N2j349MWBb32ajLLSNH
	 dkdpoLMojmYtA1zd5t7dydsqPjdo7imQJjdGAC0safrGhS2YUpoMorDQzKH0Xk/HOa
	 qDRhDO7bJ/ecw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C790840291;
	Thu, 26 Feb 2026 22:12:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD3623D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FCE6067A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYUg-jUCoOol for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 22:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DD29605BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DD29605BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DD29605BE
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 22:12:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2ADA9A4C2D76;
 Thu, 26 Feb 2026 23:11:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44010)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvjaB-000000007rB-0NJp;
 Thu, 26 Feb 2026 22:11:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Feb 2026 23:11:41 +0100
Message-ID: <20260226221142.2888118-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226221142.2888118-1-bernd@kuhls.net>
References: <20260226221142.2888118-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772143903;
 bh=x34Xlvl3PK7xSYLfhKT//cL7fReHZAOsJrhFCcB3w3Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Qin0KqRk8FaHQf/KQStQwKocLIdU3C+35DAmcz0aLn3Ba//ZdceRrXu0P2nwLJvvw
 gZ/m7wu65TMP/2NweDRKZiiFjfpfN8DWYg3d8t9K7p0oKjc9MAbMJYVBDBsaSGkT8I
 b5z4MaxH+0qkbDtyA6UdtpOZPsf9qH2fbcVr6Y6Dm02cNeEhHUt1DYGRWHcbwvA0HM
 GGefPno7g2KCIvOO3MgY+5vT6lpeFgsqYmgu9dz/4+wKHRy2fmvLhq/iqY5a//8lr+
 KUMnZok1IcNd8uZ1Cm25AixDHg5x5Ey6vZSjnECvq3hlKHeO71oG5EeeTrTaduUYoa
 zbmcqrt9+agvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Qin0KqRk
Subject: [Buildroot] [PATCH 3/4] package/wireplumber: bump version to 0.5.13
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

https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.13/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index a254b68cca..eb22ae6a7b 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
+sha256  056033cd4fa551b947eebd697bbf78fa9e6baf8f7f12cb5395656aa619de4946  wireplumber-0.5.13.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 8818662059..0c5760d2a9 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.10
+WIREPLUMBER_VERSION = 0.5.13
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

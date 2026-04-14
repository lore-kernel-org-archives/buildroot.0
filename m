Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BD5F9D0E4
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CE8942B3F;
	Tue, 14 Apr 2026 16:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnGB9E0JY2Ac; Tue, 14 Apr 2026 16:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C22842B5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776183671;
	bh=lEKZ5uvkNL2E6lk/YNDWfCdDIeoy4/YjdzH2pPIWfg8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nP7PvtVlNzKvh/HE2pta9t32goGgdDQz6yFSpZeXEqznGrPqIBLkuliLsusLt09pE
	 zqfVpc9lG/PFCH2gWQ00h9p43R7vOEEEofdPxr1lwavzOatNbZrLbpTsjCNhAWLWnb
	 tb5bnSBJGv7vF+f2VsuDJ2fElSv+WHQ/CtEJUgWZZlQM5DxB0BGSVUiGy6w4/1da9O
	 3oIa1oY43DjdnREj3ojwyoUpk3JwXu/0mu0XcnEjYbVDNJ/lsFu6Kf1wpD8tZP0Bx1
	 NtFhocw5sUBUnNARoMQ/CxRZFpEverbLzyvIHxKWY1l59C44FATQWN/WYmPYEfQVTu
	 3PCD6FaEfyTyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C22842B5E;
	Tue, 14 Apr 2026 16:21:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C19B237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7148D61C05
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1M8gV_Qlruu for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62AB161CF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62AB161CF3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62AB161CF3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:21:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5970A4C059A;
 Tue, 14 Apr 2026 18:21:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgV2-000000005zN-3BCW;
 Tue, 14 Apr 2026 16:20:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 14 Apr 2026 18:20:28 +0200
Message-ID: <20260414162028.2141018-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414162028.2141018-1-bernd@kuhls.net>
References: <20260414162028.2141018-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776183661;
 bh=S6wcBBsn8/7M9F+ou7yy/k6wa+lbMo2YPhEhAadiJus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ICU8Z+Y+nilDxet6l7YzPcc+kqh+81lSR26SZrhnm2dmM3yDPo2grIvv4JpRhQppF
 ZQ1z1U75ryg7Ao7rNTO3zZtASCZXqlBjIVH7rtM2RY2am/vcyreErOw+nBNJp4EAMZ
 a6MPdXKukEnGqDmgHTCK9fBtVTbgw8V2xWOEhJbGmlBKRllBvjz5Wf9LMLWM0AntBT
 8MTJelhfJF+yg7/fkRMFNGCukujzZG2dN2y+LOBPXI9k15ly1qPyPAEW9OOUi6p8q6
 NQEUVZJqf9Se67Rj9AbmTfRKU52v1sX1185ONk3JCAmZIob7D8WyPX85TIeBl8ABVH
 U/O0QTo+QpyvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ICU8Z+Y+
Subject: [Buildroot] [PATCH 4/4] package/pipewire-media-session: bump
 version to 0.4.3
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

Release notes:
https://gitlab.freedesktop.org/pipewire/media-session/-/tags/0.4.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pipewire-media-session/pipewire-media-session.hash | 2 +-
 package/pipewire-media-session/pipewire-media-session.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e6b176eea2..3559d3c222 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
+sha256  ea0e371b08f9fa158fb070283b04ce1c4c0a3180d6e89de46c206296918ee1e4  media-session-0.4.3.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index cc7317f925..16e12d9eb3 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.3
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5031AC0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 08:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7EF60A56;
	Sun,  2 Feb 2025 08:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8_U2ielI1pz; Sun,  2 Feb 2025 08:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D99560870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D99560870;
	Sun,  2 Feb 2025 08:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DCC812A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41E9642F2D
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hliBOEqGRfj7 for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 08:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E193142F23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E193142F23
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E193142F23
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:44:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b087.dip0.t-ipconnect.de [84.161.176.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 53FA0A4C4851
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 09:44:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34316)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1teVaf-0000000066t-2Lzz
 for buildroot@buildroot.org; Sun, 02 Feb 2025 08:44:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Feb 2025 09:44:25 +0100
Message-Id: <20250202084429.259494-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250202084429.259494-1-bernd@kuhls.net>
References: <20250202084429.259494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738485870;
 bh=FGi7RCAGjQnRPS4VzDVbHrSuK68y9Vnkauw3XgPXr5A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XWFM2HbSTDuwO3QKs7XZItt7oURm1MMQe+OJ4CPWYYYNRN1CChLN+RP1dPPqYye+O
 rE+frs80yl06S6TRMD9xuT39+CvDA8yZOjdEySUZErWNtawXNbJlM0ZXefAUCxSo2T
 hcp1nnHnZwaQ4xD+mmV2cd8+SW/jZkym8Lj5cSC8+dpOzq8rT6Sx71d+/giF53POTX
 f/TvWt8yOKCmMdfaKzqY1OmWfir3MjbfhAMswxNpvCjucfsYxBmhYjQfN2WfU3EE25
 HJbNmIZJAENb+L4Zb/ftPDzIPVfnb5iUv4/gSrD3i3ZLvlD7eXCDSHYZQCjudQIbkm
 m5pMwJLcmsLfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=XWFM2HbS
Subject: [Buildroot] [PATCH 2/6] package/libsilk: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsilk/libsilk.hash | 2 +-
 package/libsilk/libsilk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 2118036ffd..c4a825852a 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  816e9d4482a3a6df9c6e16b87e88155d5f38b46def20ec0e9e35ae0f6aa704f3  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
+sha256  2c04da72855b98b6c7bffe3d13940530d1d325b5aeaae5d7f0a211198247b8fc  libsilk-f97ee24e561610618a5af9abd78e35d565f448d0.tar.gz
 sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsilk/libsilk.mk b/package/libsilk/libsilk.mk
index af9a7005a0..cd45d58ee8 100644
--- a/package/libsilk/libsilk.mk
+++ b/package/libsilk/libsilk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSILK_VERSION = 4268a02240c35c6055b0f237c46b09b2dcf79e45
+LIBSILK_VERSION = f97ee24e561610618a5af9abd78e35d565f448d0
 # we use the FreeSwitch fork because it contains pkgconf support
 LIBSILK_SITE = $(call github,freeswitch,libsilk,$(LIBSILK_VERSION))
 LIBSILK_LICENSE = BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D2FD5F8C
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 07:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1336B60ECD;
	Wed,  8 Apr 2026 07:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ny8Z2S_0nzQQ; Wed,  8 Apr 2026 07:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F1E60EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775634060;
	bh=OImr077G6uxKTXL5PzcpmP8OussWeL4j4Vn1Q73rtgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dXM6/g1wx8HzROp6S+6YQjRixdAfn47Z/PSphGbyHUK4x2BBy50iAyuk1MowiiLNU
	 JiPdtzXOEgFSA/+5Kzx70Or3ThJZqHVwWz4SJpIlKhbg7EP8pIfbrBjENOKrmo6lKd
	 ViGTPsM+nP1p1TCbZVMhDOuxO3OeAtq+5+S8U4V9WobafylyddLhfMZgc9qaO2tQ5i
	 SvWbY1CG/N9aJSQId/mKVPMZb/jeaVbcOyc6yJ1pF6pHVilkLkmu+G7besPYtWlP2a
	 oFXe38IxMxQzauwJjbXTH481SfSILZFNEzGCni6Dh1LrjxL0qY4QXhg4wbQrWGgO38
	 wtzHyzi9XoBHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F1E60EAD;
	Wed,  8 Apr 2026 07:41:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A49812C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 07:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 964594047B
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 07:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkrlwmNsIAhT for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 07:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84C5A403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84C5A403D8
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84C5A403D8
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 07:40:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38B0F1814BF; Wed,  8 Apr 2026 09:40:55 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 09:40:28 +0200
Message-ID: <20260408074029.4005543-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1775634055; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Fq4IcczE715pfvKDf8z8vC9JV8LTSl7azN5IpsXw6CY=;
 b=ulRV3a7v3FsMP8aGtddwwrPzvss2ZgIZ+kFwGHxDgi7Zv5227Ii35OncaFNb/TqxNRmsHz
 CzcrqbMLobuCMHTMbvMp06v1/dMtP+YYvBRwZAYBliBLF3grqHB97lBRtbOsQIxr/ZiiH8
 DQSkgVtF4IA0Q7Fvw/RRoo0j9lvW4IQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=ulRV3a7v
Subject: [Buildroot] [PATCH v2] package/libgpiod2: bump to version 2.2.3
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
V2: use correct package name

---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 24bcfafc6c..157e605ed5 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d  libgpiod-2.2.2.tar.xz
+sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index ae3bcfa207..8803a282fe 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.2
+LIBGPIOD2_VERSION = 2.2.3
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

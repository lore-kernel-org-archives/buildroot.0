Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDFCD68BCF
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 19:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B024095E;
	Fri, 15 Nov 2024 19:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utj30zzUHnti; Fri, 15 Nov 2024 19:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F9B40967
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38F9B40967;
	Fri, 15 Nov 2024 19:13:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5037927DF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 314A760836
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lu6jKLcBIi6R for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 19:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEB5760670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEB5760670
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEB5760670
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:13:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c858.dip0.t-ipconnect.de [79.214.200.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 31BA3A4C346C;
 Fri, 15 Nov 2024 20:13:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60102)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tC1kp-000000004J2-1Evk;
 Fri, 15 Nov 2024 19:13:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 15 Nov 2024 20:13:12 +0100
Message-Id: <20241115191312.315113-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731697996;
 bh=3BV485C8UiyC+27m40fjLq+1W/fgFkCF40J9rWd7kSo=;
 h=From:To:Cc:Subject:Date:From;
 b=dLiIw9C0f7u0/gmfuLQNcexbmNSJviWG4ZovU1PoAH+JC+NxnoV6HLns8Zxf3RFPK
 V1v0mLgWeDi1YlA4aXAT9y4n8VNQowPuL/6whWDdXGlTnQC9axf+5ZF1KVPXXOsZtS
 1x6s07j2kOIT88j+OscKerhotnYlHFbOTP5onTZmYP1nubYU07UyYU8EPv1gzWZIkz
 e3IaarXySAC9sbUjxYYJNzQGU8C/TW6zw7GeDJHZXCCxo2szzbfan5OkRV75FZkOCU
 UVPxbudtmX6Wu0eCAA1AZnP6LC6ihZEWirI4FANYk7PSvreFXze5PevB76qnePe/VI
 cT1nYWUZSxaVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=dLiIw9C0
Subject: [Buildroot] [PATCH 1/1] package/libpng: fix arm build with NEON
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

Fixes:
http://autobuild.buildroot.net/results/52c/52c974e70f922e9d7efea4c538e4438a22faa846/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Peter Korsgaard <peter@korsgaard.com>
[https://lists.buildroot.org/pipermail/buildroot/2024-November/767661.html]
---
 package/libpng/libpng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 9761993d79..c0b3ad24d5 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -16,10 +16,12 @@ LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
+LIBPNG_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
+LIBPNG_CFLAGS += -mfpu=neon
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
@@ -31,5 +33,8 @@ else
 LIBPNG_CONF_OPTS += --disable-intel-sse
 endif
 
+LIBPNG_CONF_ENV = \
+	CFLAGS="$(LIBPNG_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

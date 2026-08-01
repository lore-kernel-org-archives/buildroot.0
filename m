Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC64C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 22:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07D680DC1;
	Sat,  1 Aug 2026 22:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwlPERMhuVFr; Sat,  1 Aug 2026 22:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507F080AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785623420;
	bh=uLk4pxt/ctmHVqJmbAIwcne04dANJUAvaSxMqBXrIz8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iiWn0B6pqLGq6BDcPRIeGchPDjNkS2DHRIYVzdKpk/mwftz7XsE3x4wAiZztNVSPP
	 EQaa95VtQbQcJ2aA2pML/HDssFmPM60wJC4aGqSJTk9P7jHHvGKyhlmR47ZuRFySL7
	 R07woD68IDTNKFAoUyHQX3ZjOIBcVzgggJ20t0b1fbsapvrjxHIDeblfuw9MbMYngf
	 IHbHwGFYePip6oNuLpkp8olBC+YO/nQhvdteIwRc1aJasMJFX4ppAP6kM21BYciUsp
	 5IpMKSNlD5rmaDPFFhdn7l2CP46xF6ebk8yiYuaul+ajdPGnftzuatfzYc5uNTLCPr
	 dwH0LZJqhmFpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507F080AAA;
	Sat,  1 Aug 2026 22:30:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B84832E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 22:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D0380AAA
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 22:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcL8FYgnpk3L for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 22:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FD2D80A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD2D80A9F
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FD2D80A9F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 22:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4CCB1004A7; Sun,  2 Aug 2026 01:30:06 +0300 (MSK)
From: viper@landau.one
To: buildroot@buildroot.org
Cc: rulkc@linuxtesting.org,
	Konstantin Menyaev <viper@landau.one>
Date: Sun,  2 Aug 2026 01:29:45 +0300
Message-ID: <20260801222945.1612760-1-viper@landau.one>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landau.one; s=dkim; 
 t=1785623409; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=LT4FFQCTMN8MD1HeEBrAL1bTsSKpJosdCig+jDLqAqQ=;
 b=kLIOHT8rNT4BAGLxX8f/OrX1jTE49W/d1/nn0tQO7zLKmg/iVFgXvtMMJSRxKGciWZpZPd
 ucxHWdscaEoww/KucY+9XyyjsrTKVhaV6NA+m13PNdd44D5YcBb2U5ib4TGFY1lFLoYSxN
 WdWAEXW9EYC+scu0vgpUg1DpjmNyzxqu9i5ECP8qFlqPTjgbpciJ5yrbmkiQZ8VHI+0UVI
 i3kjkc09yHZisnwiaVPdU+qBh+clyZZwzJ2+0KWo4Hc3/H5MX9MHg9cA736FgOoWhRdZay
 Eqseempl4W6xgL58f6qFScHOx1QUwTLT1qyfCgyqKMDOGYg1frdTxzK54xy+sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=landau.one
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=landau.one header.i=@landau.one
 header.a=rsa-sha256 header.s=dkim header.b=kLIOHT8r
Subject: [Buildroot] [PATCH 1/1] package/mtd: build with -fPIC when shared
 libraries are enabled
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

From: Konstantin Menyaev <viper@landau.one>

Historically, mtd-utils only provided static libraries, so they are
built without -fPIC.

This becomes an issue for configs with shared libraries,
where apps may need to link libmtd.a or libubi.a
into shared objects, resulting in relocation errors.

Build the MTD package with -fPIC when shared libraries are enabled,
while keeping static-only builds unchanged.

Signed-off-by: Konstantin Menyaev <viper@landau.one>
---
 package/mtd/mtd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 2a625fccce..d67770d5ba 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -14,8 +14,13 @@ MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
 MTD_DEPENDENCIES = host-pkgconf
 
+MTD_CFLAGS = $(TARGET_CFLAGS)
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
+ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+MTD_CFLAGS += -fPIC
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 MTD_DEPENDENCIES += libexecinfo
 MTD_LDFLAGS += -lexecinfo
@@ -35,7 +40,7 @@ else
 MTD_CONF_OPTS += --without-zlib
 endif
 
-MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
+MTD_CONF_ENV += CFLAGS="$(MTD_CFLAGS)" LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
 MTD_CONF_OPTS += --with-jffs
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

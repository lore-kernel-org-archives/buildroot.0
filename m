Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DB6CA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D126168B;
	Fri, 29 Aug 2025 14:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoJa8nyx0vvX; Fri, 29 Aug 2025 14:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 680CA6166D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680CA6166D;
	Fri, 29 Aug 2025 14:34:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFEA1BF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E892A8133A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-Hq7HhWHkwd for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC29A81223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC29A81223
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC29A81223
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 838754E40C4B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:34:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C365605F1;
 Fri, 29 Aug 2025 14:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 498751C22D73B; 
 Fri, 29 Aug 2025 16:34:18 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
Date: Fri, 29 Aug 2025 16:34:05 +0200
Message-ID: <20250829143407.1970907-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756478058; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=BpD/uLJ8mfy/iQzXj7/x/+5iJDpIn/5dtX2O+bloxvg=;
 b=L7KXtqj4LpNFPZ+NxFjfOyuk+LcVI567vrWzVuShOFk2sUspHiSZpJGmt+aCmYO5xGhp6Q
 RP/ck7GlX+QJefGP5UYvI4tQU0AqwtDy7v+/9h0vIQ8+WwkXGxqL3B3l0OlFUhbvtmLMDb
 mP0SB6qZDSLroWdoM+F7drv27x6wszsBzBSh+NSl6r0+wv3D2z+FJHZmS3Yf/VFYim62Zp
 Cv0bs4EUbfwzI+P+U6gHrw5um8H2b/TEDU5jvfK0KPse/8kbQJ9xxmdBxSZ1H1tcaI6ZSt
 klCE10j5yTaYkJBc1ln0Wi19R+yc2fozKvghNfOT3+wtBnTC0C0PTAWkwcQ/ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=L7KXtqj4
Subject: [Buildroot] [PATCH 1/2] package/libkrb5: fix GCC 15.x build issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream commit 4b9d7f7c107f01a61600fddcd8cde3812d0366a2
would allow to solve GCC 15.x issues, but it's a 313 KB patch. So
instead, let's build with -std=gnu99. It requires a bit of
reorganization on how CFLAGS are handled.

Fixes:

  http://autobuild.buildroot.net/results/4460089f5989277e6143f6e3d66f71371913ee4b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index e57a2b98a2..d0ec877d35 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -16,6 +16,8 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
+LIBKRB5_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
 # we feed the configure script with the correct answer for those tests
@@ -38,9 +40,11 @@ LIBKRB5_CONF_OPTS = \
 # Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
 # so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+LIBKRB5_CFLAGS += -marm
 endif
 
+LIBKRB5_CONF_ENV += CFLAGS="$(LIBKRB5_CFLAGS)"
+
 # Enabling static and shared at the same time is not supported
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 LIBKRB5_CONF_OPTS += --disable-static
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

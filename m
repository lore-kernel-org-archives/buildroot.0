Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F42AC83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 08:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B2A80D4F;
	Mon, 14 Jul 2025 08:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpXt2js4S1TT; Mon, 14 Jul 2025 08:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0084280D0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0084280D0A;
	Mon, 14 Jul 2025 08:18:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F474967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 08:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74C2C40409
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 08:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEz9aRKXMsTo for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 08:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE9F8403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE9F8403FF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE9F8403FF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 08:17:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso48279925e9.2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 01:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752481071; x=1753085871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pzuwwFvJx6wM4LgVKL49QRMWuDhmhBUWBHQj8ANhujU=;
 b=xOrR5w2mPcdWh9nYtAzjwyHm83fM6B1zxe0BAh3GXRRSASWp/cZ+TGySGBwv87+spf
 hLfUpmmxF1L6xbSG/17DUzIhq+j04H6dQ/bOogzwAGwelY/262XcnNsu2bo1XMu2VnMs
 wa/IlbfbySvjlNoB0SaS9Djlv4avKD5QGBMoG7J+6lnaEEtk3tbsdPdEIqZcg7SPo26p
 TtY9H1AhHCwu+klA6KFBU4oj22w4gnBhE0fJuDVEV+Qduxtz2kwQNq94MkEd2jbsoxXx
 nI6V3JJ4Z8nbu0+dQRLSUJ2GpiB10I2IKLttLpMWwyWYJMsrKPaGk6zSh+N2KjQsSQrz
 XFww==
X-Gm-Message-State: AOJu0YzxPRhNWYS+QQBJZjabbtZSWZTukurRQJC5rdaKdJWavkJSTbYR
 zxBoXrZRiR/KOFR0mivaWdcBr/qpnogjUpxt3kfj1O6qCNvhAvIBu7SHY+wcPGvR/fD6nzxVA/w
 FsZ0/
X-Gm-Gg: ASbGncvkR/E4IQdjowu/PYDTalz9TRHb6SLqgfrodG1LgvFOL3s7bYE8nSRpR4rLYmg
 k0e5t9N1hHwyusseC52D6E91acl2LsgDHlq8Mt11BIUOHbqPBJk5KE0WAogmJuTQV8pVpX3+32z
 DZ8+LJrN0Rne6z4HvsmTlPXP8wCbgHBwi1kslljBUGxfP2BenetpbBrhF1A4tfVSsGJ+y4GDONm
 dtt80b026a2K5JV0a5dyZF55FEXOZIdDDWcoMd7HJUVD3np6O58NLN7SUd5lvmtJDvbjOe3NGQe
 iIHquKIAXYPG3IF/HKQVR16ryLeyjcBd+dlO6rZDNRpKCmexrYKcsBew062bNrZHKkeIxsGY2mK
 qRht2lBmkWIWmKQ==
X-Google-Smtp-Source: AGHT+IHXDxfxoVIJhbdPJ//drvosk1K+KgP2m0UeQdT05f15guDufdfbb+CYkygrqvMZ1jSXK0RZIg==
X-Received: by 2002:a05:600c:34d1:b0:456:1d4e:c127 with SMTP id
 5b1f17b1804b1-4561d4ec409mr13140585e9.8.1752481071106; 
 Mon, 14 Jul 2025 01:17:51 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f13ec67asm85796505e9.4.2025.07.14.01.17.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:17:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 10:17:49 +0200
Message-ID: <20250714081749.83051-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752481071; x=1753085871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=pzuwwFvJx6wM4LgVKL49QRMWuDhmhBUWBHQj8ANhujU=;
 b=SadMIzVuy6qd0OCNYs3t4XnS+kSvGM0H2TQg8Q30ChCJgn3YwvQpI9YU+cp+H2OvSw
 yqZiBlKaXpB+4O+dvMCee+BPgxi9QkWu+o5p1d8qFB/8bQLugPTml0+fez2CUAZZRvCO
 yAGvhlyRPhT8IGqOSGsSlbB6k6q3wugEDtuXj1imX18fTyn5GOyod0/HVCiurjIL681X
 vLCf/v56Bx8lQci7IZf39Qng56886WlQluBzYf/ui4Pdm5JDgUm7DMSuyekz6GNWEOjQ
 7X6j9TNnTBU+eyApXFxXZdvF5is6oUToZ5bejCkNP+N94tI5z5DrRgmuPYg08sWYpUv1
 r+Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SadMIzVu
Subject: [Buildroot] [PATCH] package/libesmtp: bump to upstream version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building libesmtp on the autobuilder, the following error occurs:

/workdir/instance-0/output-1/per-package/libesmtp/host/bin/arc-linux-gcc -Ilibesmtp.so.6.2.0.p -I. -I.. -I/workdir/instance-0/output-1/per-package/libesmtp/host/arc-buildroot-linux-gnu/sysroot/usr/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c11 -O3 -D_POSIX_C_SOURCE=200809L -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=2 -fPIC -pthread -MD -MQ libesmtp.so.6.2.0.p/smtp-api.c.o -MF libesmtp.so.6.2.0.p/smtp-api.c.o.d -o libesmtp.so.6.2.0.p/smtp-api.c.o -c ../smtp-api.c
../smtp-api.c: In function 'smtp_version':
../smtp-api.c:1183:7: error: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Wimplicit-function-declaration]
 1183 |   if (strlcpy (buf, v, len) > len)
      |       ^~~~~~~
      |       strncpy

This error has been fixed upstream in commit [1], but no new release has
been made since.
This patch update the package version to fetch the latest upstream commit.

For the changes, see:

 - https://github.com/libesmtp/libESMTP/compare/v1.1.0...335ee8d2fa5cb7d30db7b818ec05563ad139ee2f

[1] https://github.com/libesmtp/libESMTP/commit/972eb547493357681b1b7012ef20618e6831cfde

Fixes: https://autobuild.buildroot.org/results/ced/ceda012506edccda1727904eb3327017b07e27d8
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libesmtp/libesmtp.hash | 2 +-
 package/libesmtp/libesmtp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
index 596ed4eaca..ed301257df 100644
--- a/package/libesmtp/libesmtp.hash
+++ b/package/libesmtp/libesmtp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  32bc3614ca12d21c7d933f32d43410e8744b6f91fdca7732da9877a385e4e6c3  libesmtp-1.1.0.tar.gz
+sha256  144aece0077db6a2bd655d3d9558c714c9defd30a2d52c6e85ed54457d712daf  libesmtp-335ee8d2fa5cb7d30db7b818ec05563ad139ee2f.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING.GPL
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 6456e83e10..e861ad4ac6 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBESMTP_VERSION = 1.1.0
-LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
+LIBESMTP_VERSION = 335ee8d2fa5cb7d30db7b818ec05563ad139ee2f
+LIBESMTP_SITE = $(call github,libesmtp,libESMTP,$(LIBESMTP_VERSION))
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
-LIBESMTP_CPE_ID_VALID = YES
+LIBESMTP_CPE_ID_VERSION = 1.1.0
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBESMTP_CONF_OPTS += -Dtls=enabled
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

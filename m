Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D7BD7494E
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 23:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B90180D14;
	Tue, 29 Oct 2024 23:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1YZ2u5tZs7u; Tue, 29 Oct 2024 23:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12C380E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12C380E80;
	Tue, 29 Oct 2024 23:59:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C36AB494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B14A280E80
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIc2ywFh2Iuj for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 23:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B12B280D14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12B280D14
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B12B280D14
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:59:40 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7eda47b7343so3890298a12.0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730246379; x=1730851179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VtDJoxqrp9N0D61oolqlqv/Oq+Jd33ApHemKV6/BMHU=;
 b=RMWuBTKIF6IBDdSZxFoQ+7WKS5AQSTj8OoSxICUm0Yo8nnELdhKvtesKIBlpKFf38M
 +yVh8kVngU1WwAAe+1TgnR2IgNzhdL+vzvtlf/tBmt1z/iLErGa/VMbPIYc2hNUlNAvq
 mGjysoUabsyJmQbcGqmpCV/TeByiKp2jwvAdXEoMTcg9rZpfqvhfmXxYaS1gMzet1faU
 TqOwZD4pmtS+jPnmQIGVpSh6ya1U9ZzTs+gr2H2xtXkOqbf1uR1kFUKp9u2GQtk84zPP
 csIknpGS6x81PqI6zO4SmpWf/ktc/uT82nvGJ9U+j8YYdM3eGmAkD0S6lwyp9P4Z3Hit
 LFrQ==
X-Gm-Message-State: AOJu0YzzBUxaa39WrV7f9pAhzjLErehj4+qvyfOqi2ifsVdoPn8/oYNX
 61ge+kPm58DHL5oAvWWlsAzmwRxiPGDZ3Q0Qu9Zj2urIG/RC51RIip4QsqZ6
X-Google-Smtp-Source: AGHT+IENo/P5+B2dLH7o5MiYKBwOI0xok7aOlx1aZYPAZ6EUL1T6qWfkhJYXJeH99v8XakByKlxRKA==
X-Received: by 2002:a05:6a21:920d:b0:1d9:275b:4ee2 with SMTP id
 adf61e73a8af0-1d9a840a30fmr18260380637.24.1730246378928; 
 Tue, 29 Oct 2024 16:59:38 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7edc8a3d1f1sm8179958a12.76.2024.10.29.16.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 16:59:38 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Date: Wed, 30 Oct 2024 07:59:21 +0800
Message-ID: <20241029235931.37689-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730246379; x=1730851179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VtDJoxqrp9N0D61oolqlqv/Oq+Jd33ApHemKV6/BMHU=;
 b=Atl6RxxJ7C+FdSvHokOhZ9GCQssBRVlfoQlyJlYkPqFOfbH5opJ3/nyUCbAnWVvSvQ
 InGVAuLEEJmfNk7UG/woe73p/otlOyCBIFnBHGXbYFGvEkLSSuEwLUbrSdF4GX9IdLw7
 rD2WoOKRr6pEW3YCGg5+hc/6xWu1Ae8VJaI+jdyB7f8Ah8oN4OzVWxVU3l/fNwXseZea
 t/zhmW8spWCTp5B4fR5xVnOM5iTdSLsLJgbqHzUiGB0qzbi0OWsb5EpvTL5DTenXaeLp
 3FnqjskkwRbEv6cf/cyYV22KK6GtlIpo8BM/eBQMLiUAPvC+ukkRRPymBrnvkZ6FguYO
 yVwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Atl6RxxJ
Subject: [Buildroot] [PATCH] package/libmodbus: bump to version 3.1.11
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
https://github.com/stephane/libmodbus/releases/tag/v3.1.11

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index a7b7e583a8..5c081d9710 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  899be4e25ab7fe5799d43f9567510d6f063d2e8f56136dd726b6fd976f9b2253  libmodbus-3.1.10.tar.gz
+sha256  15b4b2e0f68122c2da9b195de5c330489a9c97d40b4a95d2822378dc14d780e7  libmodbus-3.1.11.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 2fffa1e0e9..4902d6257f 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.10
+LIBMODBUS_VERSION = 3.1.11
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735A8C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 08:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3583C413DE;
	Wed,  5 Jun 2024 08:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYGstULrob0O; Wed,  5 Jun 2024 08:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054274080C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 054274080C;
	Wed,  5 Jun 2024 08:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8361BF5E6
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 08:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C058843A2
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 08:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xty3zL8iIrIC for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 08:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 200D8843A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 200D8843A1
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 200D8843A1
 for <buildroot@busybox.net>; Wed,  5 Jun 2024 08:15:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57a3d21299aso5872581a12.2
 for <buildroot@busybox.net>; Wed, 05 Jun 2024 01:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575354; x=1718180154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJWfwuYwxcsbVnvvF0AleAa5gkaD3FjVgOvGasyCmCA=;
 b=A0K6GPfsIUgb7AvKasVDuBFZfz23FHV0Dy1grYmKswHI/XzwXd4olzfO8YQLIeQgE9
 /ZsVoHbT0AYHb/DP7+Y43svJ7KSLGIGx4TCSi1ptcHzFpeSA6iIEK/zHj7yfYIHsCvPf
 LQnq75MMCoJvwIsOXk5x5e8xVfrNgq+ZK7tmt2eq51iW933/gJs4G+N9Lqu+e9CggCcG
 qis8XiUSWG3CDqcQdvXPSsiuRRPlairCI/tEQHBq6q4Tm+jWTs7ccCvO7LG7ZQT+VJtF
 dGFtEdeRedBO2T9I/Cu50kxIXejHmsEMKgquQUtFKAPK5J5jChsI1TFETdMusrbS/eyT
 lShA==
X-Gm-Message-State: AOJu0Yy/n57F+2NbohtL7unhZ0QnncNMZbaC0rE3u7howVAyetO6Zcd7
 RkkUo9OgObgaxQpjfKgXieFK2BLWVeLRl3/xBJvrYB3lyb3kyELQNB1DMA2AiT1Fvs+KRE3iin6
 IEQ==
X-Google-Smtp-Source: AGHT+IEXOsf6FswxQpe5Qoso0haY6l5sJ5l+b59s8P8HNf1yHhYcAjQrnsMaTOJDlylyQVeICOFnDg==
X-Received: by 2002:a17:906:1c11:b0:a63:4e5a:a240 with SMTP id
 a640c23a62f3a-a699f34a8ecmr111139266b.6.1717575353712; 
 Wed, 05 Jun 2024 01:15:53 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68c9ea107fsm566330766b.12.2024.06.05.01.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:15:53 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  5 Jun 2024 10:15:51 +0200
Message-ID: <20240605081551.1181658-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717575354; x=1718180154; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QJWfwuYwxcsbVnvvF0AleAa5gkaD3FjVgOvGasyCmCA=;
 b=ZkZCb54RI2t9K9MhQPtDDM9Y6oTVi5WUyOTVsO//sXHqczal93HMzc7qpuX4fZhZjR
 wyTwr28l1x8GVFYLQEyIefZkcmH8ltMsH2QtuzwcDKhDjCr3cIO6BzmHXm66R455ybC7
 eS7xz697/4sAHLks5PppgjOTFsPw5lRFQw2XD92o/K+Dcsh8isl9HrAtSWpFAHpTH3i/
 ZehNtn3QzYixofejIrjIc9d296B6sBvrmVM7/fuqZSX9vU7wReuGFGGJkGz/keLOTKUf
 aXxdddwljQk/f3/5QfQVuy1r8t927Uv4JQefGWH6ihTqVmk1CVhr+Jfu56MAg3E4Jmvw
 CXlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ZkZCb54R
Subject: [Buildroot] [PATCH] package/ntp: bump to version 4.2.8p18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

diff COPYRIGHT:
    -* Copyright (c) Network Time Foundation 2011-2023                     *
    +* Copyright (c) Network Time Foundation 2011-2024                     *

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 96e21bf2d..44f3486d7 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz.sha256
-sha256  103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866  ntp-4.2.8p17.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p18.tar.gz.sha256
+sha256  cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5  ntp-4.2.8p18.tar.gz
 # Locally computed
-sha256  06246b8c15ccc1a1873c78525c810f0802e68f383e79ee041e06d1ab9cbf80a4  COPYRIGHT
+sha256  45b6e5a0a5f0ac4afdd9e23caa2241779e4da463e4dba32a41b4dbd61577b2a3  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index e64f6308e..1a7c7e793 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -6,7 +6,7 @@
 
 NTP_VERSION_MAJOR = 4.2
 NTP_VERSION_MINOR = 8
-NTP_VERSION_POINT = 17
+NTP_VERSION_POINT = 18
 NTP_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)p$(NTP_VERSION_POINT)
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171DCC3ABB6
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 04:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C7DC80EF4;
	Wed,  7 May 2025 04:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B312hn-HDj3; Wed,  7 May 2025 04:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C981E80F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C981E80F0E;
	Wed,  7 May 2025 04:56:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31AC5CD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 04:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1819460EC7
 for <buildroot@buildroot.org>; Wed,  7 May 2025 04:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TU6qUiqAq6WY for <buildroot@buildroot.org>;
 Wed,  7 May 2025 04:56:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42B4460EA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B4460EA1
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42B4460EA1
 for <buildroot@buildroot.org>; Wed,  7 May 2025 04:56:56 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so6684556b3a.0
 for <buildroot@buildroot.org>; Tue, 06 May 2025 21:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746593814; x=1747198614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pfVigT2cNQp6KEUfkFLB8EGzqJliAPFnOyeDqvIsls4=;
 b=O7EWUSx1um5KXVQmMfTVbMtYebx5H6z9zu+FMgEYJqYXWWJy5YgDrYzHH1d8klqD69
 yc8eupo8MhmvAugzXq6CbxY1DLAG0izxHxwRQ5FgM2CZQWtwSSGh9a+pcopt/N8+rDhe
 Oui6zcjurQnneELTEYqujMFDR9dzawycfsKuSVpShs+izmmlxCo0DVouwQ0j7Bl2Gwyo
 OwgKxZY8k4YfnrcbA+dK+Tx+QULg99qhLpzZdgiZM7G51mriuqFXNUtZMWry32V8zL1h
 +t952wYXos96s4l9Ay7Fj2TdGmT7uZOxAp3qMBJuGMa9+gvhB/we5LOKgdm1oHGC/U5N
 Hgew==
X-Gm-Message-State: AOJu0Yxw5yXY1VKzWZ2A8eppwf0jeUyuEAwaOy2p/tM7BH50bYpH/WqC
 5bRrByk7bnVl2ktvGYqWqcVjLeEOpCf+DiF5FbAWmLoV+ohUGaldyXGuLW2c
X-Gm-Gg: ASbGnctVCxlsky8uG/Cxg9oFiWyihFNI+u5lXoKDHHbhRGohp+9vdkrL0fSQa7BCDVW
 DVz5aGlcr7IRzXKcuNq38Ugw/a1i+OfsegLQJHsKQNWcPFVvAvk1fIVrFAnT6bKSqxgPO/jbtxf
 6Zo/mz0isu5Lsj3DoXqjf3XE+QaCdYU2ej6+QOXgeGYUw2Fd8Wu33WGSgqutQrTiWywFfrZVQHZ
 WwXybiNEAFNdTrB5WxWLEWPOYR6ESTAtVTiTzNWCVU8z6mXqlmcO31i8K68j1B839NpZ9XR/Rls
 gbagQpqiPvWy/35+LZEW2jdEbslBWf6lpFjioUKad7nQ9uwbcPWOkJJzu2vTVFWlrLMgZfy6Ar2
 8SW8tLtYwNlnG9o5CLm/RWQuwZnQ=
X-Google-Smtp-Source: AGHT+IF8Y0jk1rWvMF2YoGGXx5L2RsLsq9sksno1qLGShZimwUZ/j+cfw7LUbJo1Mxk4YUD3pZ2NXA==
X-Received: by 2002:a05:6a00:800e:b0:736:5f75:4a3b with SMTP id
 d2e1a72fcca58-7409cf1d2a0mr2219926b3a.7.1746593814450; 
 Tue, 06 May 2025 21:56:54 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058dbb8c1sm10072405b3a.49.2025.05.06.21.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 21:56:53 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Tue,  6 May 2025 21:56:50 -0700
Message-Id: <20250507045650.5514-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746593814; x=1747198614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pfVigT2cNQp6KEUfkFLB8EGzqJliAPFnOyeDqvIsls4=;
 b=LNwTsjjXfCSgzoo2kpf0JmJGk5udvCtUdgNTI9gWohrmYpRlGS9q6dHuxrYPMG98mE
 dNNRQRlsjKRVsvABfjGNkeFUzQ2oc4Zk/Ui2zhsBHBEmf9hAg4WuSWTUYMv/DgT8n+vj
 RVsK2+g+AxGu/OwwlTwfc40Bw9QcGg30GjVHKPF3p/kVhwCBuVPPG9Omfiertz4eU+Qr
 Mh/a8aqArAYjLQJvguQCAqcPmhdTK9a0n2rT7g0d2S2Lgoh7eUX18qwmy/rX6Oq45D5W
 COl91nmINXPjlg2pxlUUcqOrWr+FYv7bF6SbEKo5GMaGcDrvPSbl/2ZkawaHkQ4L5+7s
 +kwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LNwTsjjX
Subject: [Buildroot] [PATCH 1/1] package/tzdata: bump version to 2025b
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
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index d347bc4560..a1629066ce 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
-sha512  93b8f939d39bdfe451e262666f9099c529c96c49d14c08e3611560ca660e12e16d08a22b145d615e00570fb194881618d6f9a0a617c119ab447be03279d747c3  tzdata2025a.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
+sha512  7d83741f3cae81fac8131994b43c55b6da7328df18b706e5ee40e9b3212bc506e6f8fc90988b18da424ed59eff69bce593f2783b7b5f18eb483a17aeb94258d6  tzdata2025b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 46c65707a7..32607268d8 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2025a
+TZDATA_VERSION = 2025b
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

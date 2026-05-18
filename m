Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A1CCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 13:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A5F83DD8;
	Mon, 18 May 2026 13:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPBfbfTEELL9; Mon, 18 May 2026 13:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CED885B94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779110506;
	bh=Mfs93wNMvGIw/NOgBiPdyrE8Oe8hz5J3DyAdOFAT6fU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RE971Yxx6QLB4RUXJ+d1AzCsPf7PczawCper6lXjHczSZRHAIAQy0/YKlK3IXAs95
	 4inaMBhK/JG97NHXh9f+t6QSrkn4124iDZQOwp93qluuiZGpKTzLmiexJIwcIs2bh7
	 AStl2iq/K7tvD82T6n3QFSL3PtpcCs5NOBbyzvDtkiitRTnzyBfEbghYqyvNkts2O8
	 DW/kFL7I8xro740wbI8c6rV2+jj9SOoJqXJIZOyM0SPD9wmNfSmbroRKOvQ/9orItG
	 n74rvENHF9sV4KQHoMoLLUYcPW1SEJaW+qzGtObxo79vjK7ac3E3TRzEmqeLATkjBt
	 73riJnKL7s2Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CED885B94;
	Mon, 18 May 2026 13:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D001265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6B936119D
 for <buildroot@buildroot.org>; Mon, 18 May 2026 13:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDGLUEr8KEPC for <buildroot@buildroot.org>;
 Mon, 18 May 2026 13:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E546761194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E546761194
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E546761194
 for <buildroot@buildroot.org>; Mon, 18 May 2026 13:21:43 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso1306532f8f.0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 06:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779110502; x=1779715302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDMbZ22FDv74QkYt5LwsGiWDugkKHRQVxK6r65kPpBE=;
 b=Zgbou8uOkFNfqY/hO3MLEswz1+LnyUYxHONtQLpGZi98rNHcEMJytukVNmijxfmhKF
 FpGsxOmrTNyscmviNIDCwI7syvfFURwTnZcOjxdzzmmjqp4BCdwhGoJvkEvYSmiMnhtH
 uo0YQf2BGB0Svn9Onf47iETdyqyvcD0AtqpxDOT8/iZJ9tX8Y6lTdP5Uui9SDVhPHaqN
 ocsKUxTEg0QqHNGPSv4DVBf0CKgX5QiCmPFFjBsinOebiGX8bzQP8vGZt3IH/kTYEOVP
 DaJ8qGlAiNS5O0z7qkAsy76nUHAP66o5+rCRMWvhEE4g5vM35U0hq8KocNNM+R+ggnNZ
 TA/A==
X-Gm-Message-State: AOJu0YxRid85Y4EAaULpgjPreyMRpLTWMm0p9wiIfGFn5FAxAARKE4w6
 yVA2Yc7XYAyEYG7LS85r/vM3nwUhsyYU+VEOdOYXr1GyUhrz8TOL15XGAEPjzmx0bfM=
X-Gm-Gg: Acq92OFydzgDbnyyA1dhmyxZFSrDdQlCfv97ogJ4ZM0ThWBqThOr0LYTsC4UUAMiKwS
 GyCt9UmUWJCHet9GPDrLgi8xFzNcQIiK+XJW9WcV2eiinrt+yveh1uYBnyfQteZBl0/UnGoHOQz
 9y1BQINwz6F4xnSAj8yqrWSIR0qu3ez5Xp3y8tT8HVcnU3Vy3dGo1WJGyh3UrjQszB/bmXB7WWs
 F0bm5xYMArUUIi8P9mnqYidmtzXjQxNEjPq8WD79lZymnYZEWpzFjR6RI8jc9pLkPsbhQYYroEu
 /rOEwd7OXEukMQkes59nhQc6CYaJ34wIkn7I+1kYNoiN6Jteqok7PHSfn8IrdMXKUaTmBht09fx
 72TQhKsRnSNva53iymTr0t7fVXVmIwij6esKCQb/YRnE0SY3J8u+0GHbInUHlCeshr8Drc07+fe
 l5gMeOYBVQ3o9nBJU=
X-Received: by 2002:a05:600c:4685:b0:48e:5d91:cfe3 with SMTP id
 5b1f17b1804b1-48fe5fd494dmr232920145e9.1.1779110501457; 
 Mon, 18 May 2026 06:21:41 -0700 (PDT)
Received: from eris.lan ([185.78.76.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab3977sm279432985e9.9.2026.05.18.06.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 06:21:41 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 16:21:12 +0300
Message-ID: <20260518132112.852142-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779110502; x=1779715302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PDMbZ22FDv74QkYt5LwsGiWDugkKHRQVxK6r65kPpBE=;
 b=N/LuOW4njFgMUID3eVc5JGkN2BvXVW1VCBYhtQ8OK/VSYS22tv61pK2C7V6LbPZx4A
 6MMeAhtEYfhhxTcDGn08bEOw5nvD0r0OPReaeos3WckeV87gD/uPasuwgK3ltqVKNO9p
 GkVbWCvbvLh4gmzrmkkhFr/WtEqXzWkfcmBEANBJTlGTKzJaj3/k65j7oMKefyfeQoW7
 ngRyZJk+43JOzdtG0bn3EqMEH2OCF3vvG5Ca/XcyITmv+x5SdGkfbNJfxxJeeke6AkOK
 goZqYuj7J7SvGeVXDbY5+pZsKfv68yoE1WjaI00QPLF5j+PFe0g0AGNbY9OHBZ/veb1t
 QTyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=N/LuOW4n
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 2.3.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index a610b17140..db1c5d5fee 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  da69a0104beb6e51415a59f1571a47beb1eacc65cc6027b250eb1cf13ff4f802  sdbus-cpp-2.2.1.tar.gz
+sha256  8c01d28fa7b1a973d7a9cfdfd65480e733a52172506eaa1fea225b681590fe3c  sdbus-cpp-2.3.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index abe12c05b9..d8743c66b3 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.2.1
+SDBUS_CPP_VERSION = 2.3.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

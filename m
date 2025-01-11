Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B8E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3DE60F6E;
	Sat, 11 Jan 2025 18:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwaZuigR6Ewg; Sat, 11 Jan 2025 18:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEE160F74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFEE160F74;
	Sat, 11 Jan 2025 18:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A797C950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9203A40201
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNNZLvli5RpQ for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FC0A40017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC0A40017
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FC0A40017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:58:24 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a8c7b02d68so20334055ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736621903; x=1737226703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jyOs96xqJNtNIU4sDP25JZTaHZrhuhZcnF+3EtDtwsI=;
 b=PRtATOZ9rUjbkWYRWm5n0UWxU7iH0/xNrc0kyv3s5RZOBT+xJu6Y8khobPCFVQSnQD
 zsvF9tIIpw68wa5ZP3woVn1Rxx/QGpjMMplYUIUrrEID1kLW9I5pkP8Kk4PlCZNKwsMP
 TJK8HUJBVYe0vtAuQ1hIyGCoKZEFtZTJaY5de5W+Z4bQcCID6rf4WvojSm+S9EMLXARW
 DdZhgMPR53lIqIrG1/Vj3DOx/aEnUlfQ/K2qBaP3gAzwUn335YMWAbQp90+tb+hmf07B
 AHeWCPWwj5dSVfcj1zq5mhz3oSaJ9OB8trTiEO2kJE0rmAuAe3409PBzK7v3xTgJykY5
 31ng==
X-Gm-Message-State: AOJu0YwETa8Tx9bN5rauF1HiWwGP5iI/QV9AYm11AA2Klm4P40Ag3vBR
 PMGMzlm19uGhAnL/FVcHLG2kNis+q9HggOyrWp5d56Ob3MqYzw/pm2KbIWpujts=
X-Gm-Gg: ASbGncsR1vtOkMkQyjhParPsTp4PiYKjLCxi29YgvdZraI4jombyzwJvBT/g/LMxVg6
 QI121F5O0O0yKtQZZeUD1gcMsw2nCTZgOB7fdjgRP4gUskCWyEERbFWwY1NMplBY2XZwe2ki6d5
 GgDdL3MxgnyGWhSIEUyAtb6vO4RxcOmr6j1IJrRWu5H5Cilj7ACEj5ZHQ6GmeuqvjoFLn6A8J7C
 3PnUyT/qig+XZCol5FRaTLWlP21IeneYEJLYWxtdG1n0jYb9ABpxjJ5K0cSgRTAer6QKW+Chi0i
 ugcjsg42ABBn1Wq4eVGHcQh0UbI8mSg=
X-Google-Smtp-Source: AGHT+IGVf6vRKPZ7aWs4gSq0YaiLtvsD/jLTBFixn/RRExcTJi3RGc+QlJKLP9dIWLpLstHwfMiIUw==
X-Received: by 2002:a05:6e02:1fe6:b0:3ce:568:b62a with SMTP id
 e9e14a558f8ab-3ce3a88ac9amr120031935ab.14.1736621903045; 
 Sat, 11 Jan 2025 10:58:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b718a29sm1665772173.87.2025.01.11.10.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:58:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:58:21 -0700
Message-Id: <20250111185821.2958289-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736621903; x=1737226703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jyOs96xqJNtNIU4sDP25JZTaHZrhuhZcnF+3EtDtwsI=;
 b=INzem1vueAZHyDN+I8QU2Y2QDD1YECYA15k7jUxTNH236xBxhRYNhJpL9+kmKu3rf9
 GXraAAaG3HSj9gdFOWRqjs/3plVzHIAQ1bTsjaBghp/++Ulf9QyT/s2flQf70avVjhaF
 8lbQyB+KBGlmErshwVmn4/6pQ3qKMw47e4nweg1tXjLrrKyBDP7spCBveTNWYYOeTN1G
 P08y2whJ4yY0NgdZA+HEW4EkjxINcc/3UE5jT/Cg87Mry4ZnkfSAI5isjyoMC10RPcQM
 dMNC3TWF5Qdu6rDTVn9ZIXbptJhIgICJFzmRZ07aQJRz71PAMei2BUaHAkowB48MnWB0
 chdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=INzem1vu
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 63.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 3e27405846..0d39d55aae 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  3c9e76bdee0db8aaef391d658cbdcb7c  weasyprint-63.0.tar.gz
-sha256  ec24c64fdcc63e4168b2c24eb89b1ee8a711281a7d7fdb3eed3f54995489c9d1  weasyprint-63.0.tar.gz
+md5  219b0f3ea8247e97f16477d509ee0f40  weasyprint-63.1.tar.gz
+sha256  cb424e63e8dd3f14195bfe5f203527646aa40a2f00ac819f9d39b8304cec0044  weasyprint-63.1.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 2619351cde..583af799b1 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 63.0
+PYTHON_WEASYPRINT_VERSION = 63.1
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/78/57/213cd566b7e14130d62babd91c5c5c2b94cbdbcdc0c7a0936a236bc88db0
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/2b/f0/1ac7d241b8cabaaf047278ef67b64869473a4e0a2218a1cbc0a6ffb0d8fd
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

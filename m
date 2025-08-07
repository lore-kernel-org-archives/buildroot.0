Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E8AC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 15:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1BC260A9E;
	Thu,  7 Aug 2025 15:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgLQrdh9HuPi; Thu,  7 Aug 2025 15:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D480608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D480608A9;
	Thu,  7 Aug 2025 15:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC4A31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 15:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0525841FB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 15:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHgwYvNB7guZ for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 15:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEE8583D4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE8583D4B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEE8583D4B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 15:29:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459e20ec1d9so11387235e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 08:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754580558; x=1755185358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IhHd5fUwS0zJE9T/yuwTCR6sQPefl0WLY5AX4IQeKYs=;
 b=uhZ8uV7uhk0CcymiM2cdmp4HPieKVZQneOVMXKGuGv9QTysfWKkxIviYMqwUp5UH1F
 hMjFYqkFq5cC2k+kYgIOEQgAAr/achbY/3cxDiFZXvPg3NT3qEDTwsB05rHG2zK/+n7N
 hxvO4yXcqIcdDFqjIrEJ3WzluQoeWPX7Ml79BjKBBDuyOKltYY0wNztNcHLAM16IQnYL
 Lprb7ZVFK40ix9W7uMO02bxVeHcq/tZX7FG9DgPHWtB+CN+D9ICvO7oTVRhZELfYeZj+
 BFrTBEQxEGg37lRFY0bSuJPQuuTRYzZWkXofi0wBTCJHHgZLZrkVPJQqEGTdvv+Zf3I4
 sPYw==
X-Gm-Message-State: AOJu0YwsU1bWthtBalVg5XY7TRK7OIQIb2o/JZYP4tmyDis81E+9nrIv
 4bUPbOqQyn5CEZYxE8oflMFAtQHN43QYLpO5GQuAtodafBG14kKgz+CgO237EDJpy6zhHqdxFwS
 Y59Gy
X-Gm-Gg: ASbGnct3qExqG5E7hOdQaqgmdkbvLXth2AvN5bL3bH+hg1fZoSabN94qg5lMcRqL2Wg
 54pxfHi9f2lVgQtTNV+mmvmyKT42k/A/v6v40MwL4I+RmH5bonXEaCAnJhAMgXgZQqQnc1dNEOl
 Uo98IexobYoHQbDSVHRrWLjntHf6Bd57qjpEdnR3NPSCWy8vFL3IHN99VmtsUvIgUF/0Ewq5sk8
 eijgLDm4zPeEeuS+YA3Fc4/3tVTCVuPYNPbGGy0yVomNxyWmjU1c9ALq0JjCW+4NYaSKZee/Wfq
 vn2iG/H6bNhDnyzkHUfmrBA1gUqjZuh8n7+4CbiN+/F0hcWVJfGJBcIBlsv0i5fefDLkQtGVAAC
 p8AjCY1DLhnaURjKQ5pUT1eJPKIp4Nz6/+sXIsJLaU3eG/aEaIJUZXhw=
X-Google-Smtp-Source: AGHT+IG0WmLH4Q3jKfhkm4A2dnWN7EvApN6GadtFBbZSsoS/xME/8m4TnGjLbXQHNz/AhWlJSAU3mg==
X-Received: by 2002:a05:6000:4205:b0:3b7:9173:692e with SMTP id
 ffacd0b85a97d-3b8f48eb0d9mr5422189f8f.25.1754580558146; 
 Thu, 07 Aug 2025 08:29:18 -0700 (PDT)
Received: from sah2lpt241.be.softathome.com ([149.6.134.59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ded356b9sm166618595e9.12.2025.08.07.08.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:29:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 17:29:06 +0200
Message-Id: <20250807152907.3225581-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754580558; x=1755185358; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IhHd5fUwS0zJE9T/yuwTCR6sQPefl0WLY5AX4IQeKYs=;
 b=ctBZyjEaq8K5sQ8gEzKU8Jzua4feqkxM4uVzaSXj2f7cZHqn3qTxHmK2+jHHqeqlXQ
 ta//oN03MX1gLObxLu1Qq0JZT4MassL11TUpcH3yoz6fvVZtI0XQOhF7yzefv2XgXoHE
 yV52TeHvlDVsmkpSRvPC3b3Y0qh9wwv6o1BTFlKjwJnYJQSAYmklhExV2Pqeln+DYLWL
 x99PFa0dQXg3RjgsNAnZwwMn2u9GVvHY0hAxfd3Jhkz94t+zeMSDKM2zuHOLsjRhz0Ta
 zvXxj+rM/cPBkIJ2bSFHVEExPXJfMkYLmK8duhwwTcWOGGKeaizmTxLmbzg7pALzURua
 O9vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ctBZyjEa
Subject: [Buildroot] [PATCH 1/2] package/luajit: add CPE_VERSION & CPE_UPDATE
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

Since this package hasn't had a proper release in a while this patch set
the CPE_VERSION and CPE_UPDATE to the latest tags available.

The annotation available on NVD all refers to this last available
version `cpe:2.3:a:luajit:luajit:2.1.0:beta3:*:*:*:*:*:*`.

See https://nvd.nist.gov/vuln/detail/CVE-2020-15890 for instance.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luajit/luajit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index b030a16cfc..ebec4d87ac 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -9,6 +9,8 @@ LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 LUAJIT_CPE_ID_VENDOR = luajit
+LUAJIT_CPE_ID_VERSION = 2.1.0
+LUAJIT_CPE_ID_UPDATE = beta3
 
 LUAJIT_INSTALL_STAGING = YES
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

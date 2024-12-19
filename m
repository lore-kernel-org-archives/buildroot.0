Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE45CE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 22:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6054580CF0;
	Thu, 19 Dec 2024 22:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQ18cHr-Jr4k; Thu, 19 Dec 2024 22:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C07A80C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C07A80C99;
	Thu, 19 Dec 2024 22:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 647CD920
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 22:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4551460756
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 22:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3DGGxF0yaRA for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 22:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98E936074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E936074C
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98E936074C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 22:47:18 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so110188039f.0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 14:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734648437; x=1735253237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKO4oImdHweRjlpp4pi3JOICjm6uu/5fJfllB4uP5y4=;
 b=ZXSUTYTyBRKJ1TNzaA7Gw/nTaZkr1Ym5/kszvxjTmYva4kelgkHUfl6trRnKfC/vDy
 bk649MehtHLHoZJwyGE8+eLxY4ntdeMJmesHFrQOcbb8VmKUUc4PwAnbh08IZmXhyy4j
 lJDr+A1fZ+h+HRyJoiKyLnzfxYZQmOU9qfEVMQy91SAdqPWttIcfxSbJqwFSSnHOWJAQ
 iU+8SycDbyCztjf5WIv5sV+95L4vAhZsmofd6fP8PJ+S9hoPE5vekKFdqEgbSv7hh8wu
 nS49YuesmbBJd/JuMsJCPiZyQJJYGtAfgzZLMGyR7Ni8XZXgJTsygNI8eCCp8i+AN0co
 gxxQ==
X-Gm-Message-State: AOJu0YxJGBdeKr/z8DmGZHEqzkHfPPzsscCQrNOCqJG6oASLygIYgYyz
 IDzVe7mD4+Tmi0WNoddcF/v7OZA2x14shlN9CTtsK/pM8sF5jKbQAJjUvfY30Eo=
X-Gm-Gg: ASbGncs8vMfSYupLvYoJK/GAcdyWH6k4HOc0liW8ZWyKyIC85vBERN66OtFKVqoAhUQ
 1120EaOf1i84lHGf6X/9TRzDNWIxGBcbHGkXKmcvKGe4uzjvhUl7e873vcatH8aHxsAsh5TwxfL
 FhncjE88mLQF7PugTahaJbSLZCucbT/pYr4uw90C+CwVAvnjhxLYptjy6mO8vKRPty+gVt7iAis
 jJveFTsmInjeyuPy/clNzh0QFguhCd8xnRHti+TszrWZA+ycCwfXq2/If2hMRk1mNADf3S7bNCH
 49I6vtESx++P+ig1NPmCk9YsPvi+UpFxUg==
X-Google-Smtp-Source: AGHT+IHqRa8DYGsAQU5HTePUGmRHGxfkacRqdso4e5jG4LNqnApz51SlacZGM6a2ml28kJdW51IWtA==
X-Received: by 2002:a05:6602:3f92:b0:843:ebf1:16df with SMTP id
 ca18e2360f4ac-8499e65898emr44938539f.10.1734648435895; 
 Thu, 19 Dec 2024 14:47:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c221649sm501057173.150.2024.12.19.14.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:47:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Dec 2024 15:47:13 -0700
Message-Id: <20241219224713.989560-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734648437; x=1735253237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SKO4oImdHweRjlpp4pi3JOICjm6uu/5fJfllB4uP5y4=;
 b=dhw51aivFVa4rv3m05V39fKFiSNi86Eh1Z1f+wPw64FS93unamclHLBEu1z8DDRXsb
 SpH2MiB5URoLOaDP2nn7wltxvbaBUf1E9SIoFIu7b7IB8ohlsrSLCnB6dm+OuG15KRvw
 WSBOorNxw844D2Be3TfcpJUjo3VDUbKnewkTOYH4F/Zfz2vFNkWpKOnPSy+SMFhHAnU6
 ZdMpD/CbM9FGmUDSeEcHUjNglYvwtrhwwCMQbN21g2WhwL9f34bkXURml7HqN6d1zYks
 C4GU5nBqIzk4O4DfRT2kHSd2cT1zgcXhde4+7P1agSH3Bt1fU5ThaZK9TjLo4pX1c/7O
 kjCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dhw51aiv
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2024.12.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index e924d12481..3d02b78b6f 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f96b703ea848bc538322eb957749b0b2395e0cf83213cf310cbde0a3f598eac4  cloudflared-2024.9.1-go2.tar.gz
+sha256  48b9c54d79419d0489baadb8cb54d5196e0ff17650fb9eff81de02989fa8b009  cloudflared-2024.12.2-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 68849e9b82..78b46f9d0e 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2024.9.1
+CLOUDFLARED_VERSION = 2024.12.2
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAE6C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 04:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5A381F83;
	Sun, 13 Jul 2025 04:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmk8MFNrKa_n; Sun, 13 Jul 2025 04:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D9F581F8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D9F581F8C;
	Sun, 13 Jul 2025 04:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0EB7106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 04:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6B0060AA1
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 04:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_8PaZDuXrr9 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 04:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6C0860A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6C0860A97
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6C0860A97
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 04:00:58 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-74af4af04fdso3343094b3a.1
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 21:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752379258; x=1752984058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ykxZTF2B5RtwoX/14iGbnhCXLU7iEngT6ZMpzQOg8g=;
 b=MLPryBRGmFAtNT1TyAUaPojT0SNIZe/JsMZD5lKLaxvJS+tlwA2XyeoiRTNT2pZ9st
 dfnJSj0gwP0r+Z2rPFrkzleuNx9bnQJkc3y+DCgMoF04TFPGBF6ZGDKRURnuvVwkhs0i
 1z8VPwJFibEO/AkJixgoBRrGmV4DR4mX2CjmOUwAtIp7ENG+BXoCIraZSjzuokjP94VW
 XWeWujs8dTu1WMMPFF8EEI80SI69deUcm37S0pvZQq0hToWryM4kwOsPbSFSqHHi4Qqb
 MlX2mxtsDgISN0HqD5mVdbcC3FcPm7U5SE47aJMdm3fK70WDgPChSxCMsqHoA4Vxostj
 qz7Q==
X-Gm-Message-State: AOJu0Ywa1LwTJWOe8rWROpRfnXUn2qHuNdFto+3VC3Sl2c72KkAn67Ob
 loIgeQShzTr69w2z1WbL6KnzcvJ22rUze8wTeXU4aq4K/qy2b3W3PCRPwfvC8Q==
X-Gm-Gg: ASbGncvA3nVwerXL95glQuFHsRwphbWo55noKnI/r120HM7s1sbz5LZyFSxLDN9svbD
 oxODJ4OvxK7dJTGyGr3eZo8bPqz/+wnECYhU0OE60aL+G6SdWMFH8SGa8WXcc+Qv6HD185xnatU
 evc/AxTkwJ6eV8Hxo2kW1xBfxTomNNJ3OkUUqtKQE1zFOJ4EnX81e2wB4P2f5qDjSvsF6paiQhm
 1A7+5GVwB3fr4SdZFd/KPf8TWkzOAJ7eULP9kT8MPQ3MSNBRQ61xIi6tfr8elODEii4RKpj45gi
 QjyHOlG0W7rmIxMDzRBOtzWtRhv9dCe2Q+S7xh+/w2aQuDbQ5i2sqf6apbgb2aJ/jqor5BV59n9
 5YUfpsPzrYi2f5zGWNn6oFokGJZmqww==
X-Google-Smtp-Source: AGHT+IGDm4QzJq+FwEpsnnQFG2dTX8Bj0jHJQ4S9uWYJYAFdkpPzk45LC2/BC7dA/46zWF8fpyvVig==
X-Received: by 2002:a05:6a00:b90:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-74ed0f37dbbmr11776009b3a.7.1752379257493; 
 Sat, 12 Jul 2025 21:00:57 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4af33sm7705806b3a.122.2025.07.12.21.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 21:00:56 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Sun, 13 Jul 2025 12:00:44 +0800
Message-ID: <20250713040046.105851-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752379258; x=1752984058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ykxZTF2B5RtwoX/14iGbnhCXLU7iEngT6ZMpzQOg8g=;
 b=P0dyjDSihTS2zvlTdz+kyjwPXKzDZbMQy8QQM27S6SMvGJzEh5XkFSqg7KumlrHpml
 TSp0FlSSfvBetak3b0MXQQOI2ac5vVYPmfW/bvj74YUZKG9ZoHWODpWlL8/joHflexve
 tLsl3MWStJlT/CrjX9UEE0/V/TZnpvUmdSGPUO4Fj3QPP00XbcAjDBf0uORH9ArNuq9r
 +WSkX56izMYrhzNfF9irRfVMx8UNj9vAbdcD33dThCQA5AMTe7bLGTYi5xGqcKDdaBRL
 HK7AezlkWLFJungUc26mGUlViA35WM/GG0jL1xRW3q89xHlLZZz7/6y2QicVo0RGnEzn
 TZXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P0dyjDSi
Subject: [Buildroot] [PATCH] package/chrony: bump to version 4.7
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

Release notes: https://chrony-project.org/news.html

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 25535e723e..75555fed9e 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
-sha256  571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  chrony-4.6.1.tar.gz
+# https://chrony-project.org/releases/chrony-4.7-tar-gz-asc.txt
+sha256  c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b  chrony-4.7.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 642e1d8fd6..f2aca81d60 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.6.1
+CHRONY_VERSION = 4.7
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

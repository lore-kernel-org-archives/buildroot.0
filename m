Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9A7E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C8C4130D;
	Sat, 11 Jan 2025 15:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGIqOA03knSL; Sat, 11 Jan 2025 15:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC66E4130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC66E4130E;
	Sat, 11 Jan 2025 15:49:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B216942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C1FB61098
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IC28hhwKLDiR for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:49:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D94E61096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D94E61096
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D94E61096
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:49:04 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3ad272538e8so13801295ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736610543; x=1737215343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l/ZPlHHobnmHWFO2hxP1GbgcaJPZP8buxKLcQgeCUoE=;
 b=SljWCW2UWHJhpghnzTIw2WcvVsb1hW78wa1j5LWwccy58RqGrDJ+S8tigO+AVF5HB3
 4PvxWOVb8PhjKUpR5kZd1GAP8/TK1e160vzIhYa+JjYLpEa9ZvwY1Zs4ervUaKsgpKYP
 qrVTVXV+2hFeUGmqnQzVo3lrvo4dMLjTivyG7LRelArviHp67lLNaMYyb1FOr3JrNcDQ
 wf4hG4lZbKZ9ApIflBU1g2L+a1MxRG9E0Nf2pNogmcaifvdXV7zweRdm70TglB5mEl2R
 QIs4zSg6NUUYhVN+9je3HCgsdhYr/LdmjFgeNEeNS82u0LRSaaedpEjd4+I3YsczbjZ9
 oqxg==
X-Gm-Message-State: AOJu0YxwpLwxAqKE7vn2uWwTWTwlF5Ibx5qr/9u4y+UQzM2aQ6kDz43w
 7nBvmhzHVAeq1uryE2XODRO6/pixlF0SDarVwCuWnx4eBqp16d6D014dYB4MD1o=
X-Gm-Gg: ASbGncs6Cb3QGaJ+56qzngpxlkv2ikzCul0ZIhb1M/evL+U+D0jjZs+ZShtfA0UKM51
 rjbOecstluI+x8wPGBeUHhF+wVdpYmgM67bWMfDlZ1vfgtgAIWBdUpihYb928a+pDpLhOyKGfLY
 ZxQcGYbnLpRKKg9rmOW9Pd/TjzfkeRv8HkwlvjgA+eQnERdTInofPQU5+vLf7Q0SgzRTeTYr0EW
 CzRoFBpt8nAwTDlTBKh6ElU6JjgXS3tR6K8D2lHXDr4Q140Nl6CuxqJm5z5azJPT0mNv0U5IubA
 cJ2DtktTquyQKGCJYRgLa3w5XknOqUo=
X-Google-Smtp-Source: AGHT+IGpA3Ttk/v2xKMYxR8ZGDLJny1QxQAyUZsq25N5fuZDIuj6XsnRLjFhfdD5mDZrGRhLYdx4Nw==
X-Received: by 2002:a05:6e02:1605:b0:3ce:3395:f7b1 with SMTP id
 e9e14a558f8ab-3ce475fbc60mr73796825ab.9.1736610543308; 
 Sat, 11 Jan 2025 07:49:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7459e9sm1579709173.118.2025.01.11.07.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:49:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:49:01 -0700
Message-Id: <20250111154901.2857863-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736610543; x=1737215343; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l/ZPlHHobnmHWFO2hxP1GbgcaJPZP8buxKLcQgeCUoE=;
 b=Zd0+P09KQBMMu+ILjLQz75k4qACF6+DbmAhUbMXmJIl3ftKl/Q7NzBnCmSabaG1rE6
 6jCI6l3BOs/pGdFqge2zoJ1TItieHqhlOcFCX3lSUMMmZzhOT/YpJXxLnZ9pxGu0cLDL
 xF1xOvsguxZHZZMNwdsoTLjPgfzCbqRiYqGo5cntcnXweNIkPOFOS8D1tAse25/lpxxF
 Ew2w1DnCY/xqRGe9Xd3EpSsoSsc63/+m8eDtk4RCtHDBiQj/+Zq7i4wm+Cp9cbzRtHFS
 v5YlS//0RtGzDguZTeNrPbWTq7Tji47+aRtelB/5uEHirnXDm3EHiwRVlXq8Le5kbJiG
 ty4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zd0+P09K
Subject: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version 2.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index a6c8d90853..8eaf7ece50 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  88c9dbeb3e6302c7db813195e202420a  pyjwt-2.9.0.tar.gz
-sha256  7e1e5b56cc735432a7369cbfa0efe50fa113ebecdc04ae6922deba8b84582d0c  pyjwt-2.9.0.tar.gz
+md5  f3273aaf736c24795e78ac48adbab111  pyjwt-2.10.1.tar.gz
+sha256  3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953  pyjwt-2.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 084d4ac802..18e84b7838 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.9.0
+PYTHON_PYJWT_VERSION = 2.10.1
 PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/fb/68/ce067f09fca4abeca8771fe667d89cc347d1e99da3e093112ac329c6020e
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/e7/46/bd74733ff231675599650d3e47f361794b22ef3e3770998dda30d3b63726
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

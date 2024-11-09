Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7882FD5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD9B82106;
	Sat,  9 Nov 2024 17:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j42ymluV3Rnw; Sat,  9 Nov 2024 17:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B8282115
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B8282115;
	Sat,  9 Nov 2024 17:15:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05334D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6F2A8409C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDsN7BOHWq6F for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE38A82115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE38A82115
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE38A82115
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:15:07 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a6af694220so11844935ab.1
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 09:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731172506; x=1731777306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=evahNZvlQPgcxqrXGdPS6B9+fS7WDTRbcwZGBZQxJAc=;
 b=GMwVER3BxuRLVQ1gsc0+MCCRYN+HNTt29KcP68VvDmqV0XC5wQqfL+oYkMIZSxI/iI
 J/2kQBTr5lGgy47ZkiCFeb/EH9PDYCc58F0dUz6jupwy+iJdlXPW4aYkXVotUASf1/jF
 zlazCqZgMwrvLns2HvHIklV327sLGbhl+9E2+mg7wkCcAAMLMJ904XTbkWP8Yqz719/h
 ROfeqQ9I9mUUpWUCtFqqJlRolVeyMnAd8o5PSXaL/Go5Aj9oghalp2yRESnSXs8LTche
 EkkusE4fHbJ4vLYfmmbKG/5ILvMprF11Cs6I88wuj0i8DtpZ1XA9pM95wulPZnANKw9u
 kz4g==
X-Gm-Message-State: AOJu0YyuNmH2rYkiz+Krx1C4QWpXXtYvrNdh2Bqh5t1Dl4UdjyrxJg0r
 qFjHA8gNlfiCefRvBLW2ED4hww/jpvycisV50n9I0EreAMX72r34H5ttCgIP
X-Google-Smtp-Source: AGHT+IENAYx/7ZSBzXiG9tTgK/eOR2PZSr0gCB3loM2pLuc6pBcLmsQvz/PF+v4VebGlZbCAXSV4lw==
X-Received: by 2002:a05:6e02:19c8:b0:3a3:9792:e9e8 with SMTP id
 e9e14a558f8ab-3a6f19e85edmr66502455ab.5.1731172506266; 
 Sat, 09 Nov 2024 09:15:06 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9842f2asm4154715ab.37.2024.11.09.09.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:15:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 10:15:04 -0700
Message-Id: <20241109171504.595484-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731172506; x=1731777306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=evahNZvlQPgcxqrXGdPS6B9+fS7WDTRbcwZGBZQxJAc=;
 b=Bv8RB7HEtGeKzKE6yq5J4DH1nprLVsabmIWvOuwP9FVA9vIEJE5wtcDDRfFLS8Puw5
 sjh2sk1WSADZxGKquzKw6f/84dP6eS98NGvanA/emPKaSvCfxOBIZcOJ4Yoj7lr4ySMH
 efbRlYwGqzw9zJqV0VE8FcWnvEYpldkisu2DPtW7vdIfNg1JUogl4DBgKia817E7BFIT
 obTLW5qSAlcw5JOc5qft5zaw0DAxN3qXnFUzH7Uro3FOZ17M1rTTTK1+dhU+Ad7n3H8G
 ufbumOOv2nwkm1NTtLs0TldxcboF+T80jIWMo32qwCA8e0VqCUdopKOu44tsQ3hOAW9y
 atmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bv8RB7HE
Subject: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to version
 2024.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index ca5867cf16..b53830f4cb 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  1bd2cb19c8d9da652e4d7c5be16c7d20  dtschema-2024.9.tar.gz
-sha256  1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2  dtschema-2024.9.tar.gz
+md5  e4ecd1925af81376865ce0169dc1146a  dtschema-2024.11.tar.gz
+sha256  bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047  dtschema-2024.11.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index c848b547c0..13ccc16e95 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2024.9
+PYTHON_DTSCHEMA_VERSION = 2024.11
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/6e/ed/38406756269a83b341ceb5884874692f18eeae820b70a198e8f3699c11da
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/b7/e2/260c0429118b1555ddc2d0d465b7ab36e76ab2454a3d1a916ef06dffccca
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

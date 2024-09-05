Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89644CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4856C40175;
	Thu,  5 Sep 2024 19:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDM-jc5rFXjv; Thu,  5 Sep 2024 19:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FDEE40391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FDEE40391;
	Thu,  5 Sep 2024 19:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 019A91BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE3FD406F7
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGvD7vdyg2ui for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93865406F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93865406F6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93865406F6
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:40:35 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-39fdd5c44d3so4810595ab.3
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 12:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725565234; x=1726170034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4mc8U07B2lMCi8QNWG0QL6+Zy9RyUBRNW0gw1fL3SkY=;
 b=Tf915GTvj8JmmXgT0lbkoX8xO7kkjpyXi25jAONNg68rH77y/B3wWTAAY9RWHPyRGa
 gbyITHD/ha2TWQvYlLxNSFWDte8M0TlEYrAEH8I1TnGEbi9QBryduK2r9ht1k9UyYIRF
 evQDe+hJY8EXjPnLCTkFgXIbExslhpzPfvIu22Ey17NIlw8QGF4hXOo1yxLpaLXJKwCi
 pMTeiTmbwf+h1s8SM9YwDr7R4mVmIfEyjOsYM4XXUgzKl7YIm3gEEy2g/OifJ4RGKelV
 KTd0vJP1ZWkEdA+kNPSiwLkbJzcr3xKHgVGOjzWGLrx9+Z4jaQJS9hHnAbSIJi8XFOmJ
 ekLw==
X-Gm-Message-State: AOJu0YwcKNDWy3FQQu2SlBD26M/TaGUPVSxkW5CTze2MyBP8fEXyUaYb
 9m47gNoKTTH0I/cug6kYBVv143s+VyKyy8EEF8jhnTUz7gaDfANWbFOY+Q==
X-Google-Smtp-Source: AGHT+IF9s8MTbzKJnikN5jVc46CbDDZGqYYu45sNenz67Yg/Vlo/fGwHCcN/7VLomOkmX1URyxa4cg==
X-Received: by 2002:a05:6e02:1a88:b0:39b:2ceb:1a23 with SMTP id
 e9e14a558f8ab-3a04f069c7bmr3436645ab.3.1725565233854; 
 Thu, 05 Sep 2024 12:40:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f524955e8sm31671135ab.40.2024.09.05.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 12:40:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 13:40:23 -0600
Message-Id: <20240905194023.1103271-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725565234; x=1726170034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4mc8U07B2lMCi8QNWG0QL6+Zy9RyUBRNW0gw1fL3SkY=;
 b=N8n4lTAjinodkGoPxaSDRgvpZeD9hzJ8s2MhdyWykzcAnTVVhojrRH1EFCp2nPIxEB
 /z3vcrFft9NmvAchZixjnOuZWDc6KhnYr5ydoJde9Rc97S3q5GjDBunb4wbjFyuYfO1+
 z+wxTnZIy1Qu1krURgNh41xZ9D4qPwI2PjrcNUGVJ39sjkWSKxu4NaTBty6+XMIaadO5
 Pk5BDOm48/OT21DE0OWJhREOnxmxkP+KCdeTLJVFhO7EgeTV0I5NCBi+6t3N3Kv16ljp
 02AQCAK8QisfX7smvPqo90OETn9f5CSOjghzIST8e1DQOeBX30M4wbB7HikDtfrcguJK
 Pb7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N8n4lTAj
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 1.17.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 0573d6ec06..2847d38b55 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  0bcaed453da3004d0bea103038345c1e  cffi-1.16.0.tar.gz
-sha256  bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0  cffi-1.16.0.tar.gz
+md5  4336ca58b2df0cc3b163884d5fa2e5e2  cffi-1.17.1.tar.gz
+sha256  1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824  cffi-1.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 1f83db079b..152009e8ca 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.16.0
+PYTHON_CFFI_VERSION = 1.17.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/68/ce/95b0bae7968c65473e1298efb042e10cafc7bafc14d9e4f154008241c91d
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

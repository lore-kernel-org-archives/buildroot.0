Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C6CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E87A6124E;
	Wed, 22 Oct 2025 16:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDkvAfDQsi46; Wed, 22 Oct 2025 16:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ACC661248
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ACC661248;
	Wed, 22 Oct 2025 16:40:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 722BFDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C3A61248
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOmVzJfZZOnb for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7239B61240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7239B61240
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7239B61240
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:40:56 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b40f11a1027so1411170266b.2
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761151254; x=1761756054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4QdYONNIXAKqUv3gwhP9YJYQYd4btQabTtVJB3/0+j4=;
 b=HZPHYE56EWGRD3IYQaoONY1HB+G70O2oQ3PEJCIEFjGnYv0tYnpuHZVKgnhSDKyZ7S
 AgWYl1KCZtj69VH3QsC+kxQUOubStpTkmosLURmTHsJY8sSGaIBXi2rA8oqPwNo1kg4k
 oVkCD6qDp/LunZExvE4jc1DxmVc3NR3FK7C7eJbTEpmDmXEt+T4AQ84DZVY2fxaFWOY3
 fKsYjfKxb13EjTUTwoFQUYqFP0nISZl09V3+8aGGC/u9K4qo6b/rtW8hdciSdIOZhYqM
 E4QnQmpdagLqLBPVMhP4gmqk5CvHemasAx5PRN78PR/ZU8gB8S8031njB0toVuIJWHq5
 o1dw==
X-Gm-Message-State: AOJu0Yz5S7wHA20meBIOCoPhZdhS3PO0LDOfNQIbH7b17vXoT9l7GY+A
 7herIVfhKx4lWlhVALd0cTgpaBNYTv3SKeUCtuiph+TrM6xew3wll/IC/dfscfiQOtXTCPC7mA2
 A4mdq
X-Gm-Gg: ASbGncv5mOyIM3Vt9NWmiWn8h4jZY2YIWHttRW1UcnGOKub8HPfxWRmkT1zpz2vLPIk
 4EEpgYZe2Bj7bjYWz/DvgrrJV9PNCR5ziYHVL+DiqlrhwMbwDmlZvgtE59hITKnZqPXrqjZPE18
 2jQVKY2O4nRrHW+k9xpj0+6YFR97Ewh0eAym7sbUu34sH5VhFVG+iI2S0nYtrFhqa7xL/gJSmxz
 8EQaTTqW7i6Y/PNvmDCMbkOeqacm1I+wJzoHJXoXgcvIeNDq18Mx/4xhZtZUxD9uwdwNwM4JGTR
 bPC51sAyA8TFjMWwmz3DkNj62NzAPDiKYjKGa+ltDjxvPl8OFqxKoykVybTQJWQ/uBAUxQAt0k/
 oIzqFhSvSoWiQXmdj6ssE227FsP5aK7+vmwwZtzZwPpTre6ciqgLpZCmW3TZSnlBf6jgzq3MKdX
 fJeT4u5Oah4cKIWgZJ1soK4Pmr1CjTblP7C/g78JQORU5aW7+u
X-Google-Smtp-Source: AGHT+IH+3bdwhix10xiCERqRZOU1MzTkUxEWnbISngOQzr7I9Kb2nEWN++yLnxmpIPWO+qGToKBTbQ==
X-Received: by 2002:a17:907:9448:b0:b04:626e:f43d with SMTP id
 a640c23a62f3a-b64751284f6mr2278676866b.47.1761151254262; 
 Wed, 22 Oct 2025 09:40:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb4dcf2sm1356979966b.75.2025.10.22.09.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:40:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:40:47 +0200
Message-ID: <20251022164047.22401-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761151254; x=1761756054;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4QdYONNIXAKqUv3gwhP9YJYQYd4btQabTtVJB3/0+j4=;
 b=SnEqDO2nLUVD0WhHgdTOIZCY8EBQOPR74Qonnt1QivIh6p5QYyb93bH86SjTdmS0EI
 UGpoIqxBpJe6JclgznYJMjSlNjK9r/ypirGX0ssa3p8qf7v5/O36lC5Uy/7iWEzVbq7w
 BP9f2llAlu5aZFVU3t0COSJLNazqmG7+PAUis=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SnEqDO2n
Subject: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version 2.11
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
https://github.com/storaged-project/libbytesize/blob/2.11/NEWS.rst

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libbytesize/libbytesize.hash | 2 +-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index a52a2803e573..c3962d7bbdd6 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d1ce3be8ac59fd59511d0794c7327d5cf33f1e83496837b17e19ac49400cad1  libbytesize-2.10.tar.gz
+sha256  1f6ce157750ed1201ce83edd3c23d997a615c7da30f9a0e5bb44635f66768d81  libbytesize-2.11.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index 7f56cbcb7930..f163b9ad21a8 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.10
+LIBBYTESIZE_VERSION = 2.11
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

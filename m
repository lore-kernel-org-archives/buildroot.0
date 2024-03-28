Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9570CD11DD
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 17:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F91B82513;
	Thu, 28 Mar 2024 17:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jl9Sr6vIRTOo; Thu, 28 Mar 2024 17:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A0DA82628
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0DA82628;
	Thu, 28 Mar 2024 17:41:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6C4A1BF2F2
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 17:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B8682628
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 17:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qea6Nm5nsmZY for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 17:41:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0555A8224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0555A8224A
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0555A8224A
 for <buildroot@busybox.net>; Thu, 28 Mar 2024 17:41:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so1674337a12.2
 for <buildroot@busybox.net>; Thu, 28 Mar 2024 10:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711647660; x=1712252460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjzIavNefky2c/GiWVbUVJNnTYJer+GV764r8/cquNE=;
 b=r2V9AwgdqYjV/O6CvwHUe/pmgxBpMI2ucYGYSgeR9WD0lNoVtRw7vkRzX8IK4ssYag
 DMaaIciYskFGEEhaoDaP+gYuEneE/avpS+Oop/YPRrIjrwd9I2RXR+HjrbvBoX/H7Hlx
 fwykiZKCf8/O91ZKR5fHZQqXmJAJ8A5SWy/HifOCzpKvQbtb1Am/SMpYtUoa2Ehl0SFK
 zNNmEDYgl72CtpPzpjky6ngoWQ40bwJ3brT72N6+6uiu146YY78GX/FjUqy8R7fC3bbP
 v7UaEkFZ/xGskvGW1CbaA0C8/VqRIqTM8xQpntiDAYz5k7UoUlUWtwyqgNWK5OBcdHGA
 QaLQ==
X-Gm-Message-State: AOJu0YyUj3LTuR2/I+kmadjcTjnufFaKvqlpKEJDIfyLUpc+Lpmqyt2Z
 iCP7oOLp8nXXFk26tf6HDRV8InSaNQFaBJOua54tPmFJGaQmfvizz16gZj5M
X-Google-Smtp-Source: AGHT+IENT504NY4Zc1LhSjwaNYrGpni8R9afv6XcKQl9S9n7LfW9I0AwkjhmT2LZwCXNKZZzdbm5xw==
X-Received: by 2002:a50:8750:0:b0:56b:cfef:b2de with SMTP id
 16-20020a508750000000b0056bcfefb2demr3132866edv.26.1711647659653; 
 Thu, 28 Mar 2024 10:40:59 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 cf2-20020a0564020b8200b0056b0af78d80sm1080665edb.34.2024.03.28.10.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 10:40:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 28 Mar 2024 18:40:52 +0100
Message-Id: <20240328174052.8677-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711647660; x=1712252460; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjzIavNefky2c/GiWVbUVJNnTYJer+GV764r8/cquNE=;
 b=eDbOHr2ZJbU+Q2pJ4Hpkvh5trk97OlhWWWI4e+3N16kjYfUKCx1WSWD6LcX2NQhj6D
 8ducqUnp3xkua3Vdm1FRqUAsNYurrXVHqNfxAjx84l3z7v/uuK2j27cC9wDfVvvkGvM4
 CYfZ/MeW9I9ECS04dN8tgUp8NLaQKxM16V7AzgKYuARbhmSWbl98mXPQXPy8PMJAgr/s
 rAmsNkCqaE3I2DVrUXI6Ov/EXGXX4/10CfBpuuEJ6E2hFawaJ2OqazwrbjbkCwFaq/B5
 12+d/92cSI+EiA269IBFdGbmwkS3CFhH5jI5OnbS1uFeWSyK6YoiSy7Zz7794/FkK4zj
 griA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eDbOHr2Z
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.8.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 40b49dbb8..5d3b54ea9 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954  libressl-3.8.2.tar.gz
+sha256  c0cef9cfe174ac366ce482f542fddb07721e7fa0caface34b49a8720fa37fe7d  libressl-3.8.4.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index b72f3b38c..1d90aa853 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.8.2
+LIBRESSL_VERSION = 3.8.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

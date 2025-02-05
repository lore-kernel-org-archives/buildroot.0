Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AF4C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2681842643;
	Wed,  5 Feb 2025 15:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxUYGB-OHlWH; Wed,  5 Feb 2025 15:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E028D424E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E028D424E7;
	Wed,  5 Feb 2025 15:43:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB72012A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD9380489
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7s76wYNuVlR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9457380BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9457380BB3
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9457380BB3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:43:06 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3d04721eb72so10176925ab.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 07:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738770185; x=1739374985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WCUT+lkDKH5iPmMQLN7XEPb16qSt6LNUT81RTfvNzTQ=;
 b=v11MVniFQLD18XQQ24dlk218rm9Ofon5cSFLGzXS7ZLJKOdcbJuGrzeYW2NjYv8Zsi
 FZvGS7UVZ/UJZbKE50MmYcUF39LTcqiX3mFf3bdrx920n6hTCYcu4H58Xz5bzs4RRw7y
 voWY+gxWG8T+qPNvG5aZACWrUPDgA0uEhsKQUa075htNzc2elfCGyIKhgMnWZmS13sRj
 nD01MbJ0X41vq32JRTKgn3vpq5zPY6AvctCJ85PK2+qcOj7gRMedfMnY8LwKnM/2h1LT
 wgjzlP0vX/LEGoLcpfI+0jFGTW2xIS/5MGof2l7YjA5fkRcQY/l9sPeyduoi+v6Xx+fg
 MvBQ==
X-Gm-Message-State: AOJu0YyN7ipLnODZZGPcFiS+nG+ZJ8ZtGyOMxk/+KhlyZxfLovNDqD4x
 EyfcdPQqoq7vTzwC0tJKkZux3MXlxs5N8zHKOJi1wndlhhDSP4OdxAFrHYgu
X-Gm-Gg: ASbGnctm4PDQMUVWPYT/RuUx4OEowaxl79QAcgmVws0T7vXtaEfWPNrJbM7JxtUbWX4
 ybYalYFGSfj3uF4DqKK8OncNLEbcDM6t0qMYUmgVX2hhAEmimUkt4+GYmwwgJAEgKNY2TOjXhpF
 MXdun4fXsT0+BVCs6G7X60G6f1155VoB7XrO6O9PTmPpA3mVNplis2snigzY27vKz7VgtF9kRdU
 Mq1uet/6VUp1tM5PJ40RniWP6Eneqzs2avBi5f45DS3cjtComFk9mmiLLOg/RjJhxWDqnqpG+hk
 Mo7cLnlgdYamAiSekFzITMDzEzDW8r0dOx0KcG38053WQO0bLHESMqlv7S9ue/36tg==
X-Google-Smtp-Source: AGHT+IEhJg2WJPbtwSTnPQ4mVs9HN2UCIju+srhrDCqM6VyKR8r4LrMcGBivTOTHH7+nNMKvDXxD7w==
X-Received: by 2002:a05:6e02:1a29:b0:3ce:7d8f:3d73 with SMTP id
 e9e14a558f8ab-3d04f3fa26amr30941165ab.1.1738770185429; 
 Wed, 05 Feb 2025 07:43:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d00a51a629sm34595915ab.34.2025.02.05.07.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 07:43:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 08:43:01 -0700
Message-Id: <20250205154301.3302035-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738770185; x=1739374985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WCUT+lkDKH5iPmMQLN7XEPb16qSt6LNUT81RTfvNzTQ=;
 b=fqBvUZqhOEqCjia2h7AwoHdN44qcsnh1y20x+dnUMSHAc3PBDkb9pGJ6B4VCBIntN6
 Y8jtrVClAQCmzdaE+uS7Lxc3Uk3qC4zfhYYYmDhCDR/CLJR/8/c90cYYywEe6rBUNbid
 WVWJ41z6Eh4pGyT4fBHcDMgnYUV/Ed7aL+ibrw5wQuyMoupKyMC/3YcAXyFlZYkwyTzl
 hEu/MfFYta2+gBSXCOQ4uZvpNSzGHj2enOJXOJKRTHM6cddGuVZIDBZGXniA4B2DWh9i
 Ls5K2lLaNdN8lHAVRIyecW1Zq4FkXtbHDXowxjkrhPm2uqFRqHJVpOjZDoiSUrTfj0al
 NohQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fqBvUZqh
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 29.3
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
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 06f4924394..98159ad897 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  3b8bf6e96499a744bd014c60b58f797715a758093abf859f1d902194b8e1f8c9  protobuf-28.1.tar.gz
+sha256  008a11cc56f9b96679b4c285fd05f46d317d685be3ab524b2a310be0fbad987e  protobuf-29.3.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ffed3166c7..4540443702 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 28.1
+PROTOBUF_VERSION = 29.3
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 8ce6039449..1e1833980c 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  44b076f3564d3561067bcc2c455e008a  protobuf-5.28.1.tar.gz
-sha256  42597e938f83bb7f3e4b35f03aa45208d49ae8d5bcb4bc10b9fc825e0ab5e423  protobuf-5.28.1.tar.gz
+md5  26ee22a630b0dbfce4de03adc5600fbc  protobuf-5.29.3.tar.gz
+sha256  5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620  protobuf-5.29.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 02bf2a1d70..898a133d37 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/3c/0b/7a997c8939f698d72bdea14d57116e43d3051fffb3b2964c30938c4a08e6
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f7/d1/e0a911544ca9993e0f17ce6d3cc0932752356c1b0a834397f28e63479344
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

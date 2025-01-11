Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13654E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C082183AA3;
	Sat, 11 Jan 2025 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdDx2U8HPRCU; Sat, 11 Jan 2025 13:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C757783A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C757783A98;
	Sat, 11 Jan 2025 13:11:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9599D942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68FA760641
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fI1lXVj2apA8 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69603605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69603605CB
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69603605CB
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:11:14 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a7d7c1b190so8952375ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 05:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736601073; x=1737205873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TQ3KhQ5spTDBeMagS3fgcQDBhOoYg5LocKD2qde4zk=;
 b=MQfNeWcV1RNj5FocQiO31oFgf3Ptds3hIeZs9XobdSk5lp7q4/HiBYgyQ3VVp6EeQp
 F+ar/6RykKHzukjsMYGzCfxckFH9VrKlUzXhR66nkw8lKoSdVCEDUAT9UgW65H9o0fRA
 7yBm5I6wmtTtWDeXKugcG2Jx6UwjhTDwKdeiL0AOW4t4urk6O7aXNaRS1hUx6iFiO8dm
 zmTZ8UV252seNJRGHGVrOdpwIKsTyVOGK/yq7+h/7nltO91XNyq820TEaj4RHk1eiOsW
 8piU6lkHQz9ho2Ww3sN9c2rCGWTcYbPAuWmLd2luW5Gd94x86EZCpl2lW+8IjAC+z2tU
 ZCGw==
X-Gm-Message-State: AOJu0Yy6hxzBfgzNOn/rfV4sAiVieWf+QKAQ5W8eY6tK2gF2mBIMqbNK
 PBEnl6Cbuirg/0Pf62HsTbBfIvNj7CtT5Q2+tAfnIoDPcza/Sb/J6+JcSjR80HE=
X-Gm-Gg: ASbGnctFG7Pd3WRFHeV+Wa2iLtUg9r1RavsWWvAAIaHAyYv6jM4qNj/G8qJgE6BaN88
 PjZEPt6j0umdmVrbd5OdsB5FnRmmObEA50kDwwBnCuG5qXnCtgXH4SHMu9prrWthjXHZiaeCBZK
 R0FaQFpwrvKcbZJ9SF7308mjwlKoPIv/dVxDj2dG17pApujGjuL8RMubX5ihJAoZCFU3bPoQlpd
 CAAy/Xut9kVznJw8eLR6O8UYrNY+yleuJMioq1Oj7Q0FvzUDpZwnXEFftryvvyqRtGPzVGM2H1D
 gnZN1yqgubwyKYY12AwBtQOoIrJt6GM=
X-Google-Smtp-Source: AGHT+IHhgDxliWIchljceFRepWUTN2R+hq60MZ3cXXJQRtFSkmUY25h8CDPaLU+HF+3bM/SMnQ7ROA==
X-Received: by 2002:a05:6e02:1d0d:b0:3a7:d5a6:1f9d with SMTP id
 e9e14a558f8ab-3ce3a9b5a86mr103309965ab.9.1736601073125; 
 Sat, 11 Jan 2025 05:11:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4ad93a6bsm15295135ab.16.2025.01.11.05.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 05:11:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 06:11:10 -0700
Message-Id: <20250111131110.2463054-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736601073; x=1737205873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+TQ3KhQ5spTDBeMagS3fgcQDBhOoYg5LocKD2qde4zk=;
 b=kNJMzReC3jvNZopEYoSfspAFdL9DogBRjgMwEyHRbY0WN2dWBOA85EiqWteEA418nX
 CjL4uMDQxc63Rimmx1ZsupaMZf+0dOCobT1fYoOqO8OIKn6pCyVmAJJHAf6KWYG7CATf
 LEF7LSdJcMoBOT/8S7ZayEu2e6KIBMfg+LWTQ9J/JtzY5ZR1JEXB8l4j5EGr71nieRnP
 FMDscq46Ll6/7bR20LY1PKAgPp0bjAwrnmWzwRLNn2Wpw68CxYRa/HjScpWtubm1kpaa
 ZPgHcBcn6Wh7ApDI2ZtgGifbOo6ZMw3TDpKmBAM4LfAGChYuGPlLXnL4CS5Qo6zI96P0
 amaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kNJMzReC
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy: bump
 to version 1.2.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-marshmallow-sqlalchemy.hash                        | 4 ++--
 .../python-marshmallow-sqlalchemy.mk                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 68892165f5..20714feb4b 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  1cdbefa0aa35a1205d7e3bb3674743bb  marshmallow_sqlalchemy-1.1.0.tar.gz
-sha256  2ab092da269dafa8a05d51a58409af71a8d2183958ba47143127dd239e0359d8  marshmallow_sqlalchemy-1.1.0.tar.gz
+md5  da3500ba7a5c4eb499c3564748d76ccf  marshmallow_sqlalchemy-1.2.0.tar.gz
+sha256  9787e95d52dc39f351db1ca47a7ca30b593e4f02b5c54592680bc03ce8ce0e79  marshmallow_sqlalchemy-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index a334bec1f5..a1ca926b10 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.1.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.2.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/82/f8/2e565045b17dd60b38aafc3242ac44f5403315df08963501d07463d089ac
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/9f/a7/5ee9c0073c34a2141d4ae5e90a6c131bc859c6f7b3367ba55c6910d48f3b
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

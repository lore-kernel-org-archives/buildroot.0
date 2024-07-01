Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBBAC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A04560AD5;
	Mon,  1 Jul 2024 19:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6kmsiG-9LnV; Mon,  1 Jul 2024 19:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584A860AD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584A860AD6;
	Mon,  1 Jul 2024 19:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF0B1BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2644B41371
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhUVNL_O05Vp for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6FD94136B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6FD94136B
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6FD94136B
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:54:36 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3762c172d9aso14871285ab.2
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719863676; x=1720468476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2azM7mFghbMz3HffHuLvZPbHSRvUjyWkTAM1Z9Ye5bU=;
 b=mMOkI2+KuDRQHloM0HWpd48r+P3rjF3/hEeBHfbIS7DaJKZ5zDfpiXk5HIvjDfW1dL
 4C8jp/EUfUV/cZzpb6T6lxqh8QFdalhEw4zaus3D+akINLUzAboIm1Bq/HDlS+gGBSYA
 AedNu3nx5CNLIVgzd1/T5caLEHkEo1Wro821niZNdRule8wKWkPzAqpmeTZQRpLvA+Mc
 f1u1LFxIOIQXvnU/CY5UpOzvLLrfdti4MyML8aK+4CzoeRbG4bnhtabzYFdq4jn1PPI+
 o1Eqeg+kNbu3h9Pu5EfQboi9OJieX4GXpLQQVbrmZKSQPu/OPanbEEECJxuFfY/JdS+K
 JykA==
X-Gm-Message-State: AOJu0YxBExI1K7kRYe+oZ8Kx58zv2gcam8PT0TNgp+nQfMwFTt5z9plW
 16G3trZpkHkKCSexi2f0oK+UHun4dZhGyO1ehGsLZeEyeZI6cLWh6eSVbw==
X-Google-Smtp-Source: AGHT+IELq2f2v3FakhD0DfktVx9/bRCkYZFY2E+JNTUe24IJ7wlhI+hqECi6f/roavPGZ6xxvtWTvg==
X-Received: by 2002:a05:6e02:1846:b0:376:4544:826d with SMTP id
 e9e14a558f8ab-37cd0913c03mr96675905ab.5.1719863675568; 
 Mon, 01 Jul 2024 12:54:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad2f41376sm20224785ab.49.2024.07.01.12.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:54:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:54:34 -0600
Message-Id: <20240701195434.1793733-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719863676; x=1720468476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2azM7mFghbMz3HffHuLvZPbHSRvUjyWkTAM1Z9Ye5bU=;
 b=AQ700SZpFE187VgPUnkUOPRvHY9nseqrDxK+xTfHD3BkGUR9mVkk44nSoX86QwVOvd
 dHBylTQvCt/8nH9iX9N7by3P8Y59GTnapQIJX36I+R5lIipfFCTm2E68CSHvSFMtp/I9
 d7uk61I/PzS7fCHS6PLHd8CiFMhCHq79IuGyqb7t6DaT4wB2PPqW5h9gbb5v1rcPDq2j
 WbbSWFCawiWdxLcBHi/ytgno5u710ugFntyI5Hd12xdRh85pSGBhl2NFcH4FF5YXxGu6
 dyzW0ywEFzqEl/kvDMJ5/Po+DdEbU8w9ZGu37Zj5XVLADLsETLGuGR8rpkLdA6GtHPZs
 lO/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AQ700SZp
Subject: [Buildroot] [PATCH 1/1] package/python-sniffio: bump to version
 1.3.1
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

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sniffio/python-sniffio.hash | 4 ++--
 package/python-sniffio/python-sniffio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-sniffio/python-sniffio.hash b/package/python-sniffio/python-sniffio.hash
index 00af7c58bb..989e31d196 100644
--- a/package/python-sniffio/python-sniffio.hash
+++ b/package/python-sniffio/python-sniffio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/sniffio/json
-md5  abb96bcda81817d6c632915c53ac29c8  sniffio-1.3.0.tar.gz
-sha256  e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101  sniffio-1.3.0.tar.gz
+md5  1673edc4dfeb739130a87bcd7b477864  sniffio-1.3.1.tar.gz
+sha256  f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc  sniffio-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-sniffio/python-sniffio.mk b/package/python-sniffio/python-sniffio.mk
index fa369a0e2f..120794d77c 100644
--- a/package/python-sniffio/python-sniffio.mk
+++ b/package/python-sniffio/python-sniffio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SNIFFIO_VERSION = 1.3.0
+PYTHON_SNIFFIO_VERSION = 1.3.1
 PYTHON_SNIFFIO_SOURCE = sniffio-$(PYTHON_SNIFFIO_VERSION).tar.gz
-PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/cd/50/d49c388cae4ec10e8109b1b833fd265511840706808576df3ada99ecb0ac
+PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd
 PYTHON_SNIFFIO_SETUP_TYPE = setuptools
 PYTHON_SNIFFIO_LICENSE = Apache-2.0 or MIT
 PYTHON_SNIFFIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+PYTHON_SNIFFIO_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

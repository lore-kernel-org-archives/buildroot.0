Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC42EE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D467409CE;
	Mon, 23 Dec 2024 16:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AStXORkL_6a; Mon, 23 Dec 2024 16:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2631E409DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2631E409DD;
	Mon, 23 Dec 2024 16:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BFFFD8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7558460684
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr3VX7D2RT_S for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75888605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75888605ED
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75888605ED
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:20:16 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a8165cfae8so14254905ab.0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734970815; x=1735575615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8cdLQf/eFoCQt9fa0ZiPQiBzoVxcXwMYZN10zWQjyus=;
 b=moOpMwIZj6qO8UL1uS4TM6H5A9dTuzAAEPqsnlhgPZk0mL/PKbmdaCaAo+SOqYwBmf
 xXKXSwwyBmrwOBuMmEaIhCU+JPHFmv6PFTz6EwTVFc7MTUqrmWvS8YrysmvyY5tu/2oe
 MSS5QJFu9hD1M9feGp0/+oHuf79EeF30e0dfwuVMdjz5TwBa6fzvVBWsIq15lApzsC1r
 QknPTHLhYEk9IqgEf9InK4P85uNwjc09e7uJ0e3TNQ3ye+GRFAfuBx9vUOp4z/Kgum08
 0F+oQ3L6OTBO/WVjuLyI0t/JNMfUxoiDRNGEdNO1Esr5TxaB4WDLOQMRp7lGpjpVC9Q7
 FBjw==
X-Gm-Message-State: AOJu0Yxf60JvLCrY/HxZQXj6N9nnzI/TUTKLKvaxw2L9vn/3dBwHL6o/
 P7cMd2u3nHY/hbxncmhLmscS9wlSK0rzdJhGHgRmI1lDDAT/qv+137YkXIirO30=
X-Gm-Gg: ASbGnctrAZne1vDowDAv+f9nndUXoZPKWK27NYbI3b3len6AqzpmoTIYaoaeZ3ljr0j
 cX5OmDHBYkqTpIEipnsOvUtRqginWreA4hPOIGIXsLICQ2oeaOOuk94hlGBV34oAQt3fhwQCgLR
 RRClFmz8Nc9ZXjZbVccrRes1XmaZxSPykVPjumXHCsH5dBWYsvY+hD8bEgmafFfppWlRZVCmb2i
 WSnkbjb+QAfKL5oWNLXY5zMm6WzKiNLuHyIs0sikxgGHYJ3SCuElc/MLJUlQSeY6PEOtXsjbTEV
 WPio0wPF4knKnQPKq7dxG2GSq9uuliLRMw==
X-Google-Smtp-Source: AGHT+IGlNrr766AFNdjwEHJKzbzC9CFkZVN0RnrTd9hSgZcfwJDHw09E5nljJOZKaCTSQiaWAq3V1g==
X-Received: by 2002:a05:6e02:1d0c:b0:3ab:a274:d73 with SMTP id
 e9e14a558f8ab-3c2d2276f0bmr89513885ab.7.1734970815101; 
 Mon, 23 Dec 2024 08:20:15 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e47d6cdcsm24870165ab.71.2024.12.23.08.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:20:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:20:13 -0700
Message-Id: <20241223162013.1860033-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734970815; x=1735575615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8cdLQf/eFoCQt9fa0ZiPQiBzoVxcXwMYZN10zWQjyus=;
 b=jIS0Q6Srdjw+Sa6Tqhs1H5trWTITBw7JlgsaFdDpqLavQgw99n5CvmCmGvP+zXgtPv
 SMHbo/HA7586ew5XJtTO8Ngg1CaSL6GfJHYWaLVx0/UiwZ7lk5JSlDHaHdXBth9BOZO4
 iyzJyJYCS4k3mIDbYaby9DXrBRucV7p/TX38I+lLNWmfidkNWjpmF6de67qFpl3yUWUS
 BTFN6cgra0dsplY3tnXZhqfTPxIQ+iu6FgRJhana102uFG57NMJtnvhh6I2Smox4n+Vu
 Cjaq1GlZJLgrMPeAHOO8UD3df7YCLvoEne/CDYkCHiL/LLzu6MEQZoz9lCjUzc7jKjIy
 cWnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jIS0Q6Sr
Subject: [Buildroot] [PATCH 1/1] package/python-click: bump to version 8.1.8
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
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools build backend to flit.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-click/python-click.hash | 6 +++---
 package/python-click/python-click.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 0fc04d638a..3511954a5d 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  7c3b52c56fd30699f453a7dc7b42cecb  click-8.1.7.tar.gz
-sha256  ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de  click-8.1.7.tar.gz
+md5  b52ee8e6c33d88a2b4626e6a6002245d  click-8.1.8.tar.gz
+sha256  ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a  click-8.1.8.tar.gz
 # Locally computed sha256 checksums
-sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 0e29ff034e..8597c65cec 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.1.7
+PYTHON_CLICK_VERSION = 8.1.8
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b
+PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
-PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
-PYTHON_CLICK_SETUP_TYPE = setuptools
+PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

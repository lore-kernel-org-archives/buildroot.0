Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08057E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A1740E5E;
	Sat, 11 Jan 2025 18:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2L5t5zi_aSPf; Sat, 11 Jan 2025 18:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B09541177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B09541177;
	Sat, 11 Jan 2025 18:01:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 121A4942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63CC606F4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru9MUvEo6Urs for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E06AB60590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06AB60590
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E06AB60590
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:01:53 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-84cdb6fba9bso231725339f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736618512; x=1737223312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5nSYRKJIGxfbe0d8NLACT308CLcQI4+UbXddsHTyf5s=;
 b=lB9ZfcnmpjIdQS60VBuez0gv+7gVdwvfG9uH5e0oja+X3gczKbmFmVGL6cvCLip3Hb
 mP8fVxBULgVIGSwEIt2ZFo2EdugqIhs3QJmBIyGqJNaXHJypxkXSGq59rFeH3QsS/Chm
 hSEKPC+FCQ9H0EUK6IfHyJspWcHzjQ3pLFzZ/MeRPzpGNs3z67x87Zns5HcSHtrr6MVB
 7p2hxnvk8VS1Uxp15SnA9AP/ENGrn1txW9ZmfNf+2Un08XdGys+48YJ/S5HQR+A+gwx5
 ajMea/Ncz7paloIOUoa4o3q9loVdkzRTwnjshkqk2AR9epadTS+K6IMnl3THnYQWj/vZ
 DhMA==
X-Gm-Message-State: AOJu0Yw70i9eDbexoS9fK3e30q8Sf7N80zeh//mkh1MCQ1Sx6C0PPRxe
 QlpySYZR+YzNJ3S663LKdGKxkPBCViZ5DGx2Q3iGhgjDzroFxtsDT7xbw8b1aCs=
X-Gm-Gg: ASbGnct5sH7MlarRYnSK51NwHMAtKJ1Pdr2mRrd4Z36dYHGi0zzVSxIhHTa/7eO+dH4
 Fpn9OdVMLXwX3rylb1IR545QXzxKAXJDCsIbTZx2oJ9na6mGo5W5ZjrhmZPmQdmSpvdZWDMrq7R
 eGJ5B0MHKWiCzI/Zd6tC6Vg+kg270cydftr7Xa+1mEkvZhDP0IvyGh/ikmyoryVcLTc0rS4hUWd
 3OJp2+DqcM0bS/x2Z/zVpCugaTc8ol/gjh8aq2r4t3Xvxz2jWHS9g6DipE/iSr1k/Fxw1tTNoyF
 +xXxAYdolQlEOABAsoluyWKVuOtkdkw=
X-Google-Smtp-Source: AGHT+IHYtSL+55W5BY3NWyiUUcbzBtqZ6vv7rmtm2ya0K7DaSAq4yeiBWkoVuTJWhtOPVtgfHPI6hg==
X-Received: by 2002:a05:6602:418d:b0:83a:b188:7a4d with SMTP id
 ca18e2360f4ac-84cdfdd7c11mr1415534339f.0.1736618512658; 
 Sat, 11 Jan 2025 10:01:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb1b466sm163963739f.12.2025.01.11.10.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:01:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:01:50 -0700
Message-Id: <20250111180150.2923566-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736618512; x=1737223312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5nSYRKJIGxfbe0d8NLACT308CLcQI4+UbXddsHTyf5s=;
 b=JHApmx890jTIIy+PI11+7ASQ0HlRxpIeA+4Nl8xSw3oE5gFqyZokoDHcByrKSZacrH
 HHVdoTrQjN15Hk/1xkRBWYUpJP81BNchoJyZC9GRhLY+QDY8Z6LSsPdubdOzAL6brX8O
 jXcBF51P013UG4ltsna2yLzRNdG0t6BefKvzrgKtQX1IJgIMQ6pENoK7p2KlKezOgEsJ
 aboda807qu3p/US+trb5e2jWOmSvZUE+6hXuDU6/qzyUuTDkVfKfgA9j2P6GGusSc6xf
 rPvKDa6fuWbmuA7KuXl7fVnwEECCx7eqZ0vGgOyW586CLtoWSBzAR3HyCG9mQq5SCbRU
 w9Rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JHApmx89
Subject: [Buildroot] [PATCH 1/1] package/python-tabledata: bump to version
 1.3.4
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

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/thombashi/tabledata/commit/c86bbd425f5f2bfa8e65a4e216e4457f9bd70c4e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tabledata/python-tabledata.hash | 6 +++---
 package/python-tabledata/python-tabledata.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 19fd4ea9c5..fb3471af95 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  579c4e7454a837d252d4977b73556aae  tabledata-1.3.3.tar.gz
-sha256  c90daaba9a408e4397934b3ff2f6c06797d5289676420bf520c741ad43e6ff91  tabledata-1.3.3.tar.gz
+md5  c0efbc178462c94920c02c52da56bf18  tabledata-1.3.4.tar.gz
+sha256  e9649cab129d718f3bff4150083b77f8a78c30f6634a30caf692b10fdc60cb97  tabledata-1.3.4.tar.gz
 # Locally computed sha256 checksums
-sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
+sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index 43e22d45d1..bf845b7a7b 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.3.3
+PYTHON_TABLEDATA_VERSION = 1.3.4
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/48/6a/7f78fbf883f325b70ba9ce5c10d97652f5c371e224940097c2cea9d0f456
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/b2/35/171c8977162f1163368406deddde4c59673b62bd0cb2f34948a02effb075
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
+PYTHON_TABLEDATA_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

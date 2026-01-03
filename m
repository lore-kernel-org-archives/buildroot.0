Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78008FA3727
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F3E809B2;
	Sat,  3 Jan 2026 01:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpR-_iKpmVPS; Sat,  3 Jan 2026 01:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C60108098C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767403264;
	bh=qE1O567N0U/N6wC1MWKS3CrGYC6tStO6PEgRIhT2Y2Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SEA2zDhAhFEpE5h+qZQThtfQUNwaWRocdUdvm06KOucF2eqXbqhGjGlzZhSRk+o/q
	 FVYS2/hAvv/GssUFLiQ5bmSB4qvPJP3KG0ZdQpHJqMG1Kx1GwsQlOVqF5IahPbqoNd
	 okWBvmEiTocaV8hluOxPTF74nAPeaqkf+4qR/45HODjwPm2uTdsZr6XQoK8+aEulYC
	 SHOUwv6P6T9/f3gidKTDynETPxGD7SAsw+PmHjiZWu9TcHWwcW0/NZElNWn2A8GJWT
	 olZfGb+63aMSzCF55+92OK5DhUUSP0J+E1xIA5aI0ZVtyu0E3yKpAs4T67j2Ll3Oym
	 ixbwG4wKCYU0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60108098C;
	Sat,  3 Jan 2026 01:21:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF8CE351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C2E6067A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1pkg5yxvhS2 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 088F6605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 088F6605D4
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 088F6605D4
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:21:02 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7c6d3676455so5680231a34.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767403261; x=1768008061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIr6AdFBs6QXhZKClzidpgchH6o4Mnj7bnPWFaGssnI=;
 b=ZFi7nm1NDuY0nCHf9JeqcISd6kDsoxkThgGaaWDcDpE6hVD+dy1c5Q4wCtrrQWELXh
 r0LSJ0e2iY3hPC/CcWO3vPi/ic1ri4XggA0Mt7TPNQojLJ3xghraGGN9n2aEihVEjmYT
 ZZL5cvgJBYfuUWr8oST4xiR9pBWAh7/0KvbP5Ub6GMSdu358pFQuhR/7HgjtxdFSM+T2
 An0DsbJSd/bL5VwNpF0y+LUyUqNKyBWMmZ8EnWHYoMTtYGwhea1PuhiKv8Cqa8ZzlXoT
 DlSgNPCMZfSgiWKJJ4in49DYkCFbsIQAntAwvPJGCnE4R0pLADc7kOPIv2NiYBLVPXYR
 IIew==
X-Gm-Message-State: AOJu0Yxdw/VMKlTTcmvi7DkdF00BCDqbAMvVum2CFUKwr/77mbPMpL7j
 0c7l0C1/hQ6do5qqN+ZftSFv/W8wco+0wr5JYNwpVQbCUN9jAeHw6pMbdoNjnkDD7ZY=
X-Gm-Gg: AY/fxX5JikTogKriX86K3T274XpCHGgZjwCB01vyTKfjHTb3s7AgM2pylxme19Yejir
 SJDrFBlHvpWXRoaHDlmroocAKnZJ/vjMpAE11K/iafuLVwEwmiZ0/oBdl06zW0ll9PAqBER3cwN
 s9t1HnzDp1sMdJg/tTQFUeLgLmkX3Ig9PKFnvO7grkClYfhv9L+AoNwZmTqYsY+tF9nl5nNdqJG
 saQXLUE92HdHXTFglc7zkrwT/PhF5fskJaZ8k0+UbeH5GYHdGQ46ZDUXQ9VyJb4sa7sX8DWo+RK
 lNmq48Y1EiWiltyMkk5gVsgyXtPSE6WPv8H4MRBbCakf+YLk/iSos3i0f5xc2xdrbexrLWT2oIo
 Ed4H24cNLbM/jEfkUV0ncxLKq0Wbsgjpa8/P0X+ApykC/hR1RSBdjRX+1CYhgKJlh2qZeZ63bFi
 CWZnDentPjRRp0YCRZA6/zmRdzQC7mWx4LELueJ83/7jhByRDhgA/5coODNmLJ7+nW911O5XM9m
 L8LaNFcirbvU/QzDqf+R1ek5ENjS/mKEwDzdAtgFqE7x1HnGvk3McA=
X-Google-Smtp-Source: AGHT+IFft1wEnzpTKhPggbs8Dfnso23SaIGxnHczLWfxfsRo3FXIFme2xES6xaeYyMFKTIaQtEl96g==
X-Received: by 2002:a05:6830:91a:b0:7c7:63ec:b697 with SMTP id
 46e09a7af769-7cc6690bda3mr24496835a34.23.1767403261507; 
 Fri, 02 Jan 2026 17:21:01 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cdf600885asm12565240a34.21.2026.01.02.17.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:21:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:20:58 -0700
Message-ID: <20260103012058.745351-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767403261; x=1768008061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jIr6AdFBs6QXhZKClzidpgchH6o4Mnj7bnPWFaGssnI=;
 b=Db/TYOrtZMXne2v7iY/+dfuOocfvEFxC96GehKzUukkKvRbVXgbsmDPI5at1685B1e
 ye149PIB1YCNAVAg3MNl9MmLQbNF09ZSXbX13+FBAct3O95pMo7w2i8NeFtIWfDI29jG
 qHpCHWTuZQLYe9/2g2QsyX4FiiroZbOqJnL86CmIjCfmTk06na7PhIgbI7CEBTfSV15y
 HxFEbxxAi5CreYRkvLLOQpiMaU6CZYb+5Q84Q8U3oYhJ2Is5Ou0DNuwWZPkCzlZVBKSF
 Qti3wmYMRoWFjK3EenFgP1T+WDavJvC5OQuXxR+t6xy8Jwg8ODFXQrFyinqT+Dx20ds9
 CGzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Db/TYOrt
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.8.0
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
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 54c297bdb4..2c72626637 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  9f5b82e0ca69926b4eb9dc145b82c524  cbor2-5.7.1.tar.gz
-sha256  7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71  cbor2-5.7.1.tar.gz
+md5  43d53d2eedc711252f5f66b1e05389a5  cbor2-5.8.0.tar.gz
+sha256  b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931  cbor2-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 65873d77ca..6f8bc31996 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.7.1
+PYTHON_CBOR2_VERSION = 5.8.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/a2/b8/c0f6a7d46f816cb18b1fda61a2fe648abe16039f1ff93ea720a6e9fb3cee
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/8e/8b4fdde28e42ffcd741a37f4ffa9fb59cd4fe01625b544dfcfd9ccb54f01
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

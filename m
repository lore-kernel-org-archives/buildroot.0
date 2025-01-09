Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3A4E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 19:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B7260B3A;
	Thu,  9 Jan 2025 19:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ7J7jzLubD7; Thu,  9 Jan 2025 19:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F4760B61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F4760B61;
	Thu,  9 Jan 2025 19:26:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17169942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7F4F40FEC
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaWMZF_pdMph for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 19:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B55F140FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B55F140FDC
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B55F140FDC
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:26:41 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3ce301bc718so9031985ab.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 11:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736450800; x=1737055600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OCAtXP8ESx0hEinRlab9KEj9QE4D3mg4PhSrN0MlI+o=;
 b=Ukac9OsHw2sMBMJqiDCP12+4g1x/U7gZQsV1T/+BVOJ9HJW/XmokzPF8x8mGsLlI39
 DlcBKTU9o3BOGJj1r8yIuQIXFnZgym0G0B3j48Soe0NVWNmMWPfmjv6Dqq5nW3AmHc8r
 J1U4OrWHyrXxmmERC9ws8pyphqymJh9MiAzQbwIO+MoKv+31Zlo+nw5NtPMEfcT9Vk+j
 NfdKXkspK66lXNxviWclm6HUZg9wOZHghF1PXjpM6r8KlJIJLjOWggRSpvPxQqDnxuqe
 PMlY3tbuEmYdFoOR8aCUY5psaDWX7/R+qG6h7Yuw/iHtID+J2evQWKpKGb4fJQqWQM33
 5tvw==
X-Gm-Message-State: AOJu0Yx9ofOdEwlTyYhKIT+H8M0lGiHdRBRyUFkOoEDwfG8V38Y7d5Oi
 /hwpczhRqcaygFQLAh2EuEoynpb4Ia4TWq/P1fioGIrClGeVZlsRgTibpEoEQqU=
X-Gm-Gg: ASbGncvs1Rn0IQIAYaLVwruVoJ8L8qXxM0ayj367oEbl1/ntxgBky2qeXgxacs4a46c
 xDFACSvId7zCbF78XQMK9LAD2Qt0uEsHmF3Y4Y4iisEo89g1wq9b3E6jmn9zDVVx6U6lLA170QH
 FLn4AIlzFBgehExtkVGOA+6X6vH5QgSE7Oc2B1YyYrX0DXA5YmqwoP1Vrnvl9FwanS8DdtVoTAo
 UfgY67wPxlhGjECTJlw+i10TB9ya/efFd4X7o1mgHPU1V73f4RgGp2lioKD/0MnhSmzjq2bCo7w
 77aS6cXPQmtwmE3KkB2icIJuPVm6jGY=
X-Google-Smtp-Source: AGHT+IHBlxJ2BK5opqSY2dobZffC6Dsy5XbNMiwrx9YBqpUvFhanKs/XlP5zh6bqD1RSICnZE+Zezw==
X-Received: by 2002:a05:6e02:12cd:b0:3a7:7ad4:fe78 with SMTP id
 e9e14a558f8ab-3ce3a8beb7emr63083935ab.19.1736450800419; 
 Thu, 09 Jan 2025 11:26:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4afc3ddbsm5299385ab.72.2025.01.09.11.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 11:26:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 12:26:38 -0700
Message-Id: <20250109192638.2363626-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736450800; x=1737055600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OCAtXP8ESx0hEinRlab9KEj9QE4D3mg4PhSrN0MlI+o=;
 b=I3WO059xQ4mAC2GGPrpnYT5nsfgsufv22vWUjxn/EzOZqFwQrI2G7qT+BdNVTE5ysf
 IQ26VcAe5klk/gjTpbw6y2KMf4MdNlXOZstxVOPFPmsYVUCGL6fWFZUaF+B35OkXl64d
 395DARb5mXiA2yLYaFAocE3exJagw3wBF2V3O4ezudzQI0yn1GaQhMsZeBq+XpSewUeK
 N1c9iQQ741/2ZXJvqqSRizpvMnND1Ozg1vy667VtHQxUYMiCJUYRlPKzR3y38HNLt4Gg
 62lzZ4d3LbHAXTl3S7Ls4rK2g5ZLsqaxn4jZ66wX90CE6gfjANOXlx6BfHMOv/I09sdu
 2M5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I3WO059x
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 4.3.0
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

License hash changed due to year update:
https://github.com/scott-griffiths/bitstring/commit/fdc3fbe76862e581997403b9f59c1a2d2ba5d85b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bitstring/python-bitstring.hash | 6 +++---
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index e1b66c76b0..35ce801523 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  5edecacd8fa0356601f7035977d0749e  bitstring-4.2.3.tar.gz
-sha256  e0c447af3fda0d114f77b88c2d199f02f97ee7e957e6d719f40f41cf15fbb897  bitstring-4.2.3.tar.gz
+md5  378cfff7d1c8befad689cc6df0e642b7  bitstring-4.3.0.tar.gz
+sha256  81800bc4e00b6508716adbae648e741256355c8dfd19541f76482fb89bee0313  bitstring-4.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
+sha256  4110041ff5b99a3b0f64d4aa0c426fb9bb4fb3de69cd4c847e634f8e99b2c6f0  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index fcb40365d4..d0abfeb909 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.2.3
+PYTHON_BITSTRING_VERSION = 4.3.0
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/d8/d0/d6f57409bb50f54fe2894ec5a50b5c04cb41aa814c3bdb8a7eeb4a0f7697
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/0d/43/52859178f337661e2d496262f9061799d99644012b7b02ab5d7c491c21fd
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

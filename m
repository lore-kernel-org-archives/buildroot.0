Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ADBFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63CE18154D;
	Fri,  2 Jan 2026 21:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdg-aByxSabN; Fri,  2 Jan 2026 21:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C103781444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767388363;
	bh=2lbd/jddiIn30nohqmy+oLb/lQuvdhDAEqpLOQdBmiA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ku1jZE/pz5Vdksbugfi2FFjP3GM8A8p2p3vLsrAp8hsQhTJ8q1HDXynrwsHcwiIWC
	 Vzsf6YYpm4C31bbG5piguh4WnW7n7aZml7vegRihKTHJ4iIn2xVlcJP5q+MsoqAo1l
	 eSLgz3SbbYKgh9X/QS8rycscIzYcAaSYXHmFJ00ppbxLRdkxfLBIYsRK9VOPMzK2sh
	 NplQIbSA0h7mI7qPJX0gWPPjGBy9BEFayDHBicD0yCv+RuUrbZxRKSqVsS0v81nyyd
	 t7Ox+IR/+2FSe+R+e9LBiypzFdZBdmC5HoB1BuGnfLKUvc4FtAVpReLtOxX/jQP0EP
	 bymk72dG6+pcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C103781444;
	Fri,  2 Jan 2026 21:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B6B19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7839A60A47
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vE99h_-GA6Em for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0265A6081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0265A6081F
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0265A6081F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:12:40 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7c75178c05fso4372752a34.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 13:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767388360; x=1767993160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qm7z1xfx1JYfeMbiZFdySdrxjDgsPIC5UDh4H54AsA4=;
 b=Ick261edlG7yJRGJ0EyBY9N624qBjERDmZV7vUERfLv9Ysb+Ke2wGWWVJIUj3hpJMk
 mOXXFwzsjhb1ixr6f1340dASXEb8aVIftmC62DVz08MXthL1GIAF5BRrbkUdT7gZ1hXc
 NBn+Y+Cr0alnJ+ZXPbUAxZxfVdqh2PHyCXiExx68b6UGSsLI08Vlf+j7OyRcrte1+Xkt
 08Fhji9Rt/7/BltpsZtrhU+dd6eZcZd9RbQvmYcgXm1zalR9icVcOUBcPdpkT+/M4vRX
 reUaQH3W+13H+Qyvg8L5T+Ip2nL5kjph80SCj/TkLhodh2C86EjY14MxMxWYx9us3BZw
 4HPw==
X-Gm-Message-State: AOJu0YyG6iEDY+w3fKYa8RAklYN3ExE7HlKxzbe93ob1lZorL/N2/zJJ
 NU4+Z92sXb61FEl1b1H7OZvvBRjCrxrnbaipA8DmFpdraQS7RjP8oiTAByMIlsFUXzU=
X-Gm-Gg: AY/fxX7fbZfnzQR/tCOcNQl0HP2j/w3dQ7OcUvbJwDLd/7G3MS9AoQ7DEI/BXxhjgcR
 Hqgqai42sDbksYpuVnYDzERkT0kg80BKhRtgkBfPqdgBehUr63SaDwgDdlavggJ9GQUBvzajdCB
 i9kA5IB3s9W+gNiS0lU+cSKBElLVzmjtoQ1chk3gNRjQG9XbBhTr8YDd3aaFfKWtUacsb1mH6Lk
 F/LGsb/ufM0+ONILDEade8Ta5NZCixKwW2hCVsyGWIAnonwd2pmmdgo3pg18yA4gyoyBZoWgHHi
 ycGGpLIILzzQwIdSgxeJZwebFbZq2Gk7lzsY89ZGSmFcmmuCTRnU26e/KZzooRdoqo0uihn7d5u
 zdkvZhiQ7TqQbmyZu3Y1pLY+Qp+Irfxt2COWdP/xTgFLUO9xmzV/4+U5l5ejOz/hkhXBG9vQBsa
 uqC+uqwGpGwGEjvwwUR/P82t7ZYrsNFAJziN+uBuOAWXCuNTx6V+QCia9kYCLjBsX8+Mo+CSyxW
 vu+Gv225ztjnWx8sbsMRUzDPF5sUUzERHO23w9w62D+h3Bc65RBZBA=
X-Google-Smtp-Source: AGHT+IFFgU8dn3EQxoNWK9xs2MQuT5EBkJVtfpW3cZ/VCnwxqv55TxrXAttxLeCmzOQn+2EbONsKOg==
X-Received: by 2002:a05:6830:82d4:b0:7ab:e111:1a57 with SMTP id
 46e09a7af769-7cc66a901fdmr26287074a34.31.1767388359680; 
 Fri, 02 Jan 2026 13:12:39 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667ec367sm28660108a34.23.2026.01.02.13.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 13:12:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 14:12:37 -0700
Message-ID: <20260102211237.59729-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767388360; x=1767993160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qm7z1xfx1JYfeMbiZFdySdrxjDgsPIC5UDh4H54AsA4=;
 b=ZWAxqelVZD8CuMRm73a4QP4fGpIRzYE+7wkv761K85dS8z2IPvVLFUNF8yOREwiVIs
 yOogDwmyyMxzd6mJILByXa7JpJBmIi1STyUIyl31q536DwJVRgzIGAvcPDsbs8PmMkIa
 Ad6xCcJO485TqeUAvmemedgmhU36syfMoUP4FHI4pC1rS+tyWTZOp+Sv+NUX33IZrQ2u
 fAm76lwj8xl9v1fmwFzAsN3a6adlLx5wUjA+IfYFDgLBVPC701YBzZnYhxfPtd4Ee3Ie
 osx58OBfKL7udZK/vZtjDeK0LH4QSlNK+8weHmXAG/t7KmGSDwKF9MI4MSE4Wl/OPAJL
 lefw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZWAxqelV
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 4.1.2
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
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 0df05df3ea..fb11bca0ac 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  952ff36b25ca99d60f7e0d79bb90188a  marshmallow-4.1.1.tar.gz
-sha256  550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d  marshmallow-4.1.1.tar.gz
+md5  6c6ccf9a63b69844257dbb6cbc45d593  marshmallow-4.1.2.tar.gz
+sha256  083f250643d2e75fd363f256aeb6b1af369a7513ad37647ce4a601f6966e3ba5  marshmallow-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 2a5a8f6f90..7879fa0ede 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.1.1
+PYTHON_MARSHMALLOW_VERSION = 4.1.2
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/4f/81/edb105b3296712a282680bc1ae02b8c1bb45d8f1edad3ff9fab1d41e9507
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/e9/e1/5edfd1edf05d3cc98415b0810ca45fa19d7dee6def0d0ec639eb4eb14e20
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

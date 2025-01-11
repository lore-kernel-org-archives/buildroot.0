Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A31060819;
	Sat, 11 Jan 2025 16:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjGa-hK27472; Sat, 11 Jan 2025 16:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6017560BBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6017560BBA;
	Sat, 11 Jan 2025 16:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E418942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE126810C9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6lYoPVfbzTW for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED55F80D3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED55F80D3E
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED55F80D3E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:36:30 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844ee43460aso222571439f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736613389; x=1737218189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iekqu9WE6JZP4ICbRtHpHIt+HvBQNE2ACei3PnnjjzE=;
 b=Pn6MZVxK6+w8PoZ9POgomwfEEmcMa1bwqQqjy32utcMx63XV4LE8BMWM0BM/d2D6YO
 SQ1F1tEWMdChs9myRjsGX49DK13Xeu6pZp4In3MNmCZgCnYW/YBLXeLvGmgDbue2LFoV
 xWwoMdEmsJ+XWmU3g7eHTAQjvqqH0UBLYjj6UA42yjooFrtftNOZznnc4q+POGZ1pMRM
 AXQSYcg8Hbyf8cPuXR+ObHTBx+P9P1zCehWKc38h0R9Q4ts0VMPRTOetDRF1ilYaZKi/
 YciVZUEnBMqu0/3hANV4ZUUW7vvBRAR2bsV0BAPFSfeauUOiwo97apm9LRp3LJ8nVGpg
 6qnw==
X-Gm-Message-State: AOJu0YzdN+Nl5uGwMHEPOhg+t/LRWknd6JiLg12vsILEeCLpxSsNkcBW
 D1pZEZ4usjMmHEwI82cvpoiFsXlafsu28JLo//6YaV+08mUI25dhcepsCG8Hz+8=
X-Gm-Gg: ASbGnctTe0u1uM80EJeArXnHpk6vy317My7zYVP0AVXGWWgQPBnw4BOwEfhgD+d50cW
 NzlT4Jux6iZz87iZkdvzyolkG1UiWforK7Lfad6gwu4gEZraIVZcdgUEo8UAh4XoccE0xgSXNK0
 ZPHoRCoAgv13tKwkEFpke8AhYbPeUXd+8Sb6obMBUa6UIGbl3Vihe9XTAslmOVAIDc+gvv8MaRA
 K8Rv797IJqEB0C0DuUapuqaoMCslUuS6FE94WwIruyKHmrCM23FxEc+h4ng7yIo1sEPejTUCBze
 oarzklCV14Uogka3kl5uAitM4QHdOi4=
X-Google-Smtp-Source: AGHT+IHEHd/zPcp+n5y/kvYMbnLkAGpH3akp/t+x+1uuCAAKYn+v8/ORn7RuKgsYbftisuTmEB15fw==
X-Received: by 2002:a05:6602:3a09:b0:83a:b500:3513 with SMTP id
 ca18e2360f4ac-84ce00a3e64mr1413209239f.8.1736613389680; 
 Sat, 11 Jan 2025 08:36:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b745841sm1606924173.127.2025.01.11.08.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:36:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:36:27 -0700
Message-Id: <20250111163627.2887964-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736613389; x=1737218189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iekqu9WE6JZP4ICbRtHpHIt+HvBQNE2ACei3PnnjjzE=;
 b=OU+rViouOp+IlFshr+p0y9yudFXN5jKKt4xx6imz75KSa9RvaqLgg5ixxF9iAp0MXb
 pIiPahJAgpMuk87HozzvX+70dv41gf2frnWrpoPJcHacJj1xI7MKI3Yw2n5p8J1BEBUa
 4jvcSJDGwaV1pu7eZjkMS0BHf6vz4LrrHpb2t9AjL1HetpvG1q/LXbMau6ajmpKwttCJ
 juhcbq8g86NhxnV4qA2vlh/adoc5081DPPaIerMdzbNDBPOCw18D7UxyVSEj0zw6YaM9
 fB0xZ0Cam35+Yrm59QsKKyDI2IRpzAY+Kw+gAMCGyvVEi4hPRDPDVxYFFVALEfKlZjeN
 LymA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OU+rViou
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.22.3
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
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index a2b36b8d06..df9da1f9b5 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  a2bafde869e0a9e6390de8b1d1144a4c874850b016898c71fd5313c027ba709e  python-rpds-py-0.21.0-cargo2.tar.gz
+sha256  e8422d1a1734de76d460e944b2b760785c88948d1f85640930d3fcf66b553fbe  python-rpds-py-0.22.3-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 87172cdc59..b539453d37 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.21.0
+PYTHON_RPDS_PY_VERSION = 0.22.3
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/23/80/afdf96daf9b27d61483ef05b38f282121db0e38f5fd4e89f40f5c86c2a4f
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/01/80/cce854d0921ff2f0a9fa831ba3ad3c65cee3a46711addf39a2af52df2cfd
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

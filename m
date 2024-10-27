Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB8CD1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D78260D58;
	Sun, 27 Oct 2024 23:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxQBQrxLlLBa; Sun, 27 Oct 2024 23:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446A660D5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446A660D5A;
	Sun, 27 Oct 2024 23:14:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C0FAAEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559914064D
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCHdVymgSSqO for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2894540648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2894540648
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2894540648
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:14:19 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so145067039f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730070858; x=1730675658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J8RA5zrKSlGegRE1AZAk9JVGVMCbFnUEWc2/THxrgAY=;
 b=V/OCJ+Gcm+fozuJWkypSGHqSdhE+moYdG+6MPiURqtzoH1hS6coXLw6XbOsF8MXBqR
 EeycsBz98ObDz8gbhfSmiFl5MOg3HE20U9e1vAs2h66Xvl3Kks6rK8OaQHrJJdZA/BCD
 Qw+LRLoR+3wPyyHT6x2rxvTh+bU6EHLF6gYOAj9M42vxE8rhA4KjiK7NTNQGIlmEiE+4
 qixb9AYA+1k9auHaJBvuCNh9TLJf1sYxDty0jJdycfMd5YgFbHhx8vS2+YkMlfL0msHy
 xxVcx2A0mB8vF/RIKDlClQS2RGylfvzPnTA+lLfxRqjLQCQOBqTls7IIRTAwxT11Ev3D
 X5fA==
X-Gm-Message-State: AOJu0YxEpj5E4sV/98psKjaTPMATOt5loyqRuZKkSkkfoEF9CUffVyMb
 lbHRgdlD3XGlHGv9R7cfnUgAb7lJyeds+gG4Ue/oWt6TjnNVCgw0/CTs3w==
X-Google-Smtp-Source: AGHT+IHP4pcr2dEvDuWcAc/qlvWW9qMaHiyG64teEJUmh8gskayN1GsIQt/TuLGTilPcjOFbR1MlTQ==
X-Received: by 2002:a05:6e02:1d98:b0:3a0:aa6c:8a51 with SMTP id
 e9e14a558f8ab-3a4ed295fecmr51143895ab.8.1730070857784; 
 Sun, 27 Oct 2024 16:14:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6de08dcsm13686125ab.23.2024.10.27.16.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:14:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:14:16 -0600
Message-Id: <20241027231416.3879043-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730070858; x=1730675658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J8RA5zrKSlGegRE1AZAk9JVGVMCbFnUEWc2/THxrgAY=;
 b=jp+kasbGNVkgUsql89TtM7+zRN/WYtkylCOyGk4p/mkx+KdzlGrKsc7x6eBtrV1hR3
 NJChsjFsHDsslavNUpanbkNIOv4Feao7G3KG/eK1D4Jq7waRlgs8VrjIZEvSfIqKbX+v
 JFp6R/45rDPTZ5jujmQWcUpzxQ/1qVxnOD4CAQkSmmgBh+k+4Ks1aXSu4ym3JuhcVPMb
 y++bb1gl9syI5T5k6TsxJmiVI4ed46RXHSlCmNmalGdSElyWb+Jt++q3LK0bHim1tedJ
 Oj9neiQEck+f8RFCSE93FgERwToDFffOFu2DLwUZ4Zdi7ULvoXa4gpa1CzXnCggkzCT2
 t7wA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jp+kasbG
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version 7.1.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-pysmi runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmp/Config.in          | 1 -
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index 0c63b57931..f29eb79a46 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
-	select BR2_PACKAGE_PYTHON_PYSMI # runtime
 	help
 	  PySNMP is a cross-platform, pure-Python SNMP engine
 	  implementation.
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 4e1df1e4ed..050d92b70d 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  9d1ba65a734a613e68d616f3f4c24b6f  pysnmp-7.1.4.tar.gz
-sha256  4ec7fd78cb7437ad64644108dea603cad8e49f065da3dd3e0539dda68bad320c  pysnmp-7.1.4.tar.gz
+md5  801dca4e3d0b58aeece4fa3be83b3cca  pysnmp-7.1.8.tar.gz
+sha256  03d88f0ba21e0357ad58c9566d369dd6123b5b628840f91001d40c0f5b658933  pysnmp-7.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 78f9eeb930..eac01b3169 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.4
+PYTHON_PYSNMP_VERSION = 7.1.8
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/43/71/18a9d8c00efba166b66408040028f25a8ea20d2acc9cd89bd780369544b1
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/e9/af/f9e379bd9e607fd289b6cef13d633667c4d213f8c1519a86f61eed09731f
 PYTHON_PYSNMP_SETUP_TYPE = pep517
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

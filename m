Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3877CE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 06:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA4960A73;
	Sat, 11 Jan 2025 06:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VqHrhtZSiEW; Sat, 11 Jan 2025 06:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A3660A94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A3660A94;
	Sat, 11 Jan 2025 06:38:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6AFB950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7B4583A5E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CGwVeg4XFSH for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 06:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B170083A62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B170083A62
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B170083A62
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:03 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2166f1e589cso56676055ad.3
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 22:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736577483; x=1737182283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLu+9TKy9NCZInv/EcYZbA4pCdUSDgwTEvjAnem8c28=;
 b=IPtLszuOXzZvz3ymjTNIJGcdga3j9bxk6mIJ+XObgIZOM9iiO2l6FSusWP5Q6BDqwr
 tX9EHsN78JcHffCAf4hGDLhfPhq7piN8TphrYlCxQhGmOkHkZvVoZxXdryxadmrj5MAw
 8V5InBcnb6oJ0uKbRQYUf2EuOERc+PNrRSSHcuQIyYaDqjYFnLasWTNU4L6dfKDek86k
 ujKgmuEjA4dcbLECzfO0czpbXGt1dEaRwS3rt7QakfKZdtMPF4jZri3ShbTqi13ZLH+h
 Irsy2DMdvClA7hMwL5+vs2QM2faJcbHSmchc0yZPmEhH5Pgc4JMTgYIGuaVvBV5XOI/4
 pghA==
X-Gm-Message-State: AOJu0Yy79LRRyLne+2OsBiotp1DodbVQl/EdwCXUmiYEkU+MD35QPVo2
 a/0nx9Zbgkwn38Y3+AI9783dMVbkxAUJUxFPA1NOzk3xz/2921zYZlK+5bIg
X-Gm-Gg: ASbGncv8AoeiT/5DVmnB2e++WnQ3/1xowD9r87dannWzzlhIL+UzoQzyVF1Y4YuAOKK
 VG3+WRWTUTHRMsvufEj9nU63cfMjDE+R8bM6+C5EIueOfhhbZQNsNSIbblfsKezW3WtEkHJDC5I
 o5B2D0/ZnUruMvH3Mt8mI4YpasyDh2ZoNVd+HN6yda8LjPki85tmZPIbT5uBtfq1/5Q1TN54uRI
 XGqo0YjkzjhdBytdkZwkWEGIn7X9VFw7TTkBC20DR2vPlozitcbgprlAPjkkRX/nVkFW2Xi5yun
 r2v0eWEnGkLSVSK+af4XomdOITkANVBuJUZRFCzJ
X-Google-Smtp-Source: AGHT+IHUFV8l+jeJFN8G2thw79jUGpuWmhd+b+EC2CkZg3utop03gUBSCa3e+ztLaZU/OdgHzRn23A==
X-Received: by 2002:a05:6a20:7f8b:b0:1e0:d6ef:521a with SMTP id
 adf61e73a8af0-1e88d0e6390mr18332650637.1.1736577482711; 
 Fri, 10 Jan 2025 22:38:02 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406a9433sm2477488b3a.176.2025.01.10.22.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 22:38:02 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 22:37:51 -0800
Message-Id: <20250111063753.769689-3-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736577483; x=1737182283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLu+9TKy9NCZInv/EcYZbA4pCdUSDgwTEvjAnem8c28=;
 b=cKJg5BWjjo5BmKLYS8BAZdT6loO4EHFjR3p7f3qrPja+s4ziFcVitnAew2fhgfp/G5
 QqWzS1/l5SxMwNwU/330RjrqQGDIp6i8BHNlAB+Ov1qgJh7ejIb3Ms3Te8fqKcLL8LE5
 eIkugz6nEUWOEDQUiyDjryrB7cmo9OBEtMTt+dpzmNb5B6pn/PS5wgunRrUxN1gNDQhJ
 0c8yZi8FWVMr5Sjwib5ZQ7zWzeNEqPWToVd02iTdMJaTxMfXXxF+V5n0Bz9lTaqK9DgL
 J3vVer6L8NzEUm1QrQtr5dQYc1VEbWbI6MTD6VQI6i8+hwEkfKLuXtvBUfg+5jT/seF8
 x9bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cKJg5BWj
Subject: [Buildroot] [PATCH 3/5] package/fmlib: bump version to
 lf-6.6.52-2.2.0
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
Content-Type: multipart/mixed; boundary="===============4225811595319655688=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4225811595319655688==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

- The license file was renamed from COPYING to LICENSE.
- Added a patch to fix build errors with gcc-14.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...conversion-error-and-enum-compare-wa.patch | 79 +++++++++++++++++++
 package/fmlib/fmlib.hash                      |  4 +-
 package/fmlib/fmlib.mk                        |  4 +-
 3 files changed, 83 insertions(+), 4 deletions(-)
 create mode 100644 package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch

diff --git a/package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch b/package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch
new file mode 100644
index 0000000000..e38b36128f
--- /dev/null
+++ b/package/fmlib/0001-Fix-the-integer-conversion-error-and-enum-compare-wa.patch
@@ -0,0 +1,79 @@
+From 3a1962a70cec74b3dac979e52a2cbcaa8897b9c8 Mon Sep 17 00:00:00 2001
+From: Akhilesh Nema <nemaakhilesh@gmail.com>
+Date: Fri, 10 Jan 2025 20:20:50 -0800
+Subject: [PATCH] Fix the integer conversion error and enum compare
+ warnings on build under gcc-14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Error:
+src/fm_lib.c: In function ‘GetDeviceId’:
+src/fm_lib.c:139:21: error: returning ‘uintptr_t’ {aka ‘long unsigned int’} from a function with return type ‘t_Handle’ {aka ‘void *’} makes pointer from integer without a cast [-Wint-conversion]
+  139 |         return p_Dev->id;
+      |                ~~~~~^~~~
+
+Warnings:
+
+src/fm_lib.c: In function ‘FM_PCD_CcRootModifyNextEngine’:
+src/fm_lib.c:997:51: warning: comparison between ‘e_FmPcdEngine’ and ‘enum ioc_fm_pcd_engine’ [-Wenum-compare]
+  997 |         if (p_FmPcdCcNextEngineParams->nextEngine == e_IOC_FM_PCD_FR) {
+      |                                                   ^~
+src/fm_lib.c: In function ‘FM_PCD_MatchTableAddKey’:
+src/fm_lib.c:1103:57: warning: comparison between ‘e_FmPcdEngine’ and ‘enum ioc_fm_pcd_engine’ [-Wenum-compare]
+ 1103 |     else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
+      |                                                         ^~
+src/fm_lib.c: In function ‘FM_PCD_MatchTableModifyKeyAndNextEngine’:
+src/fm_lib.c:1174:57: warning: comparison between ‘e_FmPcdEngine’ and ‘enum ioc_fm_pcd_engine’ [-Wenum-compare]
+ 1174 |     else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
+
+Upstream: https://github.com/nxp-qoriq/fmlib/pull/1
+
+Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
+---
+ src/fm_lib.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/fm_lib.c b/src/fm_lib.c
+index 4ea40ff..85b4a66 100644
+--- a/src/fm_lib.c
++++ b/src/fm_lib.c
+@@ -136,7 +136,7 @@ t_Handle GetDeviceId(t_Handle h_Dev)
+ {
+ 	t_Device *p_Dev = (t_Device*)h_Dev;
+ 
+-	return p_Dev->id;
++	return (t_Handle) p_Dev->id;
+ }
+ 
+ 
+@@ -994,7 +994,7 @@ t_Error FM_PCD_CcRootModifyNextEngine(t_Handle                  h_CcTree,
+     }
+ 
+ #if (DPAA_VERSION >= 11)
+-	if (p_FmPcdCcNextEngineParams->nextEngine == e_IOC_FM_PCD_FR) {
++	if (p_FmPcdCcNextEngineParams->nextEngine == e_FM_PCD_FR) {
+         t_Device *p_NextDev = (t_Device*) p_FmPcdCcNextEngineParams->params.frParams.h_FrmReplic;
+         params.cc_next_engine_params.params.fr_params.frm_replic_id = UINT_TO_PTR(p_NextDev->id);
+     }
+@@ -1100,7 +1100,7 @@ t_Error FM_PCD_MatchTableAddKey(t_Handle            h_CcNode,
+     	params.key_params.cc_next_engine_params.params.kg_params.p_direct_scheme = UINT_TO_PTR(p_NextDev->id);
+     }
+ #if (DPAA_VERSION >= 11)
+-    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
++    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_FM_PCD_FR) {
+     	t_Device *p_NextDev = (t_Device*) p_KeyParams->ccNextEngineParams.params.frParams.h_FrmReplic;
+     	params.key_params.cc_next_engine_params.params.fr_params.frm_replic_id = UINT_TO_PTR(p_NextDev->id);
+     }
+@@ -1171,7 +1171,7 @@ t_Error FM_PCD_MatchTableModifyKeyAndNextEngine(t_Handle            h_CcNode,
+     	params.key_params.cc_next_engine_params.params.kg_params.p_direct_scheme = UINT_TO_PTR(p_NextDev->id);
+     }
+ #if (DPAA_VERSION >= 11)
+-    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_IOC_FM_PCD_FR) {
++    else if (p_KeyParams->ccNextEngineParams.nextEngine == e_FM_PCD_FR) {
+     	t_Device *p_NextDev = (t_Device*) p_KeyParams->ccNextEngineParams.params.frParams.h_FrmReplic;
+     	params.key_params.cc_next_engine_params.params.fr_params.frm_replic_id = UINT_TO_PTR(p_NextDev->id);
+     }
+-- 
+2.25.1
+
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index f81b017869..edf87426df 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  64dc76c0adc3aa58bce6aba470dee7dee001d4964ccb1958e899a59d9917b21d  fmlib-LSDK-21.08.tar.gz
-sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  COPYING
+sha256  173f1c41207e50dd3908c7dad192962240fd1a9269bca6e368f401134b3503bf  fmlib-lf-6.6.52-2.2.0.tar.gz
+sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 3d185979d5..601a3e16ef 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FMLIB_VERSION = LSDK-21.08
+FMLIB_VERSION = lf-6.6.52-2.2.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
-FMLIB_LICENSE_FILES = COPYING
+FMLIB_LICENSE_FILES = LICENSE
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
 
-- 
2.25.1


--===============4225811595319655688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4225811595319655688==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54AEE7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C268851CB;
	Thu, 19 Dec 2024 05:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUzFuNc3zH1N; Thu, 19 Dec 2024 05:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA90851CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA90851CD;
	Thu, 19 Dec 2024 05:40:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F8B7E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FD95617B6
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlvD021EFyz2 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C6E1616A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6E1616A2
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C6E1616A2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQxxl000414
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:21 GMT
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su9srt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-801d2d2d31cso285873a12.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586280; x=1735191080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3uCm3cs8YJgGj7pFv+v8T3RH6vl3yR93Dkx5GXho5s=;
 b=X2kAZ7Or7+lw2LReUMIbMcsG6E6P2g/wdUI/9vmcSpp1sFw50n3ZdYKquk3sY8mWBK
 phPlUVagETgMuYmSSa/n6r/3V+oLCa0NOvO2xmZGlZFdviNgn0yXBbD6FaTsNjUxPaK7
 l2kqgtdlMElYacO7IgshM7fytSIDpPpMj1rEkQ4HLYDKiCc8IQ5esqZQtI8V5BMSAqO6
 8keeCdUx2CHMa9apZxeeItjbrAzCxLtA9FPEfjh6sZWkHdtYC3+89roHOCd+EIMjz0Wu
 qOnBf/izWbPPqwyT/t7+Jxqsyk4VHav45fgZ+Y5C9o3vzO1L0C6IVFMl0yjRzmxPOzzd
 zeBA==
X-Gm-Message-State: AOJu0YyDBqJZr33wrj+w1z6u8NJYyvWHB7QpUR5V2hx3slkMHCxc0re8
 bReDoFlIS0QIWZuv2xKgaovN2HjaGep8aU8lUfd5ya6f0LpGrnfRxVMOK6ZixNkIkpg4Hk8/3kv
 dbF4dwiDSx+sHCFIylfVgaMU8F/b2VpZCEnfgc6ov0+mIgubCadgVG8JZF4Rwby1p
X-Gm-Gg: ASbGncvep6N7cJ0QEK0Rw6lc0lkh6LZkrpvJahbOQIbJqDNDkcbyagCUDekZn0AVsm3
 cRpPhpjwgqVY6xvZmxB32Fv1RIseAJIxHRPIkRH0Bj7mSbAO1HYQ45De4WO3rgIMnxUAHJ51y7u
 AX0k27wbZ8OWY2BpV+4zZe4eva2nKtrBwfRI1iPmWAsExOtZZuTvxrMBmbDDfaxwgQgRGXUephY
 HZCQJ11b0+JgMZHtpkbI07vyvdOIBY1FlTVfZo1WWAN74rMvxApZINM1JKZVFheND6rrLoG5iPL
 HqkYprYYUNK07JFI8CPdJJPnomhV3g==
X-Received: by 2002:a17:90b:5408:b0:2ee:c04a:4276 with SMTP id
 98e67ed59e1d1-2f2e91c2e37mr7882746a91.5.1734586279937; 
 Wed, 18 Dec 2024 21:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJuJwxqI9FoyciV7FAe66z9OCJ43tjqoUOE6eMvHiTqNHidLpAU4OgTg1u59nGkIIvG2soQA==
X-Received: by 2002:a17:90b:5408:b0:2ee:c04a:4276 with SMTP id
 98e67ed59e1d1-2f2e91c2e37mr7882709a91.5.1734586279321; 
 Wed, 18 Dec 2024 21:31:19 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:18 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:47 -0800
Message-Id: <20241219053053.2389046-9-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: f3gyoe97JvsuB3eBwftE7ZL1b5sEU-pO
X-Proofpoint-ORIG-GUID: f3gyoe97JvsuB3eBwftE7ZL1b5sEU-pO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=677 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s3uCm3cs8YJgGj7pFv+v8T3RH6vl3yR93Dkx5GXho5s=; b=jANKnJL7PLxCt24u
 srBC5mqkOhESzTeUWbGXC/5A3GqFCNxtnSoWrQ0bOJG9HxaZk8wsvGWVvI3aZOQq
 sQMfFA0HVLVdpsfza4JzbLCEZT5QqvwVt8YH+u+e7RelVoNey0skddopnFgVy1s1
 FxQxXk523CrW0wUnSyqmzZBx3L6LJ/Q9/UjzW8Q1CBHVM0ZoUu6XvNGSNHHeOyaL
 Jw4AUh1fRCEjy7vQu4WKQOmh2+58UKMk3wbXIAQ6kZYS6s50O0Gw3DQ/u5j2QbE8
 yB4QQ6vHAodt2aTV4xT/W5SIwGwQid6GzztkaUoXvY07VYgpd4AGqhamj15ETGN/
 TExqfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=jANKnJL7
Subject: [Buildroot] [RFC v2 08/14] package/hexagonMVM: new package
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
From: Brian Cain via buildroot <buildroot@buildroot.org>
Reply-To: Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MiniVM is a virtual machine used by the Linux kernel for
the hexagon architecture.

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 package/Config.in                  |  1 +
 package/hexagonMVM/Config.in       |  8 ++++++++
 package/hexagonMVM/hexagonMVM.hash |  5 +++++
 package/hexagonMVM/hexagonMVM.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/hexagonMVM/Config.in
 create mode 100644 package/hexagonMVM/hexagonMVM.hash
 create mode 100644 package/hexagonMVM/hexagonMVM.mk

diff --git a/package/Config.in b/package/Config.in
index 5fa344c321..87d2ecfb9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2828,6 +2828,7 @@ menu "System tools"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
+	source "package/hexagonMVM/Config.in"
 	source "package/htop/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
diff --git a/package/hexagonMVM/Config.in b/package/hexagonMVM/Config.in
new file mode 100644
index 0000000000..b00666188b
--- /dev/null
+++ b/package/hexagonMVM/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HEXAGONMVM
+	bool "Hexagon MiniVM"
+	depends on BR2_hexagon && BR2_TOOLCHAIN_CLANG_AT_LEAST_19_0
+	help
+	  Hexagon VM implementation.  This virtual machine can be used
+	  to boot linux or other operating systems / programs.
+
+	  https://github.com/quic/hexagonMVM
diff --git a/package/hexagonMVM/hexagonMVM.hash b/package/hexagonMVM/hexagonMVM.hash
new file mode 100644
index 0000000000..3e1ae8e2b4
--- /dev/null
+++ b/package/hexagonMVM/hexagonMVM.hash
@@ -0,0 +1,5 @@
+
+#
+# Locally computed
+sha256  e5e3ba941af491cab37ece5db85eb7422db9dd0d13464ea528dbf2c01c24b5f0  LICENSE
+sha256  5345cd83b18b6b8f44d06a54bd1a518d447c311dc1c3ba7b45ffa16785e66e1b  0.2.0.tar.gz
diff --git a/package/hexagonMVM/hexagonMVM.mk b/package/hexagonMVM/hexagonMVM.mk
new file mode 100644
index 0000000000..7b3529c14c
--- /dev/null
+++ b/package/hexagonMVM/hexagonMVM.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# Hexagon MiniVM
+#
+################################################################################
+
+HEXAGONMVM_VERSION = 0.2.0
+HEXAGONMVM_SOURCE = $(HEXAGONMVM_VERSION).tar.gz
+HEXAGONMVM_SITE = $(call github,quic,hexagonMVM,v$(HEXAGONMVM_VERSION))
+
+HEXAGONMVM_LICENSE = BSD-3-Clause
+HEXAGONMVM_LICENSE_FILES = LICENSE
+
+HEXAGONMVM_DEPENDENCIES =
+HEXAGONMVM_INSTALL_IMAGES = YES
+
+HEXAGONMVM_CFLAGS=-fno-pie -fno-pic
+
+define HEXAGONMVM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(HEXAGONMVM_CFLAGS)" -C $(@D) minivm
+endef
+
+define HEXAGONMVM_INSTALL_IMAGES_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(HEXAGONMVM_CFLAGS)" bindir=$(BINARIES_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC8C83F27
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 23:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5513F83C5F;
	Tue, 15 Jul 2025 23:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlGcBSSHvQVi; Tue, 15 Jul 2025 23:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A50483C59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A50483C59;
	Tue, 15 Jul 2025 23:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0B121C62
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A22176125E
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcABtCCZxfX7 for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 23:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDC706115B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC706115B
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDC706115B
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:01:19 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3df2f20f4bbso18331455ab.0
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620479; x=1753225279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ArlIrwfyhgeI8x4jEgKDSDgDzBFJsYP8YHz07FGf4Ck=;
 b=MMf1cLo5gPlVRfbztLepljROBhmlblabiJ8Nd9cb31H53V0QqyTETlGwz12ybTQ2Ck
 PyrZi+kzrTVgw5FM4ZN7HIwpLJ/ikP9O8Mgx3kwtmCYKuhk4XuB9ZhEZVZ9+EHtq6TKp
 K8GRw1AfclbXgnobZOZn7qbuU2CxBSk97Z3kcrOWVtM9Xt0z5sIrJ/0tS9E/ytQLWqoN
 Sh2tdnw04b2JZICAuA2PkXnrO6DNdWlwXEIl4wZ6jRvBHe5cBro+oMq5gDpe/IPFTmMX
 tudOxEGa5oXAIOkuhcgoVB1sspTn6m3cv0SxdLnpIw5jE53lrBE38vKnOUxqZK4zapc7
 +bvg==
X-Gm-Message-State: AOJu0YzWkWQ/vmXP8CZuvdE+pv6ip6e04ghNd7h0znoEyOPmXDoZGMIm
 vgAg6SKT1wHMNHUScH6Ae9AT11fmseiYD+aZ5lrYXJMM40rBEdGdI1lbeWfxH0HCFBk=
X-Gm-Gg: ASbGncssrhm8LGerokG/uRzKtP3FI1gtritb6tddpiz4gxtmQ8+IXSVhWdIEpXcxHiY
 Kbe7+hyAHgo7H89kU7y0gXgMz1QPjTytpk69BqlCeLMDblU+vNdoKZNHNjDP3Je2dBqui/3xXRO
 6k89G4XcQKwYHPgijbh9vRp/SPpWaSZoPRS/LfNOVBQymqEsjrAxIx+Q0BwKl9KKGM2oyOTO00O
 1Quv/t/pxyZ+EceDCKgUn0FPhEwTBVYfQ5O9LZy03fI4L07PjcfulK8MEbfngRk1LBTqcWftmEX
 mALhU2qB/locCyWzzdEMkC6R8YxkEg5RKfiGHmcpUL15xHFhrT4x+oGG9wPG+rdv4H5f14c/kgG
 pjBi0YuHG6hFjA47cGYM1ao0Iw9hUCSah4DdiSoNHctOqwKWdLy4FvNk0kTslw/JP4/slgxyNtR
 gPCN2FpKDX4QqkR06Zrw==
X-Google-Smtp-Source: AGHT+IHT02gNIrZZSKWYJ2klaIxOj71Jveh0dLoiGMY1eXolZv2tbTKREc81QZ2kZV10CtJ/kz0LGA==
X-Received: by 2002:a92:ca46:0:b0:3dd:d98c:cca9 with SMTP id
 e9e14a558f8ab-3e2823237acmr9606275ab.3.1752620478466; 
 Tue, 15 Jul 2025 16:01:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50556532328sm2691528173.5.2025.07.15.16.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 16:01:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 17:01:16 -0600
Message-Id: <20250715230116.754529-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752620479; x=1753225279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ArlIrwfyhgeI8x4jEgKDSDgDzBFJsYP8YHz07FGf4Ck=;
 b=ESKjjBJOIsMI9Iop1ivDMFtdi+faAnI+dHZQzjGv35kDVM20DA6EZtc+JTu55FPWtj
 381qisZ/HCmQ/wvHIXjFRPCLbxlGh/zlwcS7CPiL3adb63CXf81TjbD5vSg+oMCescsf
 Qg5hXtdIy0nMBHLSCdpAdkhCxy3ZgK58q2jdoC34rscMKUCCxFQixZ3yaA8HaZc4Rr5+
 qaJa8s1Pi5PEA+k2zgty1JO55LWsVqO5yUy31pXqTJAwWacLV78hC/UACpVvjxdXqnuO
 UBeVdt+rRfUt9CYSAHnPdOmd3htpIu9+PNkCXkJ5NaIjMHmP1If4I0hHuxVdoggWk9Iv
 N3yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ESKjjBJO
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.9.1
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

Drop no longer required host-python-tomli dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index baa8d4b2e6..fd7ef77adf 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  c5e19df8566f9c15b6178a6312f1d7071c7a91efb0f578151439b5fcdb517176  python-maturin-1.8.3-cargo4.tar.gz
+sha256  344b213648e4954b157132ba8a3b5158576af7499bbd68712f42c5d314a13b40  python-maturin-1.9.1-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index af6cf44b68..313dedf114 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.8.3
+PYTHON_MATURIN_VERSION = 1.9.1
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/30/0b/3fd746cf5cfa3c8d7e20ea08c0dbc2c2c765ae051d0fc43d808a38bc9548
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/94/f7/73cf2ae0d6db943a627d28c09f5368735fce6b8b2ad1e1f6bcda2632c80a
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

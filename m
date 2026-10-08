Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6140CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F50660F41;
	Sat, 10 Oct 2026 09:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id fsHT6eIPGD-P; Sat, 10 Oct 2026 09:28:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5529360F38
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624501;
	b=UYKuFo15oP9JB5/s1CzyiQIFQywMGv7SHLdOJeclympEm4GEd9Kz4TyaYClc3e369bjc
	 mRLwOMScxpGRs+7euyFzsXUViogvDaNSPhZJt2OcYkLrdprm/OvmnPt5haAnxj3Ua2fXO
	 0qBlP2R46Jxanouw6fxNoIPBEhz0zA3h1CVBnFqPBTqyHajftIMag5GDtPUhch3UylNSD
	 q5mtOKS4OGRzGAGu9xZNOeBiOBZHEBmSeOvO2umisD6sezEbFcljVI7IQ5qpns9xLC7F/
	 jj7YVUSk/bxjyQXhvGpHLLekUCrAubpNJpgb9uDKL5i6Nhh6OqCQduSdl06NreHjPdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=trS0IAOSNK1hqylmzMDU+LseaS/hwMJtg7Mf5fCzLN0=;
	b=ZU8zuVB4kFATeO7EwZxBlpKnt42T8BsIai7iwo7QM8kirb5yR4UnPs0csc95UFbBxa88
	 wlSJKNyBwBxfcDCA3KMkOeBZy+B7iDMmoOX+jiVl4jeG+r/ebvLvILw3Ordb01Is1vpPw
	 sMHZKfXDm/Sm0RGuLvPl7v9/VjtT4tW5fxodG6vip8bBaoHpee69mZk0z9tB3GFPCnA+t
	 9aWOKLGc8F19LDkiA0Q1PWd5n3cFiPYW51dVxlxZrmdtkWrgaq3NMnV1LgfqWLfLhBl0H
	 kGUMcjFRYCHlwgS5lqnTDKOxXbZ2drQYyg7UgTk5YDMzaeaQqGibbdfECXf30vztATg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624501;
	bh=trS0IAOSNK1hqylmzMDU+LseaS/hwMJtg7Mf5fCzLN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KGLQ6gjKWsmrQ/FvPMz8+xlhg4vYYjfWwz4kbWv1xcwjxsHnawOgYCwuXwCzQEVhQ
	 u4EDz6c3jjS/VdaMaLHypOsiRhb4sUbHd7vj7Of/flnL7E3Qdy6yNaObXPN8CXbvza
	 YNPXfCE4mlWgB2hqnAsTFU5D1IDFTnQY/54KoCPOGrjRC4wrES1CfuPQP6l9CJeEHT
	 1Ru97DjZ8Pwway91j+8MJBsdUxyjlXoyioN1o7TsMQf23k1LfhGib1d0m2b2C/qB7U
	 QSVtvIeGX4r2LZHJwbgmjp8DlSexqoVVAfOh2VL8xtLDKeyRH3uvNyJ8yJY5QeJPQa
	 QrSH37FfNfYhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5529360F38;
	Sat, 10 Oct 2026 09:28:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA7075
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4068281126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY2EmoV_b851 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C89FD81218
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=Aq++9cRlL+yNQyj+XceTtZoZOPqiMXjZsQl6Xt4ulivBnGwofnZvl/EJR6WsBLbaL4xB
 GQb0buApirfN2DC15e0StVUFXfDeBojVvQXKlmZim7oQ4txeRNBe8/hfnlbnHzbolDivP
 Mt0URLfo+NPlKFq2E6Pc4j9cam2NIGt0rlayYQB/zr5/YlS+oGOVnU58e+KQtQy7Smt36
 +/ahvk+fjiq/wkEyQhjbvGU/vvqTxvhRpX4m1Z7qQB+Hh5D+Ct2J2Mqb/qaKzzQnyHunB
 GgpoXOy1+C9lSkriPTdgX8iWMoFBfgoG/d/cne5g6HREcijIoETRixXFdIsgsRgIToA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0/yqQAzvA+iPHv4ivjRxn27THPQncoSv5bUb2n8ZU3M=;
 b=EpcQRDDbxYd0SHM8cel5uRY/JDL4DEzVYKiNqu5MLq5SgViyB4M8DtgB17w8+DB/WXXG
 wEB5cU7PZk5iW+0xWZ1jDfd8uECeJ80Ssm93VYfCRVTOybRFfL++ATjSEtleoGvejJJVG
 ZGKYNvigP4PYSs7wDgObPNdIPpbwrsZW3LSH8D6bpr5dmfUYlE+nXRhsrTIC5Tf4014ir
 ++77e7mM25MIspneh72Yjc4iVdlQ5NeTEOhYcKNBqTKgG27PUKcSQuCYDhg0Jj6zKEaV7
 gojXso5npaEL1SUi/D3Eh/gVKAuHPlBzGZMYih5UXnFqpKWIwZeEZcl72boURrW8z3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C89FD81218
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2A378F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 17a23398cc574b019c43b4434640075f8064eda5
X-Git-Newrev: 2ad97be1ce22c7d29432c31d2ef2379e6ef1d605
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.B2A378F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/thrift: bump
 version to 0.24.0
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8866700677178757687=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8866700677178757687==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ad97be1ce22c7d29432c31d2ef2379e6ef1d605
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/apache/thrift/blob/v0.24.0/CHANGES.md

Please note that this bump includes CVE-2026-41608:
https://lists.apache.org/thread/vwsbcwqdpwdtp8qkjo11ol6rodbfm21f
which fixes a security bug in the python bindings that are not used by
buildroot.

Building this defconfig

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_THRIFT=y

without this bump does not cause build errors.

The Gitlab pipelines detected a build error for this bump with the
defconfig bootlin-aarch64-glibc-old:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/thrift-0.24.0/lib/cpp/src/thrift/transport/TBufferTransports.h:110:32:
 error: ‘ptrdiff_t’ does not name a type

To fix the problem we add a patch to include cstddef.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0e5019c2e470e1502f1420879f644365c7ea8842)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...def-include-to-fix-build-error-with-6.3.0.patch | 33 ++++++++++++++++++++++
 package/thrift/thrift.hash                         |  4 +--
 package/thrift/thrift.mk                           |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch b/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch
new file mode 100644
index 0000000000..f59454c3d1
--- /dev/null
+++ b/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch
@@ -0,0 +1,33 @@
+From ca2c2467c78d9140a7e260727cd3305bf3decd09 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 4 Sep 2026 19:49:59 +0200
+Subject: [PATCH] Add cstddef include to fix build error with 6.3.0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+thrift-0.24.0/lib/cpp/src/thrift/transport/TBufferTransports.h:110:32:
+ error: ‘ptrdiff_t’ does not name a type
+
+Upstream: https://github.com/apache/thrift/pull/3801
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TBufferTransports.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TBufferTransports.h b/lib/cpp/src/thrift/transport/TBufferTransports.h
+index b78e457b3..b0447b0bc 100644
+--- a/lib/cpp/src/thrift/transport/TBufferTransports.h
++++ b/lib/cpp/src/thrift/transport/TBufferTransports.h
+@@ -20,6 +20,7 @@
+ #ifndef _THRIFT_TRANSPORT_TBUFFERTRANSPORTS_H_
+ #define _THRIFT_TRANSPORT_TBUFFERTRANSPORTS_H_ 1
+ 
++#include <cstddef>
+ #include <cstdlib>
+ #include <cstring>
+ #include <limits>
+-- 
+2.47.3
+
diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 406c65fd25..187fd15c50 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/thrift/0.23.0/thrift-0.23.0.tar.gz.sha256
-sha256  1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f  thrift-0.23.0.tar.gz
+# From https://downloads.apache.org/thrift/0.24.0/thrift-0.24.0.tar.gz.sha256
+sha256  e0fa5839a4c5c1d631b0931cf2c554ebbfa4e2fee3a9fb3ffd4f82ce4396c6e4  thrift-0.24.0.tar.gz
 # License files, locally calculated
 sha256  89aa7b27868669299bd8a6c53b72ec4beadce42dad6c8336797cc26e1e8df98d  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 34f4671239..a517dd5035 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.23.0
+THRIFT_VERSION = 0.24.0
 THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0, Public Domain (sha256.h)
 THRIFT_LICENSE_FILES = LICENSE

--===============8866700677178757687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8866700677178757687==--

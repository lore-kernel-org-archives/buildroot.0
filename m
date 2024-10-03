Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E48CF34B0
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 16:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907C360656;
	Thu,  3 Oct 2024 16:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66sO9L9PhwkB; Thu,  3 Oct 2024 16:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FDD607DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55FDD607DA;
	Thu,  3 Oct 2024 16:26:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F070A1BF285
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 16:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF2C540126
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 16:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSNfSg1okl0I for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 16:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 385B640065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385B640065
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 385B640065
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 16:26:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so190479266b.1
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 09:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727972803; x=1728577603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFPUvHEIVZamKmasYmkwF35aaGgnDV0nTEkihqZS/bQ=;
 b=J5EFx64Y3B92KHl9L/XTP0PAypR5VUvvKcOZW9dG4XxDfBpJvjEazkqbLcCkWousdO
 4c41p7Rb0k0FBhWUK+FRbxNAi5Mf5/Mv8+iGlVhG/JX96GDw4cFgh5n0XENSWnTjYWfL
 a97tGIkSaEP5w+INUyPLrcYpDY2LxAFGfIH5qSIc2uq88b6Of6XnWb0Xex1KRiC0TLZl
 AzCxc1my08TvcLu8uavQEAhsOkdp0CVXCM54oKXDKRymHiiBthkyDawEQqqzvAA8AVHC
 NEsnH5Y2gnNC0QjM0mqGlbrHR6OAlFqnrGlPzkk3sdii9XD21GTjiS8F16FtMD9EnrSF
 pgeQ==
X-Gm-Message-State: AOJu0YwXrx9GzC16UZ2lNCwtqfsQswne+FtWzBYNHf8EtcOGp/Mv54qj
 rwIBWBTOvwlGdiA3ttQq0MZE4SLJwy++I5b18gV1tliu/SeKUPz7gxm3C+EgiMm/7zRNYEk3fDr
 OTLM=
X-Google-Smtp-Source: AGHT+IF3MZHu0wymh4DdKbtD9ggcmEs+wtx7DdpOKT9IrrupBFEjke9P3WUIu2GYGZJk/U8pILkzeQ==
X-Received: by 2002:a17:906:478a:b0:a8d:6910:d0dc with SMTP id
 a640c23a62f3a-a98f8397f5fmr701750166b.53.1727972802821; 
 Thu, 03 Oct 2024 09:26:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.153])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99100a3200sm106996166b.4.2024.10.03.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:26:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 18:26:29 +0200
Message-ID: <20241003162629.470273-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003162629.470273-1-dario.binacchi@amarulasolutions.com>
References: <20241003162629.470273-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727972803; x=1728577603;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFPUvHEIVZamKmasYmkwF35aaGgnDV0nTEkihqZS/bQ=;
 b=EJyUU3TYtVyW6/ZGF1up2pCwmdUmPI7iN3thQoEFtXPOfVMQdRtnzpDcWq60yHzTC1
 rhrMxh3McjhcKfJPu4E67H21PxQS9tIKZUEIuM2iWq5v+uzjXRwVCCufQQG4u9r6l2og
 MZSOZa3ozgw8ewseWVudLFzYzzMQjpJ74VCIc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EJyUU3TY
Subject: [Buildroot] [RFC PATCH 2/2] package/libcap: fix build failure on
 ARC targets
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Sen Hastings <sen@hastings.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building arp-scan with --with-libcap for the ARC target raises the
following error:

configure:5053: checking for cap_set_proc in -lcap

cap_proc.c:(.text+0x78): undefined reference to `__atomic_test_and_set'

configure:5086: result: no
configure:5097: error: libcap support was requested but the library was not found

The patch adds the dependency on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET
to libcap.

Additionally, besides libcap, it was necessary to add the dependency on
BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET to other packages to remove
warnings of this type:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBCAP
  Depends on [n]: BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET [=n]
  Selected by [y]:
  - BR2_PACKAGE_RNG_TOOLS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_MMU [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBCAP
  Depends on [n]: BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET [=n]
  Selected by [y]:
  - BR2_PACKAGE_RNG_TOOLS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_MMU [=y]

Fixes:
- http://autobuild.buildroot.net/results/66ee26677777124eafb4740a3c7437e06f704f98

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bubblewrap/Config.in  | 1 +
 package/cdrkit/Config.in      | 1 +
 package/chrony/Config.in      | 1 +
 package/criu/Config.in        | 1 +
 package/libcap/Config.in      | 1 +
 package/ntpsec/Config.in      | 1 +
 package/proftpd/Config.in     | 1 +
 package/rng-tools/Config.in   | 2 +-
 package/slirp4netns/Config.in | 1 +
 package/squid/Config.in       | 1 +
 package/systemd/Config.in     | 1 +
 package/vdr/Config.in         | 1 +
 12 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/bubblewrap/Config.in b/package/bubblewrap/Config.in
index 2492cee0e564..95aa171b46b0 100644
--- a/package/bubblewrap/Config.in
+++ b/package/bubblewrap/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BUBBLEWRAP
 	bool "bubblewrap"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Unprivileged sandbox tool based on Linux namespaces.
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index b3ddcbd13540..8b6ed6984993 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CDRKIT
 	bool "cdrkit"
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	# Needed for libbz
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index c22b756c113f..2784d20516ce 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CHRONY
 	bool "chrony"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Chrony is a pair of programs which are used to maintain the
diff --git a/package/criu/Config.in b/package/criu/Config.in
index 30b131cd30a6..913583cfee96 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_CRIU
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
 	depends on BR2_USE_WCHAR # libbsd
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	select BR2_PACKAGE_PROTOBUF
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index e1971b7bb15a..b0379d8f5094 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
index 3b20daecc77a..9135527c238a 100644
--- a/package/ntpsec/Config.in
+++ b/package/ntpsec/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NTPSEC
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON3
diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 9d99ff70c485..f82c2c460029 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_PROFTPD
 
 config BR2_PACKAGE_PROFTPD_MOD_CAP
 	bool "mod_cap support"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Compile ProFTPD with mod_cap support
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 7f08fa25fbf7..cc11484aefd9 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_USE_MMU # libcap
+	depends on BR2_USE_MMU && BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/slirp4netns/Config.in b/package/slirp4netns/Config.in
index 22414dfbc972..9103eea70cbc 100644
--- a/package/slirp4netns/Config.in
+++ b/package/slirp4netns/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SLIRP4NETNS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, slirp
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSECCOMP
diff --git a/package/squid/Config.in b/package/squid/Config.in
index ab13e735e114..ca02c9f97ea1 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_SQUID
 	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d9545e9db04f..f5ec1cc854d6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index 38502729a7fb..0000eac361e0 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_VDR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_TEST_AND_SET # libcap
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

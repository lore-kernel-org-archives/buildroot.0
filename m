Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9080C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E1D084026;
	Wed,  9 Apr 2025 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ir4q0bgZduiQ; Wed,  9 Apr 2025 20:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3949B82F9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3949B82F9E;
	Wed,  9 Apr 2025 20:04:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10089220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 496A083F77
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NagwtirNGwiB for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9C3683F9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C3683F9A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9C3683F9A
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso2818f8f.0
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229036; x=1744833836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BWerdW93CkeCUzbw5scWDEM2xIwzczhZQxaKzGZVeQU=;
 b=GvLNO1ZPCCa/foiHINePYbgosoXYx2V8sTJ29UoxQ8f2HrUjFJBsPioU146zHo+zyR
 E8J2C2kXsB69fMPlpXSY0ofJR9JjTvulS2qiHgTOoVnXK9mixxV5ic8EV/m3KwQ8hYWG
 316B/KYIVPfyMlnuvABa40anCoPveukkfpQJWsGmjLihB1s5R77bvejt367aHRMRpBk6
 Fm9kzbCgTrkNG/fWb0RyNMVlwBG1A1qKleMkc+zOtNXVqAblin4h1kmB7uO/624x0eBe
 WxU+YK8yBDQkLgt3JM+YwITWXvt+sJKAYk6ZlreB2sUyhyiV8JSrXQO5Fbi6fJH8lYBA
 qTww==
X-Gm-Message-State: AOJu0YxxayuZOzEOvKsr82PuTB10tFT6wrHcVNqt7+COuwBp6KyUi/hR
 AFpQUUJNRa6ChPouwvUEJbecrDbsVm1sh7Z9vpyGDiON5C1bfbwpB2uHig==
X-Gm-Gg: ASbGncuJLRTSdi0WYxckX9sMosfsj6VGZe4yEQPGxxVpWocDD8ulw3Eg/EiJOKDrXTv
 KNKiI8baWgiGHKnsi0q3g/JySExmGZwlAryWjiEOp1NXws1MdtpcusHG0StEKm2TcSU1s3gH5VN
 eqGP7LvCEoc615gRwzLWKA6Bd70+/Ru2bovMd9EQHYwumvXr7dc+8vjicaIA5uo3ke8De5H3WZi
 6EOdkwAIy6X16Uw/B94IrTVKXWBDpUuPZT897+UXooaM8tsl7PZ75SVvXTuKUIDvgiTidRMhZcj
 0jxgdkCi43Kr3EGZwHkejV5XfIadk/pkConQsaax1qPhHgJRYjY=
X-Google-Smtp-Source: AGHT+IGpSH1XzeXsYuaxVe/fX1CR/6QeN4K9GNdLcNGJevhhiu50sPx3QBwnumvFW3vTuqJlZOY8Ng==
X-Received: by 2002:a05:6000:2a2:b0:39c:12ce:67d with SMTP id
 ffacd0b85a97d-39d8f465867mr75420f8f.9.1744229035643; 
 Wed, 09 Apr 2025 13:03:55 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  9 Apr 2025 22:03:39 +0200
Message-ID: <cd5284e2829d69a71794d76b0f2046501c9cef39.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229036; x=1744833836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWerdW93CkeCUzbw5scWDEM2xIwzczhZQxaKzGZVeQU=;
 b=E5PZTED0DnRU1Te7fYghBFx1F2iQIfWmXVXg/AlxgPu576Wo/g5/PS1Haso1LyK55m
 NAerEsS0Mw77KJKpuZjrHolZ+I4wamCqWlD/ZC1ObqlToeDenCyORm3qJ7VaHH3iIIba
 c28wcbN9ab5GkHIaxCkmcCHwDjT4MioV0Bm0I4ZQ/8kIluR/oGcKoSUhJgE2uwNK67yy
 ZNAefJZaCHUhXxjJE9ip2PwH08z+mL+AaMbkX51HeXra68rdiAqDAvZyzy83PBCV0A6C
 rWpTK4gT9GPCABEFuNqNHjodXBpghg7wc5f0+EFNT+0UKDeMmzdjie/9bjYFCL4I7qND
 3VmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E5PZTED0
Subject: [Buildroot] [PATCH 24/29 v2] package/sdcc: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Although they are optional, most ports need sdcppp and sdbinutils,
especially when we later add an option to build the device libraries.
Furthermore, they are relatively quick to build. So, we always build
them unconditionally.

For now, we enable no port, to get a basic package. Enabling ports will
come in following commits [0].

To be noted: sdcc will hard-code its PREFIX/share/sdcc/ (from configure
--datadir and --datarootdir) as a search path to lok for its stdlib. It
also add a path relative ot where its executable is, i.e. something like
[...]/bin/../share/sdcc/ as an additional search path for additional
libraries. When PPD is enabled, PREFIX/share/sdcc/ is copied to the
depndee's PPD, so the stdlibs will be found in both locations, causing
sdld to eventually whine because of duplicate symbols:

    ?ASlink-Warning-Definition of public symbol '___sdcc_external_startup' found more than once:
       Library: '.../per-package/fx2lafw/host/bin/../share/sdcc/lib/small/libsdcc.lib', Module: '_startup.rel'
       Library: '.../per-package/host-sdcc/host/share/sdcc/lib/small/libsdcc.lib', Module: '_startup.rel'

As tested with fx2lafw (to come in a later commit), the generated
binaries are byte-for-byte identical whether PPD is enabled (duplicate
symbols) or not (no duplicate symbol).

The licensing terms are a bit hectic: the core of sdcc, the sdcc
compiler itself, is GPLv2, and the doc [1] adds "GPLv3 might apply
depending on the libraries used when building", which is a bit
ambiguous... GPLv3 is however the license for other parts of sdcc,
like the sdcpp preprocessor (derived from gcc), the sdbinutils (derived
from binutils), or the sdasXXX assemblers and sdld linker (derived from
an external package, asXXXX [2]). As sdld is always built, GPLv3 always
applies. One tool is under the zlib license. Others are disabled, so
their licensing terms do not apply (until we add options to enable
them).

[0] with all ports disabled as it is in this initial commit, sdcc will
    end up building some stuff at install time; this is not a problem in
    practice, as the default commands and flags all work nicely.
    Furthermore, the issue will disappear when we eventually add one
    port, in the following commit.
[1] the PDF rendered from the in-tree docs/dsccman.lyx, and of which the
    latest version is at https://sdcc.sourceforge.net/doc/sdccman.pdf,
    notably section 1.2, SDCC Suite Licenses.
[2] https://shop-pdp.net/ashtml/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                  |  3 ++
 package/Config.in.host      |  1 +
 package/sdcc/Config.in.host | 15 ++++++++
 package/sdcc/sdcc.hash      |  7 ++++
 package/sdcc/sdcc.mk        | 75 +++++++++++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 package/sdcc/Config.in.host
 create mode 100644 package/sdcc/sdcc.hash
 create mode 100644 package/sdcc/sdcc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c84f95943..b4250a5dbf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3438,6 +3438,9 @@ F:	package/casync/
 F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
+N:	Yann E. MORIN <yann.morin.1998@free.fr>
+F:	package/sdcc/
+
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
diff --git a/package/Config.in.host b/package/Config.in.host
index 3e6fef9e50..d29fa33e27 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -109,6 +109,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
+	source "package/sdcc/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
diff --git a/package/sdcc/Config.in.host b/package/sdcc/Config.in.host
new file mode 100644
index 0000000000..52934aa150
--- /dev/null
+++ b/package/sdcc/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_SDCC
+	bool "host sdcc"
+	select BR2_PACKAGE_HOST_BOOST
+	select BR2_PACKAGE_HOST_BOOST_GRAPH
+	help
+	  SDCC is a retargettable, optimizing Standard C (ANSI C89, ISO
+	  C99, ISO C11, ISO C23) compiler suite that targets the Intel
+	  MCS51 based microprocessors (8031, 8032, 8051, 8052, etc.),
+	  Maxim (formerly Dallas) DS80C390 variants, Freescale (formerly
+	  Motorola) HC08 based (hc08, s08), Zilog Z80 based MCUs (Z80,
+	  Z180, SM83, Rabbit 2000, 2000A, 3000A, TLCS-90, R800), Padauk
+	  (pdk14, pdk15), STMicroelectronics STM8, MOS 6502 and WDC
+	  65C02.
+
+	  https://sdcc.sourceforge.net/
diff --git a/package/sdcc/sdcc.hash b/package/sdcc/sdcc.hash
new file mode 100644
index 0000000000..ef5ceb686a
--- /dev/null
+++ b/package/sdcc/sdcc.hash
@@ -0,0 +1,7 @@
+# From sourceforge
+sha1  ffc600a471b2684a3b268859b038487e43b811ed  sdcc-src-4.5.0.tar.bz2
+# Locally computed
+sha256  d5030437fb436bb1d93a8dbdbfb46baaa60613318f4fb3f5871d72815d1eed80  sdcc-src-4.5.0.tar.bz2
+sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
+sha256  c23d0df4adc62b3f7cddcf96bec64e7100bfe7671eefe2ce31b9ace366fcc001  LICENSE
+sha256  39c81a22595e472dcae2caf7b1a4009a9bbaad7b043d800a5af0631c612961af  doc/README.txt
diff --git a/package/sdcc/sdcc.mk b/package/sdcc/sdcc.mk
new file mode 100644
index 0000000000..b2082c36bc
--- /dev/null
+++ b/package/sdcc/sdcc.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# sdcc
+#
+################################################################################
+
+SDCC_VERSION = 4.5.0
+SDCC_SOURCE = sdcc-src-$(SDCC_VERSION).tar.bz2
+SDCC_SITE = https://downloads.sourceforge.net/project/sdcc/sdcc/$(SDCC_VERSION)
+
+SDCC_LICENSE = \
+	GPL-2.0-only (sdcc), \
+	GPL-3.0-or-later (sdcpp, sdas, sdld), \
+	Zlib (makebin)
+
+# doc/README.txt refers to dccman.pdf for the whole licensing information,
+# but that's a generated file, so we can't add it to the license files.
+SDCC_LICENSE_FILES = \
+	COPYING \
+	LICENSE \
+	doc/README.txt
+
+HOST_SDCC_DEPENDENCIES = \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
+	host-bison \
+	host-flex \
+	host-gawk \
+	host-zlib \
+	host-boost
+
+# ccache is handled by Buildroot and included in $(HOSTCC)
+HOST_SDCC_CONF_OPTS = \
+	--without-ccache \
+	--disable-doc \
+	--disable-device-lib \
+	--disable-non-free \
+	--disable-libgc
+
+# Keep utilities separate, and alphabeticaly ordered.
+HOST_SDCC_CONF_OPTS += \
+	--enable-sdbinutils \
+	--enable-sdcpp \
+	--disable-packihx \
+	--disable-sdcdb \
+	--disable-ucsim
+
+# Keep the list of ports separate, and alphabetically ordered.
+HOST_SDCC_CONF_OPTS += \
+	--disable-ds390-port \
+	--disable-ds400-port \
+	--disable-ez80_z80-port \
+	--disable-f8-port \
+	--disable-hc08-port \
+	--disable-mcs51-port \
+	--disable-mos6502-port \
+	--disable-mos65c02-port \
+	--disable-pdk13-port \
+	--disable-pdk14-port \
+	--disable-pdk15-port \
+	--disable-pdk16-port \
+	--disable-pic14-port \
+	--disable-pic16-port \
+	--disable-r2k-port \
+	--disable-r2ka-port \
+	--disable-r3ka-port \
+	--disable-r800-port \
+	--disable-s08-port \
+	--disable-sm83-port \
+	--disable-stm8-port \
+	--disable-tlcs90-port \
+	--disable-z180-port \
+	--disable-z80-port \
+	--disable-z80n-port
+
+$(eval $(host-autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

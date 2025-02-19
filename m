Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C9C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0721984DA3;
	Wed, 19 Feb 2025 08:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96iuVMG62pjq; Wed, 19 Feb 2025 08:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B10E84D9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B10E84D9F;
	Wed, 19 Feb 2025 08:52:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37B5D127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BBA840603
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsphPsdBeo7g for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7843A410D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7843A410D1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7843A410D1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so4159624f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955058; x=1740559858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ubxIylZR0HBtM93RVqkKEzMANuEsMkamUN4K1b7QFck=;
 b=qfLkeEpRH9JaWht/DNDHWuRzBxyIvtBzIG/6z7qYAVDTEG+Kcfj/uCJiAfIU3ayySL
 RHk2ii5pUdmhgt6YyJLc8yMbK1IsjipjXhv4km874iZ7EQPrx+r0k6xs1C6T/mU5bZDh
 zye1lFHrkjkyDd2NjjdbdKXSQVNM36Qr+Kuz55loRxDRIbnPt7amM578lRhNcqilS9wB
 jyhGTrVseBK44HTNMCB2o3taXNzsJvtsqohvVeUnOmjaPYr57r2K6F8HZVWM+4TXsEYk
 zHgJoqhoHpXfIENbe3jSz7Ngt2ZjMDKf0OFQJpwJ3DjYX6LlssbPRXzXZiWtCJkLjON0
 NWaA==
X-Gm-Message-State: AOJu0YxZFf/0p/una6L2yTiFCbtEOaf9xskWdTyLr2rLI9q1U9pfJoZA
 0Mf7zVc1USek6j5yETfVKKVH22zb1v9jpJUU3tZ84RlDCAa2LTTlLzynrw==
X-Gm-Gg: ASbGnctzfbkDrA9mmuKAS3NMrdQltLIgAn2fExmiWVupO2Wbp1iX8oj9LLtOLt06Zs0
 +fez5MSdlsT3E9mgPSEuJnNSmolUAmSICaIkuYWAtok9s/DyOu2tqttQUheiF2pJ1X8LkcCm07H
 z+zXTcD1/EENZbbBO2yy10e9og9j51pwvrqOHDkzTiQsBozl903HbNxK5kA2/Z9E/UFWIKaiUNV
 aZ2mC3dk0sp+6XrGUnfyEhi9QNKW+5AkL/ZjzNNktQMdJsDo86Xyc70LaA78EX1dkr17qnu9V7c
 vJSWENhSrkoaQJtRhnGdhrq+wQ==
X-Google-Smtp-Source: AGHT+IECu6Gl6OzqltiFYONGQWBWv8WDEY32/Ocpd1WfPTBMVraC1DHeVDGSht7jHXE5d++RWTP2bg==
X-Received: by 2002:a05:6000:1844:b0:38f:4d40:358 with SMTP id
 ffacd0b85a97d-38f4d400751mr8291457f8f.9.1739955058293; 
 Wed, 19 Feb 2025 00:50:58 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:57 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2025 09:50:38 +0100
Message-ID: <e649d3746a89803634428e01107b2e3297597712.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955058; x=1740559858; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubxIylZR0HBtM93RVqkKEzMANuEsMkamUN4K1b7QFck=;
 b=TwzHHA/ZT5opTouiXJCxbLS6JOjDEPGyhTLJZxEA9O/YxA5vQ/vG8Pj2MDa09sFZtT
 RPTbh3klJbgJHIGzZytbbrtyB2v3DoZsxqS8XYkU/ujcixdKSGaIizraeJWJbUSxN3Yr
 CuH8CXizRh8fXGdQDt6kjV50Lsr8f1YTkCw0EAQZBt5HpkOoYZy8/YRS8dZBJKlcBML2
 qiNmNohKpxb70/o5g4Y6yg8FLrqzAnk5OCRoZYMtS++waBXP5VYQUZTG7GMdacvuwdE7
 t27H7vH83aDRpKRmpxDW0A8XnGIxxSNG5x4wuHek6kqs8/h+VDB/MT1VGszZ4SjboTgC
 2Ykg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TwzHHA/Z
Subject: [Buildroot] [PATCH 23/27] package/sdcc: new package
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
index 6827866db1..4d0d294a8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3416,6 +3416,9 @@ F:	package/casync/
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

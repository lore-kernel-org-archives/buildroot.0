Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CC7C88E4A
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 10:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B288781201;
	Fri, 11 Sep 2026 10:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYhjrr8lj8Jh; Fri, 11 Sep 2026 10:37:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9101C811E0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789123031;
	b=VGfymU8814TqF8wv7iQDo3gSVxhKD+nc6/JOcgrYFQbq9TcGNAVqu74t1ef/PqOxiEPq
	 fsb3O5RXaoj5qEpKZkdkVlbujDFDR8Ffpe1vrdB7EQmoir3CaKwrB/v0VXPk8OP9Nl/ls
	 K4M3xf+7ui19rdiAUKlSO8aCJHo5doJ8x87lYr2wjuLoK7y08PebHRGPvIo90xn2T+Ge7
	 fJBhnVWk8cf5qDhlxPHUNGxzldcCq8WlbsIMQ/otgmEaSjJGoXwgxQwBUJwRgWgBk/6Rd
	 Yutq5B9vjqq+eauZc9REvKgsWCbJd2LvH+Z5H+zjaBWC+VVfGQrDdys9zqprsjS0ziA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789123031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rEJ7+ytf/w0+Wmavn+oO1OytDHWPYJ7iaL9CwM1dSPs=;
	b=s+qyjuoQ4vwY5eeFWi2JHuKVr3EOHOAW1bit/O9Xaiye3o1j2ZbT3HX7HHrsoKcvWikJ
	 ceSGmzLDpAVBJmNUKay5pwHtptJDh2M++xwexYKrJ54h8fgxg6YvuR5CMM7tTK36ssFj2
	 mRZyvkZh7HHjIb2y4V2OPmnfdExQ1BgpJlIUKo+iPdYnczV8r3HDw75Ddok4kC4D0WSu4
	 Pl4Z8uiu+bEoiyUK3ZlUn9lkFPF/fEToMWjoNUARsglrjknoccfrX9NdGzbmdljGqWT7E
	 sfCFUBQzQ3ATD3icOkP2g5mABAN2cYbzpM/7AGvpTgXr3qugXZnyoGGRfaL2gl7zrqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789123031;
	bh=rEJ7+ytf/w0+Wmavn+oO1OytDHWPYJ7iaL9CwM1dSPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=k/sasChOHz3iCnJqBOVNE6n+COWFq5TIbwRbf4ynKp/cSiQXVK7PPjw2owIY/xzRH
	 8gbuEat+ATcp3BWSB0RL8ibjD1XbGihGWEPUWdZunFXyvUcq8ZFfaX5O8hYbsRFWlV
	 mkel2mi1Qy7J7S9NXpEajpeU71skLAW6ibxzyhOsStuto2idtFhSoMqhYKeX3LkycS
	 dRazOnimWfHNF4L/iLcSNwK3ZLSfuNP2IOLHTNPyYpe138y6swfY9wPzTjpj852PF6
	 fAXfn5MNo3ozp5m8WOe6teGykvF4CyRjgZ+JIMBpdwMokCLr3czE3MtZFr1qiMbYdC
	 UK6tZHwqBi4QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9101C811E0;
	Fri, 11 Sep 2026 10:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8A932F
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 10:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7924740BA2
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 10:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iH54UHTwBpY7 for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 10:37:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 19F6240B9A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789123029;
 b=sH91LQDOrxsH8L17G7fVj5nv7VB9j4VntnrSBMkBwwAWGVRkNuO5zbqkPbjE/mQnwLDg
 xKBMj7dWt7WWln/WFcJZ6y4YclqBS28eiREF7urwe4m1pvkcVoubzQmSROVdcWSP++KyW
 sayPJvgh5RA31SI2jAmloYZsTPDTxZa6OVUmBH4vZICrZUP5cKnQozi1S3XjN2KQZyab7
 QrIwPM9gM9fvzPO+UsqPjdfj1zssOFRm/jpX52ZpOPD+e+pK4wAyn9f3DtASwtYvE0/Eb
 tZ53QCHnaJE5MBRjOFRw95ON8liSJkSZVOz+ydGDaPNl3bnjBSXNP6u6tLhMMkMMAvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789123029;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=MeoeoL7Hl66snjdWtK8LV8OJHL9G7bOULmRwAfYEFw8=;
 b=ULeZMGXuKtw9keHaHrBdCGs5x9WS5UVcxPM0qBBFMRFMYMGyfswRdXry5xBSOB0kpb2I
 dQZ5UTop0xaowQBQR4Sm7+wksZBHwhTEUIldcLvd8POHmCuQbnuXQCMwer2yFxFrV1ZYr
 IhhuRoCdgqgY9AAE9kkSNUSMK+49ltTw7cPCtH9HCf03vNUSq0T+AMjYVvclfuxMXlcSi
 XR7e75YL8NqD2mrm4pAV5g9UN7pNs2t+TOCW30mORgm08Qu8+aBRiapCtON9WudZvT1P4
 +pmOnh4x8CijMcX+POs41KJ0rX2SBHPotd3Xp7FjxX5W0qVsL1N7H9Z3YKPbLuwthjQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=PL2p93g4; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19F6240B9A
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 10:37:08 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a64c7cdb46so1183083a12.3
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 03:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789123026; x=1789727826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MeoeoL7Hl66snjdWtK8LV8OJHL9G7bOULmRwAfYEFw8=;
 b=NRfa2kXXCkfuFsvVw8BIJ+dKjyliKHwszyR8lzpOAXs2I69Ox2vqlP6cGKAbzNVM39
 mIiFh8somSkuIQqf5yp0PtKb9fn1fiy1x+ooLpup+G0ZliW1YYoW5lT9GFBMgPMT8/3x
 CsDFTrjlx6HjjpBaDrLNIhHFeZFmXpOh1xrgUsShBvOxaWL2fXp2fE4+fWbDVrTfZHSt
 /CsUgSKUzajIA+1B9kc3AJBaEkLZNKZ8V3P/9wYA8kvpS/lYZ7MmOeRh4yfHzYCHZYcu
 weU14Sm27Bgr/B2SmcDa8nTVTCriA6e6H27/+Ii721Ch3oFP/SVcX8k0iEwiJoT2tXIw
 mY/g==
X-Gm-Message-State: AFuF++kd4NJBwcJsQxxal3wpQ/3cGapFT8sT+af7GLsYTbtsXQP2YA3S
 V1fzivx3+chdLr98RR/lrZd7fZmNOYh9iUk81DrgTY3PPCRRln3exMv+U4+rhQ==
X-Gm-Gg: AYBFou0L1oj1icEFScIHZNNpnkMIbihXkUn5bifmxdMxoLKjkAybvj8yqTTvhIoB3rV
 BfjnHTqm8RXztR3dRtF7MvJ8XShAQUN7if+4bfqdCGWZLkmZ+yp/3TnVcNYoOsPTpLcNaa1uyb5
 F07+mrvXrfQ9WwymEsC3e30esiGVGOmWjzHJRXlJ34tnt0buYGavq8IQsPmNAXZOKUkpSDLufH8
 NI5KUlDWu4Ik28XoOXjlA5PBXUE+/RtwfWJOEZh0zQ40SDVYl8omQdYXm0T1vXOimTd04iA7Fb+
 eSj0ZWyElUHYpmoSi5f5CekZ33rd6TZsQH00WRooNH6YTxHAUuhNywy/t+LzymjiBM3SEw3PiYa
 Ilut69DwTzAHT8s7j53TO4pV78NYik3jwpBaArbduB3nQqZjrfNlZOONWqw14FP3n+aUQIUXJ7m
 iOEiKC4V17sBOH4c2e1GXkEyMPVckeRT4BT6gm618TZ/Lew4JwhZnfF2iXJANic0yobTt/RjmEX
 l/1DIAny0OY+5b7NlRtEU0Nr+IcP+ZZYA3a5FcUJfFNchs=
X-Received: by 2002:a17:907:3fa0:b0:c26:1648:a060 with SMTP id
 a640c23a62f3a-c296667175dmr155531566b.27.1789123026105; 
 Fri, 11 Sep 2026 03:37:06 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966066b6asm64469166b.34.2026.09.11.03.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 03:37:05 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Sep 2026 12:36:53 +0200
Message-Id: <20260911103653.431685-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/poco: convert to CMake package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: stefan_preiss@gmx.de, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Currently when building with make, the cmake config files are not
generated. This leads to problems when integrating the package in an
application built with cmake.

The CMake build system links the PDF component against the system
libpng when POCO_UNBUNDLED is enabled, while the legacy make build
system always used the bundled copy, so select libpng for the PDF
component.

POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
defines rather than CMake options, so pass them through CMAKE_CXX_FLAGS.

Poco is built as a set of shared libraries, so -latomic has to be
passed via CMAKE_SHARED_LINKER_FLAGS as well.

Disable File2Page along with PageCompiler, and tie the ActiveRecord
compiler to the ActiveRecord component, to match what the legacy make
build system omitted.

This patch is based on this one:
https://lists.buildroot.org/pipermail/buildroot/2026-April/801019.html

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
Changes v1 -> v2:
  - fix POCO_PDF dependency (Thomas Petazzoni)
  - cleanup unrelated target options, flags, etc. (Claude Code)

 package/poco/Config.in |  1 +
 package/poco/poco.mk   | 98 +++++++++++++++++-------------------------
 2 files changed, 40 insertions(+), 59 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 4801b36a24..b0eeaa1dd8 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -94,6 +94,7 @@ config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 
 config BR2_PACKAGE_POCO_PDF
 	bool "PDF"
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_POCO_JSON
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 40dcc1c502..63279d530e 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -22,80 +22,60 @@ POCO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),postgresql) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_POCO_PDF),libpng) \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
-POCO_OMIT = \
-	Data/ODBC \
-	PageCompiler \
-	$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),,ActiveRecord) \
-	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
-	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
-	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),,Data/PostgreSQL) \
-	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
-	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
-	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
-	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
-	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
-	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
-	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
-	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
-	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
-	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)
+# PageCompiler and File2Page are code generators that are of no use on
+# the target, and ODBC support is not wired up in Buildroot.
+POCO_CONF_OPTS = \
+	-DENABLE_DATA_ODBC=OFF \
+	-DENABLE_PAGECOMPILER=OFF \
+	-DENABLE_PAGECOMPILER_FILE2PAGE=OFF \
+	-DENABLE_ACTIVERECORD=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_ACTIVERECORD_COMPILER=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_CPPPARSER=$(if $(BR2_PACKAGE_POCO_CPP_PARSER),ON,OFF) \
+	-DENABLE_CRYPTO=$(if $(BR2_PACKAGE_POCO_CRYPTO),ON,OFF) \
+	-DENABLE_DATA=$(if $(BR2_PACKAGE_POCO_DATA),ON,OFF) \
+	-DENABLE_DATA_MYSQL=$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),ON,OFF) \
+	-DENABLE_DATA_SQLITE=$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),ON,OFF) \
+	-DENABLE_DATA_POSTGRESQL=$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),ON,OFF) \
+	-DENABLE_JSON=$(if $(BR2_PACKAGE_POCO_JSON),ON,OFF) \
+	-DENABLE_JWT=$(if $(BR2_PACKAGE_POCO_JWT),ON,OFF) \
+	-DENABLE_MONGODB=$(if $(BR2_PACKAGE_POCO_MONGODB),ON,OFF) \
+	-DENABLE_NET=$(if $(BR2_PACKAGE_POCO_NET),ON,OFF) \
+	-DENABLE_NETSSL=$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),ON,OFF) \
+	-DENABLE_PDF=$(if $(BR2_PACKAGE_POCO_PDF),ON,OFF) \
+	-DENABLE_PROMETHEUS=$(if $(BR2_PACKAGE_POCO_PROMETHEUS),ON,OFF) \
+	-DENABLE_REDIS=$(if $(BR2_PACKAGE_POCO_REDIS),ON,OFF) \
+	-DENABLE_UTIL=$(if $(BR2_PACKAGE_POCO_UTIL),ON,OFF) \
+	-DENABLE_XML=$(if $(BR2_PACKAGE_POCO_XML),ON,OFF) \
+	-DENABLE_ZIP=$(if $(BR2_PACKAGE_POCO_ZIP),ON,OFF) \
+	-DPOCO_UNBUNDLED=ON
+
+# POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
+# defines, not CMake options, so they have to be passed as compiler flags.
+POCO_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-POCO_CONF_OPTS += --no-fpenvironment --no-wstring
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT -DPOCO_NO_WSTRING
 endif
 
 # architectures missing some FE_* in their fenv.h
 ifeq ($(BR2_sh4a),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT
 endif
 
 # disable fpenvironment for soft floating point configuration
 ifeq ($(BR2_SOFT_FLOAT),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT
 endif
 
-POCO_MAKE_TARGET = shared_release
+POCO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(POCO_CXXFLAGS)"
 
-POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POCO_LDFLAGS += -latomic
+POCO_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
 endif
 
-define POCO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
-		--config=Linux \
-		--prefix=/usr \
-		--ldflags="$(POCO_LDFLAGS)" \
-		--omit="$(POCO_OMIT)" \
-		$(POCO_CONF_OPTS) \
-		--unbundled \
-		--no-tests \
-		--no-samples)
-endef
-
-define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
-		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
-		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
-		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
-		POCO_PGSQL_LIB=$(STAGING_DIR)/usr/lib/postgresql \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
-endef
-
-define POCO_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-define POCO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

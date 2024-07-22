Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBDCC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81FC7401C0;
	Mon, 22 Jul 2024 16:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQodZ3ZZ01Ul; Mon, 22 Jul 2024 16:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA06340265
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA06340265;
	Mon, 22 Jul 2024 16:17:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD0E1BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349BB40320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7t9NCQn79lv for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AD8A4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD8A4023C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AD8A4023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:17:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42795086628so32185745e9.3
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 09:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721665064; x=1722269864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LlU1b7GoLZAiJIZJlYBCrVkLi/uKxc5qY5RF9DWHD5Y=;
 b=WID4aR8qvgUItYR2f5Njdoidi6OtTAC99qeMcdUO20S8hHLE8c+X7Y82lO/C9J8Ioo
 GILG7krALrmRDi7Wscb/3VeR6MNK8TChSPUjgbO4GXKqCxjq8ryQUOA1YR1i8434atq0
 OnNgNhnRc9CCmqifHVETtPfQ2aqSKJRuLoXv3cuYpEkA9fJMH0RFk+TRkeUhvJKY4Po8
 dOLKjL+wC/HcA64VbMLADDlTSOwF7UkOgYprn2WXPgY6mQY4vlgMo06Hnf8r/VV/801s
 T75QHWAuF1qU6xEVPNCRKh5uaJ98zjHIDzAcZd3nQPrU5Si8myzXjnQsrmNi9XAJ2EDJ
 Vc3g==
X-Gm-Message-State: AOJu0YwEjYCwQkBS3ArXHB+hAYkh6EcrcognY2yyWY55uoAYTAHtChjB
 68fh4qbcSXJmwmx5xFJpuFWYuZYY1Hr47sroNslmo6Hwxc6ijrE30ShKp/2BFAbiTEQuQRwx8xJ
 MwaY=
X-Google-Smtp-Source: AGHT+IFfzz7EyhDKWx1P1qITx1P5pNpEyp9FP1lm7PxiLzHHBpVTeKMQkIAbW879RWkt3hM1SAPebg==
X-Received: by 2002:a5d:6e86:0:b0:367:97fd:1d75 with SMTP id
 ffacd0b85a97d-369dec2f34fmr270673f8f.27.1721665064067; 
 Mon, 22 Jul 2024 09:17:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.39])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687869447dsm8947002f8f.53.2024.07.22.09.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 09:17:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:17:40 +0200
Message-ID: <20240722161740.301988-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721665064; x=1722269864;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LlU1b7GoLZAiJIZJlYBCrVkLi/uKxc5qY5RF9DWHD5Y=;
 b=qZ7UcmAJoc7STyBHy2em6dIb5/TTM9NyrcGiMDmSseTfwe5hF9SYBAhYu5KJ1H0aRw
 POQe8ti6i2ZrEZ9th891dBfzUx5vTVHUk0WiFtYIQw6iaYX+24lJT70vPOOfulgo1sVc
 z8nVtA3LzhfYlgTW9/gsZQUvpepG9dUBl8TgU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qZ7UcmAJ
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: bump to version 2.2.1
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
Cc: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/zxing-cpp/zxing-cpp/releases/tag/v2.2.0
https://github.com/zxing-cpp/zxing-cpp/releases/tag/v2.2.1

The added patch fixes the library compilation when only the writer
support is enabled.

Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...-when-only-writer-support-is-enabled.patch | 164 ++++++++++++++++++
 package/zxing-cpp/zxing-cpp.hash              |   2 +-
 package/zxing-cpp/zxing-cpp.mk                |   2 +-
 3 files changed, 166 insertions(+), 2 deletions(-)
 create mode 100644 package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch

diff --git a/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch b/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch
new file mode 100644
index 000000000000..0d2a90f7a546
--- /dev/null
+++ b/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch
@@ -0,0 +1,164 @@
+From aef33b66df0ad6f085dc55b50d7847e0b8a2ccd8 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 17 Jul 2024 14:53:35 +0200
+Subject: [PATCH] Fix building when only writer support is enabled
+
+The compilation of the following code, which links the zxing-cpp library
+built with only the writer (encoder) support, raises the following
+linking errors:
+
+using namespace ZXing;
+
+int main(void)
+{
+	std::string str = "01";
+	BitHacks::NumberOfLeadingZeros(0);
+	auto writer = MultiFormatWriter(BarcodeFormat::Code128);
+	writer.setEncoding(CharacterSet::UTF8);
+	writer.setMargin(0);
+	auto matrix = writer.encode(str, 0, 0 /*scaledImageWidth, pixelHeight*/);
+
+	return EXIT_SUCCESS;
+}
+
+arm-buildroot-linux-uclibcgnueabihf/bin/ld:host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
+undefined reference to `ZXing::TextDecoder::GuessEncoding(unsigned char const*, unsigned int, ZXing::CharacterSet)'
+arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
+undefined reference to `ZXing::HRIFromGS1[abi:cxx11](std::basic_string_view<char, std::char_traits<char> >)'
+arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
+undefined reference to `ZXing::TextDecoder::Append(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&, unsigned char const*, unsigned int, ZXing::CharacterSet, bool)'
+arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
+undefined reference to `ZXing::HRIFromISO15434[abi:cxx11](std::basic_string_view<char, std::char_traits<char> >)'
+collect2: error: ld returned 1 exit status
+
+The patch fixes these errors.
+
+Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarula>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: backport from upstream https://github.com/zxing-cpp/zxing-cpp/pull/811
+---
+ core/src/Content.cpp     | 4 ++++
+ core/src/Content.h       | 6 ++++++
+ core/src/DecoderResult.h | 2 ++
+ core/src/GTIN.cpp        | 2 ++
+ core/src/GTIN.h          | 2 ++
+ 5 files changed, 16 insertions(+)
+
+diff --git a/core/src/Content.cpp b/core/src/Content.cpp
+index 4d3c44657cf9..569d4e35614a 100644
+--- a/core/src/Content.cpp
++++ b/core/src/Content.cpp
+@@ -93,6 +93,7 @@ bool Content::canProcess() const
+ 	return std::all_of(encodings.begin(), encodings.end(), [](Encoding e) { return CanProcess(e.eci); });
+ }
+ 
++#ifdef ZXING_READERS
+ std::string Content::render(bool withECI) const
+ {
+ 	if (empty() || !canProcess())
+@@ -165,6 +166,7 @@ std::wstring Content::utfW() const
+ {
+ 	return FromUtf8(render(false));
+ }
++#endif // ZXING_READERS
+ 
+ ByteArray Content::bytesECI() const
+ {
+@@ -188,6 +190,7 @@ ByteArray Content::bytesECI() const
+ 	return ByteArray(res);
+ }
+ 
++#ifdef ZXING_READERS
+ CharacterSet Content::guessEncoding() const
+ {
+ 	// assemble all blocks with unknown encoding
+@@ -236,5 +239,6 @@ ContentType Content::type() const
+ 
+ 	return ContentType::Mixed;
+ }
++#endif // ZXING_READERS
+ 
+ } // namespace ZXing
+diff --git a/core/src/Content.h b/core/src/Content.h
+index 99e5a01e7140..aa77bda94d54 100644
+--- a/core/src/Content.h
++++ b/core/src/Content.h
+@@ -38,7 +38,9 @@ class Content
+ 	void ForEachECIBlock(FUNC f) const;
+ 
+ 	void switchEncoding(ECI eci, bool isECI);
++#ifdef ZXING_READERS
+ 	std::string render(bool withECI) const;
++#endif // ZXING_READERS
+ 
+ public:
+ 	struct Encoding
+@@ -75,13 +77,17 @@ public:
+ 	bool empty() const { return bytes.empty(); }
+ 	bool canProcess() const;
+ 
++#ifdef ZXING_READERS
+ 	std::string text(TextMode mode) const;
+ 	std::wstring utfW() const; // utf16 or utf32 depending on the platform, i.e. on size_of(wchar_t)
+ 	std::string utf8() const { return render(false); }
++#endif // ZXING_READERS
+ 
+ 	ByteArray bytesECI() const;
++#ifdef ZXING_READERS
+ 	CharacterSet guessEncoding() const;
+ 	ContentType type() const;
++#endif // ZXING_READERS
+ };
+ 
+ } // ZXing
+diff --git a/core/src/DecoderResult.h b/core/src/DecoderResult.h
+index 02b285084195..3117b03a923a 100644
+--- a/core/src/DecoderResult.h
++++ b/core/src/DecoderResult.h
+@@ -50,7 +50,9 @@ public:
+ 	Content&& content() && { return std::move(_content); }
+ 
+ 	// to keep the unit tests happy for now:
++#ifdef ZXING_READERS
+ 	std::wstring text() const { return _content.utfW(); }
++#endif // ZXING_READERS
+ 	std::string symbologyIdentifier() const { return _content.symbology.toString(false); }
+ 
+ 	// Simple macro to set up getter/setter methods that save lots of boilerplate.
+diff --git a/core/src/GTIN.cpp b/core/src/GTIN.cpp
+index 256855a03070..690901062301 100644
+--- a/core/src/GTIN.cpp
++++ b/core/src/GTIN.cpp
+@@ -199,6 +199,7 @@ std::string LookupCountryIdentifier(const std::string& GTIN, const BarcodeFormat
+ 	return it != std::end(COUNTRIES) && prefix >= it->first && prefix <= it->last ? it->id : std::string();
+ }
+ 
++#ifdef ZXING_READERS
+ std::string EanAddOn(const Result& result)
+ {
+ 	if (!(BarcodeFormat::EAN13 | BarcodeFormat::UPCA | BarcodeFormat::UPCE | BarcodeFormat::EAN8)
+@@ -208,6 +209,7 @@ std::string EanAddOn(const Result& result)
+ 	auto pos = txt.find(' ');
+ 	return pos != std::string::npos ? std::string(txt.substr(pos + 1)) : std::string();
+ }
++#endif // ZXING_READERS
+ 
+ std::string IssueNr(const std::string& ean2AddOn)
+ {
+diff --git a/core/src/GTIN.h b/core/src/GTIN.h
+index d56b604e5f71..9af0b01200ce 100644
+--- a/core/src/GTIN.h
++++ b/core/src/GTIN.h
+@@ -47,7 +47,9 @@ bool IsCheckDigitValid(const std::basic_string<T>& s)
+  */
+ std::string LookupCountryIdentifier(const std::string& GTIN, const BarcodeFormat format = BarcodeFormat::None);
+ 
++#ifdef ZXING_READERS
+ std::string EanAddOn(const Result& result);
++#endif // ZXING_READERS
+ 
+ std::string IssueNr(const std::string& ean2AddOn);
+ std::string Price(const std::string& ean5AddOn);
+-- 
+2.43.0
+
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index 6c6917ed8650..ff11896f4b79 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6d54e403592ec7a143791c6526c1baafddf4c0897bb49b1af72b70a0f0c4a3fe  zxing-cpp-2.1.0.tar.gz
+sha256  02078ae15f19f9d423a441f205b1d1bee32349ddda7467e2c84e8f08876f8635  zxing-cpp-2.2.1.tar.gz
 
 # License files
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 077d7e75d3dd..5f91bf2f716d 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 2.1.0
+ZXING_CPP_VERSION = 2.2.1
 ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

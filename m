Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23528E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 20:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9491839A4;
	Sun, 12 Jan 2025 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFO5Ge3w80mc; Sun, 12 Jan 2025 20:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F028583955
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F028583955;
	Sun, 12 Jan 2025 20:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1A6395D
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FFD36108E
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9Zb_RNO_qdc for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 20:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C95F761084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95F761084
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95F761084
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:29:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A4B6FF804;
 Sun, 12 Jan 2025 20:29:28 +0000 (UTC)
Date: Sun, 12 Jan 2025 21:29:13 +0100
MIME-Version: 1.0
Message-Id: <20250112-fix_zxing-v1-1-ffd083221fb6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABgmhGcC/x2MQQqAIBAAvyJ7TnCFPPSViIh1s71YKIQk/b2l4
 zDDdKhchCtMpkPhW6qcWQEHA3RsObGVqAze+dEhertLW58mOVlHjJFCYEYC7a/CKv/XvLzvBy/
 zaFlbAAAA
X-Change-ID: 20250112-fix_zxing-0ce1dc66ee1c
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736713769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W7nEKK+SNJtEsuju/Z1zOUSAP2pQIiugrVEgrXPPTVA=;
 b=msMI9LzcTnZIiba4s0Kkj0ZWVAxRhXyglpZGz/4egRtcnAfeFoeK5NyfBlTDW8pkc6mPef
 +HC0SH0zcEmikXwtzIdrzgII5rDB52wyfB3qEkjyKeFOwOoyEq8Y2Fe4d8CYVVEbkTaa7R
 uZBuEuJngpW0JoQV1uUji4Df7isBgUeGUQn6u9E3GF7TSW4QbCdnfyGj5Qb+edHg531X2M
 XFnEUeW4ET80M2xtYgoz8XxLXcwGRu4j2aQvhC/9M5KHfxQ0N+CUdOrVHfcvrEq1JZCsdw
 YTO8g/b7bJSGUYQeHVoFMXmiILXjIcOTHzs9NScK1tb/PjYj7dy0C2N9qmZ5UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=msMI9Lzc
Subject: [Buildroot] [PATCH] package/zxing-cpp: bump to version 2.3.0
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit bumps the zxing-cpp version to 2.3.0.

The compilation of this package has been broken since the bump to v2.2.1
when it is compiled with reader support, due to the added patch.

This patch was not added upstream, but another set of more generic
patches [1] that do not change the API were added instead. The error
that the Buildroot patch was fixing no longer exists in 2.3.0.

[1]:
    - https://github.com/zxing-cpp/zxing-cpp/commit/d0c8f226e22cd978fd42a25a6cff6d65b47ab6e9
    - https://github.com/zxing-cpp/zxing-cpp/commit/d979b765a14423f6d7747827b72193a0da9f3030

Fixes:
    https://autobuild.buildroot.org/results/ba4573a1bcc0110d4d0b45642e07009ec949d66a/build-end.log

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
This patch doesn't require to be backported to 2024.02 as zxing-cpp
wasn't bumped to v2.2.1 yet.
---
 ...lding-when-only-writer-support-is-enabled.patch | 164 ---------------------
 package/zxing-cpp/zxing-cpp.hash                   |   2 +-
 package/zxing-cpp/zxing-cpp.mk                     |   2 +-
 3 files changed, 2 insertions(+), 166 deletions(-)

diff --git a/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch b/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch
deleted file mode 100644
index 0d2a90f7a5466a42138b69c5db49196d62a66b89..0000000000000000000000000000000000000000
--- a/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From aef33b66df0ad6f085dc55b50d7847e0b8a2ccd8 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Wed, 17 Jul 2024 14:53:35 +0200
-Subject: [PATCH] Fix building when only writer support is enabled
-
-The compilation of the following code, which links the zxing-cpp library
-built with only the writer (encoder) support, raises the following
-linking errors:
-
-using namespace ZXing;
-
-int main(void)
-{
-	std::string str = "01";
-	BitHacks::NumberOfLeadingZeros(0);
-	auto writer = MultiFormatWriter(BarcodeFormat::Code128);
-	writer.setEncoding(CharacterSet::UTF8);
-	writer.setMargin(0);
-	auto matrix = writer.encode(str, 0, 0 /*scaledImageWidth, pixelHeight*/);
-
-	return EXIT_SUCCESS;
-}
-
-arm-buildroot-linux-uclibcgnueabihf/bin/ld:host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::TextDecoder::GuessEncoding(unsigned char const*, unsigned int, ZXing::CharacterSet)'
-arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::HRIFromGS1[abi:cxx11](std::basic_string_view<char, std::char_traits<char> >)'
-arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::TextDecoder::Append(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&, unsigned char const*, unsigned int, ZXing::CharacterSet, bool)'
-arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::HRIFromISO15434[abi:cxx11](std::basic_string_view<char, std::char_traits<char> >)'
-collect2: error: ld returned 1 exit status
-
-The patch fixes these errors.
-
-Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarula>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: backport from upstream https://github.com/zxing-cpp/zxing-cpp/pull/811
----
- core/src/Content.cpp     | 4 ++++
- core/src/Content.h       | 6 ++++++
- core/src/DecoderResult.h | 2 ++
- core/src/GTIN.cpp        | 2 ++
- core/src/GTIN.h          | 2 ++
- 5 files changed, 16 insertions(+)
-
-diff --git a/core/src/Content.cpp b/core/src/Content.cpp
-index 4d3c44657cf9..569d4e35614a 100644
---- a/core/src/Content.cpp
-+++ b/core/src/Content.cpp
-@@ -93,6 +93,7 @@ bool Content::canProcess() const
- 	return std::all_of(encodings.begin(), encodings.end(), [](Encoding e) { return CanProcess(e.eci); });
- }
- 
-+#ifdef ZXING_READERS
- std::string Content::render(bool withECI) const
- {
- 	if (empty() || !canProcess())
-@@ -165,6 +166,7 @@ std::wstring Content::utfW() const
- {
- 	return FromUtf8(render(false));
- }
-+#endif // ZXING_READERS
- 
- ByteArray Content::bytesECI() const
- {
-@@ -188,6 +190,7 @@ ByteArray Content::bytesECI() const
- 	return ByteArray(res);
- }
- 
-+#ifdef ZXING_READERS
- CharacterSet Content::guessEncoding() const
- {
- 	// assemble all blocks with unknown encoding
-@@ -236,5 +239,6 @@ ContentType Content::type() const
- 
- 	return ContentType::Mixed;
- }
-+#endif // ZXING_READERS
- 
- } // namespace ZXing
-diff --git a/core/src/Content.h b/core/src/Content.h
-index 99e5a01e7140..aa77bda94d54 100644
---- a/core/src/Content.h
-+++ b/core/src/Content.h
-@@ -38,7 +38,9 @@ class Content
- 	void ForEachECIBlock(FUNC f) const;
- 
- 	void switchEncoding(ECI eci, bool isECI);
-+#ifdef ZXING_READERS
- 	std::string render(bool withECI) const;
-+#endif // ZXING_READERS
- 
- public:
- 	struct Encoding
-@@ -75,13 +77,17 @@ public:
- 	bool empty() const { return bytes.empty(); }
- 	bool canProcess() const;
- 
-+#ifdef ZXING_READERS
- 	std::string text(TextMode mode) const;
- 	std::wstring utfW() const; // utf16 or utf32 depending on the platform, i.e. on size_of(wchar_t)
- 	std::string utf8() const { return render(false); }
-+#endif // ZXING_READERS
- 
- 	ByteArray bytesECI() const;
-+#ifdef ZXING_READERS
- 	CharacterSet guessEncoding() const;
- 	ContentType type() const;
-+#endif // ZXING_READERS
- };
- 
- } // ZXing
-diff --git a/core/src/DecoderResult.h b/core/src/DecoderResult.h
-index 02b285084195..3117b03a923a 100644
---- a/core/src/DecoderResult.h
-+++ b/core/src/DecoderResult.h
-@@ -50,7 +50,9 @@ public:
- 	Content&& content() && { return std::move(_content); }
- 
- 	// to keep the unit tests happy for now:
-+#ifdef ZXING_READERS
- 	std::wstring text() const { return _content.utfW(); }
-+#endif // ZXING_READERS
- 	std::string symbologyIdentifier() const { return _content.symbology.toString(false); }
- 
- 	// Simple macro to set up getter/setter methods that save lots of boilerplate.
-diff --git a/core/src/GTIN.cpp b/core/src/GTIN.cpp
-index 256855a03070..690901062301 100644
---- a/core/src/GTIN.cpp
-+++ b/core/src/GTIN.cpp
-@@ -199,6 +199,7 @@ std::string LookupCountryIdentifier(const std::string& GTIN, const BarcodeFormat
- 	return it != std::end(COUNTRIES) && prefix >= it->first && prefix <= it->last ? it->id : std::string();
- }
- 
-+#ifdef ZXING_READERS
- std::string EanAddOn(const Result& result)
- {
- 	if (!(BarcodeFormat::EAN13 | BarcodeFormat::UPCA | BarcodeFormat::UPCE | BarcodeFormat::EAN8)
-@@ -208,6 +209,7 @@ std::string EanAddOn(const Result& result)
- 	auto pos = txt.find(' ');
- 	return pos != std::string::npos ? std::string(txt.substr(pos + 1)) : std::string();
- }
-+#endif // ZXING_READERS
- 
- std::string IssueNr(const std::string& ean2AddOn)
- {
-diff --git a/core/src/GTIN.h b/core/src/GTIN.h
-index d56b604e5f71..9af0b01200ce 100644
---- a/core/src/GTIN.h
-+++ b/core/src/GTIN.h
-@@ -47,7 +47,9 @@ bool IsCheckDigitValid(const std::basic_string<T>& s)
-  */
- std::string LookupCountryIdentifier(const std::string& GTIN, const BarcodeFormat format = BarcodeFormat::None);
- 
-+#ifdef ZXING_READERS
- std::string EanAddOn(const Result& result);
-+#endif // ZXING_READERS
- 
- std::string IssueNr(const std::string& ean2AddOn);
- std::string Price(const std::string& ean5AddOn);
--- 
-2.43.0
-
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index ff11896f4b7931a10502f66ef0167fa8b2f760ba..c0758579dbb02dea4fe5faa5d8580c556022b410 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  02078ae15f19f9d423a441f205b1d1bee32349ddda7467e2c84e8f08876f8635  zxing-cpp-2.2.1.tar.gz
+sha256  64e4139103fdbc57752698ee15b5f0b0f7af9a0331ecbdc492047e0772c417ba  zxing-cpp-2.3.0.tar.gz
 
 # License files
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 5f91bf2f716d86ff1252a431297386b36406bef5..515daf590ff53e394ff9b789711e895f56e5499a 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 2.2.1
+ZXING_CPP_VERSION = 2.3.0
 ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = LICENSE

---
base-commit: 012baffa75061b1776672c0d89bc015e27deaf68
change-id: 20250112-fix_zxing-0ce1dc66ee1c

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

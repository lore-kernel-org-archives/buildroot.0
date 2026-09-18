Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22879C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99AA60DC5;
	Fri, 18 Sep 2026 18:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuUtYMk_21lE; Fri, 18 Sep 2026 18:43:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DA8666064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757022;
	b=KI2KZ0Sq48GXFUWzDIAiw3nNyYnx68Yf/UirDPjCHRtCBr7fiYuKmXxBdjKOLzwToeX7
	 718IOdpy6pIIqYFScmtoCv0MTk9xbeL7VR+E8Q+rbzAPWeV5SZQ3YMOhsoc/5y6N7EbX8
	 0qj1q9fT754aHwt8zYFlYl8U+FdX/0EooQT0WMojooUiPFGkcOr2w34QksjkIm92MoZB2
	 he6ByLpy887M58g8V1QxXb5feMZtLjwMpinSMutdwhKVvzraMWPW5ag17kVSJ9QeQzsGt
	 eXwlhy8D5igeAQiyRsFDRKq411z8dffTbzWlcjhfyoy/V4Ly6jpqVfTTa0rkdwDMXig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=09xGPVp2zG5l94Ts+hJH2qBmJWI3SEkh77CE0h7r61I=;
	b=pEgv9OHW3LV2hYyKF5lHoDoX2hH3kQYM6IWg5gy11sP7APE2444AzgEmO+f9dgGnbJp0
	 +slvcSlxffTEYDfzMFASecPt9VVKhGGTnuhbXSSb5696y6oo4f9TZYVp2q9AuBf6qWYhd
	 dRoElrYFJzhrKSRAAsLFtmZo2z6K2t6OptvRkeMggVtgRpT72bx0O5Si87OLIAtpSyLeY
	 xBmuL2NsACVBnrH6BBjwIPH/hHSm/RFywlpriAY9V0BUbtSRkFJ+HmnZEbpuR9n237kqg
	 +OFyVkfAHg2X1JsFuLk3noo8m/nS5L8txttgXgdwtOYWTKPlH8R9SZUNx0zm5y4cUyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pkhLGBYF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757021;
	bh=09xGPVp2zG5l94Ts+hJH2qBmJWI3SEkh77CE0h7r61I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BIQaYUjCdavRjivK3+WEuSnb6PC8xg/gtgk6is0P6f7kq4lIHFJKX7OeY11dpf6LE
	 wO/jIBEaPBE81raFSxnPiczQpRdJfzYn3rIoyOCTyQBJ4hd7ukHRjKgkr3JtCb/Dnr
	 bDaqfBLN0IxRSFYY1lQXJG8zt9YkdWD6KlNfdZaEbFzLzwNd7Yg9iMZCcEb8J418oj
	 CWee52yKUwLb7qXn1jaVhWQzUJ5csqU62u3r4s1wIFQLVkE4dvlLMWtk9SJ+x4bAKo
	 NM8ewb2N8RgQWlcfx1v4CVZbsL53gPdefzW+wEVTu4ZeVciA/h7DyVutyYpy9c69N5
	 QJfDhrUvA9rxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA8666064F;
	Fri, 18 Sep 2026 18:43:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02029237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC4416064F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zj2mKk2Jnpp7 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:43:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D855260617
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757020;
 b=kW1NV3LW1jK4EDBL4tNDR8AvDgtpouiQwSnqWNdeN8ol6mDpZEkJ/qE42ervKHfDpntc
 wWkjCVAVxzylMi+yIpJAS8FMiKBP6TKGBLnnE1TZS3j5pXBO1lzUnUr4m6RjKKePgF/yc
 9hADkGuYbLomqhrmHfs+t1pPHEucJriZ2RkNk32d4xy72zndzl358C/4SpsPb05QOKqT/
 IOq04aRzb8yQDI80nuaa5N5Dq2XToR4I1w0nWrETT3C52iUg4/v1EWCoNMlCZWgW1mgZN
 7KADG4XebDUFNgl6wVrdXJ+0s2iNmAcN1lmgT7v31oM+RjvEjfuJvVCwQDw1Xu+4+1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757020;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XLPhJ/yqdZDpBa2W8oqLgq7qY66DZWf+Ky/L9XVf+kI=;
 b=UJL6OzzV40a3y8HSxCXxoQiG71RNaoqFvrrFp46ef6orfm8uDdtiWL1hbXcm+OEOFjw1
 ZArq3seVhmvb1k7X/7wkt/VmqB9r9udk3dhDN0q6TbxsZjU9Ls1pXwPHQaSJTRR5esrhS
 92YI9AfbgeJ+qJ9rPbj/mxjGYG/685bAfyvPx36R+zupZMa2HbJ2r2y7qkIRhg0EK6RS+
 LRJQvYgVXNxdQTaLLSr/wJLgat5j6Q0jNZd0gBxJPzjG5xy8701vkCBAA2GEVtnT1lElo
 OkomxstLknd6om7ccE7SnjLMiVoLh8dRP1LsMHk+bypQz8m2djaHZYQo33Ab2UW56Qg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pkhLGBYF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pkhLGBYF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D855260617
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756905;
 bh=XLPhJ/yqdZDpBa2W8oqLgq7qY66DZWf+Ky/L9XVf+kI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pkhLGBYFM/o+bPegfuvOMcXvJyv9f8oNZUDiIVP4watvVwa73/wx6b3Pxk6p6hlE5
 A4qzTIgbZzcahqiVGsGY/KOF/TrboRGvw5hHdb3PpTX2LrpfFDMMYmy5tGY+K9TaB/
 Trl8/UDp1cOAhq0rGSW5Y3tJ8vIFbhXky9dvxGVGDzsa8tJYcO7dpEHR4IBRNNiOxr
 5OfGEoBy2A4dBERuw8go3EuFL95dOZzC5RjWPb8WeXolzIC7FqUDtHw4Opmo0w0E/A
 CFscGhP95cPSm5+6yBfXNEKsVaqZap8UxsMVjNj+PNMHQEQ7SckmuxOa+avbuIo7Aj
 Wei/wm0bSiFjA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:sT6QlizaRwruGjTwvFw0j70VJbSpp90X1TMr3Q1fZi051HKdmN18/YuILExbAmW8ZBrsvngbN9F/siAjn374aTngql476YQtub35K2Qbcg9uNg8WCsllNn1P67QxQKmWavbUXgWqXqkF/3Gd6Jf0BaYnbzM/K+xokMjXUNzmY9Ev7Qql0T8xir1L98DpcZiGw0CUF3DvCPlbWjkOhBfelqKLGsD/ZTq2ApEvCFmPnqfj56XIPDLQhZHhEYnvD5yvDanA1odlGIE+wn1UfwPjd/ykUto1w3Bt16ugahLJ7ycs3WZ+DAAGQwJDkfOUhzvvNELM5HMFdVYgELkywmG1i/9w6cDlpuoyfYOxrq3cS2JJgFVe6dILA99t/yIL7sN20qQ1uwhHohamnmmb1szNav0tDRy92bk5cfRvdaZqCjx0EnIYEtD433K+MZUeEd4wO3E/VNxvNl6oyVdIONRMv1d4Dm7ctaGxb2wkiRwozDZMPv9TrDTmfl2JoIhUolJ1VwE93qG/z+cQjgK2ASRYlWTj9pyDBhs/LQu14xc/GjlVtv2ealVb+hIUzDeX9Tx5p00Oa4hB9rj4J7zSPrgOG6O36mFqcjy7w8b7CgMiC70Brz
 zIiVuJvHfYAOgsuh4LtB+Dlxvp+Z+zyGS/5PAv/pCbjr3eBWFccuABq96RRZDLJJYxGnpE9iTDKjdpWQaGL3pyy/FP0PMFfFDUXkgKat65ZO1enDdP
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 581DFA4C4700;
 Fri, 18 Sep 2026 20:41:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWq-000000007cB-3BUh;
 Fri, 18 Sep 2026 18:41:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:31 +0200
Message-ID: <20260918184140.3631274-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 09/77] package/jwt-cpp: new package
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for domoticz >= 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/jwt-cpp/Config.in    | 12 ++++++++++++
 package/jwt-cpp/jwt-cpp.hash |  4 ++++
 package/jwt-cpp/jwt-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/jwt-cpp/Config.in
 create mode 100644 package/jwt-cpp/jwt-cpp.hash
 create mode 100644 package/jwt-cpp/jwt-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 954279b8a1..0bdf812052 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -403,6 +403,7 @@ F:	package/intel-mediasdk/
 F:	package/intel-microcode/
 F:	package/intel-vpl-gpu-rt/
 F:	package/jsoncpp/
+F:	package/jwt-cpp/
 F:	package/kodi*
 F:	package/lame/
 F:	package/lcms2/
diff --git a/package/Config.in b/package/Config.in
index 968ad126bc..8dd0560a2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1908,6 +1908,7 @@ menu "JSON/XML"
 	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
+	source "package/jwt-cpp/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
diff --git a/package/jwt-cpp/Config.in b/package/jwt-cpp/Config.in
new file mode 100644
index 0000000000..3feadfe3ec
--- /dev/null
+++ b/package/jwt-cpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_JWT_CPP
+	bool "jwt-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A header only library for creating and validating json web
+	  tokens in c++
+
+	  https://thalhammer.github.io/jwt-cpp/
+
+comment "jwt-cpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jwt-cpp/jwt-cpp.hash b/package/jwt-cpp/jwt-cpp.hash
new file mode 100644
index 0000000000..38df18ced7
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.hash
@@ -0,0 +1,4 @@
+# From https://github.com/Thalhammer/jwt-cpp/releases/tag/v0.7.2
+sha256  7c1b4f767bdd14f727f6114d9e35b761f10d00d6a27ef7650ee8c628f08df27c  jwt-cpp-v0.7.2.tar.gz
+# Locally calculated
+sha256  35c2d7d6824a1e1ed2b266ec334b7862726ae593855c3cfa68b952bb75f082c4  LICENSE
diff --git a/package/jwt-cpp/jwt-cpp.mk b/package/jwt-cpp/jwt-cpp.mk
new file mode 100644
index 0000000000..27e7d23691
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jwt-cpp
+#
+################################################################################
+
+JWT_CPP_VERSION = 0.7.2
+JWT_CPP_SITE = https://github.com/Thalhammer/jwt-cpp/releases/download/v$(JWT_CPP_VERSION)
+JWT_CPP_SOURCE = jwt-cpp-v$(JWT_CPP_VERSION).tar.gz
+JWT_CPP_LICENSE = MIT
+JWT_CPP_LICENSE_FILES = LICENSE
+JWT_CPP_INSTALL_STAGING = YES
+JWT_CPP_DEPENDENCIES = openssl
+JWT_CPP_CONF_OPTS = \
+	-DJWT_BUILD_EXAMPLES=OFF \
+	-DJWT_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

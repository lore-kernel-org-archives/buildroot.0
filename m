Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499CECA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D758840875;
	Sun, 11 Oct 2026 07:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJtHKOh__8CW; Sun, 11 Oct 2026 07:06:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B0FE4079D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791702400;
	b=Fdi3zp/mSTm7YeI6ap6BgbJMOoOp8FdhszE0nMv8iy5X+Z8zpOqvmwosXGEm4hpEhnd0
	 GFZq8Y6z67E051JUg/BzJz4HRI2O4zzD9KYSL6d673V52lVXjmvzigAms0TSpxFmKN6m9
	 U21GIgMQQ69BDgWAtpPa+qNaxc3w4AZWtSQ8vpt16Zi8K/FZHlZxnswPlWRh4misBLAgo
	 J9BC3TH2qAp34+rYgaOaL+s0mZWdCPMeuIjbk6tyVMsZ7p3Tez22LqT1iuUgMcXVlpHNl
	 8YqGYTEZ3t5D3gi8NLbCmT7Kyn3uq0/NKIn/qeugqKQqpZjW09HMiXCyu/NBZJP5B/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791702400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SHjy1n8R3/1Ez5ezAHG88v3F0OaV0THgM/QogzCuDD8=;
	b=m7gz8RgE6WN9XGdYi0M6703XM+jIlYB2LYtCNdbm9zWgm6kld9/dWqFPiS71BYm76c0D
	 9zYqxPaxZUFQOhfxKFkFNLD8Pb8t5OUiHFPf9Fap9LnHF16C6GCwcjIm3sv1IYa6hUp30
	 CtdJMMqxNBIDc0X8JRcH44XDEi1E19zjJU86RHKWc8ARh+Aa8CkkaLPw+Emr7Kyj/+d8G
	 2SeAOQDFAUrfeFUeMKhwUFxN+x5OKGZBNiJFqvIrm75Krte5+ITqjQrzsuoNziebNCVYQ
	 cLF8Mv7k60jzK0ZFFyWiZeMfAcgapDOFkoNvBpGxbUIgWxgjf4eoFFNx6n21i1zOFug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791702400;
	bh=SHjy1n8R3/1Ez5ezAHG88v3F0OaV0THgM/QogzCuDD8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U0/o5Yi/mai3nR2y5qR/dUwuwyDgcouMRxe8bpYXVBnWeea2nZSzvh2okwxryHtQe
	 gbB2x/2wo1sYWv73Z04AFTmd2Ru7B3qHkXuYbLvUrmNKEqewCM0fkmRDNDITPJ4OZP
	 8w58DJYhciTMZ9gsSrNzOn8dmLdWL5SXa3JzyVsFUrR0UfPmJdKvV8gAIW2IShlAln
	 WQKunUwNbwrEHPx3ZrD6aGMOXiO/ShYzn4j38nGfqXGvaMW1oIMgtn4Y9W+xLmMz8l
	 f0dlBr51cE0W0ptuTs8GpeJxGiY7aMZZUdSPJOS879XMwg3RQbeYQQSaTgnQaRGlzb
	 05B8ettYmADWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0FE4079D;
	Sun, 11 Oct 2026 07:06:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 231FC1DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC8160728
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmhfitTulL9M for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:06:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 84AD8606EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791702396;
 b=mglRZgvAWXTFEbM80s60vyZZOcIr+XptBVHuFMyoBuemJTRlF/9F+7PmHD1v2zIdG0KH
 Ta09GbpyQ67RGGf9Thb6aCtFHHcns24RI/AKyUUNghKu2gipNRcdrQGKWKu5g/HDQ3kH3
 +sT4iESaYnAsFZszbi2Ba1xB1A3uwAkTNrKzKkrwpQQQ4lBbOS9qd8aliDlWop5qG6PhY
 BvwNqMxA8L1cuDX6FD116siMuDetLr+n/Yz1yV7aaB713oURFC6OjBc10Ykg3AQ545irq
 /gRiR4iUnRHndS9DXQK3870omlhLuRIH8lsOHEWissrO1cSuHlgYBk9Tn+TsobB1kgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791702396;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HtOeDQiip2Hh+kwGIFRptEe/LXvE5bgOdKVyPvIANHw=;
 b=D0FtGp/uxjLstaJ/WypnJ3kZ12hX3ONuHBYeell6+4DZ6vM/t6XMJ4inBGUr5Ju5Rf5S
 yiww8VYwbLCKjeUX9yXCrJkXaLGXviyphBentPypkxTtn8fwCDfSlUCTA3yD3pNUPKt3e
 kmVNslzDNSj0jVC8JV/nnLDz1B/acOgZwmBt3UpGrykIqOSFUIuJuTOJR6wd0mR3XHVCK
 CICXrQdcD5eKr9tQioxowUSsB5J7KCt+DsskQaa/7yWcyXsqpgK0Hx9ktQ+F/lvYSLMu9
 WiQU8gtXvc34r28fi5mj2/MsmIJeXUdQx2W+tpz6cnQFhYvEG+NuuH6O+ih4xqY+sXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84AD8606EF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0011F88485; Sun, 11 Oct 2026 07:05:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 09:06:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a69b8c7eda80157d7e794ba64ebfbc86b20c48b
X-Git-Newrev: 7e05cbe06e50dad5c0271a9b384c997aea445e95
X-Patchwork-Hint: ignore
Message-Id: <20261011070518.0011F88485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libaec: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e05cbe06e50dad5c0271a9b384c997aea445e95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libaec provides fast lossless compression of 1 up to 32 bit wide
signed or unsigned integers. It implements the Golomb-Rice compression
method under the BSD license and includes libsz, a drop-in replacement
for the SZIP library with the same API (szlib.h) and soname
(libsz.so.2).

https://github.com/Deutsches-Klimarechenzentrum/libaec

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libaec/Config.in   | 10 ++++++++++
 package/libaec/libaec.hash |  3 +++
 package/libaec/libaec.mk   | 19 +++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c6ac972854..0c03a503aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3569,6 +3569,7 @@ F:	package/feh/
 F:	package/hostapd/
 F:	package/imlib2/
 F:	package/kmod/
+F:	package/libaec/
 F:	package/libftdi1/
 F:	package/libical/
 F:	package/libmbim/
diff --git a/package/Config.in b/package/Config.in
index a768b6b7b3..c5806ad2a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1620,6 +1620,7 @@ menu "Audio/Sound"
 endmenu
 
 menu "Compression and decompression"
+	source "package/libaec/Config.in"
 	source "package/libarchive/Config.in"
 	source "package/libdeflate/Config.in"
 	source "package/libjcat/Config.in"
diff --git a/package/libaec/Config.in b/package/libaec/Config.in
new file mode 100644
index 0000000000..86fd770f2a
--- /dev/null
+++ b/package/libaec/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBAEC
+	bool "libaec"
+	select BR2_HOST_CMAKE_AT_LEAST_3_26
+	help
+	  libaec provides fast lossless compression of 1 up to 32 bit
+	  wide signed or unsigned integers (samples). It implements
+	  Golomb-Rice compression method under the BSD license and
+	  includes a free drop-in replacement for the SZIP library.
+
+	  https://github.com/Deutsches-Klimarechenzentrum/libaec
diff --git a/package/libaec/libaec.hash b/package/libaec/libaec.hash
new file mode 100644
index 0000000000..cf4984447f
--- /dev/null
+++ b/package/libaec/libaec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cc7b93be9002e25a88b45d6b8d5f6120756cb5e1000613f91d803ce0beba24d9  libaec-1.1.7.tar.gz
+sha256  9fdabba96fbc46af0ca018f86329f1e06e873b25801732001128d5afca265e36  LICENSE.txt
diff --git a/package/libaec/libaec.mk b/package/libaec/libaec.mk
new file mode 100644
index 0000000000..d631230be6
--- /dev/null
+++ b/package/libaec/libaec.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libaec
+#
+################################################################################
+
+LIBAEC_VERSION = 1.1.7
+LIBAEC_SITE = https://github.com/Deutsches-Klimarechenzentrum/libaec/releases/download/v$(LIBAEC_VERSION)
+LIBAEC_LICENSE = BSD-2-Clause
+LIBAEC_LICENSE_FILES = LICENSE.txt
+LIBAEC_INSTALL_STAGING = YES
+
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBAEC_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+else
+LIBAEC_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

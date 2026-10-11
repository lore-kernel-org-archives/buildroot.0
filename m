Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513EDCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6015C60616;
	Sun, 11 Oct 2026 13:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJe8QqviErcq; Sun, 11 Oct 2026 13:01:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDB006060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723681;
	b=e7mN0NOHGY7fSF5+CRJhPZCfvlp0/LYpv0IUx8bsy3bycobLISd65D63YzDBQ+4fl6jk
	 BnDaKeouHU2MNx+4Dh2aL7LHEnX6AFgbkjluscnB3PmC82IYdXeaaBFJgNWMC64V597K+
	 koLNYxEWEwr2dextcme7urYmmL3TotpZMpjO7ZIZ/3iaWtOf6Ry9rYXRMzLSww3QCdnbv
	 eoj8O9oo2YYOX+sUED1jkcwxJS+Y5k1he7LlfarF7Tx/tZTMJZ/UHCLr+6PtCEL+P96t8
	 1CoHeVWKY0kkFmfzL72TkR6ZNSbi3Y9cyM/YUnLN8W46a4eS2qpLnPIw6TbiT7k+B2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jR7VGcVsGAheU5PIFFvpHj2t9GG/XzbII0zORbJZ6c8=;
	b=NOWuFLF4jJiP1F3KwzyhCPTBKvKPGWR8HaIng+MbXpOwWOELTFefMw+DyYsFeQyHK6Ca
	 vBkf4sx0qUzbVPqYincUTLYKsSzEQLAxpAA8W6mS6EuBzjpkyGllsNYoZ9R5p6LkCa17H
	 FOLtKMY0Bbt5r2KQlfWKoQnL/dBegOI7NvVQFqCipjw37/2FPpZzxipkc3WOdqUqgICoT
	 rllzynuWpL8JAQdR0eMPG1uF953Q4I8+R9+kaHEEVxnidDeNErs7rZ0U0U6jynX71BpGf
	 f3UnuUKaFh7qjwcRAgkZa9XOnPf9/xT2hqmf7baz5VdZC9tEdSysOCKV6F3L0u9pnow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723681;
	bh=jR7VGcVsGAheU5PIFFvpHj2t9GG/XzbII0zORbJZ6c8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GShWV+sP3nvYjVguRIU+Ye7A+s3RIJRg9zuT9yXccI+HCKeOeviok9wVvlqeeQ8sk
	 I1vSdsXr5Lw00gzQ018TvNEfFKQsv1sDPP/gVoxMM+g9eSsKZ06OBPutL91rlYbBrD
	 n/49eE2epFViR8tJ3KIYsIk1y+xUXiszPnTpgvBtZ0JC3Z/Av+jjqjfqJT+0GGxZqZ
	 VMUPeApnHdQklG1wriFxOS8TbgGeOCvOC0wgWIV95E8Yfelwxm6jT6IphrDWUC0fWw
	 1SuWmF4RB0CAXoY2RiYFkl77rydQUEuv0y3leQIGuQtmwJkirgtk5HxPwD52nzYvcJ
	 kIiOWdT47+0Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB006060B;
	Sun, 11 Oct 2026 13:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A769111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 002FA80C84
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOSs0Quy3xRA for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D088380C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723679;
 b=Nm7XYlxEO9A9hkFhSCxG6jPTvRgNFzt/nNzj3b0Cp4ZWeduJW7fnRGAp0WEZ9q8G5o6x
 KQj2slMXcLflGrl9K6em/M5WpV5N/P27VDaHJ7fbMzgxMu0xhCbfzVKwgYVLIQcg1+yDg
 nuow+paUrjcnaK+q1ttO308eZn+mx5rvi9aplRfMM6Ps8dvXDecG0en4Na5xhCGFW3uEd
 Cl8K3w1xmzkPlXZ63M9iQlWKM+sj20h6yFvF/vx7sBg6kE+ht1frG8/GTeT2AawNCb2Or
 A2HlyB9NcijdK7nBH+ZyDSyiLKVNuxnG6YZ9t9yFxe1SfAJvdw24PSlK0teyLRkYKqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723679;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/tEb1odY2MhZTFTiesMjT/D3EI6T3+mIQ05Q4Vx4rlQ=;
 b=TZojhsBfKlxi3/04eRcQgu3rFoQZPscqQDTOlzFIUN98hFCvHP9A0FImEM0s2fum2weF
 OVQ+JXpds836Kn8g1SE0Qu9+46srYpI8EZWpWVDvgop3c7p/9EzttAwFbo5JHLsF60T/Z
 c41tEjU2y4/HbMiRE94I8vK/B4IHj3XCjamoSES5M6f9udXagD1CBlUYb7MtAnpKee5Ct
 PupgE+fh5ZPCc4Zqv5xtJ2k0dPI7hRLKqCkwN2an32YNEUZbEbOtDCFlKgpG7b2l1Raht
 V8p9pImwCfDY7t4EGdoeTtShT8YdYdOlzMltxiQO7ZnytMAZxephpSEVlP4QcaAuBHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gZ8MTTvV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gZ8MTTvV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D088380C7E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723660;
 bh=/tEb1odY2MhZTFTiesMjT/D3EI6T3+mIQ05Q4Vx4rlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gZ8MTTvV552Ro6kNc5K6oT8PBncG3jpHftePbm9Dh00YzYWQyiVMCULuy3kCNbxFf
 5v6S5hVnJwpdcYbAZCPc1KDzJLcHTcnjJYvqOE0tEw7T+EZW+Mg2vtxtTKgalrUb5g
 QN47w0gN0iQgzaptPk22YskUtogs4QnMQKWRhB5vreU3INlRr3kLwvmB90mRaj7yLd
 F2SqR3ITp2I8gX5adfwmR5AOYd/g88kyH1RbCP7Bi6d9YOPhedW+JgDCpkTX4KezEs
 ILE+L3QiYqpWx9nxNh1JESSpBgBRG5sykrfXuUCmGOyFZs89U5sY4V4ZGLLGUP1xbq
 UzBjpmqGt9uAA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 biyuEKZkt5fHQ3hC1v1+JuUEEFzimqu9/yllFu7S1RSL1dp8lX2a7KI8xdyv3gpwqVyAp+vBY8J
 V+Zkq7YKmFrArDfzsNhZmTVVM+dkfSrJ3fnKijLO7IBjRtM2HABAEGcymx834AzEumQP5aCbypN
 ZNlcMIbtmVMdwGMALiDtkn0Jl8SjR1jCTagTn/bOJP/GxVdiuXZe2EDJfx+g4mFZDo6TMW2v9q1
 QWg8ePYzC587d5CYOOm60HzUSylZxqqS5Fbt8zGcjXKePZWK04Hh6lGEPiXhL4LLYdojwg83tny
 grz61YOUcckvf7lIrCYIsan4v3ljF99Nr7usDQrcWLZQOsjvqUc+0achY83AKwPid0VwqNwIVnC
 eHvVaX6Xg+TujRIpmOGshKJqfuVGw8qHML8o10iV+8MVPx6lzyzwg9UkAXDWZyi0jJTRnRkB3px
 tIX9rVSmpYVDqT1K1kekhouwH9yEC5x6osTceeYJryKm6iGa6NVYYS/SnbRP5r4CBxDNn0UZ+rr
 N301L6ctWexJZxTXARIhXtpmk/vmJppcVOwdSNSN7BmwWYV9+TcIHWvp/qX+d44abUkKStl58Gr
 E9ZZL/dL9UZVtx6Shi4uc7tKeV6Nj/eT4FEO3MG23DECSbumRIe/VVAFDsTeXCnOCgvzPySq+JS
 Zk/VH+w7/OCxZyg4HZX7ABzMAMe8=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2DA42A4C5846;
 Sun, 11 Oct 2026 15:01:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAi-000000007Fz-06GJ;
 Sun, 11 Oct 2026 13:00:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 11 Oct 2026 15:00:06 +0200
Message-ID: <20261011130058.3443432-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 01/52] package/qt5/qt5knx: remove package
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

Build is broken with the upcoming bump of OpenSSL to 4.0.3:

ssl/qsslsocket_openssl_symbols.cpp: In function 'QDateTime QKnxPrivate::q_getTimeFromASN1(const ASN1_TIME*)':
ssl/qsslsocket_openssl_symbols.cpp:1352:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1352 |     size_t lTimeLength = aTime->length;

ssl/qsslsocket_openssl_symbols.cpp:1353:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1353 |     char *pString = (char *) aTime->data;

ssl/qsslsocket_openssl_symbols.cpp:1355:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1355 |     if (aTime->type == V_ASN1_UTCTIME) {

ssl/qsslsocket_openssl_symbols.cpp:1415:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1415 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

Last update of the package dates back to 2020:
https://github.com/qt/qtknx/branches/all

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in.legacy               |  7 +++++++
 DEVELOPERS                     |  1 -
 package/qt5/Config.in          |  1 -
 package/qt5/qt5knx/Config.in   | 12 ------------
 package/qt5/qt5knx/qt5knx.hash |  6 ------
 package/qt5/qt5knx/qt5knx.mk   | 15 ---------------
 6 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 97824f701f..846e3c8f04 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5KNX
+	bool "qt5knx has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5knx package has been removed because it is
+	  incompatible with OpenSSL >= 4.x
+
 config BR2_PACKAGE_SZIP
 	bool "szip has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 01d98f8698..64e0371cd4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -254,7 +254,6 @@ F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qpdf/
 F:	package/qt5/qt5coap/
-F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f1b16ff39b..b837601dc6 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,7 +44,6 @@ source "package/qt5/qt5doc/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
-source "package/qt5/qt5knx/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
diff --git a/package/qt5/qt5knx/Config.in b/package/qt5/qt5knx/Config.in
deleted file mode 100644
index 991e93c8cb..0000000000
--- a/package/qt5/qt5knx/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_QT5KNX
-	bool "qt5knx"
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt KNX module implements the client side of a connection
-	  between a client and a KNXnet/IP server. This connection
-	  can be used to send messages to the KNX bus and to control
-	  the functionalities of the KNX devices.
-
-	  https://doc.qt.io/QtKNX/index.html
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
deleted file mode 100644
index 2600a739bc..0000000000
--- a/package/qt5/qt5knx/qt5knx.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hash locally calculated
-sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
deleted file mode 100644
index 91b99aaa87..0000000000
--- a/package/qt5/qt5knx/qt5knx.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# qt5knx
-#
-################################################################################
-
-QT5KNX_VERSION = 5.15.2
-QT5KNX_SITE = https://code.qt.io/qt/qtknx.git
-QT5KNX_SITE_METHOD = git
-QT5KNX_INSTALL_STAGING = YES
-QT5KNX_LICENSE = GPL-3.0 with exception
-QT5KNX_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
-QT5KNX_SYNC_QT_HEADERS = YES
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

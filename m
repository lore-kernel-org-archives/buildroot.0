Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCF7CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CE780EF6;
	Tue, 29 Sep 2026 18:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJyo21fQulro; Tue, 29 Sep 2026 18:36:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E1E2C80F00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790706987;
	b=cqf6sgiaGjIKvS4sK1961cYk/UwzGVnhMXTgs77zMnf0u/DjJkyahakJzIURVZDGu/ff
	 iGQbKw4UoEwWX7pcSHAK1WB41HLcAYSebgPjseOe2ryedNPSlvUCGeslEwuChcr8i6TLh
	 cKZwMYLGOug1qE8CtT/+O2yMZZ1PpnLHF5d/QCA1bCv8RaZTNSDbzQ8PeYrBBrHMXdWsn
	 hLe4rZz8adFhYLQYhsYji5ysaMRr2lLpHLjLRlbhS2mXh0nfo4whfOfYVOvV+RQNPztmx
	 vl+yErZj9eNymo0BrfSdvc5Ww4uFiTKC/6gb6vtcT/dqWPW8X7jLh8IutDjkxvPb+XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790706987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xKy9LXCDfWHHuXfOTghB03ehoJkxU5o2M/dYG1B1tbY=;
	b=aBI9CTfFmANU97pvR7elAQslZTXlitQilCeKv1ePo0I/Hi2QkPUoVg+lQ3La4sjBG60X
	 Y0igOy9GTkMEDODAeN9BB5d2h+k0k/8zXOBlcziLdm5LfJxl5kLwhji6Vg1qp6BNXcgzU
	 /gFKr9sKM7S2VLQBNWBFY2mOjet83zHdl1Sp69ICafaEJ/xsgygr45XB9GJ2zKK0+m6lv
	 Y0ACWIUkpAA8ZjXvP+AxMBeV/H5QqdI5B4m1u+QBn1aArNArBW8TADJ8/oCIOIvos0QhT
	 1cEw+TKPXKwq9RBVl3ys+yE5n+22yhBwSTxsmcLAgLMMFclF2fXPPUkAs/7ANDULRVA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790706987;
	bh=xKy9LXCDfWHHuXfOTghB03ehoJkxU5o2M/dYG1B1tbY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfFUiMuXq1dSjCbmF36bbpE+CC5a9x1ROaCteZajv2HKX64D7QJZ8fSlNalV1rqk0
	 jV9UUTn8DPR20p3NuU9+8e5bo/+IfvOppBDV7iKglKERd5BKBxbhRvn38mYkXzw6O/
	 ihm8DAnOOvumCxsC1Vq+FvbeSNwQcehXPQ9Nf1NyaSR2c0/0LE73MrPm9DBYwc4+g/
	 3rIY2C4ZLstUBEWz7NqNyU4lPg9yP87C7gdDLtU8zKGXKVryty5XsE4pcJf+x/d3sn
	 PkvM29NzOxGEZlmnzb+67qXba00vrzp0LmJF4zRVFySjXVegrJVcPI/JdEgFLtJ1np
	 bG70km8DquEzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E2C80F00;
	Tue, 29 Sep 2026 18:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E600414C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0309607BB
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Iby9UbU3oUt for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:36:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 28BFF605AD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790706983;
 b=Lxq0NE+1Ygf/hpxpYNm+8WlLG4liPuj2HcBZ25Z3zWBOiDujdkawtK1pXAcCXyN51G7E
 64cGtFgnvAAOmNCrjNvpzCyjCZ8NJuhpxuCNh6cHad85Ejg4JRPH5Jk+dxqiADAqyN1YI
 c5VcDgiJyMz6RjOM2gXVupfLdSlbVgzzidw/ZH9KzsioXU/DDBeJBWOc1SAf1beHbBY/w
 VBH2oUZm8RzAGaHP72Y5FnJBC7dHm2CLAptL6lmTtRfwvV2tTXYOTyGjltc/6xZBUKS31
 +KZ1VyIHuv4Te4lo5mGABqsrL1098Cz90SMA21vOvwMo4f48eWKhow0CtUmrl8bCoDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790706983;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=G6joYrtlrd2kJjhC0OPhR/nU8tjDhzj4BOY6px+UQ6Y=;
 b=iMoajctbzCxBYDgdVMkrk/qKl6tsanD5a4Jqkl3xRqR/Ukfpd8EArlAmxhjxSB7ibtTt
 vH57RtNkCh03SdU631KC84gC8tcfqwpja77Zob/Hhq1c1Jg5xVZr/zzogr+epGMxlHLtq
 TAglEWXus7/gex0s00NMnFxhYli+qyQbBkMdXXNDIkp+VIc6TmzR2ItWAKcAXJz9HG+5W
 HYXItH7KjIDjdurBgUrqIT+bcsKWDan1ARtWV2Gc9mO1cU5EAirWAPljfuKROgSRVX66k
 dNbOr5iyi1/S9glFZllCpQyEYsyXGXWcISGsfUjqrLwOvn7ceiRILs4wIXI4H2Mh9sw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=llCBq0fB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=llCBq0fB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28BFF605AD
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706980;
 bh=G6joYrtlrd2kJjhC0OPhR/nU8tjDhzj4BOY6px+UQ6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=llCBq0fB+b/FTkgk/P/9Pqn5aigLnXv6hjpbQPybzOkciNWZiyYepIshIhi7qg2s2
 ljjsr528AwC6ONxCTc8Z12EmdsjatWxGtQ+lb5YpyiUCPiqSNwFH5DgAspHN+VPv4y
 qaDLZ7RiXEDyWURv3Pf13cOfJUy+3qReV2EyzLU9AB6ikGFYiAj2B4wk7wJgvNwfH7
 eaTPB7I1lWbucBypd2WqBS1gbo8z+6HF+XbHy1Z6uI4QJUaGmK0E7M99HcSSgimjX2
 570wpkRzOK/OPV51qJQDVBrw24empx5Na5dwypqOEjGJIrMuKCCHysdtci+gxnuZkI
 Fax5IJk5S0DLg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 0VpQlEBS9avOm+KwgvoB1K0nUjfTi+nvRSs5rIbohWAKeuX3x3WzZKqsu7nkuyNFAhswfaR9/1V
 4v1DxyID/wdfcmf4DxYUxlUi2w3kWu0PkC4+HTIxF7YUkuir6dFhYaPXoUqegMLZ95/yHh/oyvG
 lTpZuK6vtBAFtNq4WUJmqoiTcmseCe9mijBKS2BGUB6M4I3raSrPCehNJYbgTP7e/iDe1vi614A
 QkDAHEq2+cjVSjdNj5qX65+Ms7EsKwXNxC5odNAN7pjHvXiaI1/UgClAGj5VKJLObzqh0OA9/Yl
 7EWX9vps37xxWqahLE27HfEuMCmSLKRLMjEsl8uCeAxqAUn9bBQWxDjsHMtRKEe0nCEfV18EvwW
 S8qbfGEk1dzHg4tFpMX4BAwPjutLWOJsbRSKh8Rp+STriWzlc8azp1lLHmCn3nrx3iHYJ4vL9aU
 J7gNgMca1GOkU1Y30eCEgfVb3LhiX8m9dNossgfz4BUssQ1coS5kJgaApruY7hhWWDFm33KxVNr
 zxbh0tO18gSPUC2fUMFp1bL+hf6Qo1RXqmDbnqsF3HZG7JeSY8ya+R1wLsGuoYHXGMYwu+OH1UB
 KqGdLmgoFo/m0WGCnjqW5rBuC9BIiFcq8E2n+xg+iuws6nbedw6GbgDnNNp3pbRfjugOeXylzqy
 qFKX4tItgamsH26mTRSFr3xwDLBU=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1919AA4C47D6;
 Tue, 29 Sep 2026 20:36:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgd-000000006Jn-1r0b;
 Tue, 29 Sep 2026 18:36:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 29 Sep 2026 20:35:00 +0200
Message-ID: <20260929183607.1849293-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 01/66] package/qt5/qt5knx: remove package
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
index bb6257f532..5bbe332112 100644
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
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d62bfaafb3..0211f53e4b 100644
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

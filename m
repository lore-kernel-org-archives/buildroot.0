Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B271CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D73340581;
	Sun, 11 Oct 2026 13:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_Ipb7zfouaq; Sun, 11 Oct 2026 13:01:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D722405B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723695;
	b=AwaogWC49iXM1Mi4XOZDxgTJmb2V8sq2wG2jUfytQDJB52Hxb3L0rFo9C7jfPp3uPbh4
	 QSZcymqESSd0wlwNhpaRmuqRq6Ezmj7d0ho07VBtUNqZvoMUPcwXpZcq8+nezf4jXedgX
	 IE0Wg9un5AsOXTnkPwuh3TgP7n2E1BvwKRv8xtzDCUhiYQrzTVPZiC/dCOtIj06HKIZ8q
	 icBGFvMzSsgfcjYcNGkaZd/8L/WenN52vlprS4X3MNMFC2f2K7jTkFJ13KqqfB8YfHeRd
	 LIkoBSGtjsfPfA/CMGmJEPX4O5gcH7AwHHo0oxV+8zrhUtCjsyjuwG2fSNTCjE6+e2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=10m7s6iUgy4orsVZvSvqRgealhHjN9dV841kBhfv8PE=;
	b=oZc3xAswqk9Vj3hUZvo2mjqJ8gkZoVPtpiz8jxOLXeMRe/2d4MmiK80AI2nnQnD5mc+6
	 mbiyFcEjDRVY/CT4vloQlk+u0+Rs9NLzSdOKbfuDdb5COdGfv/qyInCMKjcbdI4UOhXOc
	 6o0bX+j2cmEJkYynJLT1AG3mqGY1aFG03ERi6iBEct/goMu6hrGQVjnlzUufsemO0Ad60
	 O4n0nRkboV6GpkCybTq/K+v8WhSzI28HKgQvqszvHs8HRGPe3+cn2lBZHDQ2lZHpeukIs
	 vlxPGYJiRlQ/s7Am7vrgMbYN62l7o3Lfsbi0MWYBrRGmff+J/OgmkT2o6zvNqjBLJJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lSONTfj8;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723695;
	bh=10m7s6iUgy4orsVZvSvqRgealhHjN9dV841kBhfv8PE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agJ0flYeB8dtilE1+hEqiUXKn7ZFKXZZhIrt1LTXsI4mOYCH639O/SLCt5PT5TusL
	 UlkM6JN4GKNe/N0K74lhqUQF+njzdre5MruSPrH57xT18wQ8dMt2bnTi3L+ce3wH6r
	 yusQuGVoEgKMP9qDlncM7Ag+6T/qlVicWX6sijhG2CqbhbLdYe4uVJw/hkk+syro4k
	 mxh8g26OxKRskjBC5GqrGYCEIIWI595vJTjz7vJFMRqEjbdVp/EmwDXXwp6J51VRBq
	 QdNXUuhCdAmThHRApCZyplnwzAli0m54tQ4CCiltCuQY7p7ftudbXEDLCFKfDeBG45
	 +8I7DHEsCBRcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D722405B3;
	Sun, 11 Oct 2026 13:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E378111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BDE6405B3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPpHkYkJE11p for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:01:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E6CF340581
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723692;
 b=agOn8P2PeR+e+lOw40ja1ZS6sAknT+rQt22xuBd7R/hH0KfUaX8uTxQw8h88vmP23I5u
 nz3h1NcgE3oihDzz1VjG9aQEzIHaGzFsb4fWPy9WFJvaQqaTU9ULjTgpjMpBt7KBPntvb
 B8tpbarpCDeud5lnyiY0oyEZIGJPmRwxsyVlj/xg4eMe/pwg/hdGmHWeoFj9qwZVc1zJn
 gzDwfWWe3cpOI+krKTpMYkJOxclC1m7mDBoGu9FHscLNllNqmiNbHY/ZAY8tmWuXlepOg
 DWQ/rAIa8HKsSaed3xZBeyHeghIHDRP1hrNgVcfoLPhg2zPdi6zI+wjxnzRp4+wIyGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723692;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ka2eokM97i1BhuoBVHmKL/P6XwOo4Yl8S/aggaBJxAs=;
 b=IfKKFRf5zecCvJ3ZWbDsx1NAasMz5sdq/rP7uOusRlK7c3oSHTTgtwExXzuVFm7F1+G8
 s4Xqkbyn+yRt7DzMtXhJFxuqf+ZMkg1CP0nMuKxalfO3w5yXkKUREavp6phtRDpFG1nNO
 q5qvedWSg+K87F274zRcsPzp51l5adJV0DC3WR12e5Giq/acorQCABRyTaZLCN2gKnAwV
 StJ5PdO02uCiB/CRO2n6R6z3i9Wi73IXsGzkzUdg/nCEWeqMF9qsHU2x9DaROhO008Rr5
 Zc3iLGXlfaBCCwyUFF0qL0h4p641NkjVer2YL1ew2ZmONepQtf3RebPPzdVuLWR81EA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lSONTfj8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lSONTfj8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6CF340581
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723660;
 bh=ka2eokM97i1BhuoBVHmKL/P6XwOo4Yl8S/aggaBJxAs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lSONTfj8Xi9VYcUigkys0viSVUiS1pMf1d774gOperroGDfhHDKjCXd9j7nb6HnrM
 WmLUNdx6YW5gMl35eyTXv/3LpjPiIgf/1+2kHKItSSd3DF/7qkjXIYET2HAuZMQydW
 Pd7heaWnoLs9ZhfYXQBG5WnfPXXCpmeBY5r6vrXaKejnUlTc4S1CPHRI0tLkS6k7Dq
 eHJ6MZu3LogTDw//SzqBVuf5ObfcnEcl9i+Z/YzKVWKLhKo5zk16VC21tyRAeHOedn
 lw65tda8Jm1KyK6PkF0vYCvWUH4ABdjiv1DAO4XJ6b36isYPU1OlqXeCpa/rBoX0RI
 rZ6Zit0ZIMPtA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 jYis44zWApf2yd7bl+C8laSjH1ps1eJ2sE5SRuGEwwqJ9hkN3g4Bc5OlnZKlTHK/FEy2c88xZQ4
 m0FqOd5Lw3tnSUVNFjh6nphjEeO5DO+pyZ2W5kP/tpgGOQXpnjMEk8F/2dGJYHQFCxKOmd1IKiW
 taYhC0nBOdP42kx3PxVdJ7ZVH2YwtYSbmA3gjLkUEFgX9vnQ7gUe31ggXKCCJZV7+mNEYD5TuE4
 KJpI7I8RR2kwSCPrHXK2xRv+0XlvnSsEA2TOzi8dbqGEghJr36bzJRRTpTqVLIbFRNID4fD9uYi
 7Ko77RVChFIsxZuFSNebN9arSIdm0I9kyH0mIod9IBXiLqQjLtIEt3pHN/eSSjXcPJ/oLwCxU5f
 g72h5uf/Nawn9d1/mVGhumohyK64u6yfW+/wv4Cks3cWI5hGaoVIDFcezjuOH+ZH/sgfCfpziqy
 sIeHJ9KomM3ae8VDF7U2Xlmv/8dGDvzdpD0xmpyKsm/sVv7j+Pj95nVq1mkf1UujDj7p3fd72/T
 l7f6dERSSM/ktarQ0ONuNzlmu44n/uw4k2AiKkLGJSkJcP425J4UJMUSePvPFbZDy3TbyMbuWyZ
 XRauJg==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52FE0A4C5847;
 Sun, 11 Oct 2026 15:01:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAi-000000007Fz-0eO5;
 Sun, 11 Oct 2026 13:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:07 +0200
Message-ID: <20261011130058.3443432-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 02/52] package/qt5/qt5opcua: remove package
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

x509/openssl_symbols.cpp: In function 'QDateTime q_getTimeFromASN1(const ASN1_TIME*)':
x509/openssl_symbols.cpp:1244:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1244 |     size_t lTimeLength = aTime->length;

x509/openssl_symbols.cpp:1245:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1245 |     char *pString = (char *) aTime->data;

x509/openssl_symbols.cpp:1247:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1247 |     if (aTime->type == V_ASN1_UTCTIME) {

x509/openssl_symbols.cpp:1307:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1307 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

and mbed TLS since it was bumped from 2.28.10 to 3.6.3.1 with buildroot
commit 3481a9643fc7223e400ed877f08ade34d44e6b78 as seen by the
autobuilders.

The last release of the 5.x series dates back to 2020:
https://github.com/qt/qtopcua/releases/tag/v5.15.2

Fixes:
https://autobuild.buildroot.net/results/1f0/1f06b1efdde65fcd99ff79a63ed01b749788dec8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andreas Naumann <dev@andin.de>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/qt5/Config.in              |  1 -
 package/qt5/qt5opcua/Config.in     |  9 ---------
 package/qt5/qt5opcua/qt5opcua.hash | 10 ----------
 package/qt5/qt5opcua/qt5opcua.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 846e3c8f04..c15a397043 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5OPCUA
+	bool "qt5opcua has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5opcua package has been removed because it is
+	  incompatible with OpenSSL >= 4.x and mbed TLS 3.x
+
 config BR2_PACKAGE_QT5KNX
 	bool "qt5knx has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 64e0371cd4..0d52d34d4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,7 +203,6 @@ N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b837601dc6..8b4903a5ab 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,7 +48,6 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
-source "package/qt5/qt5opcua/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5quicktimeline/Config.in"
diff --git a/package/qt5/qt5opcua/Config.in b/package/qt5/qt5opcua/Config.in
deleted file mode 100644
index 2b0ba37af3..0000000000
--- a/package/qt5/qt5opcua/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_QT5OPCUA
-	bool "qt5opcua"
-	depends on BR2_PACKAGE_QT5
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt OPC UA module implements a Qt API to interact with
-	  OPC UA on top of a 3rd party OPC UA stack.
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
deleted file mode 100644
index a325653f80..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash locally calculated
-sha256  fa8e0e87aae6f321aecac2605e6ac1b858ba1ed4db3c4a78a193eb7b547ab224  qt5opcua-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
-sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
-sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
deleted file mode 100644
index ef51abddf8..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# qt5opcua
-#
-################################################################################
-
-QT5OPCUA_VERSION = 5.15.2
-QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
-QT5OPCUA_SITE_METHOD = git
-QT5OPCUA_INSTALL_STAGING = YES
-QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs) CC0-1.0
-QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
-QT5OPCUA_SYNC_QT_HEADERS = YES
-
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-QT5OPCUA_DEPENDENCIES += mbedtls
-endif
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

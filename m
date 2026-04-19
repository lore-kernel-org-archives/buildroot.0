Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B293FEA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 18:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3695081EFD;
	Sun, 19 Apr 2026 18:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4gQy8PJneoq; Sun, 19 Apr 2026 18:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AEA682048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776623778;
	bh=EkBcdxngytJKlb+9kOnb7608nb1lgATdhByCqVX1Pf4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdT5BC4Jr4iZupCrAZNIWNsyyjV16Prl/2MPtqraPVhgj3+XlDorpi/hQm2CbtkzB
	 ja9HHMI21c+tvMnEdZr/gYXSezNH5eztR2rPd8qQg30gwbwSTjSx8V3NmmQaELs5LW
	 GBvVN0dV2nECtFOq2wM4ZZs4qnhTK2DRQagthEF62IfkGObFkbtiBBiHR21ryk/uTH
	 fA/TuXjkdKKE9J77L1inZEJYekq2l0+sqwSd7ZbJ8vWL+z6a3mSzQbFj9sXFz7sOOB
	 pMES1S46l9A1VZPcxWV+Ix0F9hlHzdbuNXIJidwXGDV18EWt80d2xTNqXtfI2GYoON
	 vwJ0Nlx6Iy4Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AEA682048;
	Sun, 19 Apr 2026 18:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CAC824D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01A9A403D9
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLkyEwvWfb3Q for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 18:36:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 791A140341
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 791A140341
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 791A140341
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:36:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CBB6A4C38E6;
 Sun, 19 Apr 2026 20:36:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40456)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEX06-000000007Hy-2xVc;
 Sun, 19 Apr 2026 18:36:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David Bender <codehero@gmail.com>
Date: Sun, 19 Apr 2026 20:36:10 +0200
Message-ID: <20260419183610.2595830-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776623771;
 bh=zb3G/seUBqX6MypzkRcFwdBwt7sGvA6fSehZlyu6C1s=;
 h=From:To:Cc:Subject:Date:From;
 b=vemPg1nJH0mR+0wFWYZxWBVuDOlpVZ6iCGmkWJ6zifRf1rysjMBpkd4gNXveeXt+W
 8SSulSKnF8Zfs/fTYXwxVzSn3850Y0GKjMN2B0X9l3k1+Skxgx97NyOUnXjvPnN3ff
 RY+BiWFUZj9m08A96nJ/SOr/E1peMy6rgyGf8LUlFtF0vXXjlokxknwhK3kIl9Sww7
 hnNk+URQ9HaW4T1QUdo1QNEB3Fh1Pd5tXUREH6D9StvmlqLZd4ssF85KJhC5MOv610
 ovNkGqXQv3jarGcrTNCDUGsgHiZ/8ONseQ9nrGjktvx3/PBBl0IEIy6lGmSISlfbZl
 g9UAmEA89s3Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vemPg1nJ
Subject: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.6.13
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

https://github.com/openldap/openldap/blob/OPENLDAP_REL_ENG_2_6_13/CHANGES
https://www.openldap.org/software/release/changes_lts.html

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openldap/0001-fix-bignum.patch | 8 +++++---
 package/openldap/openldap.hash         | 4 ++--
 package/openldap/openldap.mk           | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/openldap/0001-fix-bignum.patch b/package/openldap/0001-fix-bignum.patch
index ec38ee3df0..1c71cd3165 100644
--- a/package/openldap/0001-fix-bignum.patch
+++ b/package/openldap/0001-fix-bignum.patch
@@ -11,11 +11,13 @@ So, keep the check for the bignum header, but check against ol_link_tls
 which means that openssl is enabled when we find the bignum headers.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Bernd: rebased for 2.6.13]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
 --- openldap-2.4.40.orig/configure	2014-09-19 03:48:49.000000000 +0200
 +++ openldap-2.4.40/configure	2015-01-25 18:44:54.216879362 +0100
-@@ -23431,7 +23431,7 @@
+@@ -25367,7 +25367,7 @@
  
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
@@ -23,10 +25,10 @@ diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
 +		test "$ol_link_tls" = "yes" ; then
  		ol_with_mp=bignum
  
- $as_echo "#define USE_MP_BIGNUM 1" >>confdefs.h
+ printf "%s\n" "#define USE_MP_BIGNUM 1" >>confdefs.h
 --- openldap-2.5.15.orig/configure.ac	2023-10-23 11:03:46.292215101 +0200
 +++ openldap-2.5.16/configure.ac	2023-10-23 11:05:07.245355497 +0200
-@@ -2323,7 +2323,7 @@
+@@ -2327,7 +2327,7 @@
  	AC_CHECK_HEADERS(openssl/crypto.h)
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 69c3e978b1..de2fee536f 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.19.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.13.sha3-512
 # Locally computed
-sha256  56e2936c7169aa7547cfc93d5c87db46aa05e98dee6321590c3ada92e1fbb66c  openldap-2.5.19.tgz
+sha256  d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656  openldap-2.6.13.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index da67562a40..6d30a22f54 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.5.19
+OPENLDAP_VERSION = 2.6.13
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

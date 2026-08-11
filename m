Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3B4C5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 20:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA7740647;
	Tue, 11 Aug 2026 20:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTfiiKAtvGAA; Tue, 11 Aug 2026 20:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1CE640640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786478698;
	bh=euJdCF96cB0WU1cH/gTigruTUtxzQuyKC3f+7kHBN00=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=itVV4ocXcb179gkdRt/yzte4sPYDeil6xzXymXBddDZvxbtmQ9MWm/YEHprw+X3gl
	 5bXoy17u64HqL0xBvFMFoJYtXOX9vKxeeUiLk+Ss/zC9p1J1v+H5WILWq94lnNCyq5
	 zxbofXMY9180l9g9utJMS35nu8Bt429NanfbORbjB6qivMSAqP8bbKgjmosvULGH45
	 pCCXTQ/cdNDsOAjyTwz49/QPfsMujZU0CI2mAJJNAxciD62RoIjUHaeLm7UYc1UqWB
	 AGuZB6Z7pbiy6ggCf8s37ishcaC0QGn8ofXbKn0jzYFb57HrliomXlbpc8ewdnoRXX
	 K6ln45rZ+Sg+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1CE640640;
	Tue, 11 Aug 2026 20:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31BBE2E0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F3B44023E
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 17:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_qpkDXTnD6S for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 17:37:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 530C64024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530C64024C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 530C64024C
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 17:37:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE001A4C12AD;
 Tue, 11 Aug 2026 19:37:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60622)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wtqPf-000000001r2-1jQK;
 Tue, 11 Aug 2026 17:37:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Tue, 11 Aug 2026 19:37:19 +0200
Message-ID: <20260811173719.88537-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786469841;
 bh=hlFLK2zz42oOfeOgjftV7D7XYUH2GTePiaCHjNnB5uI=;
 h=From:To:Cc:Subject:Date:From;
 b=KX0LK6yTG5bAIOaFvekL7qgcvdGwsjKOb0gD7YPBTFVlXIqoKtrOgxTEENuX+cgYR
 Og4YGdcuzQElhmLdmd77sOspwvVgK9ITebNK4JA1dK9N802J4MMPNv+fxz+HFWauyq
 kMR++uBiOk7raDyXD5v2wXod7aQ/AS7hP5O5TtqWi3wGPheSbJcLmpm8DJ70rLyTv4
 ArDq82l/xhkJqrjmy1eV47OHLizcJtreR55Y2qaCwjjEKmr9Pxn2zQtM7HREjTgFxf
 2rm/q27GZjpiyn+6OsActIoTpAgfoGd35mKjm32gtFaauW8yz89T6gwjpm398chFAz
 fj0NU6/WVOkUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KX0LK6yT
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version
 1.0.10
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

Changelog since 1.0.9:

    Fix race in thread-per-connection mode on wake-up signal
    between daemon and thread that could result in lost wake-ups
    and thus connections that did not finish processing.

    Fix rare assertion failure in relation to suspend-and-resume
    processing (harmless if assertions were turned off).

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6804b6d8e886d85e1152ed78faf960cc1b306993

 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index b1b943ce87..2515518996 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012  libmicrohttpd-1.0.9.tar.gz
+sha256  04bfe8ef75db7d629a33de767599765cecadc56274a39822d5d081030d577685  libmicrohttpd-1.0.10.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index c2e585adea..8756adb4c6 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.9
+LIBMICROHTTPD_VERSION = 1.0.10
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

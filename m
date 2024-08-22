Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC32C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AF8360DE5;
	Thu, 22 Aug 2024 18:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOuFlz4nmK8K; Thu, 22 Aug 2024 18:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686F960E0A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 686F960E0A;
	Thu, 22 Aug 2024 18:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5561BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9468B402A5
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZrb_7Oo6wIX for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E33A4062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E33A4062E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E33A4062E
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:22:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E10DA4C2710;
 Thu, 22 Aug 2024 20:20:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCQU-0000000060E-1MEL;
 Thu, 22 Aug 2024 18:20:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:20:44 +0200
Message-Id: <20240822182050.65230-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350851;
 bh=pPFnBE+YKbyIDJCWa3pakpQxVJAxZ9nihCrjITynxyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pma8j0iBObzMK+viVUhz94rloM5HOYVlzOaSOsAS6mqZD7LCLHeH+k6jwaQzIuMWr
 mMvJmMWTsd9pSK9rnp7e8myFTFzbwKIGC3KCkPBlM9QhV7T6WuD1dlrcTTzeQGdiiP
 sXOUDAw3nrEJIlYV+mSr1xh5fRkK+y1QuNzU8ZNcM/G9Gw2WWzrp3LA3QSngdYMkAM
 ebCUS1kbL7uUB28Rq4ZrRWKEefLPNqp3P2uG35uhxH9xT+4NqlrwyP6rBhC+2/rXOi
 niARzl6FOYhXjCT30lCfOIqZPK2Je10n8lky0ow86aY4yMAJC7OBNNR4HYlQu2AJHk
 tlCtIov0MhqVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Pma8j0iB
Subject: [Buildroot] [PATCH/next 07/13] package/libtirpc: bump version to
 1.3.5
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/projects/libtirpc/files/libtirpc/1.3.5/Release-1-3-5.txt/download

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 40e59f9bcb..b1113264ae 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  63c800f81f823254d2706637bab551dec176b99b  libtirpc-1.3.4.tar.bz2
+sha1  f5b209b2a7f3ffcdcff5b5b54fefc6a90ddec0d3  libtirpc-1.3.5.tar.bz2
 # Locally computed
-sha256  1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860  libtirpc-1.3.4.tar.bz2
+sha256  9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f  libtirpc-1.3.5.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 04196f2f7c..1020c512a0 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.4
+LIBTIRPC_VERSION = 1.3.5
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

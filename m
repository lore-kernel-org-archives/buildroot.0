Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B305C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68897408CC;
	Wed, 22 Jul 2026 15:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_ckkZSOzN3C; Wed, 22 Jul 2026 15:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619AC408E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734377;
	bh=Q1nqtQBsgeR1xPcOeNTxMFLRFDbxWEcazHGn0E+6bBU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HjGvwV8WWaTkkxp5QDEosBWnliyzjHJlVJAVaoMKKp6JTyW1J4vpXt0rLHd43Gx+F
	 PTuObYsFyOUGuT8YsL3SSv00Schnzm11nWtd0EvJdHSmeg2EWgIUX+mAoyxrFBGsQm
	 7vWEn0e7IVUorwst7Jol36fZ+t9zxVg7cvlQnGn+CCxHfAC4n3UA6WvD8cIEUTzCbI
	 h+JQp/SNL7kifaQn/7K9X1fQYKIDmrEPGCV62ZvvEaOU3sJZUS8IZpqoCdgJz7llRd
	 ze+rEGq8fQIzuYZgu76GI1cSPJHlZatHla1kw6tZ0yuu0AOHQqmQGsc0sH55gO67AD
	 YuioN1B296enQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619AC408E0;
	Wed, 22 Jul 2026 15:32:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8779A224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7350D408CC
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FBOmRkM9Q2K for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DC7E407BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC7E407BA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DC7E407BA
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRVh-1wTViS1Nbn-00LYti; Wed, 22
 Jul 2026 17:32:51 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:19 +0200
Message-ID: <20260722153224.624762-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+zvuXQ6tkIv8ZKHgFHpDAAlcC7H0TqYDUglnbDybeRNLYo89ZMZ
 pphdZTPSsn/AuzsdQ/7oK5cyQ5N1b7OdI7TtC4aaFYI0Rt6cYHuTSN0MwATEK6XBnBE5SVN
 NPUgfG4s7rvWF5nVnaOIKZDJjlDYF7sTC6+UEupDEHmWPZnvXRSCGNL9ecYGN06f5rw9MZf
 hBWEcUd8sp5YJJGl2Sdsw==
UI-OutboundReport: notjunk:1;M01:P0:qsQY2ttRNI8=;7LG/xkMGmVsNppOtZ50r+YeqSAB
 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
 Hyn7A3+0F6S/zH23S9ffu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734371; x=1785339171; i=fiona.klute@gmx.de;
 bh=bqnZvkWkDtZFVJlftf0dhhC7aBp7nAWvhaZDhK3Vr/A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nNcsKyAZSwb6f91k8kmjMPA57i4V0sFau9VFYbsHwAtIvOG9/gFWYf7zw8dFlole
 cIL+RG+BB/VRPqr4rZOJDaEYmCVnxI6At0qxmaCLIwect/OZiwgFina68n+JaKsV1
 teMqW4iiTJhRyndDNkTAxcMj7xympgXqPTsCsT8JLe/WFKmONlifgVvC467uAp3LT
 Sml11oODk9qynugBLimOlSkd7R8QzKamrQ9vAGRi5azvQijXHfNUk7A/Ergb3gUs+
 j14AAtzDK5deo1Wb2A6kHZSBaz76b0pNbO53oTF9c3WMg37qZi0H81uFyPPDT4Gz+
 gTebOpkuPgRZruekbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nNcsKyAZ
Subject: [Buildroot] [PATCH 2/7] package/environment-setup: add license info
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/environment-setup/environment-setup.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 069ee25f9f..276d5caca8 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+ENVIRONMENT_SETUP_LICENSE = GPL-2.0-or-later
+
 ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
 
 define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

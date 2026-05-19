Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78068CD5BAB
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 12:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA2360A3C;
	Tue, 19 May 2026 12:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igkdz-5RsN5I; Tue, 19 May 2026 12:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C5260903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779193574;
	bh=wYuwy2Y/a1WFkWvDtPTyyzIB9rJEfD4kCMEa5VxbMj0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JF3x4PvLoyZRbI/aubV3Z7qw7FISqQKkxywQ+DUI0+NnIXsdITJx2GP2QuTmoRfBx
	 gGNsImg+Ape/sMFDCWAXnfEOC1mHJnYZ+IATm/S6oUBAjk6C12b0hjgyFPuOJY7GLN
	 D2LCmiY4GKatvihMTr9UDdw9IhtHpTRmW6AjH2hVVjhZH7O2NtfoDKAXhzOJKg4vVq
	 yrywGbx2NEALGGejazMTYTMXAhH+bbw1wbDZdh8IsQTnRQCFbgPRIS4hp9rnX6V4Ao
	 +gw5IcqZb3E1bxK0MkAh3kR7GiCL2SToIqoJXa/3tX51EXvrP05DI/dxnq3Xrbvduj
	 Epm3lZggZoLxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C5260903;
	Tue, 19 May 2026 12:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43B20357
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 288D360909
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAKllY-8DgiE for <buildroot@buildroot.org>;
 Tue, 19 May 2026 12:26:10 +0000 (UTC)
X-Greylist: delayed 449 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 May 2026 12:26:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98FDA608FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98FDA608FA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=v@baodeep.com; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98FDA608FA
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 159D0A9FC6
 for <buildroot@buildroot.org>; Tue, 19 May 2026 15:18:37 +0300 (MSK)
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 15:18:11 +0300
Message-ID: <20260519121814.67471-1-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baodeep.com; s=dkim; 
 t=1779193117; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=hcmMx+Ncve1wyKVcGXN+ob7kNb9k5Mc7DiyTjN+KJds=;
 b=E22q+XmbV0d1ibMIoWqwU+98S0pPSRSkHSAOPD2Tley10Ek3yj6n6/5Ut7k1YMIfqDhD4M
 PORsrdJEgvexfADRoxfD1H91JypVmrVWcXMzfN2RDh9e2/yfKlGuQCZh2Sgtk26oxNOYAX
 jjMYN6OU6ouuPqnlmk8Zo3by+I1w9NbkO7D1qAMwqMHlREq6jCL3ZDPHhU6csFBfyyoJIB
 csdg/Li70W9B5iOn6q/8YyEXZBuRqbWqbUZfLD8HPZ7jlE+xXYqBhlEJvgatd5z2Q2Qnk7
 n8R8EmMMPgeVuYbe4wgZJS3iI2KaM2ILJQGWMZ1Nol9AMguEHsPoWkYpe1DHAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=baodeep.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=baodeep.com header.i=@baodeep.com header.a=rsa-sha256
 header.s=dkim header.b=E22q+Xmb
Subject: [Buildroot] [PATCH] package/rtl8822cs: bump driver version to
 latest with support kernel 7.1+
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <v@baodeep.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update rtl8822cs driver latest of the jethome-iot/rtl88x2cs.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index ff2e5d3eaa..fa5c9b1f89 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  71d1d29d1f04a9decaba4e23df0b213fb454c4cf15f6305133d2821188b588b0  rtl8822cs-2519c0b865e31d93daa65fc5b1168722f6ec7526.tar.gz
+sha256  eecd40ef41e3dabd7263f48330d35a138092637063c5d5d4cc3936939502df82  rtl8822cs-55971663534233fd8d80363ddcb2fec1c01c473c.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index c6a541dd99..531a07e60d 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 2519c0b865e31d93daa65fc5b1168722f6ec7526
+RTL8822CS_VERSION = 55971663534233fd8d80363ddcb2fec1c01c473c
 RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

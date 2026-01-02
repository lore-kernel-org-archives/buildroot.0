Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B98FA3748
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A189F80F34;
	Fri,  2 Jan 2026 14:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eR11j7T-67i; Fri,  2 Jan 2026 14:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC99D80ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767365652;
	bh=s2FDn3jkPPOjNGWfCJ8oARCYeJ3De3IJzHghPNzPdBQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PFBUhjuTFGWYxeW7KEDvJyWmqB5MQZVmsfKA2tCKsIqdC+2tM8CXJP7cBuUHnI9n1
	 TgKGUUS9wcGz1c0QWFv3BLNhRnALX8wz3shNmVC2DvmJsSw9KIjS8CT37f7zrnStFm
	 AFDVqkA60o2VJ9wNCidRAl5rK5+nTar38OpUj3bGN2Kh6ILyEwXPgyGJVYfepIlMN3
	 jY26cA2nyN4u+Xykxh/e5nwrOZ96pF0IoZjF790FJu+g2QERzwcAYFSsXSjY2RbnEM
	 dqyUVcIesbl+H5nA2yayaAm2+Q/5VTPqVAeZAQaOQyw3mkSSrwQSQK+MiXVDuZfsAR
	 m1kVgtLulTqsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC99D80ECB;
	Fri,  2 Jan 2026 14:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D95D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AD5F6080F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZVzSLuZ5VC8 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93E2B6067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E2B6067A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93E2B6067A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:54:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4FECA4C2A8C;
 Fri,  2 Jan 2026 15:54:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbgXX-000000006f2-1KCV;
 Fri, 02 Jan 2026 14:54:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Jan 2026 15:54:06 +0100
Message-ID: <20260102145407.917492-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767365647;
 bh=17EN/12JMnfJAzxl0rHnqDnlSXJQ9fBJI7loMRJTIwc=;
 h=From:To:Cc:Subject:Date:From;
 b=nQW1Ytb2ro+sxlt8fUaf/3cwAePzHRaAavotdBtn6GhmSC/EvkCjZu8Q/ZEIiVLXN
 7X/tHIB97proPO/0DiVxyzg36qmheu4Oo4xGJagDxgQeHI7e3XiUq0pMfuAVo4Qkb1
 762wx9BEAx33tF5Vy01SORprSeZU25/6rb5TQChB/fL5+pth4M7fIrcEFahjUYK0YF
 iY+i+apdCdqeOGccvsWBWQ37BOf6jh29gCt33GWv2oD2dmizmieoSIxB2p5I6cm0h4
 q+HsciJbb/h4f/Bc2O4QrP/3n5u4Hxh+ibjVta45twPHp9oBFKtto+D/+9h37bEwZ3
 A+OjPjF4AUfLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nQW1Ytb2
Subject: [Buildroot] [PATCH 1/2] package/atf: update project URL
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

The old URL redirects to the new URL.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: initial revision

 package/atf/Config.in | 2 +-
 package/atf/atf.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/Config.in b/package/atf/Config.in
index 43a5d4f2c9..800b488945 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ATF
 	  ATF, or Automated Testing Framework, is a collection of
 	  libraries to write test programs in C, C++ and POSIX shell.
 
-	  https://github.com/jmmv/atf
+	  https://github.com/freebsd/atf
 
 comment "atf needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 27c25c8b27..91d2fb5567 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATF_VERSION = 0.23
-ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
+ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
 ATF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

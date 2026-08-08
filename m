Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9339C5AD2B
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 10:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A5E3606BB;
	Sat,  8 Aug 2026 10:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e-titfrsTIe; Sat,  8 Aug 2026 10:14:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83AD460686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786184043;
	bh=iWaBrVk7bz5NSpKejsU9vesksUWJUPcGgwrO3wTiJnc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=iL68yQYVJISyCLh8S89YXJzIMRhykqz3t5qyBq8RiWqL3GT7qZny9qq/nkvnWDEhv
	 T4a5OJrooKFXguwJ16Ohgd9nkaBOYHLvlaCNkrIwnkWmz4ZNKEfTySPu+QOOp5WLch
	 dNRTHDKN6NzekgwKqvY3idrl+K/Ex0SYHzClSFpABPKiHdG7a6Di8trQHvz2dTZW4h
	 pnORI6Q/MyhnoyHBq37lPmfcjgnyVNoi5IKQm7ukPnMwJFAaKzYsofLiQ7haUVD1Gb
	 aW5P09lnYfSSN+vX9fIDwZieDIyD4zwL3KbfR/aSmw2rnQGRA+imtmQLDn6kdj29FH
	 tCBPP2m3ovPmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83AD460686;
	Sat,  8 Aug 2026 10:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 478F4198
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393BA6067D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3h_6v1Qf7P5 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 10:14:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AE1060649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE1060649
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AE1060649
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:14:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2573D4E41158;
 Sat,  8 Aug 2026 10:13:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CCDD86045E;
 Sat,  8 Aug 2026 10:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 313DE11C483B3; 
 Sat,  8 Aug 2026 12:13:50 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat,  8 Aug 2026 12:13:46 +0200
Message-ID: <20260808101348.924397-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786184033; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=SeVmq2fm0qCu8ZIfDOl454uZGk5MZYzHwXXEpzidHCw=;
 b=TpCXuMmNIT4iWeZ7cK6dDTm6JRzeYxAzbu9vihqrAxdNntJvxyYOYxgFAITAHS7ImSF53/
 Uh8fJeigxb8rDLpR7UHdKovmUa+/Gy3kAIHZJlKdmGYbO6e1QQqLBVOIkvuls6XDPMVwvJ
 +rotnW6/TCtNqj3hU9ir9S6KEhgqjebN0/hpcv+aIOqBRRPT0wERYlrCoIrRL4tMv6rYp3
 42SyarhOHYZPWIECA1oc2DH01xPAni/iskoTRu9Gubf9TTSSJzG3OHBljeVvVHORsmDMyD
 /tRh9/jtvo//VNzLK/haJg1gFWDEkka/CltvgT3NGghGj2K1tK5WCs3/1FLBLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TpCXuMmN
Subject: [Buildroot] [PATCH 1/2] package/python-pyudev: depend on libudev
 instead of udev
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3f24135c56f6aa8f0524307b7339512fecfa6f92 ("package/libinput:
only needs libudev, not udev daemon") changed libinput to depend on
libudev instead of udev.

However, BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS selects
BR2_PACKAGE_PYTHON_PYUDEV, which depends on udev, causing a broken
dependency chain:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PYUDEV
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HAS_UDEV [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS [=y] && BR2_PACKAGE_LIBINPUT [=y] && BR2_PACKAGE_PYTHON3 [=y]

Turns out that after experimenting, the majority of the pyudev
functionality works fine with just libudev. Only pyudev.udev_version()
has been detected as not working as it calls into udevadm. But the
actual features to enumerate devices and get their characteristics
just fine.

So, to fix the issue, we change the dependency of python-pyudev to
just libudev instead of udev.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyudev/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
index aa98c2cc61..1e61228a34 100644
--- a/package/python-pyudev/Config.in
+++ b/package/python-pyudev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYUDEV
 	bool "python-pyudev"
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  pyudev is a LGPL licenced, pure Python 2/3 binding to
@@ -9,5 +9,5 @@ config BR2_PACKAGE_PYTHON_PYUDEV
 
 	  https://github.com/pyudev/pyudev
 
-comment "python-pyudev needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "python-pyudev needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

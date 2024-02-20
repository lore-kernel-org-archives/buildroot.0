Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DF4C5475B
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 18:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B844606A0;
	Tue, 20 Feb 2024 18:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjqcWm7zvCRM; Tue, 20 Feb 2024 18:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89E3E608BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89E3E608BE;
	Tue, 20 Feb 2024 18:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 473BE1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40FEC81E10
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqIEWK1Csq3i for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 18:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4392D81E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4392D81E07
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4392D81E07
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 18:50:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B18BA4C0835
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 19:50:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54332)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rcVCI-0000000049I-0ekg
 for buildroot@buildroot.org; Tue, 20 Feb 2024 19:50:30 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 19:50:30 +0100
Message-Id: <20240220185030.92016-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708455030;
 bh=b16EERK/so0ov88lJcJVBZ/foglpOVtJWyuGyei+osA=;
 h=From:To:Subject:Date:From;
 b=m1eVQWIfpCRwEVFOrMqxAy/jrYcM0J0VNWlSjwG3cJDxVWJlR1IANtrOqFbPHillK
 quDKdsNBpga8xlOideVzht4PU8nM1yU+prawRatqYtRzfZZUvcF7t2Y+cYPuwTkJLd
 lTxR49PkTWeRPiDnowYrRis2qC3tDQWit83xx9I+BrCKlJWj1aPzpZ7aOfJF7I0U2b
 kMW+zxMdFqmBVz6ZOeTfHnxphYikJ3euPJzj8sY1kwAB1kyZHpjMd4H/2tv0QKZmXj
 n7y3spFr6ACut6j6iYbGnIUF331uzs1sny/pD31Sl7aqXQNyp0dbzCcsoP1SdyVYkx
 j/moDrZEXPM4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=m1eVQWIf
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.16.48
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://ftp.isc.org/isc/bind9/9.16.48/CHANGES

Version 9.16.46 fixes
- CVE-2023-4408
- CVE-2023-5517
- CVE-2023-5679
- CVE-2023-6516

Version 9.16.47 fixes CVE-2023-50387.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index d500b61128..482b046c8d 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.44/bind-9.16.44.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.48/bind-9.16.48.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  cfaa953c36d5ca42d9584fcf9653d07c85527b59687e7c4d4cb8071272db6754  bind-9.16.44.tar.xz
+sha256  8d3814582348f90dead1ad410b1019094cd399d3d83930abebb2b3b1eb0b2bbb  bind-9.16.48.tar.xz
 sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 03ffcbec42..0d81ffabd6 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.44
+BIND_VERSION = 9.16.48
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

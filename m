Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389DDC2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 10:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00800400F8;
	Sat,  6 Jul 2024 10:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RGm9CJpUtsw; Sat,  6 Jul 2024 10:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A6E402A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3A6E402A8;
	Sat,  6 Jul 2024 10:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE6901BF2F3
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC33F6084B
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdLD7GPitgm3 for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 10:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E14376083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14376083E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E14376083E
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 10:23:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6c1.dip0.t-ipconnect.de [79.214.198.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF575A4C0E41
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 12:23:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32952)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sQ2Ze-000000002ET-2zzR
 for buildroot@buildroot.org; Sat, 06 Jul 2024 10:23:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 12:23:21 +0200
Message-Id: <20240706102322.3127779-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240706102322.3127779-1-bernd@kuhls.net>
References: <20240706102322.3127779-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720261402;
 bh=lS9G6b0Hwpt3aD1rqB3q1TAwZ2LDqMZxxa+Sf2H7H5k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NclS44FfeBb9oiyByn0qySl71PO60Jp3qpu28G/624vk0uswEl7LFHA4JZJVezOlV
 JdHBIA+XJ4cFGMWoBEQStiMfmGRPq212WgZ9337NTFQLIqcyK8xUtaGLSyHcommlRD
 w20IYB87jmIkzYztpYoLMauuPdFZQyhCMFPsPVas97wXRazfGClJu5SSQjXbufq2xd
 OH4JXWLFDUcBhisBrJzVxcq+ShWW10VYs/dWQaqQOjhUkepKnCs/KYgpArUBuKCEUO
 9nDQ4RM3McCPaZ+JH9RFJMoRxgELxp/ASCq06hIApX6wuuTzz4A9LA/FN5O8AHYXeK
 B+4zlmdjEgWWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=NclS44Ff
Subject: [Buildroot] [PATCH 2/3] package/edid-decode: bump version to 6f117a8
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 9a2012f06b..62e6b43a32 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  45b71227ceb7265da3a314a8d0969dcca584bfa12c36690e911646b58aae0738  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-git4.tar.gz
+sha256  bc166bef5d0d56035b47a1513ed320c262901f97e488c83420760d7f56174dac  edid-decode-6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1-git4.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index cc9f2c1629..be0c4f1a0e 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
+EDID_DECODE_VERSION = 6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1
 EDID_DECODE_SITE = https://git.linuxtv.org/edid-decode.git
 EDID_DECODE_SITE_METHOD = git
 EDID_DECODE_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

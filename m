Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A39D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3584D80C34;
	Mon, 12 Jan 2026 08:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVpwGkn7iIns; Mon, 12 Jan 2026 08:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FA8380D30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207572;
	bh=aZlvKGanE4DyrnlYFbwpq8YY/7X85idakiz0UV3UfV8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YovP+BPNARzvFH+HoXfwXvJs0A6cHBt/t9g6TVRn3Hz/7rx4kwYNh9PMEj+bn548/
	 zAZ34unSfHZDdV7WpbqIv1o4sDZlOtKONqZzkWqdNt5wkbigNRqcUj0/dea8d9AmOn
	 IJ+vRoqneZgTEv+SW1ztuXhMemOy7nKhTXSlH2yuCVGhsRk+O3YVoX7XEeZA3Hic3m
	 HFAWUYPava9QVT8rOx2Le/U28pR2YKGiiC7yHdSFVgJAss4QnI8lz7GMH1Xf3gc1Wt
	 1ps+AmLrTcaU3F2LWv8eb+C3TOz1Nw9JolZqAlK+taA4ba//Zf12sTTj/EZfmRwcC2
	 EN4M7Ay0lGVcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA8380D30;
	Mon, 12 Jan 2026 08:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21D1118D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07F4280C34
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fNWAqDG8KKj for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0048D80AA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0048D80AA3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0048D80AA3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:46:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC757A4C421A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-0Hpb
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:42 +0100
Message-ID: <20260112082950.2528445-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206664;
 bh=j9sLIkW60VAEqnpHmKuy6Iv87demYtA5xRekYe8Je2I=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=oPqxu+igqCEH/qzVoatUHnPCVINjkC5nPByQcpVyQ5S9OvxYkQF1rZLMBmfcs87jN
 nayVPpbxJ2xKAIDQ6NIXThpcSi/BFP9CxyQy+PciGUwJ6b8Da/2KZCeiuoSszV7szo
 hoLeQOlZ1LXWcl0XoIRD+/rMAjC2LBGzb3mlCk9uoT09TGsqPSckcLlO+JhBIcgQzx
 WNeD1UdSTInOPaG+ci/iS3Ae8XrJk0tHXGrbcxAsged++2vAMpwre6F+0isiNZTfnC
 v23uOwkxm5S7XIcHSEf7H76YWhOPuUc+PIpmP5Z9vegpI33johEFXigNeA8diVCHCt
 EEx8BV64hAuPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oPqxu+ig
Subject: [Buildroot] [PATCH 034/102] package/x11r7/xlib_libXxf86vm: bump
 version to 1.1.6
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

https://lists.x.org/archives/xorg-announce/2024-December/003574.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash | 6 +++---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
index d181310c69..4f757fffbb 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003213.html
-sha256  247fef48b3e0e7e67129e41f1e789e8d006ba47dba1c0cdce684b9b703f888e7  libXxf86vm-1.1.5.tar.xz
-sha512  68226fcb9773a583ea417ab413146203dd7db6ff8a4d388285da972353355e11e179861a77c9fa284aefac025bb3bbf5a9537fa0bf246c782e0116a667c9d9b6  libXxf86vm-1.1.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003574.html
+sha256  96af414c73ce1d5449ad04be7f9f27fa8330f844b6dda843ef22e3e1befb3ee3  libXxf86vm-1.1.6.tar.xz
+sha512  7fb3ac4302eea43b70d5106f6c7a113e28e2807da22d2bb7f040e0c4afd322cad4b7f258a5bd6da3940b6b6b39065e1acb218a6dc0ba06b9dd86ea3849231266  libXxf86vm-1.1.6.tar.xz
 # Locally calculated
 sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 0f3decb04e..517e7b4e30 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86VM_VERSION = 1.1.5
+XLIB_LIBXXF86VM_VERSION = 1.1.6
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.xz
 XLIB_LIBXXF86VM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXXF86VM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

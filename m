Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B6FCA0EC5
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA96B61216;
	Fri, 30 Aug 2024 10:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sU3pi3U-2Ajr; Fri, 30 Aug 2024 10:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A666561241
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A666561241;
	Fri, 30 Aug 2024 10:20:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B93B71BF3B0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A33CA423E0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYWY3ac1XPFc for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 10:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC7CE423DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7CE423DD
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC7CE423DD
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 10:20:48 +0000 (UTC)
X-CSE-ConnectionGUID: TY8k+YqeS92VpG3dh9hvSg==
X-CSE-MsgGUID: NRhmbHY8TT6KUdwtnaEyJw==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="25938670"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 18:13:43 +0800
IronPort-SDR: 66d18e94_VCiNBRdquR71WFWErv4E5MMmamyBlvtpMOk4WJUDSzscsnP
 65Fgp/dspuN22G8KX1bYR6pbdRLf1TTT3RHmBlQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2024 02:19:17 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.215])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Aug 2024 03:13:42 -0700
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 12:13:25 +0200
Message-ID: <20240830101327.2000179-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830101327.2000179-1-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725013248; x=1756549248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=evGQIQwTMFeSEvFITD7GRGbgD+ClmJ9QCyNGI0si6Y8=;
 b=S6VAeqq06yCuKfzd8JCew4U3Jpb3ltbmriHufuMybazpYODdIWiEwm8c
 4kvNarf3dbM6NqlbxtZ3Is8nRNV0Uj3lUJXFehq+i5snW8b/fqLc3QgAq
 COvOBEDSmGqgzJNVH98KbmvmwUzMwkRufmqTKy8+YnY0S89vasx6tJk7w
 YStxSS250uVoxsCxwUAmgKnqBfIwmTfHpLHv/gwLP85pZprWdk786hacP
 8C58QMx+WC6Bdahnt+84Id6+QaI+eccbo3twxh/gyxjIkfQ+r5eq9rQ/P
 XirqXkMlljnXI72iS42MJEQp9Mf+5RwnJb813tapiOLnzdnGOlEr5oIsZ
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=S6VAeqq0
Subject: [Buildroot] [PATCH 2/4] board/radxa/rock5b: there is no need to
 specify rootfstype
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

The ext4 rootfs is mounted as ext4 perfectly fine without rootfstype
specified on the kernel command line.

In order to keep the kernel command line clean, remove the superfluous
kernel parameter.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
index 8759d7491c..bca99a3aa8 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=PARTLABEL=rootfs rw rootfstype=ext4 earlycon rootwait
+  append root=PARTLABEL=rootfs rw earlycon rootwait
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

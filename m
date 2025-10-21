Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10EACCD1AF
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 19:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 736C380EC1;
	Tue, 21 Oct 2025 19:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmg44Akf5AHK; Tue, 21 Oct 2025 19:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C70080F06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C70080F06;
	Tue, 21 Oct 2025 19:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 711EC277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 575D360B9C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IhH_uw7wLVb for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 19:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A95D60B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A95D60B9A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A95D60B9A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:54:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25E98A4C3734
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 21:54:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52844)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vBIQz-000000008Hc-0q2M
 for buildroot@buildroot.org; Tue, 21 Oct 2025 19:54:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 21:54:16 +0200
Message-ID: <20251021195416.305472-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761076457;
 bh=2OH/X4m49Lh64nFxrZ1GFpl/XJaNnueuNAP/MR14KWo=;
 h=From:To:Subject:Date:From;
 b=T6yJ114AppA0HdeuD+q2DxMvfCFzeuyEf5NM9UMT+srAEjUSxAcoBVmawXgaqwbIp
 sw8/DwqLGC3+DIa5UmjsFoepAS4+AyyLwgirGoH6psi5KohybcElG8cIJ8YUPrLbEx
 fXNYkeGlJ2Dpra4KSCMsQu2ZVEo+zmSljPxPyognH1NC22QWfg9Vp0NAkWVUkwyVz6
 2hxosQ4WXiCDnoz5oO6VAf5w/NOv2Ij6d895K63XKSN0d3Y0WnkI1+4nVUYWiBGFRU
 IZakmifCTIH4g3Hgs7TTR+wk/2EdRPlQ6XzDuikrxqShaIOKwAEE+9r+h8+8esh4AO
 ueub9zTIDeTCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=T6yJ114A
Subject: [Buildroot] [PATCH 1/1] package/libtheora: fix build on arm
 big-endian
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

Buildroot commit 5e769b87ecfb5d61c6f32fac3f8cdf2fb24e91a6 bumped
libtheora to version 1.2.0 and forgot to disable asm on arm big-endian
as well.

Fixes:
https://autobuild.buildroot.net/results/8af/8af9ce8c03b00da2dcf29bc1c6f4afef9a002a58/

arm/armint.h:24:5: error: #error "Big-endian configurations are not
 supported by the ARM asm. " "Reconfigure with --disable-asm or undefine
 OC_ARM_ASM."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtheora/libtheora.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 2cf62e5623..906acc8641 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -22,7 +22,7 @@ LIBTHEORA_CONF_OPTS = \
 
 # assembly code on arm is broken:
 # https://gitlab.xiph.org/xiph/theora/-/merge_requests/53
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_arm)$(BR2_armeb),y)
 LIBTHEORA_CONF_OPTS += --disable-asm
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

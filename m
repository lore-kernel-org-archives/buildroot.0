Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8429AC88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 07:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A3DA40568;
	Tue, 15 Sep 2026 07:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cLRXc0x6opU; Tue, 15 Sep 2026 07:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0EB4440561
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789458188;
	b=ouj5jsvD+u1jbUoyKud4Jn8zcMiC9GjZYNLFocEpNPEYGCMBx6QaLIJuBsKDVCG1FSW8
	 SP2ErjflJjPtHCxiZ1UllKdMx4HIXA79JHT3SlpR5W2wy5ZqcDTbvkDyAGdsXvZpGJ8qL
	 ZXd4Yu3JclGClVDt82k+PNxzhXrmGV2mWEYcnYi6n9rLybem+nZDQPZ+NnHNJE3x3Ac5T
	 oo9KwJjHJ59c7vcNCDoaiH/vJUqbNCCoTYuO6njAgalAtUi5BJm7DJd0k5sX/NQamth2A
	 l+VUohamDuBYocPGuCJRVQif/cokxYXfpUp6JlzclN4npaNz9c0CTI+9ifKwRVPN3Ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789458188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5jDapKH9mTv/KOqmf3axCJHTGuIODQzw1RQfBYZ++ts=;
	b=sCHTfO+yhXexqaFwZ+9JHQw8OVROdvPhBEsypU8hzM2iq8YTYEQWO19XZ5BHaBX2LLgX
	 UX7eXC7N+KoTef5+I9Ha8lbvAN4YtC9Srb3WJ/XqSLnGjQlHuBHZTD3V/RkAO+/G3prC2
	 dTZ/SQUtnb93eXnjIu9tqMIHgi0qBKStelH1HHewiQABeQdBkkiZUbkUHKzarPC5LZiSg
	 2731Iql4Dc8zpHocjZGKOSwsP+udgzoGrcgux/DHyhzFNzbwK34obuCQQ/ZLNL7eAB46k
	 LT3zGpyx80UoEQBjxvsoKUq266609QVnRLKn+sb2qVrcqpIilE/NcJKW11Bfnl0FUuw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789458188;
	bh=5jDapKH9mTv/KOqmf3axCJHTGuIODQzw1RQfBYZ++ts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WQnsfYL9Yv4J7OraphIwJrsqPRUlzXUd3Q3MaePuZuYSBQpS0SqL4MaYezoyWIZ1p
	 kgW/mc4vXdnZL9kMVrjlBQjM3vPwg4pNUrbgYFgqmCSe5pH+rycrOxWi9s15qk0Os6
	 uSNuUXJH33L+k/vGaaxTWbZuf2TpuIwLeLayupvI21GoWx0XKDJDFrWC45dJfoNWeP
	 A3UfDvw8T6iFIdlfHJt53wW13pkeI6Xs8/lCsd0uuSiPOXpYEGue/sZSrCO1Ks42zk
	 vJVV8w/8qmaSdtytAloAYo/B6xOZcVqa+ZvmNL2u5Lr5vzJNzTNMbws0Dwb4vcEZHe
	 JjLxgLQxjsowg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EB4440561;
	Tue, 15 Sep 2026 07:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0FD5493
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 07:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36E4401B1
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 07:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2h7BQf5LQPr for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 07:43:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 97C3F40198
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789458185;
 b=ruED/RYkNmsKbj+ypVyJhmkwlmcjerdQ9htadpy6LdBYwpk9YtXSVgEjGhj+rmn1TmK9
 zBfDxZ3ROo9ALEKja3NahCOXjOJz2dc1PVaoA7PuelwHkFis9aHnQjqILTCA/hAPt+zev
 AreBMZyIZU4brPCkE7zURY9GwgDq/w9mG86iIrAuASEePGp6SK5s+/pD1nL4NdL3oyKrT
 d7oXvg0mhFuKeNVG+8Lu1CU6e6/g6vdcuJkpVA2Zr39MTYp4HOrPseY5M5dmBB6UE+Qwa
 kswxAa3E9SmNCtdkdUBxSrq4gAyCz5kiZ9kh7lEoESCS0fypbluL/879VK1Oe7NHm+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789458185;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=7Akcu6gg63KWp+nNpySPnOI7ZH+LtDttaSEUhwl+MUQ=;
 b=rFjCW84Kj3vh8LKLKbfwRXmPG03Caa7qfWBKTuU4j5Qr5OCHzKI1G1Tu7iFIdnVa7EK5
 5ICMwrd7neNGlL4B0EAbKCJvzoQMXlrBBK3egmI9erg8Rcmw63oP23vrmIRxyr1UgAjJ0
 VDKvmJr9c/LOgtDVoqhFSdPsDi5qwK3SFbGx0dvaVbOGXTdZz75nb8n98WKwxvAngQTvN
 Q4VcUpmUUPaXsm2/zERo6Z7ik1iV33mL8aPhlbiD+LPUAEk9PQlZqTNWa9LdNaThJqMiF
 3iXbWxr2J4Lo+1x2bqLjSFSu3XYYtc+w6Tm/meThPNLO0c6rjUIsGdVFE5N+QK+Aksg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=u4Inm+W3; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97C3F40198
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 07:43:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A14081814C0; Tue, 15 Sep 2026 09:43:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 09:42:12 +0200
Message-ID: <20260915074215.620475-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/wpewebkit: propagate gst1-libav
 architecture dependency
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
this dependency. In practice, there is no issue, as webkitgtk is only
available on a subset of CPU architectures, while
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
all CPU architectures, except Cortex-M, m68k coldfire, and some
specific cases of OpenRISC, which are not supported by webkitgtk.

But for the sake of having correct dependency propagation, let's fix
this.

The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
dependencies that are already handled at the top-level
BR2_PACKAGE_WPEWEBKIT option.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---

this is a 1:1 copy of da906556371ca3728b05ea4f33402891288cc027 which does
the same for webkitgtk.

---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 03e9eaf59e..4a747a22c9 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -87,6 +87,7 @@ comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

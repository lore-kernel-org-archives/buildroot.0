Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658AE103E161
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 10:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E36B483AEE;
	Wed, 18 Mar 2026 10:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9VHApzTOMIG; Wed, 18 Mar 2026 10:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C4B83B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773831259;
	bh=UNug0Whw7leGeMR8NiPUO1MrDyUG1CRAvj+VcE7FvsY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OYvv2+pRq+niqHtIBdJVaCpSPlYMq80Vgzkk2C8e/hGuUUkcQSwIY0OBS3TmSpIt0
	 eTrIlaZQWjUYrSJWi5nmKjdBsVGAKnHEh0g2RJRK5pOxnpzcPykBlIIpKzhRh61ryu
	 zfoZU8RMj8fQSWp0Icsukye9hrIT6Uc+6tTOgBqCskRLzV9OA45qaCPpJhwissdDsQ
	 GH7jQdwpT0gfBkl0+GNzhV3OQoxC6HDnbIq8Nlc/C2XaIdKQSuGLLGp17FX/zqQPaY
	 9zdLjH1h/TcxfTRXeF8z/7CXOWmslVpuqaT7RpwUFxe2ElhtNyJkdpReXV15rqi0om
	 9/DZojiZzFeKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C4B83B16;
	Wed, 18 Mar 2026 10:54:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 292561BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EAE84007D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ni20xt93bRYI for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 10:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.40;
 helo=mout-b-210.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80E184038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E184038B
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80E184038B
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:54:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4fbQgQ20byzDwqL;
 Wed, 18 Mar 2026 11:54:10 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Date: Wed, 18 Mar 2026 11:53:37 +0100
Message-ID: <20260318105338.1000762-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fbQgQ20byzDwqL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1773831250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KAbgmyxOgD5RfcMDrYU2mWUOP+TR8aaDD40vqi0fOuY=;
 b=jiX7v6p0DYaXuRIE//jYvDCtIH4j0dvpWYK6V00MxleyLl4GCZNIWKpj25hDI0MB8lANvb
 aEsl+fPMDfXDDuTClPqw2LHCtrbLZW7bH6AcD/TsujGtNsjfqupLXAwylmnXFCocL+fCw7
 5B4CYdjrH+jjDfmftsHwRSqGwocxjjRTa7pz0iq18rcNrCinHk2KlRfqSNBggCMhcC8CnG
 Bfh9ItH/5H5RfsG+jt93hBrePEDLsZEkDrIcDkW8OdC6l0x/fRpp+KDohZ1B6K0TX6sbmw
 r07zE597Ja/Qt/dXqx1BlkjQYR5O4PSCxQRckptvvvRFdewL4Mr3o1faAmyJDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=jiX7v6p0
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH] DEVELOPERS: add Manuel Diener to several
 packages
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

Add myself to packages recently orphaned which I am going to continue.

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 DEVELOPERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b722b5fd51..8c9b89c249 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2210,6 +2210,29 @@ F:	package/ffmpeg/
 F:	package/mpv/
 F:	package/rpi-firmware/
 
+N:	Manuel Diener <manuel.diener@oss.othermo.de>
+F:	package/pico-sdk/
+F:	package/picotool/
+F:	package/python-annotated-doc/
+F:	package/python-apscheduler/
+F:	package/python-crc/
+F:	package/python-diskcache/
+F:	package/python-django/
+F:	package/python-gpiod/
+F:	package/python-immutabledict/
+F:	package/python-jc/
+F:	package/python-log-rate-limit/
+F:	package/python-pydantic/
+F:	package/python-pydantic-core/
+F:	package/python-pydantic-settings/
+F:	package/python-typing-inspection/
+F:	package/python-tzlocal/
+F:	package/python-sdbus-modemmanager/
+F:	package/python-sdbus-systemd/
+F:	package/python-varlink/
+F:	package/python-waitress/
+F:	package/python-whitenoise/
+
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
 F:	package/cc-tool/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

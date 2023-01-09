Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BACFC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 00:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E965C409A0;
	Mon,  9 Jan 2023 00:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E965C409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twJ2UwYVG3Ow; Mon,  9 Jan 2023 00:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E991B40940;
	Mon,  9 Jan 2023 00:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E991B40940
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECCCD1BF865
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C806760A66
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C806760A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9Blih1-X9AM for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 00:47:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA878605A4
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA878605A4
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 00:47:58 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id d127so5919847oif.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 16:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=csQe3FBC/7P80Q4WeLkBUCIKJr5mjstl+GaSejEQK9w=;
 b=jD/IYVx3cRML+u3Uo2dxzacNyj3VpDihGyojifCuLfVmqkYtq/pO5pL/iZm5xy/4/6
 36D1WtqiiqflShZhHIQmyU3umSMOBUA4B4MJEg7WJDJqEnGpIj4kjBGK5x1RWC55+bWk
 QfAtn4jbJYAlfV9Qe3TtyUaxTkNY3CoMA854j+duCy3/gjscMi4lBP11puDsY5Lr5Pvt
 VMCqDOAXdHAv4usBHD4yYflxffPG8Zr0UNa+J30gv0jYUypKtpO/hy8J/GidAWq6RjJp
 OOW878w2lhdKhBHJsk4ZebX73Np5+qhFyWUgTB73KjvTkWnd0T+O0ejj8pQrSxCJStiJ
 /bQA==
X-Gm-Message-State: AFqh2kp76pIGlZ+1VoNh79z7E8OFNyD1/215xzN3J1DKAsjEccg8cUhc
 j464mgqY9qiQG1p2NEW/HZNQ3EcSedI=
X-Google-Smtp-Source: AMrXdXtQDYu+IZFsPOhlBsGZJpbfaOt5OidyCLFSzQEPNzb6sB7Z/BEUTboQFGr2qbeBsZNOqUTpvw==
X-Received: by 2002:a05:6808:13d2:b0:35e:ae18:9783 with SMTP id
 d18-20020a05680813d200b0035eae189783mr39527765oiw.8.1673225277349; 
 Sun, 08 Jan 2023 16:47:57 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 bk33-20020a0568081a2100b0035a2f3e423esm3235178oib.32.2023.01.08.16.47.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 08 Jan 2023 16:47:56 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 16:47:48 -0800
Message-Id: <20230109004748.1372-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=csQe3FBC/7P80Q4WeLkBUCIKJr5mjstl+GaSejEQK9w=;
 b=FchcNEOL229ddRikTleUAKj9j+wJferL2mICMIQ2pZysJLKqAEReaL3Xe6DS4nXAoS
 wdv/eM49NLgWWHoMR0bD4Kp73BXQ/109DiRaWAWGdCWm6b5Zq2QSD7/LytdNyFBHWPIk
 jltuXAUcY9L0yhj2x+I2LXLpgaR4G5LbKUEo5A7dxuMKYtaHEchcB8Kvpi2WwjbRnzo0
 0OfvZtOLsFw05/2w1csj5ARoDv59oLlQLXCjeWTrjk+ePMd1AdYuxqNhZwsMD2flyEXX
 EnMGR9a4jMMt4RDJSv6i5ViXAiRXv38hgiVPcihANtGBzrpMecTKazmzzZw1DRn8+EkX
 p+Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FchcNEOL
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic: additional
 dependencies for rebuild/reconfigure
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While testing incremental changes for a kernel build using the
LINUX_OVERRIDE_SRCDIR, the following behavior was observed.

- edit a file in the kernel tree and save
- make linux-rebuild for buildroot to pickup the changes
- rsync occurrs and then the install target is run (no build)
- run make linux-rebuild a second time and the build is compiled and run

To get the changes in on the first invocation of the rebuild requires
a dependency on the build target to re-evaluate the stamp dependencies
after the remove. This is a function of make dependency order evaluation
so that the install steps will see the missing the install stamp but
that evaluation doesn't require the rebuild because of the file being
removed internally on the evaluation.

Explicit $(1)-build and $(1)-configure deps are added that will evaluate
after the cleans remove the stamps and cause them to be re-invoked.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f2bea01d7d..da99d9622a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1062,12 +1062,12 @@ $(1)-reinstall:		$(1)-clean-for-reinstall $(1)
 $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
 			rm -f $$($(2)_TARGET_BUILD)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
+$(1)-rebuild:		$(1)-clean-for-rebuild $(1)-build $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)-configure $(1)-build $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

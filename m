Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBEECA5FF1
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E801D406DE;
	Sun,  4 Oct 2026 08:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zwt2HMsvS6AA; Sun,  4 Oct 2026 08:03:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7E852406E6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791100982;
	b=FWQftZyl+aOuUf7o8Rqaxd3b9gitvB9xiZ3ppHD3BQ2l2iULay8Le2X6kB1RI4difDzc
	 iaELN5NUrCtnwj9jTcnbY7xVtrKoy1QkzAEihVHEChijTXq60RtQpF9fiShBbQ81AVZiP
	 QCTQgqf5KGaeofZK+OrTr+shlL056e07o0gmGhYEED5dCRYjrmWnZ7KDlq5ecAhnSf4vC
	 EMYiSlOkyaXdDqIBmv61OU+l8ATyy9PxWgvrKJ+xapNIdez8PDX2en6YzBLD0nCozX5Gf
	 nH0w4Q7MlRxS70KenTW7LPFrPkWixL+/rEFNmysZ7U4O5CI/E+bbRig8Vj7PYT41xQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791100982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mh6GHYizO//eAf+GTI1d0mjTzKz7CJAX3iMGotU5JJk=;
	b=jfnbkERB0ff/dASuqo56AH5562xQswYbT5N2Y4g1+Z1s40Ui2sFdBtcNdAjcyQmVp5LR
	 PxIPoQ2SOiAmR8i3sQXyb/F5raExM9Tm1VbXt+UrRmCSsoIydmKPhjZIAswpJoIuqC19I
	 blFLQyUce8iAwabOywRV6Z7lcU5ZUCD0G5B3ZwucEchRSQaUKfUcBeTnZTu5nITSxU8f3
	 TTbmi/MH6/Q1VS5kggZF869pxWobK9Ab9uSXi1RUFb14aHR3jcMAtm5jXh9mlaAfTmBJo
	 vK86rVnmn5KPV8JP6iZBn/2VvlhSyxKU8cliIPLRWOj9FVoMglmeeJp3rs5bs5gaQhg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=huP+KU4v;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791100982;
	bh=Mh6GHYizO//eAf+GTI1d0mjTzKz7CJAX3iMGotU5JJk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VZJG2T3It/0YrX7vVqYLd1kL9hm90vXT4Ha9LYSxmZ0UK6/WnZNYXNMHG6wWUsLS0
	 QUKfhPq2HQLxeX+tYkXaVoNOCGEwVvGcKHHPRGspoMxvzUriPLEP5bd3s9hfM5OwtT
	 /kBrS4xopSG4RlzK5scwZHI2+k6Wk+aZj6IEX2cLlvTWcaETIKAK66xGMV413/7yDQ
	 tskw8WG7ORW2xnwk/IaJDpiXAgIQ/Se+5CrKhLvC3/6EwHLhqz0NEvJ15dWBEVu7T9
	 X8HcN4E4i9Wr6CvhwHdAZzKWprfvTSIPpcRMx2ZlE3lqgCdVKx2BqPCivO/imbIA9x
	 r6VfaJr/0a1TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E852406E6;
	Sun,  4 Oct 2026 08:03:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 976822E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CB17406DE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xN3skDohy4q7 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:02:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47E9A406D4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791100979;
 b=gynWMavW091j7BUTkH32Q+GphsVmslDRfqWYn8PUA24rtdTuTVgcpxDTxzzlUDmv9SE9
 Ja7ZJgdzYrcVYC9yMNLelQFpvYNtiIZgpC6iXbWaVVuzqWQcL3rt8+enaAtHZLCJDO5a/
 sqok1BYcDbiNqes9fpPcrsD555l9anxQjcN1Z1d16kcKOBvORT17EWeJlyvS4si8jG2/Y
 60CLPsnDRm6VpD9SPh282N/2aihAqFIagly3l5NqhnrC90MX0F9ApGgkERSq5HwnxCdcB
 2CYdgDwYhYO9N6em2IcuV/fW2RStV++/WE/dOMQwyQNwS4aoemsThInNFNDFqBnq9Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791100979;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0CLJ4wAv/9AkYNWVmgJuqLI3lBYeDVpohSDVAPelPSU=;
 b=MP5Rp5yrcujbeQ0iwHxFVqXZKSDkyk0gzBOfwwn2/ilpDMlvtYCqUH70Kb5kg7ik9cui
 6HwRq7apUOoNtm1USHsQAzf4zpaht/AW3mSNc4I/ydRUxLoSY0lqw6hSqo8BaCZsn6WhQ
 U6mvQZjmW73TcsnwFY7CQCy4X4WQ9wUcwSplYNI6RGOdJAsU73Kh3gjJcSz/dTh8nrY2k
 SeBzbgyZKyq6z9WkK0+jFm57U7cctVcWns7AqTarGldafhDwx5kbDSdguEuCZoyAxjnih
 EJ51HxeFyVHPkT5G3ayylJ4dAaYi7QwZ+CCRxqnTrTG/TsB7Ssyzh6lFIrYzdCgkuBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=huP+KU4v; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=huP+KU4v
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47E9A406D4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791100976;
 bh=0CLJ4wAv/9AkYNWVmgJuqLI3lBYeDVpohSDVAPelPSU=;
 h=From:To:Cc:Subject:Date:From;
 b=huP+KU4vfv0yhSYbBswOTmIQ7rnv2CFQtLZNGP2eofwF3T7uYXbRxZEsaWHqSq2PA
 W+BaKj5rLGEtixF2ii4NsG1Rwc86hkBokxuHhPIZVKpSWz6pg/7HB0dSifg1s2Fwjc
 q3HaAG3l98YrKCAepPe7AMElzAcVrKmssZJnnqShSURZUFtMeV/jicXjhel02R3aag
 wbztW8n4vaWJ6NOqpxySctyoaZBTAAjhE19z1NaI3mN6DimWJ6X4RGSqkfME6mlfAE
 LkUbmSoGs3K1ePpXAcNBNAHhB6SJV4Ih5gCKqwgepP1IdnT3x0nLIsyH9X8jD7oxvd
 BsHIDhZp4zj3g==
X-KAS-Sym: v3:f51bdf72230551df:b5Q2s6wqFQDspTkueKcHEEFCydoBlz3HaYz0hQEzVgUM0
 6J5DCveZ3Nt0oPAYTpgDUNMmzf2qotkcv1okts9qfHPf1FMRBW8rUMCU9/LOSohFCWPchcwP+KC
 YoOgXHLtq/qpa9LMWIPljSVmD86nklBpuSouMJpV4rqYlERuyVa4cbYMDAfsjHO2AJq6tshwbTI
 JYTR4cQuh+OOxqcomk0PNMpmFPhblVNkRh/58ZR2VZbSeLT5A0o8U9Oy6hLNQJXeRztMg+j6QKb
 F3O0gJpO7Ad/Uel8nqk3yUBR8yCJ5ZqPVlz2ivW9WSLM3C48qPUtz46y/vMUzSAXvL9zQbgg==:
 ClGk0Nlxi6KcBOM2NTefZv8wbnBycW7dkWhALh81tXOIJ2/X9N+mSkBsO8wl+U2CLNCJJi80Qno
 FHrN0tEVoqDiygz3ZsU0MsLCw3b+bTobqTxp8NepdhknJOSgCClktXG5cT47Z+xKNmsUVlfdYgu
 mIJukXhDGjJ7/VeJ0duNfR+Sf0aS5W/92P+32Ak6EQkDsKDl5CetIaOxJy2pGdie3zaA1xIuUYK
 1lQruu5xE6Ss5uJE2mCuNV3MWkGflGMzN5QsPlDwQN3sBcdymHTHrTtfqA+UZjCSZyobNxj+u3/
 1jawxlx7YxmaNx0daDzWUh3xhxyx6bJo2oh0+U7skwIF1RskxObqDSlGkpk/7mknP2R03WXCiMG
 LXyX7NpokWyd0eHDphsu7OswM7lpoun+9fN5h3cFTYLfh1RGN2PnXH6hBfvj8tjKmezU2V9ZbwS
 Yc+5oLjWkz7Z13th+JjWKvMB4Kmp5utnwRoJmAhBbel1PIobyyuCLvdoJJOY1hBxfTBtjrga8/3
 ovKr8w6TphVvzIZ2g+ifCCyp3HGbLgqOAgAbUX41nufyG8MIRqp9LNfB8aeNca6PJLED8cEKVbe
 ELUUHUo=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB243A4C51CF;
 Sun,  4 Oct 2026 10:02:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43344)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHBQ-000000002y0-3pxT;
 Sun, 04 Oct 2026 08:02:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Richard Braun <rbraun@sceen.net>
Date: Sun,  4 Oct 2026 10:02:56 +0200
Message-ID: <20261004080256.2996402-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/1] package/tzdata: bump version to 2026e
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

https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/L4IGHJRBUQR53F7RTEHM5IS7ZMBR3YXP/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 4d4d410ce1..e2b278ddac 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
-sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
+# From https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
+sha512  5be2f875f73b75e5783c474bf7a6c768e433cc90283f8fc6a75e3d05bd92aec97936e8a55ccca5e880b5dacc18ba65932bab0e783e1ed5d2af4a3a4df95512be  tzdata2026e.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 71f8fc3ac1..221e34773d 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2026b
+TZDATA_VERSION = 2026e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

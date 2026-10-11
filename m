Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C9CCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FFE9406CD;
	Sun, 11 Oct 2026 13:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANfQH4zrISnV; Sun, 11 Oct 2026 13:10:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41A05406F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724243;
	b=rrVMvssHWgTDJLnLUI7xhsjVvaCu6qiT9mMo18zzpt1qZYzVh+rABoHLICQgMcuETh7Q
	 2hVF8NICF6TRHZyyUhqHMnUSSzRZqN03WEWsyFIA669xjTn10N/7AH+LKDQ5mxeawsIBs
	 w+iEFY2uiJzCmx7/YMArsZTLdfwK49PQlFAKfXHg6khk3ihuaIBOIl5Oed6BddTmowh29
	 Dv1F+1pJ30tIEYt5+kihEuKn0U5Nd2tY3nMtf/HGveDpeIu7Z5pxDPYW4IVH1KXcLt66l
	 w3JzEsqFcQ8qXRtqQiFusbPAfH9JDsZmJNdqJBl5ztQOiw3ISpLhbuHi6erShn5cmJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	b=Z+BAeK04L76jhZNHamlX30kuGUQNfd9p/vhFphFplUMV/zwcYa2YplHmG8jNBOA4tlTJ
	 393EAt5NWcE2SDiCb7UAf887HYTZx6jWZyAw+AgJYH5blWrxEd2Uq3/3BKWxlQkKPf7cJ
	 Wd6h0AgjK4pTOh+kRlsrMLSz78Oaw1eIPrI0vFlEYRF2wmMwtr8MZY4bYNkooC/NE3N1b
	 e/rDqvRe51PpYULj33kWdjdukM3SaKCiM78+xnnbcFY+2ia0QXdp9AIwkmXZ1jJ5qpoHl
	 QoSAKKhm3XplO3XQ7m5B2RnjLuWzZf17Z0/K51OLjqO8z4e9L203VRHTfVDTuwwBPxQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=N5qoWWOi;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724243;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOzOS51xQBfO8AmjjKLqBRZ4pqLH+CEQ/fNwPgS0IdmoadUvrHCZH35Cuw2If++lK
	 HYA+hpcuqtfOtzQOqaxUszN/hOp76v2VVR+YyOwVpsCyLoNpRFQ2Y7ApXbeudbCv53
	 7IvH5Drvnv3Xg4fpemMx5FjlwCJ4+pK4iseZOAf3BiiSKpFI9YnoCsjT966kZzFJJP
	 tf/y0Q8dGuPan7sGnkO7TlwXPHg8Od8X7KUFc4GWtZMmD6xMCuKmiX7vB1WTFQ54YC
	 m5sXPI9wIeQBKxthIrKJQahEnA7cRR0IanuiZSSOp33x00TxKM2+ZzohpB0Ry3fdt+
	 NmprjZUlQFP5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A05406F6;
	Sun, 11 Oct 2026 13:10:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F371A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E5C406F6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxRS1G_VfSuJ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:10:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CD2B1406CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724241;
 b=bRgrIw15cKNtQieyggbIR5ThiqYNTdpc7/zDE6hAQnhAqii9hWuNeHZxoKH+CUGP4WlZ
 NI8lC9VgsB3s/aPFLHerp2zD14aT7kSuuLM0QwEwwgSxf1NlFdah6sJbqoqwBtMnmfKj2
 9UyUXakdYkQWXkmmgpfXhGrjEFYeHhMmOhol5DB1ynb/km/j85mFo4nbrM/EIQJu/fq+F
 m/6kJ22vPfjvRiopSCOAoh0Bse+t1aCgLJhhJKkQk1kPS7b/EDOI+9KyCYIRAkxiIZPb9
 ylu1TpLah7mhlW4HktJ1cPPCfOECPK3mT2hBOncv+8ybSErGBGIevTM71UKTmY6fGGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724241;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 b=m4AULUJTtCFKiLtYHvDNHsz7GT0hMCKUZyMQKXVKFqzCO6Ep60womW63yMJnIkiaPE6R
 HrMlSnHQw8k4VW3IIKLkdfTz+mg5G+ivDVocmqr2ub1lvVLsooWY7TfLn9mhlHMxDAWjf
 aSAl3BR2eLvFM/eNNJeK8qX4lGjB3Tazqlmz1YcbZ0kNrMJ13hUTT0jznRqb5armocubw
 dCgOqueWrFA5FUe7jZ68IpBBA3I7KnpCZlph9SPKBDhB20Yo9PHfquT46ZSsPAhgaBqZ4
 D8VRl5MN9eFxYng9wXNxJph/7Rnikr7X5IUBxEQSpt8Zq0ZK4fy/n4QlWhSgXe/9QWA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N5qoWWOi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N5qoWWOi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD2B1406CD
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723684;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=N5qoWWOixVstDbgjnvMOU08lWo80jCMVtU2xyftr8M45HZ5/3NREFeLYJxvXCpt8P
 8gultXuObWLR3HTeuULTf02pENY0Hl5+FuWdwW9mY90cGwW3+42gzBAVOnvuKGrYPz
 1vdpj5q1Lw/ifFIcW3sQp8ZfVqKHZD1hhI9tish2lQiPfkpcjQmPzaGrRqEDSI0vWH
 Wk7jmHgzO1z7RG+hhW1H2YXYCg397ymSqGLMjukoCKWdvCbFCnTo37WTJKxpAqPV0b
 P0HV4yjSL8f/iXPJ3xHeb7bEJ41Y7MkTGeTdaBZIgP1iRXIJL77MMo6FMShGfdqNaI
 4KJf+W+J5T3Bg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 /6n3TCALyc2HLd3sw1GKvg1RMU6aLKq6e2N1DyMy88JFxVpErWEHKgkm56uMARbDe6KrWtfKxiR
 NFv4w5KmeRWKN5XRVpLROH1Iu+ECGuvma1ox5HMqXmhjTcnpqhyXXkF3xGyH2hHBA+4SOwhSwl9
 2CCeZqAYCVyTcR1mHXJyy4M4FodsfkIkeBrAPg6XE39w6PvsRnU16cZ9tgSyRn49CVwPI0EMEkM
 T6KAqPhrqNE+gAsdbIY3eMDitBBpv8Sg5xODn9dZmx4D34JLmVpT0/y++6gcLKGSBeJdWLnBQOM
 Nrd/CirILoU0yilh8yCisO22aR/QT205sFGbRqp2Aq/yCv7pb+jmUvDqJ2wHESbuNqYMSoXX6bb
 S20QNyEAI8G2F4BeDH8YtXC6LSBcJvIv1gY6whMWEQWrnXZbeyD5ow483mGGO1iaRxlJ1KjURLc
 FliVGX2n3nseMJOq1DkyAOMqnj/CGd2QVXYe+zLWIKo1HcK8t381wS46niHM+wEqzXG2cMkqFol
 pxlYdUNQp9m7WVZ6h+L+k4NjH2Q5fE7kNPF75Re3LzCUzKH/S4Vt4UvqrJmwzxFJQvWFHbEGiCr
 AnzdoL4=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0BA5A4C58AE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAo-000000007Fz-3Q0z
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:52 +0200
Message-ID: <20261011130058.3443432-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 47/52] package/kodi-skin-confluence: bump
 version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 9cde584da2..9974b4a3bc 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae7177ad7f06fdb38ba0e217b2ac3e4375cf29a7792f2eaa70003286410521a0  kodi-skin-confluence-b049aa8b6bab50518de72783efd219680047d6d9.tar.gz
+sha256  8043658a939e141305d6acd426a5a5be3a35ec1b94baba23fde069e4a1ff0f00  kodi-skin-confluence-da60e21de4a87581a8526c9409625e9f21cc7a33.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 31d6b37380..2a83eb5994 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = b049aa8b6bab50518de72783efd219680047d6d9
+KODI_SKIN_CONFLUENCE_VERSION = da60e21de4a87581a8526c9409625e9f21cc7a33
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

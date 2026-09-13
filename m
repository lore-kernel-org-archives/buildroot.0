Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7468C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B1E780AF3;
	Sun, 13 Sep 2026 19:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBdDo_nn9cW5; Sun, 13 Sep 2026 19:47:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F33B780CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328868;
	b=QX9GTKBLeb6j5JtHm+FqxqKlVwFnfGHP0p2mSbF/+hsQ9FGMoJ9p49FNxQwat0CuwBzH
	 TNWpyhhdqHvXou1BAwKlgjjJaMHuILn0jkXH/Ye7CkPOcOs+oKdbX99QtCG2M3b8WBHUi
	 PIPOjfuazZ4Wq9PnlkmeQ24FiURzC1rE+LJsYct21cDfmcsdxkEDBE1xz3GPvHiC3rpr2
	 C+De1x8/TCRASS8QVyDziqdOx2Q5ZeY/VYz1Ho/P9vDguKqOB1w8nZdilqjmyoDChHWcH
	 I9xFFmOokNB2JJWrbs4vPvI/O64Y5V//upglnLus7uHCLSqFlMoj62RmQr8wfyJk+yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=f5zPzbvkr5LPpzKZVl3CyJPgU5HFGIKVIvVTbAU08so=;
	b=NuLO0AynusSsAv4zKNTP+kaUunheevvQjlXotIKD9IPnxX0rApi4wl7Ibn9rvZWnowri
	 W5witfcb3KCWsQORWUcYOz4bomORx2WfcgwcwEr25C6WoD5miXR4ANJNAKOjsbUFVxWA8
	 cJLjiULkToF+togvj7WeP64KRZOguEPArbi2mgVYkS51P6v0AE3oxZVvkk2LE2Us+58Ja
	 aNLqOvmUU7jzu4VYNmITlc3Gs7X99kMC6+Z+JJnkZ4QcPKLQ9frYMLKrhdsI6LSaFLViN
	 RYliuqJ3kP/m+xRMtVqfnltQ1Zf/lkwc324KTf7H3sVuKTaaK5TgqRMlFfgWImi8X1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328868;
	bh=f5zPzbvkr5LPpzKZVl3CyJPgU5HFGIKVIvVTbAU08so=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Xa0sd00Rfn1+eis7jbigr7MUfybnixqfyCpCb84FCMwlqzRoejUnov5IeMV0W/+jd
	 S68k8sIxzzZNj4lnc1wxTU4wugx6O6e+B2xEz4FSdgK0Me5jzA5ZxY9QoDi8MnrdPT
	 F0sFyNjNqBuyDzgmTBQJxSuB4z7LVArQBBWJOkSB45z0svFczDWMzz9+YIzIB20G/5
	 bOSqpFrRq39mXIoish52OZiHXdvXLKzaGEO9HxJ8Q0aO94UYKCc//Ha4bSb7Zwuw0Y
	 VbiK5O5ySIeiGGqBS7L29n8R2Q20CuVtb4GCRpd94st4s2+oAiygVcau5dgNHz5bls
	 UCrnxje3mNxLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33B780CEE;
	Sun, 13 Sep 2026 19:47:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2CDE259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9480840063
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJJWYTpRDeut for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:47:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3A1F440022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328865;
 b=POpiWt9XhZxYrC9dHhxgMbQp7Nu5NBMoFzwD5Vkl3rR9z3X/gsnJGTNva5CR7MA3yhz/
 pzwYY003NScNZ9mKHGPp9cxkU3lyWzbXkbjgrJOvfo3O+cZbyPif37kZjRgtoURKev0JG
 bVt+KmMHIwvJAf8ZRTmI9Ur5+SVsVghAX0jtnq3blJs6bZWpukV5cfr7zllzR0/a4Wut6
 D8JOksdpIvEiktRhGjGwyaGPZDvnFeqcBp5jcoxK26y6tJ/l1nsw21ajKXlhdvuZ0Uauw
 K1thRmmP6ELA4E+ANVIw2emy35Y2uh93j9Bb1bVKJB988dlsxsKuGHYbmHf3lutuMtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328865;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Uh5DmfVvNrHWHIQHP0tiDR8D+ThjquqWyWb4B3Dr6Ns=;
 b=PSehud3SLehKQlttMp432Aw85wxK2PKPLagwC1RKVqrvkS00hVLY1tXEERfIiQY50VDD
 2rdIbaHOkPb3aPsoqsf43OKr9X7cNoHortFk+xw5ydr9LyMWAlryBlBFGtxaWLowUAflf
 I3jW1IcsLQVfs9bRZNYT7BJvFpio2MKTaiMyZsLD2RDpD7Mel0Q/1mLdvB1jf39cuesY6
 LxuWWb03BLHoRxKFGaxl2ApupS2EwSUWavvD0eRQq3qZpdTcnL5iv/6jS4iDNc9uR0+IX
 wrVZwfn/BMzm78t5YTwG54hDyjwk/sdb+/GC2WOwdDTDz3MfI7OpTGcjk0UGBJV0BOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TgcDJ64A; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A1F440022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:47:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 54A96C62200;
 Sun, 13 Sep 2026 19:48:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C35B60435;
 Sun, 13 Sep 2026 19:47:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 769A911C7AFD7; 
 Sun, 13 Sep 2026 21:47:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 13 Sep 2026 21:47:32 +0200
Message-ID: <20260913194733.1725979-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/clamav: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav:
bump version to 1.0.1"), select BR2_PACKAGE_JSON_C was added to
BR2_PACKAGE_CLAMAV without propagating the BR2_TOOLCHAIN_HAS_SYNC_4
dependency from BR2_PACKAGE_JSON_C.

Since at the same time a dependency on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was added to clamav and
Rust is not supported on the few architectures that don't have 4-byte
sync intrinsics, this has basically no effect, but ensure a correct
propagation of dependencies.

Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav: bump version to 1.0.1")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clamav/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 839518ebd6..92cd75cf70 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_JSON_C
@@ -29,3 +30,4 @@ comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

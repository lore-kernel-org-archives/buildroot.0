Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F4109446F
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 19:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B6884B0F;
	Sat, 21 Mar 2026 19:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcmr_SJ64gf2; Sat, 21 Mar 2026 19:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF8C84B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774121319;
	bh=3iV4PiZlboYeRuVrXxzZYVbXRQJ+6CtTJxHEKOivfwc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HMGBpn8bGFX1GRH1SYtLefjWLnJHCVVqP3NiExisTYaEYSZIQTVrRaVyecDa3sabg
	 Hdfkb7+J/R+8WSyL97rkhHaiGjqwKTgtleUL9yzxMbsiqlZacQnNyjaaVR1wMzzyym
	 vzH0SrHoytDSj2gGZYOdzTB0/CvhOgCrTcNXz9aY5JCAJsUdittVVSSec46tW3UYhL
	 cTPBXja6tlHA1C9ct3Vjf9B/JChzWAAcvPuyOeVEsro4ztu7SAYPjCUUFP1DeJT2w8
	 7A/uelVmyeWSv+Xp4hU5VYotHFVPi8X7bwjwqfAGzZ5WjzgcVLBTIR3/jN1IEgm+M8
	 Qguzzy3lqE3Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF8C84B0A;
	Sat, 21 Mar 2026 19:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEE9F25C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D092040205
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3p6hqyycr-U for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 19:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.124.151;
 helo=jackwearden.co.uk; envelope-from=jack@jackwearden.co.uk;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04481400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04481400AB
Received: from jackwearden.co.uk (jackwearden.co.uk [159.69.124.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04481400AB
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:28:36 +0000 (UTC)
Received: by jackwearden.co.uk (Postfix, from userid 1001)
 id 070443EBD4; Sat, 21 Mar 2026 19:28:34 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Jack Wearden <jack@jackwearden.co.uk>
Date: Sat, 21 Mar 2026 19:28:27 +0000
Message-ID: <20260321192827.95724-1-jack@jackwearden.co.uk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=jackwearden.co.uk; 
 s=20180908; t=1774121314;
 bh=5SaEAvfj4JnVEx0NBcwwP/BzNzmCT+Af1WsjmUaPGM4=;
 h=From:To:Cc:Subject:Date:From;
 b=IKuNe5yIKOVcX7iAWJ2nU29/5C6Pd0fj/NCtNfS08FJMaRDqify6AqCSCUMrcdOw+
 S8+I26pGdpxSi0jknQ3AdAW6e5WhYMQd94MEMIuuE2LcIuLL+2HdUpsx+klbjVaZf7
 jq+w9TS9AVl5moSYm/6aCnqYT/q7QOryB1mkLQNYYAUsrFHHgOv4jZb1zkVmxC8dqR
 2wQPuGRgCmJVNiJoQApT3VH1W6z7tCC7Y5VdhhZm+D24t15j1+RJ/u/+HpGrEnm2gn
 lbJgT+g/DxuMLyg+DVeuT6Zx0a+CHTthPm5+ipQm0lA41LjBRJCoc7fMjzNHkX2YcF
 WIQR/YWm8H6nA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=jackwearden.co.uk; 
 s=20180908; t=1774121311;
 bh=5SaEAvfj4JnVEx0NBcwwP/BzNzmCT+Af1WsjmUaPGM4=;
 h=From:To:Cc:Subject:Date:From;
 b=KA3/+SuWxkXg6U3OAV7VBWvs4KQvlQNqrqkV9tGPLRRwI5NioH9RV7Opu79jguoVe
 jyWiJU7qO/TV3K5d/iSQ3mC+iH/CuyefvxpJlgG4MmxV7KGTrpJlB1BN466WF0sqJM
 zIxX9YDBZ0hD13ODaVZNWrKNvTXWjyQtb83S27Z3o6dBvm/pK7h/LrJsOy2fDDC3V+
 /U+S38WYg1kOlboxELGElOc8/Wy7gkRRy84LVpvfRv1S4mqGcA1CM35nlOW6jOE20x
 9bW2CzfAVNQyphT7adWbKqGsS/GrNOFBoEm387b7rj76FUybGXkW/pL3Xwb+V/T0XY
 uDBRowCcqTn1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=jackwearden.co.uk
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=jackwearden.co.uk
 header.i=@jackwearden.co.uk header.a=rsa-sha256 header.s=20180908
 header.b=IKuNe5yI; 
 dkim=pass (2048-bit key) header.d=jackwearden.co.uk
 header.i=@jackwearden.co.uk header.a=rsa-sha256 header.s=20180908
 header.b=KA3/+SuW
Subject: [Buildroot] [PATCH 1/1] package/systemd: add buildroot support for
 systemd-boot aarch64 target
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
From: Jack Wearden via buildroot <buildroot@buildroot.org>
Reply-To: Jack Wearden <jack@jackwearden.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds support for compiling the systemd-boot efi application down
to aarch64 in buildroot. This is supported already by the software
and requires only a change in Config.in to allow buildroot to benefit.

Signed-off-by: Jack Wearden <jack@jackwearden.co.uk>
---
 package/systemd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 62dc3f5ad0..8bf460746e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -112,7 +112,7 @@ config BR2_PACKAGE_PROVIDES_UDEV
 
 config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
 	select BR2_PACKAGE_GNU_EFI
 	select BR2_PACKAGE_SYSTEMD_EFI
 	help
@@ -161,6 +161,7 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	string
 	default "ia32"  if BR2_i386
 	default "x64"   if BR2_x86_64
+	default "aa64"  if BR2_aarch64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
 config BR2_PACKAGE_SYSTEMD_EFI
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

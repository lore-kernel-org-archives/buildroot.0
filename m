Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E93CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C65B4095A;
	Sat, 10 Oct 2026 09:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5zPDnxKBL2I; Sat, 10 Oct 2026 09:22:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 819EF4087B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624147;
	b=FHgtIDDk1MGOySkqVyNETmEo6PoreeRG3LO1M5RHrDUdagtW8WVXvickuyM8I8DQnEG3
	 U8+GvuB0WnJiUYnjhzHsz/rS4Tnn7CeB4lYelwWsT+v4fcyiGI3wtD18PEDgFMrD5Cix/
	 FccYP/USClpCrFVkSnW+OW7QbJcNJoqOXu1Ead8O9zqx3Wl6dbIhDn93iKVy2UfXsG2qO
	 mdQkhasmvz9KyUOuswnsnb6/DnkfZc9h4nPOJ/KeScQgwHNSIKiTBeAnmIZR/ZqjT/rpa
	 cHgSRcoQgDUeZKgpGLyY1JOYaja0d+5NntcZ8dookhvhuTAY7YM9EsERHqVt4IpOkEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jyCeoe0FX9vacvn8HvfvT8lXKj6RxGRucaSF9t2shwI=;
	b=i6qnYW65bnggoX5WvPxntEKKV6iDkihZYy4ZoGPAX+41ji+D64yyVmBk63QMmNM3UF3v
	 gkoRBaBOkK1yS/g8+QkGRMb1v+VnOBOMYHdCXoyUnpwf2RUeYQPZ+AlJMtMuS51A72Faa
	 CcCmHBfooVRr1KewARSQmkzqyrxD3b3xH1g70yx3uzEjEMPW+RYxGCXPLaeVGnDfy0fBl
	 UcoMHX9A/OOwSLT8951BFOFpS9EA5pu37OUyB217GRYJ2KmXEimrmJtouNgnoZ7JKa1BD
	 rU/kULLlOw+i1nSYiF+l2zbHvuhHtJFsVPZ3klDminQF1R4aE+92ktGpBmbmXTtST/w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624147;
	bh=jyCeoe0FX9vacvn8HvfvT8lXKj6RxGRucaSF9t2shwI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IzOK+8bNppOLPMHSuE8FF4+BfqkFjUdPga+bPY3P9WehnD14M9EgpEcP+KTFfSAGJ
	 Eg0Bj9RX7uGmJgsuy8UOucCs0rsSPjFnh4Ed6y+59RrXfuhSQa0BIoG4H4gfAWsfY4
	 rRMCAnyyyv8WzkuukXBrSwu31v1Wc+ejjd+cLysPOfDhaITRGLFO3ypPltBmGAN6pN
	 kZNPoBm698JmnqcTeDQbJbQb86PN8PgvPGy0ITzz+GLMgqNrEPRJ7bUBrf9jDxi4xQ
	 CqT4r99453VTlYXcV43fBVRTAjk/AoP0UecG2J5vvlKpQGVx2CydXtUf/Qg8xqtB3g
	 kz4dQ2TDZadzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819EF4087B;
	Sat, 10 Oct 2026 09:22:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A64DE2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6757811FC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgYbyhdRHlfC for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F1C428121D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624088;
 b=mM3+UOWyWOb/QNPLpyXMTU3pnw2bCwWlpARdhjDKpe1k1+4XIaeAyOX6dKJQ4D4QMFrw
 yihEn+SOsj39VuYKlefRNDndieFzHn2ULitXK8dIwyKFyaU02RXQCewsVQRZxvaLtmX8t
 JYau+ipPWd/3zMhml9BGzprguMkwJs7/64qLdcfIaH3y3uDIaicIPEI68fvr+gJvdMUgq
 F7owV0rPHNQXxEoBFLwcWR/jdA0WIKVcFLVowK302T/nj9d6cvQ0pJCm2gUFn6Eu0FrEF
 6edlagu6iuI19xM/qtnvhJ1wUyM5y/zG4Kt+ywNgB55VAF8F+7hPMcX60Peu8y/SbGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624088;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8Lb/CjNFDVyARwRDLA3itdTkhVmxtZ0WC7Lzxl2ctjI=;
 b=shgc1LgltGJnjWP/YihQFf1dIAH5oX732fGPLM0gbzFhfBR3bO914czLpcy2hbmedK3V
 3lPpDOgQ74NlNTe6pAbig2GKrSWOByPKKVOx5N9FZg2tBQdgGxFpR3P/AUCMyCvLNzxCe
 UZvQFe8mHDlnT7XsFPu3aoHC6HAzzdWWpidbwIIxYWUTyMjjJRLzPWbNf/iZHjMFgdC9L
 pGnPD6YgRGsm9fwaxFmxi10D3BYyUn4j1Ea39kdjDnxHd4qY3mFKyS3pipsyezLuXpBKC
 y/LqkQJryAm3L3KKT9ypfMLRWh84unyfKYq9Eta0HHKQwueOV8rWv4M9DQTWQHRuQoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1C428121D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBAE88F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:31:01 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 98ef053c24c4a8c533fd41c5e23f335353801613
X-Git-Newrev: 789bf2f21fb281bc946775c5d8ab51407f49809b
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.DBAE88F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mpg123: remove
 MMU dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3111424874358255212=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3111424874358255212==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/789bf2f21fb281bc946775c5d8ab51407f49809b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit f0862592b3caf5bc9cd347fd29634673cfbbabd7 added the
dependency to BR2_USE_MMU in 2014.

Upstream made fork() optional in 2022:
https://github.com/madebr/mpg123/commit/91f75fc026e37d88d25229b81c58bcf8d6d2a8eb

This change reveals a previously hidden build error with the toolchain
bootlin-armv7m-uclibc:

src/libmpg123/synth_arm_accurate.S: Assembler messages:
src/libmpg123/synth_arm_accurate.S:22: Error: selected processor does
 not support ARM opcodes
src/libmpg123/synth_arm_accurate.S:31: Error: attempt to use an ARM
 instruction on a Thumb-only processor --
 `stmfd sp!,{r4,r5,r6,r7,r8,r9,r10,r11,lr}'
src/libmpg123/synth_arm_accurate.S:33: Error: attempt to use an ARM
 instruction on a Thumb-only processor -- `add r0,r0,#64'
[...]

To fix the problem we limit ARM code to BR2_ARM_CPU_HAS_ARM.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fca0899dd6cbeb9e6c7442d4b53513f7a29e98f4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mpg123/Config.in      | 1 -
 package/mpg123/mpg123.mk      | 2 +-
 package/squeezelite/Config.in | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/mpg123/Config.in b/package/mpg123/Config.in
index 73ca1c740c..8cbc3a4758 100644
--- a/package/mpg123/Config.in
+++ b/package/mpg123/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MPG123
 	bool "mpg123"
-	depends on BR2_USE_MMU # fork - in the application
 	help
 	  Fast, free and portable MPEG audio player for Unix. It
 	  supports MPEG 1.0/2.0 layers 1, 2 and 3.
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 17445395ae..e6c90ce685 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -26,7 +26,7 @@ ifeq ($(BR2_aarch64),y)
 MPG123_CPU = aarch64
 endif
 
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_arm)$(BR2_ARM_CPU_HAS_ARM),yy)
 ifeq ($(or $(BR2_ARM_CPU_HAS_NEON),$(BR2_ARM_CPU_HAS_VFPV2)),y)
 MPG123_CPU = arm_fpu
 else
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index a034759143..0bdc43ce6c 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_SQUEEZELITE
 	bool "squeezelite"
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_USE_MMU # mpg123
 	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
@@ -44,6 +43,5 @@ config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
 endif
 
 comment "squeezelite needs a toolchain w/ wchar, NPTL, dynamic library"
-	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| BR2_STATIC_LIBS

--===============3111424874358255212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3111424874358255212==--

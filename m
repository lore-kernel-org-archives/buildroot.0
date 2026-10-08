Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D8CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD0FD60F14;
	Sat, 10 Oct 2026 09:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5wb_zofAdO5; Sat, 10 Oct 2026 09:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E4F2760F24
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624491;
	b=a85R32WzBz4UtGFfWMdDpsG3jlmMtDvPw2i9cHjZ3fSLfdMeINEbqCxYVjylCVlLV4Vb
	 KH6v848/BTfBFWGuh5gOVIfHUzx9QQUCt1pu/6jXw9kQKkQi8kUSoH1pLzFi3C2kckMxf
	 2yqENOpyU99vR/q8oV9x+h/RiZnFgMCZsUOZy4lLEwHqhKwSz3JQmIEaymjF6nygPjbuE
	 UVoTTHzWcfh3LXrw4MgBElwUmU9AofXHHwPID2fht/Pz6ZY5MT8WE2x+uOxmyQqhuhJxh
	 RQfTYXaama7bLQroJPvSfF02pgK1HaO3wOSQ1TxnwnPaNNN2yEDLk5AC2z9XfDthgiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624491;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=yVTTJHyYDMbjIKMxmhacaQ3tIzPlV16A7STSmGuE51s=;
	b=BPORrEg7kHnVg49UVxd143kin9pCXYs4VXCNyIObOvD5lNUJnFekR30g7iGLpKsV5eaD
	 NoGnTMoe1ZCJ0TH3Kx9tyB66I8itHO82O0ngSihdBj8yvQ+O1vdyRhZ7PbC3zkacYCvI5
	 w99KKYCsQ7/a3bWhwOrJ09QkCrvnRuj/vsITVhaXHHX8T+HF3mpb20RTs8YgL1l7lqvFq
	 m+dlcY0QQqngKt+PBN8oZe1as3B3q2ziLcAiYEZXGn1qzX0rpzmIu8b4L7kyWxErUnXGq
	 xSZMf4NDmb3x0U7sVFsXpakBKv1U3AJb3h6mXtWf45HmKrlNOppZaOrK5zmK6g7e2NQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624491;
	bh=yVTTJHyYDMbjIKMxmhacaQ3tIzPlV16A7STSmGuE51s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WLd/WTDl+2AgMkxCatcgPc4/iRNcdz8cLy7i7lzhvdmsEtHVWugjAMKyBUd7OUWpS
	 ne699YgomlfMtYLzHljBXEDXHUrF4/ib55hRaVaIl/L3/oAcYa89+KibO1xtvIQ+W4
	 THzErVVosXdMuufKllTkhmjift3TN6njE0Tm4iwy7JeVMhII+21DOiNJYimBdTe/5z
	 iolJDUbvhxfbiBllX4pbL8bIqS+XSscSwyf6zVZqNjvQ6eUkhADv3dwORnWMC91Ccu
	 JPhAeAtIwGcebfd+ZzJBSU9qI3yLhlbPbaEjfsC0tOljvxtYm14Ha7XM+gQMQuZy58
	 GUd5AV6EvdyTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F2760F24;
	Sat, 10 Oct 2026 09:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6BB2DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE7C98112C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwl1URVaPh8y for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9B3F8120E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=o/G8/nw+1tBpMpbdsMl0/T8PFm03V6hZ9GAqsSXli/pwjBbfVuw3loxKUetSZ6qR4j5b
 WXxNoASFlsnrQJDuGik3UnjWmf38wLzVGt/X18GIiA/Bm1JJxeFbNoULZYwBsM3DuRqhI
 XiuTQ0RhZJW4194r0TXeuh0idWI22CrI+XBCCdNS6zTJ5A96jgAQ7VbgczbOTSw32X9Hl
 A22m3SIvehSJKE2Fv6IPP//E2gGVBDZ4enSXG0sMEvaoA0wjvfFZpAOaSekQXHfqS0IQv
 oKCWvlGrVOo+HOz6hqmyiiZvOxliBJi0TAb8luJaTxPe4WGlnbTTye+6XLFGf7aisVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8zqxetUDr7YV01Sm+LAXG9uUdVjeGR6c93VSp8Y9jzM=;
 b=SMIZ2P/3E42lko9iEUpLZF+2RUMpo1szI1FBz4ynCNCfFSKODb2gOd5x4aKr8F/tDwlP
 xTdr1vDHpJ3bHBk83hbRgHJbLyFawVfmFrrN5+S2p96jpO/dPczvUpf+69ROHFzRognOY
 kNJp8c/XF5oUXjImtJ0Nek9wq2fqXH2uHBXkF9RRAJEf3o1P0mm8W4XK0yyBBRqeVvXz4
 sraJ6mCDfjJIEpV+FUIjldej62t8eEJFXEWDy+cDj8KGU8yXBe/TySiV+cZlzrYtxDojb
 vVolxCmAEmwgASMSb7y1kNfo+ageWz7TlWGF7qlFV/4NispHdWPIEXU602EpVG6RVAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9B3F8120E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A319C8F0B1; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 12d976476947ab4bea0954bbfbd2796838a75703
X-Git-Newrev: 17a23398cc574b019c43b4434640075f8064eda5
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.A319C8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpg123: remove
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
Content-Type: multipart/mixed; boundary="===============6630969392444771890=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6630969392444771890==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17a23398cc574b019c43b4434640075f8064eda5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 7debbe7feb..4fa674a8cb 100644
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

--===============6630969392444771890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6630969392444771890==--

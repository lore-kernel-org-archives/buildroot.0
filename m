Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399DC98332
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 13:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DF3481248;
	Sat, 26 Sep 2026 13:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxW5VrnyR_Q2; Sat, 26 Sep 2026 13:00:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6A38F81219
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790427615;
	b=mBlffMLYdfSUjbFzihnIXp49v8m0ibk4dSxxv+w44QHh3PbeBCO88qXZSTnlZ0r0dWFU
	 T1UQi+4WizKr+GsxTLUHqkAJP7EuD/b0aYzd/em5KXKK2n/YBwXADbTV+eJhEK59XjB42
	 nPlc3wy08JSbVWBVefCDOZc9sDJZdHozUq4ounK52TRJ7K8FvTK/4Laeng4Bq6BM6sKl9
	 ra8GLmN7tNMspi3dVEZitlJruaG3V9RAUhMloIFXk4m79CSIaRBHcAVRjdSbVzzKKn8vm
	 7z5WlCQxq6Lq+LA7mNQOLZ3chNUVBTJwpUgTraX+0nzc5MJ3CtSsqs9EvhvF68VAGCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790427615;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pH61wkX/yuOcmqoH6k/HJ7qk7Por9l6cGHpB4b2LBEA=;
	b=Rq9ksv6uDBy2nWUvM7LQitWmokJ0GctAtqGsFJ35+ZnG1a0LxAlxsaNpF4wBQ9Z8q3XV
	 vv880ljUWTFK6wCIE8PfLFiS8nZTE96oaSW+AY1GFBXs4n33MgL+oYYHT1AGrNjVfJcwc
	 7/UjqDfCBL4NfQIP59HVVdUH3JorStCFIA/OgHJHVIvx9XhqLM/x6zDYHPPIKlLkz4oZv
	 /P7l/ReXPOw0okpgKHagGPWLoTOBQP1taI3YcTHh0svxRuXEeuG2pXPOqajbMjTYjqNzx
	 2Gnbj0uDO/tCqWex8rBjXKHhwzFuKl3XQM8+dVFASgiTEmSr7EOecCXd0FSC8zJIxqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790427615;
	bh=pH61wkX/yuOcmqoH6k/HJ7qk7Por9l6cGHpB4b2LBEA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aEWDiyX0AXJjH35cJR955VTKdUAtqYq3Ael1VvWq0DXhEfC7Z5TFXRD0hfCi6I3jN
	 trg4cz2T6lWcZ0dVf205pgAR45nLpaRIDx3heWDj81187P255zxIzz1cmnJhYbUtyG
	 vl1cmYBH0XcK86lysnmunOFJOGNFMfL0FXVtAeTr1+bYsnvQH2ktqNju3sjEOOfrfB
	 PYP3ZBc9IEv2fF7eR6bQu1ir/wE7zRcWyZyGY+0UF9+MsG/DmhWFIYaIuiibl/uIS5
	 nC+qZf1+gz1zNNTB1xiIv5kqQy3Qd+0GPwhgWFMf47tJA7GlxcZEJSXey3vm5NY+Bj
	 5IJCwb+MKQ9tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A38F81219;
	Sat, 26 Sep 2026 13:00:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C40F334
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39A2B40844
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3gVPc9FxInw for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 13:00:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4D9F040835
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790427613;
 b=UiwM8clyZBc+ecKVEFymgAko22lZjqZnRayoW1ob06MjRJAJFs/xwlE/Lg3qrqMJM1DN
 u61cOZqoKVkuZImFcf+rvEW74SOY/cn7USC0e8PAs9Bjv54fF5wlgSbf8qozxWOnaZbtX
 l0H3SAjO9p3WcKeoB4aklmvwT15gGomp4o0kU02jHtK1p6kyj6m+7I42mo5XqDGlHaKja
 gIawTRCpXo/VY6cSmiT9nL+txELyRD/KGVLi40e5MPlDjNJLprMHAA4EwAtggLX/HUYO7
 8RmMDWi+MGQz4yF6DjyzF9hbAQ7lbz3N0583/3tZI5WmXZ6kbNu/wVKl/oipsOzne3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790427613;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eD/xoUFvLlvXjyaSSWHaqdqTpoUBXYm2FYwmkUavXyM=;
 b=aK6i77H+qZvTrJMhWSZy6VasndZMLmdzNKNCOaPdLuFynRhqKkGPF+q5PyPKzK5JFxdL
 dmgMCOwvnxVRPvB9ih7q6maakN6Zee1CeZBYLywx+DJhh8a9v5Aq80dcihGrbvjyjWva8
 XggLqzOBpM7kgTKe8CSzRO8H73wpxvYb6jkhPIFjUtMbYmGtjSoGELbZyw6qiTiQxzUrO
 vWk7dW65vBNF/gOXdOJWQcXXMYCQCbfHdlWdtEr2Us5jM5WCSCHu+wFIOy/SaIK9c6LnL
 Tz7erqwo2+JXip9W5V06AlXvLl4lm1QrwydKhTFIYTHNnjmh1D6Bw5dwgYF46W9Eb8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rOzhjJoj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rOzhjJoj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D9F040835
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790427606;
 bh=eD/xoUFvLlvXjyaSSWHaqdqTpoUBXYm2FYwmkUavXyM=;
 h=From:To:Cc:Subject:Date:From;
 b=rOzhjJoj9psPp8SAcq1q7WOdzTjjzKxuiBKvRi+6WaY0hRw+10rfrpAj4h8gVJPQI
 lNj36WFV4Lu4tS4wEJ4lNOXdeh1Y/k575TJ3ztRlxomP8ak7xYJAzClGwMyAbygne7
 3BzGS7RoI3PJi00Wzdt9hV89xJEALOnJJsaTo9jR8SioNetEu/8I9iYYvDQI7NVdvu
 vTSs4iSfSvhjL1fkc4WMXryJQxMvjWvSt30bfEQfBbu7eLiSP+vfjL+zzwztQ/4bR1
 i+KfGkkJYB3K9+jzmuKNo5Nu65dZjGs/W2yOL9B7phk0LSI8VitfMPuM+zqw3n5EcG
 Rt2c52Qv6kfvg==
X-KAS-Sym: v3:f51bdf72230551df:M+ferKt3FnKHaEP9/6AtfNn214TP8X7FFFjQfIB4jl9Ai
 dxE2CY4NGY5/FWnypcu3ElMGpAPtkyoJrrcGga/UOxvynS0ilMkKdAPn6UvWh5+CUGKWveSMdQn
 fD0TH2wUAL+Twije5s2ywN1h+9aPw7sn6p9tTiYYRptycSvq+KOBpnWikIhBmynqosxrm4g/rne
 +DYxUqd3DlZztVDOZsu3dSAT3SVjAXnpTLBK2eTvwqEtvjlgVEqZUva6gOLivjadcgDm/3GdrWX
 cwwNXX4RCNJm5sIoC+IwvUjkHDiG2z2hX5PGKN2oLtIp3XvxAkx+seU5owdWp9VBU4xXD0wg==:
 UYV4YLC0AK2JatIDVBBJWy99GDOZ/2Qo+FDF1XKD58KCd/HORlIyqSZw6pfMPwwlF8SvCXCcP0L
 8vE8xExrMyPH/qD6aXoPKlnAFw2QfpuyIx6iEKbtsq9SkUohZYjvfPqLT063TnguJJm7JEcv0XC
 bmhbwpu3ISTdeXSsLJ+hP5P5I8QkDEdpPpSXHq8Lst/N4m5jiNoJVCYlyXYfNXd5ZVeeJEuDKsy
 cYbuyfG9dKunqAQzbZzcOT1zyrlSLFcOA98/ZoBJYd7P6OEQRei7/kpqMvaaJDm060AAnRfTze2
 fMxL9pb0eR4o7FTQN/ydzUXT2SYBznidQzX31qJE+8XwlcCu3EU1qDRTgZbvDFRg+MXml2+bt6Z
 J80YxiRkqSlju13D/683FuObwtcsbgVthnoTOHnhkvrLgkxxtr2PRaIxA2Zw7mLopAsfR1L4Sum
 5I2Hit8NRfG2z+R8DskI5FrsgyVw3zf267xEj6PWAP5IQCAo5GI4QZZmpKkZRFZ3Sg7KxvrbAvx
 bLjNLbYP+iAt2twAdwIMCTQX73Du/cyTihzptm11ldqFOepVVEA5zlCbkn07shrTaveI93VlhDP
 yI0=
Received: from fli4l.lan.fli4l (p5b3a0325.dip0.t-ipconnect.de [91.58.3.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B7BEA4C4D89;
 Sat, 26 Sep 2026 15:00:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58396)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAS0c-000000005vv-0Q4n;
 Sat, 26 Sep 2026 13:00:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 26 Sep 2026 15:00:06 +0200
Message-ID: <20260926130006.243930-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/mpg123: remove MMU dependency
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

To fix the problem we limit ARM code to !BR2_ARM_INSTRUCTIONS_THUMB2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines for mpg123 passed:
https://gitlab.com/bkuhls/buildroot/-/commits/85dfb60e8f4fbe0caa74674d91c54400c288ec10

Gitlab pipelines for squeezelite passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f5549196dd9e923e3c83e809a5e170da44551c75

with the exception of an unrelated build error at
bootlin-x86-i686-musl/build/ffmpeg-6.1.5/.stamp_built

/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

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
index 17445395ae..0318cb4810 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -26,7 +26,7 @@ ifeq ($(BR2_aarch64),y)
 MPG123_CPU = aarch64
 endif
 
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_arm)x$(BR2_ARM_INSTRUCTIONS_THUMB2),yx)
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

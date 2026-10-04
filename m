Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C4ACA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 07:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC1060632;
	Sun,  4 Oct 2026 07:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IE8fUJXLSlqc; Sun,  4 Oct 2026 07:06:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A35BC6061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791097574;
	b=dUbMQIncUfA8m9Fs13VvbOlNzMa36xsMbv9y+yld0BEDH42iIYKoO1ErQdsaQO64jvPe
	 ObDM2qKS/17LHjlT9dxhoaoMVx+670oDOczQLviBs15qpCt1r84U4beXvw6O1CFGRX+70
	 gyibDQLf4w1i8bEKIYIv5K+M4MlcDGGPhdMBWJDlKQFvtUD9IWf7iNhfFJOGiMj6/VZ70
	 BmKUhipHT9g4e3qV68lN1BkR6VmksEK649ZdJsAixhnEZCeyS3XPb4iczdv1gA0QlddW4
	 PHOimbLoXF0ErN/gUpSKiTf6clc0FnBORKRkkccsSRgV4GNzRsZgZtSGp02Sp184evQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791097574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2Pj/Su2NEky2GOE9jz9xYslVadJt5bsFOyePNlFkClg=;
	b=B8PkI3vmnAe8WvQw64boECPJB6wGBt1h/aWwJAGEyIvsuR6U2MshyizRnsDsSB5Qn5+7
	 p7O4vInwvBAMhROmcrypWzOzfDimdLU5TLX1l/eLJn+GyCbv45x3HpRhIhA+vs6U4gWjn
	 1uYzJ1hFgbTsQDmRFCwzbVzMk2BLhUSCWlGJF0PsJZrJXFj4asgwU5NelgOc+6VLfG4uC
	 hTVyHos29fba8udtWhEFFDZmgeV8Vx9thz7mcSOfhwyY5xz19nYhexe6EL/uSiNk3qWER
	 H/yOqIoWgbI16L/7IkzV7BxQTpwWoJpcSl49spX4PnfKBNCEm3cu+zbyRGwIM/d9sxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791097574;
	bh=2Pj/Su2NEky2GOE9jz9xYslVadJt5bsFOyePNlFkClg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MfFf9jm4Mvas7urK1JrhhrmGXJMb6HhZJQJ9lDuVknHhAo/4mTv67ovDvNlX8Sq0p
	 GxNnljAXPayuaHoZeK3ky5pjqNz1pFRzASRecynzw1iu7P1wf1CxqRzbnQog2OKhin
	 Fit5U4XlHGV/V1QuQ5ozv26zcuqrxdaqpj08rhNQAsiHIHVh/GJ+UWA1YkVVS7vFCI
	 nrOt1tEX+PJB8VGuAqiza8+nlrm/S6CXoaBIh2+dwYPhuW7M1DqFM4pxsKBNrh2tXN
	 k3iQQ4TinR6SFh0cBgud1gJ34Xn9j5WQgnbtif1dKHVznn83rLASsfrjNQKuhPBc0s
	 4WblxSK9G/WXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35BC6061D;
	Sun,  4 Oct 2026 07:06:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3F21A6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 740816061D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CSRIU1mUuyz for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 07:06:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B687D605E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791097571;
 b=Qv/cQ0W6GSFgWpdXI9H34bxIskN4lQxpYhP8OXS/Dn6zJ0TGQ0OgDSa5/Li2EdAiZ6Bq
 cVhv8g6+WdSBj45HLqT4K3LJVF79ypgxVMFb8C8bE3MieO/HB1ZSyepK+BOQidKTjYHXi
 C5VQecuSmvnD6agIFgAsQ0zRMFkDKWIpXa+jygBHGStYbZSy7DPrJYOxOf384DVieSp/R
 pBUA7Jbx4/ddP5u4sCPFiVZEL7KXVXDw4rDdwtn3ee/r2ZdhvbRrxwoG5rAg5s6hTHrv6
 5TOxaQ9CR7ZIBD3uyQ26yfXjjo0M0qEt1jd0sX7OEu5I+Pdx6YiHaAsCDTHCBpu4gvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791097571;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L9w4yGflNEaQggxkAYyWG95Es/sqNzlkfDNS6cv7X/s=;
 b=BXAT4WMBAKwMERlp6t/9e3nLmH9TKxZUw7DEtA6iRt4SmimTgjaeXZ3in9Vleh37CHwD
 cgV3ZjmNFRzZrxV8wi7xY8CN0DahOw8uQfW6zE1mOErHcmIfOu3ViLYa/H4ACL/CKymC/
 5btSXXulT0Dcd5MZfS6AX6zk8DsBBSKbAvSaJB3WH0M0nfd9gAHj69dPG535fZLkMXdJF
 BKzU1/IyPhWG6eZoCFA9pH9nCsxQk/ysI63F1clbobAiMeOpS1MjVTWo9hqN05qtC4W+y
 3gmAcTTElmxxMfzqGLSK/1m8llBt4I98XLdZzDVVV29roPfSA4X1IOYEiiHcKRGKOMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B687D605E7
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 07:06:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4D3D8B68B; Sun,  4 Oct 2026 07:04:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 09:04:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 569b91bada811b822d9eba59c8af16169c4b2783
X-Git-Newrev: fca0899dd6cbeb9e6c7442d4b53513f7a29e98f4
X-Patchwork-Hint: ignore
Message-Id: <20261004070456.A4D3D8B68B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: remove MMU dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fca0899dd6cbeb9e6c7442d4b53513f7a29e98f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

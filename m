Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E18C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739F9814D5;
	Thu, 24 Sep 2026 18:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6P_vMOpjSIx; Thu, 24 Sep 2026 18:59:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 607D081432
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276390;
	b=IbyyOWf7yZUlVB5wn02fsJx664VbqFfMJ3PTcFrlbtJ8QhZy7+I77r21gCs7Eq7Z5iLQ
	 ZRhZ9iQ+8QnL3MDDZGZvNIjmBTA1Jg1t9ZZWV5FbrmWsMgZ2h9r7/BBbLjj8T2CKIwrMJ
	 EUQ9XvItdBwddUZmSPPonVEKADdXdV+Z5KObU4qI4+GH64qKqmqVChStMfeLE51YaJ/KI
	 loZvvOkvT2gF2khco4NoWtllJqUYJT3Q7wdyH8iODiqS7ErJSXKWi1++J8a+koHS84tr6
	 fbBvQ55txqqt4kMfeH4TYdUbYQTWXG8gS+51vDdu1mVShxr7DZAIrzYx29QYLVRRK2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Wi6Y578zs/u4eDsgZLy3tLzNuI4+rOJ243+gj5QoD7Q=;
	b=YkaEqVdJwrlq5/Fc7WNZ4jOeLwKVgdPItrexTR20Ta/CyOE0cReR+a2DWmHOL00lXjoM
	 dfE7pZDaUM9nP/mJFu0NpgLqcDOdecTm5SyBotiJ+Fif4VjCihO9X15XBfm8QdpU0m+dG
	 uSwFjmAVJFaan1IAIwPEeHxM7Kh6hbxK6IKFS2Zvr9b0nsZY0gvyPrbi/pp3zvKEA7Osr
	 i7ppU9B4UBOoGUuNWBl/ibcNB46Njcuo29IwlzC1XxJtcq/R9xa95MGYk6iYvXS/vHt9t
	 En/wD0yvp3sv2zwPrMLsXWVWwISQgS5oSn/7g4RnW23wsbIdH3fYx7Kef+dEqafRzVA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276390;
	bh=Wi6Y578zs/u4eDsgZLy3tLzNuI4+rOJ243+gj5QoD7Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LiVHQt9aCGraz5Mg5pdgZ4p2rvo6X9Sk9kMnGRUY1um/4LyhB5mHmxRr/RBsEdj42
	 etbH6eP2shoCGzyNxHBLBdHDq/Ob2dDLXoeg+BddDf846412sv+MDjkYQSS8C0kEC8
	 iEPdrhcJLZhCg0qY3I8PevKXoS6FQ3EmQ3kuNV+IRLsLVnuVc9YfgsipMMh44H+wm8
	 CX3ga9z+pnxhP+4o3Y0/aQNlvVh9BHoAm2SID2vW74JKu7tzJNLaBXMP3D3+bV9nur
	 7TLhG5sqQ+tp4l6khup1+4lhJ2UXJbuxe+gD2Gbr5eQLTpmAJ0fEgjKZTel7KVwkWp
	 6ZwCYbVtG2Szw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607D081432;
	Thu, 24 Sep 2026 18:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDCE6417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF5581225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xU_WvD6LHLuS for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 800DE81218
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=ZXVAEhzJHOCbzBMVsN0+c1ciPjdQvFvUEFrOZjNsHLr+l1I/ibi1VtkrEqeAfMGi2BGr
 upYXApXPJ78uabDypt65SHAkzqsYcAVkwBRX2vA51r2ObWxk+++m3dXgMnPEWVd6zeoMi
 5Q9XyWO8gIvXeeJ8Xk1zo764uiLavGWq32HSbY1IZedYrnG62WcHP1KHV1CnQWNABOtpA
 fDQ6D3yvsyYp1tz+rGZRuLaO/cvcnovWZz6OVM3nDYCMoNqAwhmB2n0vMP9jjSGwIee00
 6c4CMguITj0b3uIadH6QKL1QbRIsEW2Aebv3gmhQNlYr9CYBOJpH46ytlJDLUAM4HmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dkPPPu07yUu/6TXnm57Knp5NGfJEVhx7ezSR52AnU34=;
 b=bfmu6DBjPE9vtqbu8J7k4TAUZ1SpqmGvW2+dAez381bGv621IRfLvJfpcEu6OfvLihwj
 SSPa91mJL62wgqy4g6/ywZMEknw7rb0530R1sVSaYDwrQYTPPMKOzAtmWZctxRXMcHb6f
 6fJhuXGBHp+24O0wELyjAjZFQqnRIoClvFoPgPRO8IvHuqD3dT6RSf+kwyxsqhR9/RVi8
 Ozv+c0KNlW72etHxIpDU6p/o6zqQx93MB5RfYtPDcWZVdZJJ1MSEzWjs914WhtBvCrMnM
 4KGxoGwQQtAoVwuZ8avbmqs219zPhzR0rYeSDQweiPH3kp43w3KDa8ZczKgz7BEZ/MQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 800DE81218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23EAB98323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:14 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3ca262369030b176ae652ebcd901fbcd6e2d81d0
X-Git-Newrev: 26942706905513359bba75d3a94f8c7cc3056297
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.23EAB98323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libgtk3: add
 missing !BR2_STATIC_LIBS dependency
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
Content-Type: multipart/mixed; boundary="===============0162015294938520230=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0162015294938520230==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26942706905513359bba75d3a94f8c7cc3056297
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

libgtk3 selects at-spi2-core, so it should inherit its
!BR2_STATIC_LIBS, which this commit does.

This has been an issue since libgtk3 started using at-spi2-core
instead of atk in commit 2c3ca7bea1de76163aeef432412eb14551ed0581.

Fixes: 2c3ca7bea1de76163aeef432412eb14551ed0581 ("package/atk: remove package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 93282f76a535ce54e9a853c72c01152a2c3a6805)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libgtk3/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 52ee50db49..f7618832f1 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,10 +1,11 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 	depends on BR2_USE_MMU
@@ -23,6 +24,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG

--===============0162015294938520230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0162015294938520230==--

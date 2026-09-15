Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ECBC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C938560782;
	Tue, 15 Sep 2026 17:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBj_0-7SFyo0; Tue, 15 Sep 2026 17:20:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C4D796076D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492832;
	b=iXECo7OxHsUmjAaYATc4YSUF/07KjrGxJIRgymCdVV12xhmLH0MZCn5OPL9YSZU3fm8z
	 edo7/H1uuaJTzAbX/j3Bn7jrrnIvj243fuUMRWam71JzHhA+q3o8x8gZvWsIOS8AUur7R
	 FSgl6Ivq0MAkovqkWJbSGKHwlEmd9dXwJb6sJeLGDEo1QlkDSMuIltgoVkXK1CXwf4BPp
	 O/3h+eZ9AjrOW2bXYCZFd++SkOvgcEMt1ilqmv4G1H9XqPvaLdKbMP0zonWOvyNAJzpTJ
	 pxHX2st5P3Vat9rhkPfiwnlkZwXJhXbPJHT0W1reXjBiyVpqtmKdGRG4io9BaQ8LxTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JR54WSFEKwbwvOtfs3Puwi/RkkNRyf8XySTLaIzUggw=;
	b=Y2NCTBDEO4dnouvknAzHJrRqRURhfnyMloz6x5DKAVccFeQAuVrHdWkbo8yEzVwUORj/
	 woMoV6HhQSjm8aVO3wsMUCfMub2TEp8xS3A7/9Ol1ewosDzXm91P0MS6lcoaJZS1gwlH/
	 PqLGXXnp0uZriI6AhDDDTRc3u7YcuAVrN3/8ncH7xgocu0lcRgK8kLT2I3iPy1j15kR+v
	 gxwqgc77WqLqvNyL9VnihGsERun0eeShBOZr7U0j3LTBq4VJ2Pv91gZiAetqAmXLKd2zc
	 R2ohlbe65cZKQ9CJFV0dKMjW8YKKgI+Sk+hCX3Gy0kDsV6uhbH6vklJa/q6exiG4Gpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492832;
	bh=JR54WSFEKwbwvOtfs3Puwi/RkkNRyf8XySTLaIzUggw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z1emR4vI0uYZBYnhGTv5gTbNmTiAAJSNBdGwgTd7dCi3iEA7OZbCMCdiHxNdRAMLe
	 h/lkGeU5OSMyUNG16QGak4aRfUrrqI9zeCKUnsd5U/A0AqcFRlpLXUbIGwjoY/LxBw
	 xF2zi756HxEbTh4DGTLzFZHSEUGWQoxw0JHJPIGh6xUBnAWaVF1THifaUPyy02cgz9
	 2bdLTqAAd0loPQL2Bby3gQ1RtYvo0g2sz9Vfs2+xd1j+oeQvQk4yAIR7c7xOwcjsNI
	 Twg/RjRuxSOP0bqjl+fc1jPGo1PrCROXY96RAniumAU095v6s9QrRlVXneGLgF3etl
	 DZWmGR1bv3mNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D796076D;
	Tue, 15 Sep 2026 17:20:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A940DDCF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F96D80DC8
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueoyyKehgeyO for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 887AC80DBD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492828;
 b=KgkV0loHcKKAT8aKiGfp6JGNYjRXO84LHawG+tV/AhzHpNosk36uM9idZCGpqL9bCF02
 EIXWP/4MonGpr40SVKWhkQLNGnjLmQOqm+oV1HwdlehRojpmFoaPA56T+3n9gnKMkzbLM
 JsrRfPClapNmk37b8SDcLcmg/S8pcHHlLpgzp+VJeFZ3I4yL94AiHvf3d3xXY8DpCpWef
 gtcExyMU86Al+6rI8oar2wIqaYWC3AzkiZQvk7IpnWry2l25xGEdbWHuTaUP1nThNTh59
 ptnq1lTrv26mf/TY9lckOadBR5BYujobMUxvkRJ4VCvtWZRpGLFy/TLP80LKn+xiRDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492828;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A78nSE7Y8L1nbQVusG7tUBkzSBpSSfyJmW7be3unvKs=;
 b=XY7eTOpcGE5H6FEbs8KOg+9oAwBbLarS2OcBGHWVdQ1yLMQYMeSf2G44knzGyhLgRw0e
 OqwJVlLEd+tJW9ela6QbQypZt82AMOHsoUwCERPXujsA4QDR7Bk5jmXlitUNDiQZn+Ya7
 sN+5VKviBqhEVtJkquxnVUrwVYFqW2sMRHheOrPPxMUAvlUPol4S9fwtoUUZbx8S82JZY
 ljuxL6eq64PgyL5wpFnkKSH0j70KKx85rBoUi91WuHRqokRj5rDH+YrrrMYsRA8UeHOWv
 n+Uqx++HlCg8vXMETMcvCGWNBoGOq92fK5mBrabcjHQikPU6cBPR3z8MgXFxPrASM3Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887AC80DBD
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92B1395D69; Tue, 15 Sep 2026 17:19:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:14:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e67b301f53ebe6838c92203856792e6953a19f1f
X-Git-Newrev: cd5eab10fef0835dd04841c315c03c45d916bd67
X-Patchwork-Hint: ignore
Message-Id: <20260915171922.92B1395D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: propagate
 ucontext-related dependency from libdex
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd5eab10fef0835dd04841c315c03c45d916bd67
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_SYSPROF selects BR2_PACKAGE_LIBDEX but did not propagate:

	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS

from libdex. This commit fixes this missing dependency. In terms of
Config.in comment, we do the same as what libdex is doing: handle it
as a toolchain dependency (rather than an architecture dependency).

This was missed in commit a73ef093f7b40297d69c6813c44fd4626883632e,
which added the ucontext related dependency to libdex, without
propagating it to sysprof.

Fixes: a73ef093f7b40297d69c6813c44fd4626883632e ("package/libdex: needs ucontext")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sysprof/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index e89a0e539e..258f549152 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_SYSPROF
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS # libdex
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
@@ -21,13 +23,15 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
-comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12"
+comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12, ucontext"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12 || \
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
 
 comment "sysprof can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668AC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB88812C1;
	Thu, 24 Sep 2026 18:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sr_Glya-Olnx; Thu, 24 Sep 2026 18:58:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D450B81325
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276318;
	b=HHS+UUAEU98czu+6vu1e+D+YngMC0H2cdrzOetBv4Uuxog3Df/vB16VZjc77sJ02VeN1
	 nj/BrT6x1fhD9WhFpe9r2UNPyWhA4NlO/QmGy4Syh7wAbGz51Q3TaPJsw17jqva0s6fU0
	 h3abw+vXFfd0ZGVnEXvqJ2o3a1mqJ9aRl1CVGnR6PF9jSNaKz11mURlR7/4sMkcM23Zwz
	 nAsPcbBH7V5stAM5SOnr71dK5byXMEjTITyXo69vc5JOU79BNjamqiRvJULXjsA0BgXAo
	 jsZc7+BE0gBEUaSguZFRvhbyPKYCpbsAGZRU2HS8DHWGnDNRb1mtfEF4pyoZYebvovQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h74Tn1Asy8547Sggf358pR7MeM/yiu6D1ZhNYKb9p0s=;
	b=aCnCiMPobBYB2+EsYpqoyQWUpCLDvIcoToIgr/d+SsfeSUxIu+xOyTIYXpdIeQeX5M2g
	 ahYio6Sxu+Rv5UV7RJH9gNHaz3z+JGjPfuU+6HGQ3LBnkcX0Ynnyql1uikGTYf76hB1gl
	 e9kBcOLgkk84YDqqqvsQ3HJKEynYF4eiULz0mblFtMn0+559hMg7dhsOARQGa9EwSisIq
	 +EKP0X+7YegcI6tebqbkFjZ1clptVHJSk9oz+eNhZHp9TAYpJCALubShQoXK7B/kFYlBQ
	 klCJOAwQzu2ZqKKyeUJlekg16+BxM/kd5SVOrp3LvkgODnJGbPJYjXy6HjZyZneQcIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276317;
	bh=h74Tn1Asy8547Sggf358pR7MeM/yiu6D1ZhNYKb9p0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BcO1L2IKMAyKxslnqYzVi4yMaZEXqTFr4zumWyehcubfgBudZ4Ypsv8b1wSAXsQvY
	 nr7X7dxinv77ZnGPvcv63n+VtI2toCR/oIiJopffirvylqZi8SNdBBC1IBc9ZIsLy/
	 NDJUyP4zrj8llSYr9KmVdHc9Pu+pUwfq7wUH8zyWCsfcA9VfngG7ec5ZYIDelUf1mg
	 gi91equG6KHRtnnYkNejQNURh9r8uMWWA6iazIdfK0rke+7TR7C9T/qTDh4ekVLOeO
	 aFwe8xB25yq34V+e4SwjrY5E34LDDa1YCLQscD72GNAy7OA271cMFcyi+uENOaqF1u
	 I7Q2wfmmm/Ihw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D450B81325;
	Thu, 24 Sep 2026 18:58:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 941F8332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8617A4017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mn_xlIBHgnKL for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BAA21404CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=d+ilVjcL8EYCWdDpZz8nwWu219ut3YlIWwojgn5MLR2v4qBVDbW1IGbjPYtJBtjeCU9R
 XmLG4SNjlcGf1sw3jLaW2H/mCNd61atyagINU9zA6VzspE7OC9srj+anVQWHpDtA8oQW1
 DjoYrySP3Td485WTQvIOqETLh6uECASsL9bQIzo35isCQwwDhs3f07x6smTtyK1pVwR6k
 FBdJkVVRscYav9eijy4gVMl7vHUkw/tNRfzFeHqj/qujvQEcTyWjMyU7i165Nl+Mavhi8
 pqQpyYXBmKVS52Nt6QCtePT8NvOnuph5bcGlkJIPZgujrYodRAXb57cAasE7dUoOfBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Gvx8hTEzPyBsdve9x0HNlQIgpT1C0u4XoWlJbJNmtXs=;
 b=NxooPmMQ2RNUeA2smrixHrlM7xRr7LaJlOc8x7vGcocqiVaAAi2/zSL5CXIUkPCiSeJi
 fMphYVtcSGxTdVCGrEyEnx3D66dhxzOUyt5lT4PctLPdDc1ovgMBwGYiTIVR9QlDrfFAO
 CW8m7iMletxlkC9iPAi1FkyfTIkagfAZIP2rf8wdFLed4ZSccI2+dHP/aQGRz/wCCMOhT
 dX1lzOoGG1cK3MeD4BrBW149mQojf24Uo2MSrmLT9g0a+YFKy4zcGSyMxxfqguvce41zX
 8Q4StrklHrXG151FyLE0G/ApD7EWbFERde7kc7sS189Y7W2ngjVX11jIwFZsnylKDSg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA21404CA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E42094AA9; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:47:02 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ffe6be087681687d0aef3fcf453694a444041616
X-Git-Newrev: 28dfc9a5d99cadf81a2f0af3f77b203ceb15b4a8
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.5E42094AA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sysprof:
 propagate ucontext-related dependency from libdex
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
Content-Type: multipart/mixed; boundary="===============1090176697761346018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1090176697761346018==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28dfc9a5d99cadf81a2f0af3f77b203ceb15b4a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit cd5eab10fef0835dd04841c315c03c45d916bd67)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============1090176697761346018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1090176697761346018==--

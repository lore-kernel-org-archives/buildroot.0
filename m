Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76D4C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 20:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AA64058B;
	Sun, 13 Sep 2026 20:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qICkTzmg83Bj; Sun, 13 Sep 2026 20:01:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 796EB4058E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789329663;
	b=DpE/4uvJ7Alz8fhcdyb7tFGcaAmL2LsZ1+hDBRoyL5q1O6OYqHg0QS3bGssnl/uUNi8Q
	 2zr8lRmDvDl4ye4G9bkxtpr5du9zShWIneputb8zPK4USWWlTbKzYUzimBCaH/J9JUIQp
	 wMyvXaTDB060GLeALY9TyMWlfjlrR+wU1qzBAg7lNnUMV0ZbVqf1NC4UcHI9B1iB7bido
	 nM7k8TMlT2yrrb+yA2s5X3NbT3/8rsrN/Pj3A41b++CcYYtXJ9u8m2h83shM/ZbIZZEJF
	 MkgPQrSQxECDLG6OpOASiuvfnYkUan18X13C1HZJrF6dSG21+A2piTFC+FGas3uPIqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789329663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wBc5t7CVHjN4e98i/vGgUjrrpY49K8LvRo02gbr/yC4=;
	b=HD+9IdjOVfHn+gYtDLSiq0Uudk99nWOjSiHQreO+uUBH6OqUSiEvBmbTSg3qzCz05dwh
	 BO5n1cPdflYqy+nrOyJZBIVG9pLIH89EWLt56MfrrCKDLbdYP5cvNyd0KYOLyrhVLQPCd
	 YVOEjEOdJ9H4AqVJq/FaB77bpcgMoOj4hZsiTts9pt2QTv0guWaQroTIteC8XhPqgitQc
	 EcqCXRfQd2610tHQXTkG1JtKX8pQwaH2NoqYgPjpYAG5JoDHgGohykKwxEclyXgQlvC+C
	 DdfRKLBhylZt3lBy4FNC+z/XVj6G2PL5A3fEyo/37gbMK9Ckqczsi6GSJBhAmtbYUdQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789329663;
	bh=wBc5t7CVHjN4e98i/vGgUjrrpY49K8LvRo02gbr/yC4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C3BeOBwYMA0KYWHiwgZedcDFOZElk1t7wPjBu9/b1K5mi1t0EUBcZT67zNFpMtBx5
	 +a0c6Buf8nir/q5fzSA2RBozSAqbfeL8Na1StS0PoBdX+McFdpDftj/h6/gidngPmL
	 doo/YLwWQKBy8d8hNnA6OqbfgMp+ZlEP6MPQ2D/A+5dQ2UvS+e8FXcAdLkjxBxllS5
	 Xz+5b6JZZLfGp60xvJ6jpzgfYefbnSOgjQt5F54E2z1hDRcapEvFe6Ji3dra9RUqNb
	 8RgnRfCLtpbjvhHCj7ng+iwEfH6jRajN8+7N1jk83Zo8ykjbIcTR1sXKQ75xde4aUd
	 bwqyVBIX4kfgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796EB4058E;
	Sun, 13 Sep 2026 20:01:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7915624D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EDD14058E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXZZ8wjkVO0M for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 20:00:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ACD514058B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789329659;
 b=pJ9Ad8R4O4p4Sdb2RYwjQ+vcGn7+/vrsCAwJktaPpL/dN2eCE0agaUj7U7MYo6W1JnB+
 WG+hh7kjRY1ADtapFja9sHdzC6eKxDYTxpVNm+Msxsh2h/tdKpKfim/5DNUzj0HVrdypz
 qV0oW6m5OXEWnfcLJIvKpnKmoYGmk4l51nX6LlMGeD70wBoA3v+gB35F25Uqo5smWS6FI
 S79CgauROlEwt1+kbCL6dLw+nMSiHngx3xWJcFPNXshZxJ2bXsgW1rEht3WZVSuc/BEgX
 jwHtro25baAtdfyfyaHbQ2RZTWyjZ1ONyywInqToZuqQqeUm0H5etlUr29pjPVv1FqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789329659;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MG+pbWFaOBPZjYDbNyqiIijqn3glUcEzpIzih/Ho2ME=;
 b=PYiy/dFx843uu0H7MoaRV0RutmSC6y9T7Lrd9XUUgH4t1Lac31ICw8EP/D3NFKzdv69Y
 C/jBJhcBS1GFbd7hVZ1upgo6cj6OGHMcBRj3rWAXPo+MbtS2QOMgUsuq0jdZ6yHGOpla+
 vtG+TKxVsiTnIiMVMk56XPJ8J51xFAUQTRGJ3wqGf+z8L/OlgBIYTqN/IuCHUHsbriyhF
 nxp0kOfdko1CtfdliiJbTfL9wlI75OZ/1wLr0v6TzxcwjYIjfkUf9Lzio5zOyk5dulEdA
 9JCnyiVAgrB9xFDuQ3mkuOKrpfZKi+Seijdim3iiDG2gQFDLe6ZGIUd9KANz7tkjv/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACD514058B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A22C295C79; Sun, 13 Sep 2026 19:59:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:59:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39b840beef568ab7e671e9145d186b5c993a1b07
X-Git-Newrev: 04d7d7bdeb907483e7db0005b403484f379cf84b
X-Patchwork-Hint: ignore
Message-Id: <20260913195954.A22C295C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosh: bump gcc version requirement
 due to protobuf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04d7d7bdeb907483e7db0005b403484f379cf84b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump
to version 20260817.0"), libabseil-cpp was bumped, which required the
gcc >= 8.x dependency to be upgraded to a gcc >= 10.x dependency. This
was properly done in package/protobuf as part of this commit, as
protobuf is a reverse dependency of libabseil-cpp.

However, mosh, which is a reverse dependency of protobuf, was
forgotten, and it no longer carries the correct gcc dependency.

This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mosh/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 7ca5259ecb..8676f59cc4 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,7 +1,7 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 8"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

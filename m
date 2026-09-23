Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4CAC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8177E40ABE;
	Thu, 24 Sep 2026 18:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oq6u5NOW3eG; Thu, 24 Sep 2026 18:57:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C94640B22
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276220;
	b=tak9MljHGugQOH+PogYErtj8SKCGG+h1KSwZG/bnQvdXzTTZvYKetg8CrooEfhofCF0m
	 KZupWHQyurY8v8hWhcx48Ur7LnnS/sm84tlJd0AS6rvLuiuywYdvRpCM2VM3MWZ7qYA/d
	 2+xWd+apsn4cXbGx75vVxf5yfiAPNxedO01psfjPG798Y0HSzNttZLJsW0O1K3CTdhCy4
	 vCGYvXlUakuCrNBNKDYViRWCGj75Ls9GU5OIReP1Z2AzpW4w2evK/EPcnvq1rBB4F2HVu
	 fQZZhTWUe/oX0+ptiPkumLH8GRNq45c71RoX3lNP9FeIvMUZD8NBpW2G/zLQV47oTSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=m6ZH4bJyoDi89TCUAo3PGpblCh+YHbmNnefKZiHnvis=;
	b=bknj9oKlJ6+J9yNh77RRHDmEQlkHjHDmdTtsfIfeOjsrRNxoOuug42pzH/+Su0nEv9Ef
	 Si3e5EZwi0PEbezS6JDk/HXGpbE2ZujXuLpe/erkV0d+/xlNAHljSP7tL03nhqMKyAgXa
	 ply2pp5rUzrUAaUUNRqdU5WB749hBA9MVSXyDmuzbRZt5L/iV7s70c11NByqrjZn5eK3o
	 48CLovqmqz9gUqMh6Oww5mPUEC+hfO+xL92xhZyUewzp2vyNf6DjdheSIo+6IR7cY+Shv
	 1EAsG15hWzLrXIvK19bPAbz0SAidAlE0dsgSPiZjSySQ0nwE6M4VBHSmmNUwAlVtLRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276220;
	bh=m6ZH4bJyoDi89TCUAo3PGpblCh+YHbmNnefKZiHnvis=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BIbFuWFxqxPfq+gBEm5KTA5pyPVJoxV9LiGQolfGC7+Mz9A13BuvAgXMIB74bLVKk
	 V4GqBnEO7RGD5rOI92pzBmytuQE2TMkcPcMMfFRYiPbXF2ga9Vj7uvalEUfoB1ue0V
	 NHpxLvY2xTi+1Zxq9pZ8sEEBhA+dLAnVY6r9XmDL251wtmLHAtYp799mDEdzLcLDeA
	 0l2NsQyB3tuxNiL0k8q3GkbulW/sDDZGXmKcL9lyLfdr3o7+AqdduKEot4t5vrOnAj
	 rJ5EfkHvv23kaZo3V0IQxBkpG89pFSyj/Kbqj3KM+gUSbItFxBo1heRFg7FOmXMzo4
	 XsVUDnQbcYyIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C94640B22;
	Thu, 24 Sep 2026 18:57:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D4E392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1072140AD7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcNNM53EZmPP for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 64FE340ABC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=iqW8IERnJIrbI6O6RHOfSJWMnbCP2XyAFnhhkenWg1GwPM2fnOoI/IZrXOjCWn/DKOdF
 xTDG/wal/C/6Iib8TxGUdCcJWvOkjAl8vf99jzcuzhXznYdWR1g8a7fuFCEveCegGg4KS
 lAONjuvVHnxDnF6Ylxvd/1K+Wedujgm+m9763Vfsj63VqoUEwqTtM3FV/N/aj+G94/e51
 3GS/0eGiZN7qXTScLBGLgpPqN9nDEadc3uDKmrUZQMrxR/7g+fuQvt/mvY90zDoHBQNJZ
 0Rs4A+4inSY7qqmgvXFZxdsdfRFg84caQBUxaAQ2ClOrArcmdf7eXIL8Iot4EHJCzIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=08nmyoRIhfu+zJWyVbsnwHJRih34za96kYd6jwU7t88=;
 b=Xfw9rONc+1OYPkKfRpm1Kg+E4Aa8gCyCVlXr82RiqO3qS/C2VM5Rw2L+NpnogPTmERuv
 0fDozyPAwwMSItBFRI3wZ9r6sK+j8ogFCeXbNdVB333SYoumAtllpj7lyo+IueonqcC4n
 YorXNZqdtZ40UwFK3N+6HGEz9iTQet/fgOShJFoftR2uPS0Q3/ifiQj0NMz042z72LNg7
 OzPkZwWxDPU+uKLbjwi0CO/qNwDjscvnpSOBpAsg4DgK0XDK/IxazfDnf2MBQXptn9G+/
 5Q74jgJsBHj64m1nu0QdAB15/O6bg0HQyhC21uKZooqPQCFyP61FB0CDPKuYob50cXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64FE340ABC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08BB998385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:47:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 74de5034238b8271dd9143f7894097f5f3e26c0f
X-Git-Newrev: d75b314ec81b3040520e9eed0ba61f27d8cbf7ff
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.08BB998385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sysprof:
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
Content-Type: multipart/mixed; boundary="===============8195320504067553317=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8195320504067553317==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d75b314ec81b3040520e9eed0ba61f27d8cbf7ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8195320504067553317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8195320504067553317==--

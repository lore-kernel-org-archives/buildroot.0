Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DFBC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5187B4112A;
	Thu, 24 Sep 2026 18:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LZBfvTNfFjf; Thu, 24 Sep 2026 18:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EE3F410F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276354;
	b=HSw6fmVjDesX+sq5jvteogfb6O4u0rUBsbDJXsvweGpTP8YX0md/xcysdqe6SrnXPytn
	 orv0A4Z1knCIjPNRdl79Hf8dEBfrk2DqMQwL3ibrkETETYJbzbDoZxN9P0zzy4NxUZ9si
	 RUMbWGYvkrRmUiIWiL5o6Y69SK1u61yHo83Ac0j+YiuejLN/PMyo5Je6fSBwah+hYNgDh
	 xXVQPvkMOyDbTOn3dezNurRweUABT3YFUdf/WbxD1F6FEbhyDxPeukNxhMnDYTqyC1dpk
	 hce7lq4CpdGryHvT+Fsyg3XzNdMRQ4G1tJENQGGWV4G50OG3gTCzllfAdoxE/pNsugw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=O46nM4/Ur5JwfcrluUejs0lTE9qLX6d6BHgAfhVGqdQ=;
	b=DGdnmj/XoFpxXyl/tRgUWrvipWfh5DZDzLx1b2CQFKvKW0WO4XbfLMi0ITOMi8d7/o9q
	 fQCIKCXEVc5vsUFLjPFx/Hh57/vraW9LwEYkAfFQZoNs4FpkN0Sg5nWApVTYteaCUxITg
	 rb9Nm6FSLfFjT7i5cqPv6sd+ZkoONAg98+hvScVkhMLDsEdJF6QXzFfoEKooy0XHcqU96
	 IR/f4up1VvxzSItSuaCor3Bqchx03YMTfjzvXJ2k/0bY88tXe2tv13wKVo+160QLA52AQ
	 x8S9ea0L7ltVO2hHfHrwbao8ydK579k0zEeLlQDfD+KpcLVwtPhrpFcjD+emoUVVt+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276354;
	bh=O46nM4/Ur5JwfcrluUejs0lTE9qLX6d6BHgAfhVGqdQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pjp/3trEQsVje9H9cTAtwyL+lHUh1RQw5pKYYJCkLxw4aFRnGgeastdWBoppAdECE
	 pW81V+1Uo9JISxTmAVwjOvLEvr3NPF0KJsEgOCUxjdBbvfiRY942pIJ+ZIUmgkiabr
	 CN2mybHc5tpA8f1NUkLeLtnODlMwsOq93MKdLC5ajzv8EP6c8TkdvdUTMPJi3acfzi
	 44G69vJ8UgHxiUwqi6BNlwgkNLABId8Rlv4dLgMNG6zzKRaNCS+3jiL+XLBZEkNANk
	 znWaIWH47zcvzALvuURliwrwuIeHKPaAobvDS8gHDb3kJdFdom+beeEjVFt2mHu16F
	 zrYC9lolzLmFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE3F410F8;
	Thu, 24 Sep 2026 18:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84BBE392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E0B81244
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcBDb7J28_ic for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 247C981218
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=ZIHJOYcWjGeTKP1pMjVTac9iK3p1UyTbMMwYA3JMPEdmYXk5lBcBgbrj8GVSQWMdpKa5
 IWVZP0i2KSjgQaIg4cehCguPaiq7iA7X3FneQR0H8FTy1vwQwRWVTNH8hi4z1aJzgY0q1
 baYybz63G7uGa5Wq4CT+3RbZThBkfrMQta4XGwmNDbLtx2Bd20c7QrN05Ock0X1Loy5Z/
 O6NByGekrXvq6I6pCn2/rcu8QX401r2n6LHvHKv7si69DmT+6guIOdewBFCyU1PmdLavU
 /kDpc38CP3bvwXE4+nXTyWzOQwOvhyfGnUVA+eIRb11VPaGZjVCgaVH2EUMgRTR7taw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LTup4E4OJ2pkAKTqGb/7YwIeAqwBIQNFn9hCfHwcYuQ=;
 b=gBnynxMg/ehz5uDoBzpY3fMhkn2loQKOqBzSTzJqG9LAsD+4dzvQH/KxNqHfMamDgedb
 QiyIixooTW9RzzJ9yc9AalUT8YEToyv6Lsl+q2Ftr2ETwrTAKFhSHkXUzavKLp0/zGsNu
 X5+PdvuSsLBcCmUcdeYVFncnaqe43/qFHrhy9AYc5WO8abwQp4Twctm+0aKG0koQlNj0n
 B/aTQH4z22wk6bjD6agT7fZ5gWIiQvsAYVQbexW8RQQ7GQ3Aq6QuruRbyCRIvVz7Ih0+/
 Ajx9399usiMsgNvft91XPu+Qkg1gfAWWEEWD+3MHNWJWxQiTduMLJGRIbOmTbMOj8Bg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 247C981218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFA6C8F0CF; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:14:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 93123f25f3da4db2200146e65e608ad525288893
X-Git-Newrev: bd2a3cc2b027c06a05e718cae16c66ea2ca24665
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.AFA6C8F0CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bind: security
 bump version to 9.20.29
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
Content-Type: multipart/mixed; boundary="===============8717812032688767823=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8717812032688767823==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd2a3cc2b027c06a05e718cae16c66ea2ca24665
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-28
"The BIND 9.20.28 release was withdrawn after the discovery of a
 regression in it during pre-release testing."

https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-29
https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/changelog.html
https://seclists.org/oss-sec/2026/q3/801

Fixes CVE-2026-19033, CVE-2026-19662, CVE-2026-19666, CVE-2026-19667,
CVE-2026-19668, CVE-2026-19941, CVE-2026-75029, CVE-2026-76163,
CVE-2026-77119, CVE-2026-77692, CVE-2026-78301, CVE-2026-80274,
CVE-2026-81563 & CVE-2026-81736.

Raise the minimum gcc version to 8 to fix a build error found by the
Gitlab pipelines which would be introduced by this bump due to upstream
commit:
https://gitlab.isc.org/isc-projects/bind9/-/commit/a891e7423379e69340e5004a753dc121320ef244

opensslrsa_link.c:53:51: error: initializer element is not constant
 static const unsigned int rsa_max_modulus_bytes = (rsa_max_modulus_bits + 7) /

make[1]: *** [package/pkg-generic.mk:273:
 /builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/bind-9.20.29/.stamp_built]
 Error 2

According to https://stackoverflow.com/a/67000730 the code needs gcc 8.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c781be5062dacab1e1e943df9f2887eef351782)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/Config.in | 6 +++---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 4eb024b260..7e691a35ca 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_BIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBURCU
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
+comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2131f51978..8129fa2d2b 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
+sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2b42e87d62..a05ef6c362 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.27
+BIND_VERSION = 9.20.29
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES

--===============8717812032688767823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8717812032688767823==--

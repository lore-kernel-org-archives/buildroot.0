Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D16EC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A386062D;
	Wed, 16 Sep 2026 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hjsYWIz4-j3; Wed, 16 Sep 2026 20:41:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F7DE606B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591302;
	b=cBFXFC05qzEOd10FyLdqki4olV3RQnyv3xYZKA2cOs6TvEj/e22jHAWoV7j/ZcnYsjPX
	 F/em8362tYjm1W+8VSYQnaxttkCrOi0EkzbyuprzIwEUmSIREN/F1YiO09WyqmaAo+hfI
	 OFay6X/rbSusmOk9Nu15lRMaToRyN4eLHZ0PxJNXgrdx/Hfy6mji6mt8PT1I7jf/PT3ly
	 HWn2uUbqMf+UmEonMcLgFmWhNRVIU+XU2bMLpVRDaxu8DUZ+BhbnC4su9I4rLoXosZ/Wi
	 mmadBdaHVtjA9uNYNLtnvg2KOrgrdSpAmzHGt2cVcBzCFrHKp/8WW7KTeFzXc0xT2pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fWhhqzsgwLumY72ZAetXiMXfISqUZUYHRMUsylAoDws=;
	b=TTkMH1gTu60RIOnNDu4m3f6RQffR2oiF7MvbAxBdxdxrz5IIqybdTlcZu/53XqpF+OPw
	 Bgt4i4Lbhkpmsxa5NtCzYNVnB05QbR5zMCsTnPtl2oOUG4NOy0u/wbZGujZszxxdZhMlZ
	 EuzkpnTvG48ELpYQWHKaY+dYUesHH/liau4s4vtws6LS8pDjKOMLIsjFxfyyz4YB5UXKr
	 4VLhRDWp9CSw7fucMELq4q+ON5dpRk2KJvc4Skz5htQBj19qbkFGHIhLxSA2SU9EDTAh4
	 jnl6EEssUpVrfL3675pU8UNc0kuv8XuQ3HGAEyqD4cLIv9CoyIVTWUPOKlic/lwrdOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591302;
	bh=fWhhqzsgwLumY72ZAetXiMXfISqUZUYHRMUsylAoDws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nRkyAomLA39MXyHgoiHwm48q3WWzO9Aj9TL8bjLNeidYaHIVbx63N8tzHb4e9/Fip
	 TyJnUtu4Jy0MAEH6YagnEYmC0ooyuQZeCniESpDCrMFGmy52H6WaB0xkAqXYzZjAwX
	 KiwZ+wDZg+ZhuwX4UPy9Qsou/kPSiKUMwNQmH9S5es40CSjZWWCsaeVY9BuFZURe7M
	 8ngoXoZhncah6p9kPZwlDZTQemab9YxGZ2EYiG2zozyI/BDo0TKf8nLlzw1TtsHVg6
	 v5uhzuQDHYH/hvZ/m6NSkehRbXsanIId6dcTBaiDkRj5jR2TB3EYNAk9ffjW0YDtFI
	 p5wt5OrwAKmuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F7DE606B3;
	Wed, 16 Sep 2026 20:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D69229C2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8433400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tr2jtWWO5rBH for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:41:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DDF124000B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591297;
 b=afob67Ib7/cGdQzVleQRjMOiml3xVvwMnGIjrjrZpjmEnYQiJNJGLh8/3NHmg2qlPRLj
 VRV4KBlmZ6VMc9TwvojAgcmr3LQ3M1+/925AZ5UZ3qHHr52axsvKjQofNcR0ejmEmbM/W
 zcWlJVywFKUcIkesa69LFeLdLArCSEEN2uFn7xfaVVQjYn9heoblIIZfByor8Rspdkjsc
 O3WI2JjiMvq5p39/vNQToGu9DyMD165IWZgEPAa7e8X4Z25lm7PszBNonHmsAqTK7fmBh
 TesRgaMnR/cNzC2ZB9oOOlHxED/iAFaDut5b9bDZsn1/5f0/GPW8OAA+quxyJNj4jSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591297;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q6vPlYKL5Vd+/aXG8YhwKvYpQrqrgdsVhdNYWtKaeMA=;
 b=Z8LVl9eVpdlTwPwXeSB8ytppmVI1vcbWvf6LNvF/5vJzjazfiYtfpJqxb2JUVPiMoaAU
 bEHuNCurK1F4lE8/F4zU68xcwkdtH2WqGKAalmpmhhnX6jPxsSL9BS6BT0iJQbx54WmmN
 xdvLsAjnb69hAYzLaOtOo9V+nZtyubMi6AehXWYCgZWQkgu867HUDwtbnw2GZXTBc7Ise
 0DcuwXlPYFvp+4pFol0EsUGiQsQLFQI5X6R9Dby7BIxe5mqEXcxpqiHW3nRA8NXrmzIHx
 NwLBK0ZChdT2YR7rBNyvgvhzylYiw8FThlnRd2hYdrzyvzkNWKue7k0btyx5YwlOtZw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDF124000B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:41:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B30896AE3; Wed, 16 Sep 2026 20:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:39:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96ac57460fedab7fc0ed23355ed3ecaf395423a3
X-Git-Newrev: 6c781be5062dacab1e1e943df9f2887eef351782
X-Patchwork-Hint: ignore
Message-Id: <20260916204031.6B30896AE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump version to
 9.20.29
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c781be5062dacab1e1e943df9f2887eef351782
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

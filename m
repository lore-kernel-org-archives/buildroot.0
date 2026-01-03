Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7628FC6181
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958D580D33;
	Sat,  3 Jan 2026 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mR80AGAyulJe; Sat,  3 Jan 2026 21:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1485580D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767477164;
	bh=maFzgLZdKkS01Ah169SWzdY24udUxLwLyVRACqPoonQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BQWTjQueBic7j46m2dQ29DK+dQk3EGUgV2czp7a+BhNTBElNWMPftSiTODdRWLeox
	 FY9Alh8BbVs4CUdqfT4mf/OQ0+FsIX4HsO9tMhWuf7BMQaKquritZDFFLxbvhE1Ciu
	 LLN7AdXk6MmR3Dk1pAUupApCxBUF1x9tHL4iwBs5CnEavqwYjHIC5Ko39m38fhNsgX
	 ZgfwjkQANWfSxfjsN8jdw7n3ktulpalO5dKTfuzlLxnzPOeSUR1ZBfg8uMf6l0cdHj
	 oo6c1m9azs4bYFsoIdpHt8QfVuYpEwVoykUFh6N/e8sOV5LkdAc54pcYrMFSzO4pGX
	 x2i7rw228JDJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1485580D09;
	Sat,  3 Jan 2026 21:52:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F77249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 21:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6932340070
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 21:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFlEOih6NZ8z for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 21:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21A1A4006D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A1A4006D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21A1A4006D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 21:52:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 13DEBC1C959;
 Sat,  3 Jan 2026 21:52:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD52A6072B;
 Sat,  3 Jan 2026 21:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A899E113B0441; Sat,  3 Jan 2026 22:52:33 +0100 (CET)
Date: Sat, 3 Jan 2026 22:52:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>,
 Adrian Perez de Castro <aperez@igalia.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Message-ID: <20260103225232.69a948a6@windsurf>
In-Reply-To: <20260103154904.1130572-1-bernd@kuhls.net>
References: <20260103154904.1130572-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767477157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=co5chJ96Fe69cAgBtlO6pQ20kKWryH0r/RGXI0L9bkQ=;
 b=j7c15n0JX4yhJcCb7VTBI+Ru8P6KrvyyhXrlDjSH+Slz87JQyTBHOxgxqT5ImCnHzs7dM+
 Qpql+6MYw4Qtx5J5W0DruM7bEv/lx5+agxv3pWDJ71sIyOcR51kVMjrgxzYqjIJ+pIeGnB
 VYjbCvb6QWHl5h6kCLMcB7nZhfYdxjw8LnBJBrtpwZPe6Yb9Ja2lhlFQVJFw5JvvTD6/XE
 8RxW/SGHCrpVVslQykkhiH529gNTH0EQl2Bjj4cAAyfPDT6jT5A5sYAyBFRNxyoFr3Cmq5
 BuzFhRKSsfuwiQmpFSnouu4cM+jhkXmCQnJfOxBDWYx1OIm78LtJDO4k1V1KxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=j7c15n0J
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: needs C++17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat,  3 Jan 2026 16:49:04 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu from
> version 73-2 to 77-1.
> 
> Upstream raised the minimum C++ requirement to C++17 in version 75-1:
> 
> https://github.com/unicode-org/icu/releases/tag/release-75-1
> https://icu.unicode.org/download/75
> "C++ code now requires C++17 [...]"
> 
> This commit switches the minimum gcc version to 7.
> 
> No autobuilder errors were recorded which relate to the gcc version used.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, I did test and indeed the build fails with gcc 6.x, but works
with gcc 7.x, so I've applied, but I had to make quite a few additional
tweaks:

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 3372d86fba..c5f7cf9cd1 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GERBERA
        depends on BR2_USE_MMU # fork()
        depends on BR2_TOOLCHAIN_HAS_ATOMIC
        depends on BR2_TOOLCHAIN_HAS_THREADS
+       depends on BR2_HOST_GCC_AT_LEAST_7 # icu
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
        depends on BR2_INSTALL_LIBSTDCPP
        depends on !BR2_STATIC_LIBS
@@ -28,9 +29,10 @@ config BR2_PACKAGE_GERBERA
 
          https://gerbera.io
 
-comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8"
+comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8, host gcc >= 7"
        depends on BR2_USE_MMU
        depends on BR2_TOOLCHAIN_HAS_ATOMIC
        depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
                !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-               !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+               !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+               !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 542acc4187..f5686085dd 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ICU
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+       depends on BR2_HOST_GCC_AT_LEAST_7 # host-icu
        depends on BR2_TOOLCHAIN_HAS_THREADS
        # icu does some funky things by generating by itself an ELF
        # file, and it cannot easily be changed to generate FLAT
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 0dd1483c57..2c16d819d2 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,10 +10,11 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
        depends on !BR2_BINFMT_FLAT # qt5base-icu
        depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ host gcc >= 7, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 7, threads, wchar, host gcc >= 7"
        depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
        depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
                !BR2_HOST_GCC_AT_LEAST_7 || \
+               !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
                !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,6 +25,7 @@ config BR2_PACKAGE_QT5WEBENGINE
        bool "qt5webengine"
        depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # qt5base-icu
        depends on BR2_HOST_GCC_AT_LEAST_7 # qt5base-icu
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
        depends on BR2_USE_WCHAR # libglib2

Thanks a lot for having looked into this, much appreciated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

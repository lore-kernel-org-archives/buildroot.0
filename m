Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFECC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 06:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D1C80C06;
	Sun,  6 Sep 2026 06:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvoRSyJc0Aiz; Sun,  6 Sep 2026 06:38:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C7A3D80BAE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788676724;
	b=QCQitPh3ZQBR5Ixdkxj9krlS+yQGaBfA77lE6LTJYm4V77cqr3nhULua0amOIcUG7E3B
	 7nJ9L6P0yVcnH7nivHtB2OjVqEcRKFl3E7QtCmXqWHhPbGX9rAtmArVjohmgKb1i7jB4U
	 L3wsEGKrVyI+Pb680/psAaRz1w5/XmmpjHAjJ5+kGhA4OG+PlgscF507+Q16i+p/asQ0P
	 U4GhmtAnkxSVIf0I7OBO/K1nTbIjhYj4ehY3VQZ2a2NB9x+PPCJ5Nbf1KgOIc0eI4osDe
	 Jq8ceAOifweUO2z2bPRMj3EW6fGjZnQXzrsiKocB7ZZjEzZQqNYceeH4dQZ1/rswjQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788676724;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=RRbxuxCEncebVcT3hGA4qLEXdJq27qgsylg56kRIEZU=;
	b=pVtxkPHjhs5kHvGrD34uc3MvozHsuyI4afaYPE4jl76kBmtCfwsO2E8m8KPN2UvvXBIE
	 g8mZFvO9J8QH2brHz+cJNI9KNWQQ9JsuEBaDToN+qrubJFptlPWLZkava72Bw26PiLfdH
	 tmoxarommMWE7IVL3b4A2qXQYzbw2AKA9oPxyxmH7IZMWwofFockhEOAFthgDs7pfVaJj
	 VVrXk0XWw4EbrR2VNQW3gcunMKaSrYlZBSBn1W1b8PbFHz54PyoVaCeOedo++rDr9iMZJ
	 LIw+RsUGXRt9kSgR2y6CH0GBIu69b+AQnTvHrj98qS3cIsX/7JHSbU0heAS2i2P/tbg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788676724;
	bh=RRbxuxCEncebVcT3hGA4qLEXdJq27qgsylg56kRIEZU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AaAKkruD+Ucgy6EA5AZKhQuk7RtL0RXcehwHzC3GK05NdcMzxSGXYhWRExsvPzi/w
	 k0Un+TE2XeQEIivsxib4BQkDpuUMM5lOP85Bm3KbhM7f/xIuOjAg/sqAGvYiOuZJJZ
	 Wjh9x2Uhip02GJUNjBIfLQc8gVtsWilaJytqS0kgDkAvVmxRBEno1VLGC1VZx7mFgd
	 D8+CMIqrMaa/RNbFEvOFOf0bGvaqYRkov4znIyILCW98YThNl3/YoFcVuM2ai8nhhM
	 YhrTY3+3XauKK80uvEeFgaM1S3Nq6bjJNiAke/opW5GjUnaF+C+PobcWZQke+yXNGg
	 JzN58JaR4kSjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A3D80BAE;
	Sun,  6 Sep 2026 06:38:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECA6F72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 06:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE543605D6
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 06:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMvOjBSn1UnS for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 06:38:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3EB6F605D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788676721;
 b=hCCOctHa1dXpacUv4jGEtsJCs+5rwEwyHawDNE9zlu1xN4aySQB9Mc8mzei2yivYsA6x
 eVBib/BE84Muziw+vm8kG/0yEqoWwlr6NTQqsDS93Q1WNdggOjtWC3q3i/4+fKXRY0vNH
 JREUgaXPisn1vmOg1lFTeqaYL5QqsspJTIKW0ROBS0c3zuurxsA88h+Xj7cz66YVROmm/
 ru1BIYARFZUJ5aGLGI8DDv1qaYReFOgX3PbL+wW6GZnRgc2r7LL/kFLyfLcNs9/GrJfXF
 ZE9IdCVDIc7Qk+SJybEaYoZ3dldd4eyGoXlH5S2L6ZlRk1O0QnWZoe0yxuARGWmliQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788676721;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=yd/jgkVLykEVTvXfPqEqXavVLovninLL5Mqlrzxywoc=;
 b=iXzglWe/J32zXAMFMFTeIsgsvTPA7WmTJVIMxqhGIMemArkWnshGKD2+HT6T+P8/jvoB
 US8KsWIGoHz4ZQ91+Xu4MOqwljT9vDxRNb/olQfBTeK6ehwgDXpgYLmHe4Zsl8us80klb
 iw+uBAG+8szcwj61ctbyysBCf5CEgsLs/1bw9W3xJerv6iCOgWAg2BCdh7COFK1ptiIUg
 Cv13s2CrzhlODtq74l+f9sM9EhbffbUVRJmN4pJOijX0jRsNZZeqxFX7cnCToL0iPVrQu
 qXAsl4sjv7dREI8gxS/pc+bsxRwA25uqrJTBhv027G7ntW7BKQ5XZbBbpiGRFl7Rizg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=RSi4mBKF; 
 arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=RSi4mBKF
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EB6F605D5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 06:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788676716; bh=zCXqXedz7zIJKlMI4LcKKtGwssOSfd1VLK4b385WnMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RSi4mBKFAkMbA1ezun0/GNXlKOVChKkoBmaDzjLXXtUVdkbOmiMlmQGENnmU5efOL
 Zw59UaCyVoCIh8M6oaYTR2xQbDvAfiRUx/5vp5SzzXfOAT7FSW+8bTiZGsLaJSTLok
 RdwVXDr21LaQXTQc5eyiUlaXJuTF1X+RRpNnSl0I=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id D9DF4BDE4A43;
 Sun, 06 Sep 2026 08:38:35 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 06:38:35 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.5079.1788156070.3179391.buildroot@buildroot.org>
References: <mailman.5079.1788156070.3179391.buildroot@buildroot.org>
Message-ID: <34552847fb90ca9185ea014f3743a89f@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: Bump to 6.04-pre2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

sorr, forgot to mention that this is a BIOS build.

On 2026-08-30 20:19, Alexander Sverdlin wrote:

<...>

>  ...bios-Fix-alignment-change-with-gcc-5.patch |  82 ---
>  ...Use-the-host-toolchain-for-prepcore.patch} |   8 +-
>  ...-Disable-PIE-to-avoid-FTBFS-on-amd64.patch |  30 -
>  ...nux-Use-the-host-toolchain-to-build.patch} |   0
>  ...-binutils-note-gnu-property-section.patch} |   0
>  ...sk-Force-ld-output-format-to-32-bits.patch |  32 -
>  ...0004-efi-main.c-include-efisetjmp.h.patch} |   0
>  ...tils-Use-the-host-toolchain-to-build.patch |  60 --
>  ...ition-is-now-part-of-the-exports-of-.patch |  37 --
>  ...ump-calls-to-fit-the-new-declaration.patch |  37 --
>  ...per-build-it-with-the-host-toolchain.patch |  32 -
>  ...-try-to-guess-the-sections-alignment.patch | 295 ---------
>  ...10-core-Clean-up-the-i386-bios-build.patch | 622 ------------------
>  ...-sysmacros-h-for-major-minor-makedev.patch |  34 -
>  ...multiple-definition-of-symbol-errors.patch |  25 +-
>  boot/syslinux/syslinux.hash                   |   3 +-
>  boot/syslinux/syslinux.mk                     |   6 +-
>  17 files changed, 12 insertions(+), 1291 deletions(-)
>  delete mode 100644 
> boot/syslinux/0001-bios-Fix-alignment-change-with-gcc-5.patch
>  rename 
> boot/syslinux/{0005-lzo-Use-the-host-toolchain-for-prepcore.patch => 
> 0001-lzo-Use-the-host-toolchain-for-prepcore.patch} (84%)
>  delete mode 100644 
> boot/syslinux/0002-Disable-PIE-to-avoid-FTBFS-on-amd64.patch
>  rename 
> boot/syslinux/{0011-extlinux-Use-the-host-toolchain-to-build.patch => 
> 0002-extlinux-Use-the-host-toolchain-to-build.patch} (100%)
>  rename 
> boot/syslinux/{0014-Fix-build-with-binutils-note-gnu-property-section.patch 
> => 0003-Fix-build-with-binutils-note-gnu-property-section.patch} (100%)
>  delete mode 100644 
> boot/syslinux/0003-memdisk-Force-ld-output-format-to-32-bits.patch
>  rename boot/syslinux/{0015-efi-main.c-include-efisetjmp.h.patch => 
> 0004-efi-main.c-include-efisetjmp.h.patch} (100%)
>  delete mode 100644 
> boot/syslinux/0004-utils-Use-the-host-toolchain-to-build.patch
>  delete mode 100644 
> boot/syslinux/0006-The-VPrint-definition-is-now-part-of-the-exports-of-.patch
>  delete mode 100644 
> boot/syslinux/0007-Update-the-longjump-calls-to-fit-the-new-declaration.patch
>  delete mode 100644 
> boot/syslinux/0008-efi-wrapper-build-it-with-the-host-toolchain.patch
>  delete mode 100644 
> boot/syslinux/0009-bios-Don-t-try-to-guess-the-sections-alignment.patch
>  delete mode 100644 
> boot/syslinux/0010-core-Clean-up-the-i386-bios-build.patch
>  delete mode 100644 
> boot/syslinux/0012-pull-in-sys-sysmacros-h-for-major-minor-makedev.patch

Patch 0013 needs to be adapted to the new directory layout ($(ARCH)):

@@ -203,6 +203,11 @@ CORELIBOBJS = \
  	$(LIBENTRY_OBJS) \
  	$(LIBMODULE_OBJS)

+ifndef EFI_BUILD
+# For EFI, these are part of gnu-efi
+CORELIBOBJS += $(ARCH)/setjmp.o memcpy.o memset.o
+endif
+
  LDFLAGS	= -m elf_$(ARCH) --hash-style=gnu -T 
$(com32)/lib/$(ARCH)/elf.ld

  .SUFFIXES: .c .o .a .so .lo .i .S .s .ls .ss .lss


<...>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

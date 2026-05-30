Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A7DCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C7585302;
	Sat, 30 May 2026 12:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBTpZ5ezPHNu; Sat, 30 May 2026 12:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D485685303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780144874;
	bh=eESZzXoEzrATDs7DXaAeun9+LYXudTmRCvqtm9HQhS4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=m/fNduwX+RACUrkW5doEjLANwKmoG1ZkUi5o1rBZES2pm/Glytc3pJ9ZZMXtZ+1sp
	 Pkd/BwjNFq09mYvQuZjMBRUgKqIFdVrNRFO+xVgon7IpbHcNl32cdsAkfdVH4apSYI
	 4b3QqL18WcwMZL0nt4SESid37fGgpAGM68y3cT7i/EeOfdVCkQ0Rhi8rSfpIiYUohd
	 IoyQR2N5NtnVB8zjm7RO0seI4IV13eTtuVC8a4H8Iu42tfErR1FNAmotQrfzyxCW4k
	 NBr+mmWvLR2YVhwWFDtLJNFNDsdujyLOMVZF1wFRaxGMUt9lfQHNuMQ9P8vzITPO8l
	 HYRgbZfWsgS8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D485685303;
	Sat, 30 May 2026 12:41:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A980D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E470140A21
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZo2vV9zRwPc for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E397140A0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E397140A0A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E397140A0A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7528B97C712; Sat, 30 May 2026 12:33:41 +0200 (CEST)
Message-ID: <97fa3c15-415d-4bb4-b5dc-71fbc638ffe2@rnout.be>
Date: Sat, 30 May 2026 12:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260503144908.2807535-1-bernd@kuhls.net>
 <20260503144908.2807535-2-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260503144908.2807535-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780137221; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=kBa2FAh0hmyg46ZV9kzFqNXPdxJ2/ENLGuTyARrr9zE=;
 b=e0i7ia/z+lXhPX5mkdoKDF2zzu8kuOfTVjjPc61nq8GNGWHQvA90wYGVR8VPZAgkLHc0AM
 Er7B4IihhmOeIYEtF0NIlWpAU94zIyOXTuc0Y2YDIouAfJTDaHe9MaWwAA336JRVGogHac
 jo8uqCMC2aTr9GGCTAYLi/3N7pyusxdvk0FeEszWfGVnbuXY0C+DnTufv9JJVlpPFyqya5
 EZGhLJqmcKryC3OlNj9wZbSziLGxoZB7+9jFb+iTMgFU0ZOmTMWyZnXZuHjXjZzj8SJOhs
 kaDxS7hwrgTKX7vaqKme8L1hRPfGWa+MrlB2v+8axDAHZhQbwXY9ffklLEQeVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=e0i7ia/z
Subject: Re: [Buildroot] [PATCH 2/4] package/gdb: add support for GDB 17.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2026 16:49, Bernd Kuhls wrote:
> All patches that were applicable to GDB 16.1 are also applicable to
> GDB 17.1. Rebased patch 0005. Added upstream patch 0010 to fix build
> error with musl and upstream patch 0011 to fix build error on sparc.
> 
> Details about the 17.1 release:
> 
>    https://sourceware.org/gdb/download/ANNOUNCEMENT
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

> ---
>   .checkpackageignore                           |   9 ++
>   ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 +++++++++
>   ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 ++++++++
>   package/gdb/17.1/0003-use-asm-sgidefs.h.patch |  40 +++++++
>   .../0004-gdbserver-fix-build-for-m68k.patch   |  64 +++++++++++
>   ...fork-inferior-include-linux-ptrace.h.patch |  55 +++++++++
>   ...getrandom-compile-for-uclibc-v1.0.35.patch |  39 +++++++
>   .../17.1/0007-fix-musl-build-on-riscv.patch   |  60 ++++++++++
>   ...-gdbserver-Makefile.in-fix-NLS-build.patch |  38 +++++++
>   .../0009-gdb-Fix-native-build-on-xtensa.patch |  57 ++++++++++
>   ...-musl-build-failure-when-setting-cus.patch | 104 ++++++++++++++++++
>   ...k-around-conflicting-types-for-tcfla.patch |  77 +++++++++++++
>   package/gdb/Config.in.host                    |   7 +-
>   package/gdb/gdb.hash                          |   1 +
>   14 files changed, 648 insertions(+), 1 deletion(-)
>   create mode 100644 package/gdb/17.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>   create mode 100644 package/gdb/17.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
>   create mode 100644 package/gdb/17.1/0003-use-asm-sgidefs.h.patch
>   create mode 100644 package/gdb/17.1/0004-gdbserver-fix-build-for-m68k.patch
>   create mode 100644 package/gdb/17.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
>   create mode 100644 package/gdb/17.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
>   create mode 100644 package/gdb/17.1/0007-fix-musl-build-on-riscv.patch
>   create mode 100644 package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
>   create mode 100644 package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch
>   create mode 100644 package/gdb/17.1/0010-gdb-ser-unix-fix-musl-build-failure-when-setting-cus.patch
>   create mode 100644 package/gdb/17.1/0011-gdb-ser-unix-work-around-conflicting-types-for-tcfla.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index b2d5320045..0799b0ad7a 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -390,6 +390,15 @@ package/gdb/16.3/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
>   package/gdb/16.3/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
>   package/gdb/16.3/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
>   package/gdb/16.3/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
> +package/gdb/17.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
> +package/gdb/17.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
> +package/gdb/17.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
> +package/gdb/17.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
> +package/gdb/17.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
> +package/gdb/17.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
> +package/gdb/17.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
> +package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
> +package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream

  Any chance of trying to get (some of) these patches upstream?

  Regards,
  Arnout

>   package/genpart/0001-fix-return-code.patch lib_patch.Upstream
>   package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
>   package/gerbera/S99gerbera lib_sysv.Indent
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

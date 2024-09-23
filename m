Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241B0CF9C71
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 18:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C7A240C4B;
	Mon, 23 Sep 2024 18:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEUT-zYC_v07; Mon, 23 Sep 2024 18:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAFC140C4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFC140C4F;
	Mon, 23 Sep 2024 18:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA7881BF41A
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 18:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9AD181083
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 18:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j90IVyZekp06 for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 18:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CF958102F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF958102F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CF958102F
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 18:47:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so39795305e9.3
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 11:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727117226; x=1727722026;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8cM0bDYK94pCEI3XNOSAhDW0eERx6CRc5jyTi5Qn5yM=;
 b=rqNLDtYRWo50t5DBOcuHO7LvglqzSZmMutVaTwg1+A5SFesPeaqo1sBArh+ny/G+MB
 jg8b7mYMa+z3exPQkH0j+tubMUJlc5uSf/pH5oeAa+09Y2OdYOtQly1qG+XwqyEUoh9S
 4TxiYa6KD/0KF4rFSLOnFX2AOzQhftHPnpKqvxF+Tu3k5BbgrvitKoMBWDupnVLxIIgP
 tMzCvW9g+sD15r0cQJfl4cb4apxXIQeYGwpzCxeoURvPXnGU7VdwUXcON0QE+6PwCN6y
 F6l4ugtYUjxRwQToFPuLyAKlLDLKVQvMXc43qoE0QojFbUxFP9/mW49N/hprSSUI9Rxn
 9INg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtNeFsWqVfZGE9fUVF99LWAVBIPCKyn4mCbdixM9/B4EPPhRPtvzQ380C74eNBUqsRpPdLGLBr5Qo=@buildroot.org
X-Gm-Message-State: AOJu0YwTHrFTF42YqCbpC4UnfDvVADeX8/8fdr/Zzp3zn5IL6C6LdTkQ
 SN/OT/C+iuRe5XqcIgnYZcRyOUtLjKTZa1P+Id9n7vlSCzzGpWVMbzx9yWZkh3I=
X-Google-Smtp-Source: AGHT+IG6QoEAQm1us0g56vtfzUJxR1/r2ELAVozQzsd2JF+EWhkdzNBJiT9rz653hKtBLCDKf3Htcg==
X-Received: by 2002:a5d:650e:0:b0:374:b9ca:aeb2 with SMTP id
 ffacd0b85a97d-37a424c98c2mr5934803f8f.58.1727117225522; 
 Mon, 23 Sep 2024 11:47:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73f9999sm24921301f8f.58.2024.09.23.11.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 11:47:04 -0700 (PDT)
Message-ID: <7728aa00-20d0-4dd8-8db7-4b6c75265082@mind.be>
Date: Mon, 23 Sep 2024 20:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Yan <andyshrk@163.com>, buildroot@buildroot.org
References: <20240922090713.20744-1-andyshrk@163.com>
Content-Language: en-GB
In-Reply-To: <20240922090713.20744-1-andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727117226; x=1727722026; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8cM0bDYK94pCEI3XNOSAhDW0eERx6CRc5jyTi5Qn5yM=;
 b=epMkQ9qvvY8foRng7ZdfU6WK2zn1MK8PDiNt1J7B5X2Aap5BtCdpwQxQyDdEkMlidJ
 UBsMd1hn97N5ckbCmQLFoChQJ2ydQcdkKzoqH34zxLAwboC1WUAUHuTcDGdcMdSXnDe/
 W0HMWjHJ5nvT7VSImykppQXmjFQYp3m81r6Om4xw5NNtAL6Ib/KiEH206d3+B/Q+hpAx
 BXOaEwkl6IsVwvam1pj+Odfv/biMD1q9yA+lXNjGl2q5kbLsULMuv9m2tysBSHD7ODt6
 EdSPT1SkhO0Tk2R3EQuo8sgvzPgMD6RPdZNPyxkwoHgqZSu5C2suaztBXs3/Rv40wjGd
 dKmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=epMkQ9qv
Subject: Re: [Buildroot] [PATCH] package/io: New package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Andy,

On 22/09/2024 11:07, Andy Yan wrote:
> A utility to access memory/register via physicas address:
> 
> Raw memory i/o utility

  So this is basically busybox's devmem, right?


> io -v -1|2|4 -r|w [-l <len>] [-f <file>] <addr> [<value>]
> 
>      -v         Verbose, asks for confirmation
>      -1|2|4     Sets memory access size in bytes (default byte)
>      -l <len>   Length in bytes of area to access (defaults to
>                 one access, or whole file length)
>      -r|w       Read from or Write to memory (default read)
>      -f <file>  File to write on memory read, or
>                 to read on memory write
>      <addr>     The memory address to access
>      <val>      The value to write (implies -w)

  ... but with additional features.

> 
> Examples:
>      io 0x1000                  Reads one byte from 0x1000
>      io 0x1000 0x12             Writes 0x12 to location 0x1000
>      io -2 -l 8 0x1000          Reads 8 words from 0x1000
>      io -r -f dmp -l 100 200    Reads 100 bytes from addr 200 to file
>      io -w -f img 0x10000       Writes the whole of file to memory
> 
> Note access size (-1|2|4) does not apply to file based accesses.
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---
>   package/Config.in    |  1 +
>   package/io/Config.in |  6 ++++++
>   package/io/io.mk     | 20 ++++++++++++++++++++


  Please add yourself to the DEVELOPERS file [1] for this package. This way, 
you'll get an e-mail if the package fails in the autobuilders, or when a new 
version is released if the package is registered on release-monitoring.org.

  You are also missing a hash file with the hash of the downloaded tarball and 
of the license file.

>   3 files changed, 27 insertions(+)
>   create mode 100644 package/io/Config.in
>   create mode 100644 package/io/io.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 4eccf77dd3..99856ff23b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2361,6 +2361,7 @@ menu "Miscellaneous"
>   	source "package/gr-osmosdr/Config.in"
>   	source "package/gsettings-desktop-schemas/Config.in"
>   	source "package/haveged/Config.in"
> +	source "package/io/Config.in"
>   	source "package/linux-syscall-support/Config.in"
>   	source "package/mobile-broadband-provider-info/Config.in"
>   	source "package/netdata/Config.in"
> diff --git a/package/io/Config.in b/package/io/Config.in
> new file mode 100644
> index 0000000000..ba2cc2fc4f
> --- /dev/null
> +++ b/package/io/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_IO
> +	bool "Raw memory i/o utility"
> +	help
> +	  A utility for read/write memory/register
> +
> +	  https://github.com/andyshrk/io.git
> diff --git a/package/io/io.mk b/package/io/io.mk
> new file mode 100644
> index 0000000000..7454f25b22
> --- /dev/null
> +++ b/package/io/io.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# io
> +#
> +################################################################################
> +
> +IO_VERSION = master

  We don't want a branch, we only want a tag or commit hash.

> +IO_SITE = $(call github,andyshrk,io,$(IO_VERSION))

  You couldn't know of course, but we're moving away from using the tarballs for 
github downloads, and instead prefer the git download method. So could you 
change this to something like:

IO_SITE = https://github.com/andyshrk/io.git
IO_SITE_METHOD = git


> +IO_LICENSE = GPL-2.0+
> +IO_LICENSE_FILES = COPYING.GPL
> +

  I guess this relies on CONFIG_DEVMEM to be set in the kernel. This should be 
mentioned in the Config.in help text, and ideally something like this:

define IO_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVMEM)
endef

> +define IO_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/io.c -o $(@D)/io
> +endef
> +
> +define IO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/io $(TARGET_DIR)/usr/bin/io
> +endef
> +
> +$(eval $(generic-package))


  Regards,
  Arnout

[1] https://nightly.buildroot.org/#DEVELOPERS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

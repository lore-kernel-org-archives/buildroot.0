Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F2CCF9EC
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 19:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 758C06116E;
	Wed, 25 Sep 2024 19:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vHO7zaoVfCm; Wed, 25 Sep 2024 19:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC0E61176
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC0E61176;
	Wed, 25 Sep 2024 19:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC061BF35A
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 19:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 194EE426DF
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 19:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1r7ga8W_zLp for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 19:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE138426DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE138426DC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE138426DC
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 19:25:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cc8782869so1290185e9.2
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 12:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727292325; x=1727897125;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAmo9MzClqoqs/Np3phTReTQF3ozTAXutMuU4kP+O2g=;
 b=pDYxatgv04j6pNPLu/CJxLO6/lkEwifvVNVbuCMbt+yKmgTnQnOY6FCq/XXPSzINEX
 w/t25q39kYe+UYKrHTXN5wgOQXdLx8th7Q6xQ1IaywNAEiFK+uj1bos00LO91EzAlCsq
 pzTHBg4BPtco8M5zS/5MuHYnYWj68dB7yoKe84/woNOI0CHyo++vrb6GhWK1GXcHM99n
 dNxk9ZJGgG2irCpgv0OrGWCi8dm2YJJsTuKpWS2/99tW5FCoj54nFpG2UDFfSTz7CQnk
 X0IVHy+hqb+105px/XNZZsLnSRRFHh9SuOghTv7IsoD3+gHwGC8G874j6BCrG4vYT4WF
 XKCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGl2aUrdV1MRrhZ3vMIkSzCTGoZTC1XwXmKR0zmPHLP8EzrEjB3N5zO3oToO43Aycc22pqga3pBFU=@buildroot.org
X-Gm-Message-State: AOJu0Yx6jsdG8FrdIfXRTepcQ2o9f4HnRbA1nxv7UgD+hynM4RblTZXT
 1XDm1DTvkrwuEB36jDDGHFS3ohsuPSb+VMTGpYGUSrryEpunEFUSBaaVoZEJWHIe/fqMRpdIZ6w
 u
X-Google-Smtp-Source: AGHT+IHisIHwK0HBsbxu+cNxdvWZtEwRXxxsBYQUbyDWfBM/bzgMjLEtlnyz0G5s/nw38Fv/oTf5+A==
X-Received: by 2002:adf:e291:0:b0:374:af6e:b4d3 with SMTP id
 ffacd0b85a97d-37cc249e2ffmr2667053f8f.35.1727292324809; 
 Wed, 25 Sep 2024 12:25:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2f976esm4686485f8f.69.2024.09.25.12.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 12:25:24 -0700 (PDT)
Message-ID: <eb6f0fa6-beab-4124-9b6e-7f7caa994839@mind.be>
Date: Wed, 25 Sep 2024 21:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Yan <andyshrk@163.com>, buildroot@buildroot.org
References: <20240924110345.34659-1-andyshrk@163.com>
Content-Language: en-GB
In-Reply-To: <20240924110345.34659-1-andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727292325; x=1727897125; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAmo9MzClqoqs/Np3phTReTQF3ozTAXutMuU4kP+O2g=;
 b=dg9spN5Oj0gEcB7BlKBxj4D/8yXeERAXc3HN+I7yxZV63+IOQ47MKZpmqtm7J8qrXJ
 6Izrpgiocg4n1+cst1uxuPRWwchhzHNNxnsX89N8FXbNt1+luAKxbtmZBBPVo9Bt7MpS
 BRypo/9nfL3+mWqlkMlWY5fwhQ8ppOyy0mnG5xo6YczfnBwWWuQ0CBHsBc9fMCU9bWCJ
 tZyC79EBll8zuBn34jadSO3KRQ0StP53aC/D2CHv7iG0Obsk3+HGFsm3SBcHlGjUx9Og
 h8mGiwihMowQjiOdAT0RU2EyZ1kT1S5Z/dXpxBVPbxzA3Pfl6zRLCntL8DYTeEBTGn1e
 MoCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dg9spN5O
Subject: Re: [Buildroot] [PATCH V2] package/io: New package
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
Cc: Andy Yan <andyshrk@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Andy,

  I was about to apply this, but there's a problem with the license.

  In your repository, it's declared as GPL-3.0 (at least, there's a GPL license 
file). However, this code was originally written by Richard Hirst. I've searched 
the web and I couldn't find any place where that person declared a license. 
Without license, the code is in fact closed source...

  The package also exists in OpenWrt as a source copy. OpenWrt itself is GPL-2.0 
(only, so you can't relicense to GPL-3.0). But they're not very conscientious 
with licenses, so I wouldn't trust that.

  So, unless you have some source that indicates that this code can indeed be 
distributed under the GPL, I'm afraid we can't accept it...


  Also, I notice that there are some other versions of this code with additional 
features, e.g. 64-bit access.

https://gist.github.com/teknoraver/36ca82aef012c03a2bca


  I'm still commenting below, in case the license issue gets resolved.

On 24/09/2024 13:03, Andy Yan wrote:
> From: Andy Yan <andyshrk@gmail.com>
> 
> A utility to access memory/register via physicas address:

  physical

> 
> Raw memory i/o utility
> 
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
> 
  You should put

---

here (three dashes on a separate line), to make sure that the text below doesn't 
get included in the final commit message.

> Series-version: 2
> Series-changes: 2
> - Add myself to the DEVELOPERS file
> - use git download method
> - add hash file
> ---
>   DEVELOPERS           |  3 +++
>   package/Config.in    |  1 +
>   package/io/Config.in |  7 +++++++
>   package/io/io.hash   |  2 ++
>   package/io/io.mk     | 21 +++++++++++++++++++++
>   5 files changed, 34 insertions(+)
>   create mode 100644 package/io/Config.in
>   create mode 100644 package/io/io.hash
>   create mode 100644 package/io/io.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b0efabfd5d..d9b73811b6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -240,6 +240,9 @@ F:	package/sysdig/
>   N:	Andy Shevchenko <andy.shevchenko@gmail.com>
>   F:	package/fb-test-app/
>   
> +N:	Andy Yan <andyshrk@163.com>
> +F:	package/io/
> +
>   N:	Anisse Astier <anisse@astier.eu>
>   F:	package/go/
>   F:	package/nghttp2/
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
> index 0000000000..acf32947cc
> --- /dev/null
> +++ b/package/io/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_IO
> +	bool "Raw memory i/o utility"
> +	help
> +	  A utility for read/write memory/register,
> +	  you shoud make sure CONFIG_DEVMEM is enable in your linux kernel.

  This line is too long. Please use utils/check-package to verify your changes.

  I had also rewritten the text as follows:

           A utility for reading/writing memory/registers.

           Make sure CONFIG_DEVMEM is enable in your linux kernel.

           https://github.com/andyshrk/io

> +
> +	  https://github.com/andyshrk/io.git
> diff --git a/package/io/io.hash b/package/io/io.hash
> new file mode 100644
> index 0000000000..7d45324196
> --- /dev/null
> +++ b/package/io/io.hash
> @@ -0,0 +1,2 @@
> +sha256 d3b4d93988adddbc98af8d7014a045dca5b25aaa7cdbc08c29aa70ebdc86e21c  io-a2600e94aec6503fd0f0109ca26a703c4e7e166e-git4.tar.gz

  Should be two spaces after sha256, as reported by check-package.

> +sha256 5352e426b563eda9252d76be92337b49f7b5cfdd1302a1e8d99389840c0e46be  LICENSE
> diff --git a/package/io/io.mk b/package/io/io.mk
> new file mode 100644
> index 0000000000..7abc6773c0
> --- /dev/null
> +++ b/package/io/io.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# io
> +#
> +################################################################################
> +
> +IO_VERSION = a2600e94aec6503fd0f0109ca26a703c4e7e166e
> +IO_SITE = https://github.com/andyshrk/io.git
> +IO_SITE_METHOD = git
> +IO_LICENSE = GPL-2.0+
> +IO_LICENSE_FILES = COPYING.GPL

  The file is called LICENSE.


  Regards,
  Arnout

> +
> +define IO_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/io.c -o $(@D)/io
> +endef
> +
> +define IO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/io $(TARGET_DIR)/usr/bin/io
> +endef
> +
> +$(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

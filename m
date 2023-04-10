Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFB6C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 13:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD3F4157A;
	Mon, 10 Apr 2023 13:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD3F4157A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYBXmbNLlozD; Mon, 10 Apr 2023 13:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6012E4155B;
	Mon, 10 Apr 2023 13:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6012E4155B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B147C1C3B18
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A5DC40B82
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A5DC40B82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zWXM8OYjcOc for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 13:48:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60A33400D8
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60A33400D8
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:48:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94a34e3526fso124269066b.3
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 06:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681134517;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m599r8SRXAcDMEx2K03Sk5kT6yOdCBJG52hpqG1/GO8=;
 b=5d3+5A8f85BJZDAPuSfvtKhomOv8XFQRAK0KaxYuNU8XsW+ZhtiVjrkCwt1I23tpc3
 0wv/jdKt4Jn6obbi/z9/gpftUibnF30CmlEWBL3qkMJcgB+VRrMJFTlABz7EDBPpZR8o
 uodBhqCkdvzEQ/zoyscN/7etLtmz7qNNGL3X9svpeKQOQ8VZoAYrGtIlzqeSESd40BE4
 0Fley+xDb0bpdhdWOsrN0793oAJ2YjMjo0srKCEgOxPIM0QL9MjbGiybyw5URc9vFEC7
 1Es893EloB+9WaX/HxYJaWxTffe/eBZx3U++HoJMU7l93UobXCUO3xNgdRcZvScrE6i7
 pYIQ==
X-Gm-Message-State: AAQBX9esTlzE3/She81svZI6T06sjQ4iqidNbGin9s8wLrGeSpvmggJV
 /Cj0SeGuWj43iM6n52216Y7cujxbZ3OuRJ0b3zY=
X-Google-Smtp-Source: AKy350YpWfo7Gd21yyHDqCFesDH5ddoJVFyWP7/P3ljVaNVTKKcuUijLK2MaL9PEMJKBFmyWX1proQ==
X-Received: by 2002:a05:6402:6d8:b0:504:943e:14b2 with SMTP id
 n24-20020a05640206d800b00504943e14b2mr3806768edy.28.1681134517496; 
 Mon, 10 Apr 2023 06:48:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ec20-20020a0564020d5400b00504a1313bafsm1277275edb.95.2023.04.10.06.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 06:48:35 -0700 (PDT)
Message-ID: <e540fa3d-2a2f-709d-f4f4-990bdcb9d690@mind.be>
Date: Mon, 10 Apr 2023 15:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20230410090027.1926404-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410090027.1926404-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681134517;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m599r8SRXAcDMEx2K03Sk5kT6yOdCBJG52hpqG1/GO8=;
 b=Byv6zb4n48NgtnWqszgf5kAApawuXcX88fkrx0RN8m+nmjJmmmUd0Z4mC2rPMkPQBC
 0rfoQmnZMH8/DvujfFYgQLubcSCWw9mcq5eV9evGE3B+A7etmbrDFTHMoxxi69zc1ZGm
 8BdY29YyBpKFX0tFmXlUDikK2nBCEw4hu1x8zGRCafZ+vPHBXcJZUIk46PtSyvkDbPf2
 FMtNwEYET2oUtZ9qaUYQ18tE77UsJj3B8SQfr8WpN1wpdEiuZ/TOa5BomhOEodS2taIZ
 t1LdyZcU2vHi/T1he0tX3LWzSABJDAhIEdhw/i6MHVwfPk9W8Jl/Z9OO7dJUDjJ08tq8
 48bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Byv6zb4n
Subject: Re: [Buildroot] [PATCH 1/1] package/mg: bump to v3.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2023 11:00, Joachim Wiberg wrote:
> Excerpt of https://github.com/troglobit/mg/releases/tag/v3.6:
> 
>   - Sync with mg upstream, OpenBSD 7.2, as of April 10 2023
>     - Drop trailing whitespace on RET (c-mode)
>     - Add zap-to-char and zap-up-to-char, binding the former to M-z
>     - Fix dobeep_msgs() usage, does not support format strings, this may
>       have caused unexpected crashes for some operations, e.g. goto line
>       that does not exist
>     - Fix memleaks and possible crashes in ctags support
>     - Fall back to /bin/sh if $SHELL is undefined
>   - Fix typos and duplicate undo in *quick* help buffer
>   - Add support for exuberant/universal Ctags tags file format
>   - Add support for M-, to pop-tag-mark, like GNU Emacs
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mg/mg.hash | 4 ++--
>   package/mg/mg.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mg/mg.hash b/package/mg/mg.hash
> index 19cf1e29d5..e8eedb8921 100644
> --- a/package/mg/mg.hash
> +++ b/package/mg/mg.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/troglobit/mg/releases/tag/v3.5
> -sha256  a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
> +# From https://github.com/troglobit/mg/releases/tag/v3.6
> +sha256  0e30f99b7606ddd92535aec0ba0118557afa4adca0961267314a4bf7791865fb  mg-3.6.tar.gz
>   # Locally computed:
>   sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
> diff --git a/package/mg/mg.mk b/package/mg/mg.mk
> index bb3f59a14d..88f8f60257 100644
> --- a/package/mg/mg.mk
> +++ b/package/mg/mg.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MG_VERSION = 3.5
> +MG_VERSION = 3.6
>   MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
>   MG_LICENSE = Public Domain
>   MG_LICENSE_FILES = UNLICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

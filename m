Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE05C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:27:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B977E610A1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B977E610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88F7D60F08;
	Wed,  6 Oct 2021 19:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54QDQkNJYSEU; Wed,  6 Oct 2021 19:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D029F60F25;
	Wed,  6 Oct 2021 19:27:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF1BE1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F046840FD
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGMfgUr659gJ for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2971A840FA
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:27:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p13so14321758edw.0
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jQWLMjOkdU5hGndN0PkrvmDO1xW1JX8yay3K0adRGm8=;
 b=AB/KXk4+vJ23WXYnjjqAwDhvyqGB9UltfbwuvIi6pifTw52gxTDvKQYNUuCVUWrXFp
 5MZZMpBaDaDE9J+7KawjBRwCaI82YylfdKn/0hx/2WNIvXYY0e44FSKfD7ew9GJ6Vnbg
 RXjEg4pylGQveb3sSgBNllh2nSlRPV72YpD1VT+gt6C7fmYbK79Jyrgi9Imrrv2jeR41
 OaGygzm83Gb9Y4JZ39bvlqhGtwzD/v//9ODSPS8rG+1d3BlZSCad38JhGimOKO0lEbPr
 AMBTHf+YZBk0gqRjxoFdvtZos7luezRXKPtvDPj5Lppbg3p4ldsHh7SB7mlpd2jsgPt0
 pgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jQWLMjOkdU5hGndN0PkrvmDO1xW1JX8yay3K0adRGm8=;
 b=njdjrHMWo65PMuAvlGCJcVSkZO7IafcNSYFvG1VJhzAqqu+82R+PT6x0ByiKesF7AA
 QHZAMMmBTjlf9Xdrj6oHnYcy5F4ONhBboSw9XEogkTCbUsEcoSIfYbTrKop8eYGb7+nC
 7QNheJj1VZ1VwGRSDjKvdTP7ZfQKs4mwWw9ulJG2kOCQOVllhj2euUy7QZTTpaQ8/vC0
 2+z5Lz4fk2Df3evfbcPbo5D33uPRkhZYn+8t4ie0tu7L3W95xXj9798hCpbcj8qz5gdT
 xQaSZ/nssnJPAfl2pO6BJ0oK3QQGqZW3SJ6uTWhRdQ2KWtC/xqwZrpjt3yi89R3Klp9A
 Yi0w==
X-Gm-Message-State: AOAM532AJANIuOz4lxfmijt7uIL1w+LJos9k6Q9VWMOuN8i+LevP01wA
 Hp0yZSbz57BxJrxu9618WwqMqw==
X-Google-Smtp-Source: ABdhPJxfNyxwoS+m4/29+kG6x+xuW8VBDdimdPpdJe3Kn0Bh/pBxOQ2vVwb1opLt8Ff4LZfsHBYiYg==
X-Received: by 2002:a50:cf41:: with SMTP id d1mr25644edk.219.1633548470261;
 Wed, 06 Oct 2021 12:27:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g8sm2230646edb.60.2021.10.06.12.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:27:49 -0700 (PDT)
Message-ID: <1a77563c-21dc-8fe7-9b86-7c66cdb0f25e@mind.be>
Date: Wed, 6 Oct 2021 21:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210924153606.1800512-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210924153606.1800512-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: fix build without
 stack-protector
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2021 17:36, Fabrice Fontaine wrote:
> Fix the following build failure without stack-protector raised since
> bump to version 0.11.0 in commit
> c3a907a770b88529ea5a93c77cf001096799c556:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
> usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...002-meson-add-stack_protector-option.patch | 60 +++++++++++++++++++
>   package/usbredir/usbredir.mk                  |  1 +
>   2 files changed, 61 insertions(+)
>   create mode 100644 package/usbredir/0002-meson-add-stack_protector-option.patch
> 
> diff --git a/package/usbredir/0002-meson-add-stack_protector-option.patch b/package/usbredir/0002-meson-add-stack_protector-option.patch
> new file mode 100644
> index 0000000000..613e2714e3
> --- /dev/null
> +++ b/package/usbredir/0002-meson-add-stack_protector-option.patch
> @@ -0,0 +1,60 @@
> +From 54cf1897ef3aa4d0a35b5f4eb1f5c6928b033af5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 24 Sep 2021 17:24:43 +0200
> +Subject: [PATCH] meson: add stack_protector option
> +
> +Add stack_protector option to allow the user to disable it as some
> +embedded toolchains don't support it which will result in the following
> +build failure:
> +
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
> +usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/53]
> +---
> + meson.build       | 6 +++++-
> + meson_options.txt | 5 +++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index a6d21b8..4350f53 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -17,8 +17,12 @@ cc_flags = [
> + if host_machine.system() != 'windows'
> +     cc_flags += [
> + 	'-Wp,-D_FORTIFY_SOURCE=2',
> +-	'-fstack-protector',
> +     ]
> ++    if get_option('stack_protector').enabled()
> ++        cc_flags += [
> ++	    '-fstack-protector',
> ++        ]
> ++    endif
> + endif
> +
> + # Check if we are building from .git
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 63e8c85..34dd392 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -17,6 +17,11 @@ option('fuzzing-install-dir',
> +     type : 'string',
> +     description : 'Installation directory for fuzzing binaries')
> +
> ++option('stack_protector',
> ++    type : 'feature',
> ++    value : 'enabled',
> ++    description : 'Build usbredir\'s with stack-protector')
> ++
> + option('tools',
> +     type : 'feature',
> +     value : 'enabled',
> +--
> +2.33.0
> +
> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> index 25c4bb382e..0a8dbf012d 100644
> --- a/package/usbredir/usbredir.mk
> +++ b/package/usbredir/usbredir.mk
> @@ -13,6 +13,7 @@ USBREDIR_INSTALL_STAGING = YES
>   USBREDIR_DEPENDENCIES = host-pkgconf libusb
>   USBREDIR_CONF_OPTS = \
>   	-Dgit_werror=disabled \
> +	-Dstack_protector=disabled \
>   	-Dtests=disabled \
>   	-Dtools=disabled
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

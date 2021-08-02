Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55234C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2EE061029
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2EE061029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF5860838;
	Mon,  2 Aug 2021 16:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uBdZX9GI7dR; Mon,  2 Aug 2021 16:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389956082E;
	Mon,  2 Aug 2021 16:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45D1F1BF34B
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42704404F7
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdXuoL0NY9wH for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 16:33:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AAFB403F0
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 16:33:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f13so25237330edq.13
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9wgjasmNx9JV5zgkvWprW9yJO/ZDwN4g2AB/cNaY3CQ=;
 b=cbUjm4Fdx0zq+acP0bYnkYDbqT8K9Pm1Y6HGXHszgM5/mO/BwxwZBISrJO8ZqMisoF
 6TKp2xmDxH77GfBFV6+5IQDlQ0Jl8f8Ryaf3d9qs/6vU/TPVgNu95gITD1U8ulP7TzAS
 87Gfhh1ByJaqVdOyo6Mq3uOqXz9HHumCiOxinc7shF1eSPH6UIv/QAW4LvZpHjBa1eF4
 b34/Yp1EEbTc7n9k+KZdHefg8Fdj4Yv2XnYRS5GeY1ZMDDINBDKyKzRq0tNIDwAS3RBr
 mn9bOc+HhwudtBzHZHs27YYrS0Y6VjQvLy3YVtllWLThR+Tf1vzj2Trb7a3ehurQCXEx
 enNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9wgjasmNx9JV5zgkvWprW9yJO/ZDwN4g2AB/cNaY3CQ=;
 b=GsD3AiIZfup+07Cu+gDfarQYQC057Rp7l9DvCAEtiZvq1bUN5stRr8CpQ0zb1pbE9X
 3Q2AoYI6Kt9B/Ur1Drqal9sxgHd6zqcDk3dtQw2QNvnnCdKh1ozjF49w5+w78BUL9IKh
 IlgDdi8pLVtRm97ZKj0GE3/trG3aYaqv4ssL/g9WGkAgMIDEuOh0I7CeKT9guNiZxTas
 wyJXl3UZvojgxhsRbLnR3J7e2qdzA0HiycYet6BfEJTZCCfu5wdalvYyqY4PLTHD5YE6
 y+hPWBaJKzs1wi8bwHUVP28F13F0w/rOqvuTCpFs0TPJ5qcW28WXlWgwNuIt9/+kw2ib
 XTdA==
X-Gm-Message-State: AOAM532xgeGb39EPFdJNv1liDrYMu2EFEjso4nNs2DnMVMBa6ZbUpjdl
 4NLync34Tthi/fHzVe0QP7mzuUxUG9wuP6oHz7M=
X-Google-Smtp-Source: ABdhPJxUQQa2DimsFeoLG50RR0+PYefPAaXdhZlzrGE8W6pEMzUyzaAKuxVkcNEdfY/LXx1FW2iE5w==
X-Received: by 2002:aa7:c489:: with SMTP id m9mr20455247edq.256.1627922037290; 
 Mon, 02 Aug 2021 09:33:57 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id ec38sm6477930edb.40.2021.08.02.09.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 09:33:56 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801214601.566970-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <efce328e-7010-dda0-2b78-76ec04c00c67@mind.be>
Date: Mon, 2 Aug 2021 18:33:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801214601.566970-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/2] package/irqbalance: use pkg-config to
 find numa
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Karoly Kasza <kaszak@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 01/08/2021 23:46, Fabrice Fontaine wrote:
> Use pkg-config to find numa to avoid the following build failure when
> checking for numa_available:
> 
> configure:9667: checking for numa_available in -lnuma
> configure:9692: /tmp/instance-7/output-1/host/bin/microblazeel-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lnuma   >&5
> /tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
> (.text+0x2a80): undefined reference to `__atomic_fetch_and_1'
> /tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v2':
> (.text+0x2ddc): undefined reference to `__atomic_fetch_and_1'
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/577a63432fba2f9ae1ed2c6c2a77c5ce54ac5521
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied to master, thanks.

 I've applied as-is even though what got merged upstream is actually a bit
different. The fallback mechanism is however harmless for us, and it's easier
for me this way :-)

 Regards,
 Arnout

> ---
>  ...igure.ac-use-pkg-config-to-find-numa.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
> 
> diff --git a/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch b/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
> new file mode 100644
> index 0000000000..751367ccfb
> --- /dev/null
> +++ b/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
> @@ -0,0 +1,38 @@
> +From 274cb8ea470a10ce46b783e77784b0eb08cf20d8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 1 Aug 2021 23:26:01 +0200
> +Subject: [PATCH] configure.ac: use pkg-config to find numa
> +
> +Use pkg-config to find numa and fallback to current mechanism.
> +Thanks to pkg-config, numa dependencies such as -latomic will be
> +retrieved.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/Irqbalance/irqbalance/pull/188]
> +---
> + configure.ac | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c45b9ce..50c62ba 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -23,7 +23,14 @@ AC_CHECK_HEADERS([numa.h])
> + 
> + AC_CHECK_FUNCS(getopt_long)
> + 
> +-AC_CHECK_LIB(numa, numa_available)
> ++PKG_CHECK_MODULES([NUMA], [numa], [has_numa=yes], [AC_CHECK_LIB(numa, numa_available)])
> ++AS_IF([test "x$has_numa" = "xyes"], [
> ++  AC_SUBST([NUMA_CFLAGS])
> ++  AC_SUBST([NUMA_LIBS])
> ++  LIBS="$LIBS $NUMA_LIBS"
> ++  AC_SUBST([LIBS])
> ++])
> ++
> + AC_CHECK_LIB(m, floor)
> + 
> + PKG_CHECK_MODULES([GLIB2], [glib-2.0], [], [AC_MSG_ERROR([glib-2.0 is required])])
> +-- 
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

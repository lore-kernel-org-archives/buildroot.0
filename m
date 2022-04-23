Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEBCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520014060F;
	Sat, 23 Apr 2022 16:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vILfBY17jPZK; Sat, 23 Apr 2022 16:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4639C4048A;
	Sat, 23 Apr 2022 16:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5DE11BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B29BC60D50
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmIw0-1rO9Bg for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:31:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CC0760BC8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:31:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a21so1663666edb.1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BkoYjLrJ8mrclzwPPJyl/tDnyOEzxJz/g5VzY30F/18=;
 b=H3fEyhOoZ4SVQ3//znFA+Y7lAMPBoJ17HGwSSOrDKiEnd4dVct0Jwpefy2sOKsjfjE
 l98gbl9yeOsc52zzP6FTcwOK/IvkEYQYrs1pPFMDGJj0qzcRsZSTpjP/cAvEkPVf7BN5
 7S/8z6ZNzIyUAn4A2obwlMz3tO5NXX74Hx5JziBDGiOwKLHqm1IZu1Wq44MF8ARJrv2S
 CL1k2cNPRD+VJYC9XoAdiJCdbUv2IY1vp3UsvupiElp6QBDmDb3uX3WjmBDvbsOL3i4p
 FY+11T1axi/z7jGueYuzcF+8lb4ONO5Dns3mV0bIt0Kf0PNkyuTSUUnv+9HRSG7wjAc0
 An2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BkoYjLrJ8mrclzwPPJyl/tDnyOEzxJz/g5VzY30F/18=;
 b=RIaU39BMRpcFyMnwB88QAXC8gIClRZIAi71pMH/Di/X4fuFRpllYrueASiCGD7yFv2
 FgV8scrV9CiqY7k54L7P2+18J1j14FdQKu6Lzd6de7d0JeRasAapjxtYfgJqwytC3k33
 f0RKjF7G27suYYIH5YbA/dJq8qdZO9Jnzpvt8zy8en1shVk1Tei+NPABZHA2W4nClO/E
 d9WFx0Q4IUbpr6MtENp9pW24cjSse5vrH3w31Pzq2+sdADRfbW5/W7pvXVckVvNq+M8t
 jbSjt+U2e6E7NKhVvyxozV4wzeXSAsR036xxeHq2pX5u0Zhiqu7htISkP9FFbIyKkKPw
 x59g==
X-Gm-Message-State: AOAM532/1+2+Z78axV2PMUUCbndACcyNgf4zZOJMv3Ww590vmL6wNoWd
 PTLzDjtJyMT3b0/gjiGvcEJp7g==
X-Google-Smtp-Source: ABdhPJwpselCwYtUXexDdjspK5bGwIuF2aJMVqBej1fqIrt8WYx/DVEDz+R0+pSdsVc8GD9DIbZrEA==
X-Received: by 2002:aa7:de93:0:b0:418:d700:662a with SMTP id
 j19-20020aa7de93000000b00418d700662amr10667141edv.107.1650731513772; 
 Sat, 23 Apr 2022 09:31:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gz15-20020a170906f2cf00b006f3802a963fsm308363ejb.21.2022.04.23.09.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:31:53 -0700 (PDT)
Message-ID: <8cc1278f-4187-8bcd-1879-1ac9db92ca1b@mind.be>
Date: Sat, 23 Apr 2022 18:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220421214030.2348966-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421214030.2348966-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: drop patch
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



On 21/04/2022 23:40, Fabrice Fontaine wrote:
> Drop patch as it is not needed since bump to version 9.1 in commit
> 908caefa91dbf70e7f40c61113f0f1ae2b83230d because gnulib has been updated
> with
> https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=135414a7f543e4d40ad0a7cbd51885e159a6e0f4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 -------------------
>   1 file changed, 46 deletions(-)
>   delete mode 100644 package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> 
> diff --git a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> deleted file mode 100644
> index 88390a1124..0000000000
> --- a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 1 Apr 2021 07:49:46 +0200
> -Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
> -
> -Fix the following build failure with uclibc < 1.0.35 which is raised
> -since the addition of getrandom module in
> -https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=682cc4e678aceff32dea2a84b6e5147bdf5a20a7:
> -
> -In file included from ./sys/random.h:40,
> -                 from getrandom.c:22:
> -/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
> -   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
> -      |                                   ^~~~~~
> -/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
> -    7 | #include <features.h>
> -  +++ |+#include <stddef.h>
> -    8 |
> -
> -This patch is not upstreamable as it is only a workaround for
> -uclibc < 1.0.35, upstream uclibc has been patched with
> -https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/c69f5c8b8e53ed3de753f0c6d2cdd99497504b49
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - lib/getrandom.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/lib/getrandom.c b/lib/getrandom.c
> -index 41212fb32..0ad3f9648 100644
> ---- a/lib/getrandom.c
> -+++ b/lib/getrandom.c
> -@@ -19,6 +19,7 @@
> -
> - #include <config.h>
> -
> -+#include <stddef.h>
> - #include <sys/random.h>
> -
> - #include <errno.h>
> ---
> -2.30.2
> -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

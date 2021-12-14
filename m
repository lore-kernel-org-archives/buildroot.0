Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B20C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9F281355;
	Tue, 14 Dec 2021 19:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhqW9w8zJDNU; Tue, 14 Dec 2021 19:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F42281378;
	Tue, 14 Dec 2021 19:36:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 920AE1BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B8760C28
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ce60OcHy5iLq for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:36:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3315960C27
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:36:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o20so67167925eds.10
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=huYb9kuICrhckkVqM20F5FwpvSmxlC6OUUZPiqqlEHg=;
 b=Nxphx4L2v4lkwgGvCRvwoOpz2H56bNkzDF8Ga9aweBvkp/s6jHU1bTbBkKqdtMf6Fs
 8dm+8ebn2jQvdELSrSGRK9LHHeCoHQqcChPnUeEyjCO5stxTFKcRxlWUwrHPnEfokijj
 257um72KOUlsjLP7vJKLhZsh+nQcfs8kYdpYUF9EG5upnpFSQbUteyMJviGEiTTMd9e4
 ceT0AornoM/6ap6yizZ4sWFIEf/HYZSSVDdWgKnkUzU26lN59Z181TpLOyg25ZqIGHiO
 7yTi1yYKRB3xKvyvASc2XgbQ/Mv+exM1+xSPRil10QXgiuIxEcqlDZHg6UZqkWTO7ncF
 VIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=huYb9kuICrhckkVqM20F5FwpvSmxlC6OUUZPiqqlEHg=;
 b=DIZFMtryzCuPJiF0ZMDGxiPrrPW4tNKGMpZD8kxkzwfBJ/bsKXISE82zZHyjQKomHY
 35nz86yXRY8/rNdu/xN2mU//qrxUQBcaLMKtitRUIZXF7pgY60uAD15wSG58GxKhe0N3
 o7xhjDquL3zKMNBgeYlQ9kVD44lOlEQ1WWP5hwuKM/ekYi5xoTzOBd+zZxEpNDjpmtE3
 tr/QH5rfq6DNelTz1CaZvf6Wj/XTaE+TrmBNyQjWeOmoku6vmNN8TdKSymcJlR7/fluc
 fyQnC3CFxlKappLFAnanVhwxM0SpnhklFUwcASFG0N3NLJupS32ys7z6FVl+UljH+Ooj
 YoqQ==
X-Gm-Message-State: AOAM533bTIxeTjnw3R1xkdMdkQvQ26Xm+rxFsAeBoVMHeM8sKHO2rhhL
 n9L3cWbaFF3Gck9NaaztK8Cb6g==
X-Google-Smtp-Source: ABdhPJzWuwhXmw7XYRoAVyyrxdQ0xhawTw8h1UQyLBRHXChLuDmo94J4uKFgByqNi6RlQVh3yxJuWQ==
X-Received: by 2002:a05:6402:849:: with SMTP id
 b9mr6204635edz.373.1639510593093; 
 Tue, 14 Dec 2021 11:36:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d10sm229851eja.4.2021.12.14.11.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:36:32 -0800 (PST)
Message-ID: <1d725b02-ed0b-31ac-adeb-91fddaa4722b@mind.be>
Date: Tue, 14 Dec 2021 20:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212174448.667845-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212174448.667845-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: drop first patch
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



On 12/12/2021 18:44, Fabrice Fontaine wrote:
> This patch has been added to buildroot more than eleven years ago in commit
> e9ae739ce757d73657ef860e21ccc78b3d55816e however it seems that rp-pppoe
> builds perfectly fine without it nowadays.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


  Applied to master, thanks.

  I looked at the package in a bit more detail. It looks to me like the things 
that this patch was supposed to enable (the plugin) don't work any more. I think 
you need to pass --enable-plugin=... to enable it.

  Regards,
  Arnout

> ---
>   package/rp-pppoe/0001-krn-plugin.patch        | 27 -------------------
>   ...rc-pppoe.h-fix-build-with-musl-libc.patch} |  0
>   2 files changed, 27 deletions(-)
>   delete mode 100644 package/rp-pppoe/0001-krn-plugin.patch
>   rename package/rp-pppoe/{0002-src-pppoe.h-fix-build-with-musl-libc.patch => 0001-src-pppoe.h-fix-build-with-musl-libc.patch} (100%)
> 
> diff --git a/package/rp-pppoe/0001-krn-plugin.patch b/package/rp-pppoe/0001-krn-plugin.patch
> deleted file mode 100644
> index c386e85f29..0000000000
> --- a/package/rp-pppoe/0001-krn-plugin.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -[Fabrice: update patch for 3.14]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -diff -Nura rp-pppoe-3.11.orig/src/configure rp-pppoe-3.11/src/configure
> ---- rp-pppoe-3.11.orig/src/configure	2012-08-21 10:01:10.536440032 -0300
> -+++ rp-pppoe-3.11/src/configure	2012-08-21 10:01:45.353442397 -0300
> -@@ -4517,7 +4517,7 @@
> - modprobe pppoe > /dev/null 2>&1
> - fi
> - if test "$cross_compiling" = yes; then :
> --  ac_cv_linux_kernel_pppoe=no; echo "cross-compiling, default: "
> -+  ac_cv_linux_kernel_pppoe=yes; echo "cross-compiling, default: "
> - else
> -   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> - /* end confdefs.h.  */
> -diff -Nura rp-pppoe-3.11.orig/src/pppoe-server.c rp-pppoe-3.11/src/pppoe-server.c
> ---- rp-pppoe-3.11.orig/src/pppoe-server.c	2012-08-21 10:01:10.535440032 -0300
> -+++ rp-pppoe-3.11/src/pppoe-server.c	2012-08-21 10:02:02.597443569 -0300
> -@@ -20,6 +20,9 @@
> -
> - #include "config.h"
> -
> -+/* Patched hack to make this cross compile */
> -+#define HAVE_LINUX_KERNEL_PPPOE 1
> -+
> - #if defined(HAVE_NETPACKET_PACKET_H) || defined(HAVE_LINUX_IF_PACKET_H)
> - #define _POSIX_SOURCE 1 /* For sigaction defines */
> - #endif
> diff --git a/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
> similarity index 100%
> rename from package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
> rename to package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D478C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:35:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57168610A1
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57168610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D3282CFA;
	Thu, 21 Oct 2021 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgQIkxAsndwW; Thu, 21 Oct 2021 20:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7462982CAC;
	Thu, 21 Oct 2021 20:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC9B1BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C59B40221
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82o3AvAtV5qf for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BE364020D
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:35:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y12so3411175eda.4
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6S80hHmLsBy1gcF80baji01LT4HwIZI92ErHYhT5JN0=;
 b=Vgb/U7Bvj6m4yOTmxSQOCW/RacbhVTBMMam//g0tAGJKFBJvXRZoHmrQdY3arsYIvW
 pjRRX3WhnS8BBI96cO0LnFOT3LOmQhvKYYYFSDwoyUuxOvxeROJPpk86J39xmBQW7y6Y
 /HPtXAas/hGGBSUXTCfq6DlsqmuNFOq5p+IHgEmPu8Cutm30lBCUKFlafg8XGZ3xWKmt
 9/BzbFkIaZyq/RqpAKb5YGED3qChYQcPSX3zoBiSxEA8n2r4Uzx1BE3Xm4j3sGlyit3k
 CW5HiKuvJkWuQCqRI14wB15ijgviyLwMIEizvAYkgGnwyc+bhx1ayG+bhbwT6hdon/Oy
 a6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6S80hHmLsBy1gcF80baji01LT4HwIZI92ErHYhT5JN0=;
 b=hnLQCsdNk1iaJLv1M2B3i08i9kovfdz80xk6oId8JCc4m2lpf9ImB8g5G9JU+8SIpg
 6EDa81IAd94pDvn7RXCRKcrSZ7irS23CvOhU/PvF9FMCQdiWxelYo0rFG2KmvmFLnP6w
 jhscAbf4O8PwXDlrCSp2iZtGFr04Njp38g8W7LFKQl4doZzipHs9h2Tho8hXHmjuHX5g
 t5mfkrQlUV3CCYG5WihuqIunO0mjtIqN4gH6pwXrzdKvc2HLSoM9KjiuvmFCkJm5oo6M
 F8B233eBchoKa90MhqY8HZwFTNmcLTLGORNuhLxQpwkqPyVGFk71VwauvNyNhyD35Btk
 RJeg==
X-Gm-Message-State: AOAM532U/tRdexv7AqPXHzIB9kW0ZkPffcqw1B9E9OKHiqIjiu0u03y+
 GiMLSfkrfbD3J/6iMVlF2jpcHg==
X-Google-Smtp-Source: ABdhPJyXLggPCy1qB1SYQK/vP0mDRVbZDU3w9mXCU1ZuT6LWqRLZW29UWAOJwiAl7zQ8dKsyRjSEAA==
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr9584205ejc.128.1634848499434; 
 Thu, 21 Oct 2021 13:34:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f19sm3448058edj.77.2021.10.21.13.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:34:58 -0700 (PDT)
Message-ID: <e5335b6b-4fe7-231f-6831-99b7356fbb47@mind.be>
Date: Thu, 21 Oct 2021 22:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211012174838.1222576-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012174838.1222576-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/4] package/nmap: bump to version 7.92
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 19:48, Adam Duskett wrote:
> In addition:
>    - Remove upstream patch
>    - Update license hash to reflect license version bump from 0.92 to 0.93
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nmap/0002-ncat-unix-socket.patch | 30 ------------------------
>   package/nmap/nmap.hash                   |  6 ++---
>   package/nmap/nmap.mk                     |  2 +-
>   3 files changed, 4 insertions(+), 34 deletions(-)
>   delete mode 100644 package/nmap/0002-ncat-unix-socket.patch
> 
> diff --git a/package/nmap/0002-ncat-unix-socket.patch b/package/nmap/0002-ncat-unix-socket.patch
> deleted file mode 100644
> index b6484ebeea..0000000000
> --- a/package/nmap/0002-ncat-unix-socket.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -ChangeLog:
> -
> -o [Ncat][GH#2154] Ncat no longer crashes when used with Unix domain sockets.
> -
> -Backported from: r38121
> -
> -Signed-off-by: Alexey Neyman <stilor@att.net>
> -
> -Index: ncat/ncat_main.c
> -===================================================================
> ---- a/ncat/ncat_main.c	(revision 38120)
> -+++ b/ncat/ncat_main.c	(revision 38121)
> -@@ -846,7 +846,7 @@
> -             targetaddrs->addr.un.sun_family = AF_UNIX;
> -             strncpy(targetaddrs->addr.un.sun_path, argv[optind], sizeof(targetaddrs->addr.un.sun_path));
> -             targetaddrs->addrlen = SUN_LEN(&targetaddrs->addr.un);
> --            o.target = argv[optind];
> -+            o.sslservername = o.target = argv[optind];
> -             optind++;
> -         } else
> - #endif
> -@@ -865,7 +865,7 @@
> -                 targetaddrs->addr.vm.svm_cid = long_cid;
> -
> -                 targetaddrs->addrlen = sizeof(targetaddrs->addr.vm);
> --                o.target = argv[optind];
> -+                o.sslservername = o.target = argv[optind];
> -                 optind++;
> -             }
> -         } else
> diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
> index 8f69bbf613..dc379f30d4 100644
> --- a/package/nmap/nmap.hash
> +++ b/package/nmap/nmap.hash
> @@ -1,5 +1,5 @@
> -# From https://nmap.org/dist/sigs/nmap-7.91.tar.bz2.digest.txt (lowercase)
> -sha256  18cc4b5070511c51eb243cdd2b0b30ff9b2c4dc4544c6312f75ce3a67a593300  nmap-7.91.tar.bz2
> +# From https://nmap.org/dist/sigs/nmap-7.92.tar.bz2.digest.txt (lowercase)
> +sha256  a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1  nmap-7.92.tar.bz2
>   
>   # Locally calculated
> -sha256  8254a9bc733f3312c6dcfe0d5a129c29e96ecb8b33408c652a8c7beb2e25b471  LICENSE
> +sha256  133794301a764dfe8a60e38601e56657b7113e0337b452189725bbbed58baea0  LICENSE
> diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
> index 34cf61ff0b..f3994e9b38 100644
> --- a/package/nmap/nmap.mk
> +++ b/package/nmap/nmap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NMAP_VERSION = 7.91
> +NMAP_VERSION = 7.92
>   NMAP_SITE = https://nmap.org/dist
>   NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
>   NMAP_DEPENDENCIES = liblinear libpcap
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

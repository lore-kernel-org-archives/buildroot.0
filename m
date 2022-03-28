Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E48C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7E13405B0;
	Mon, 28 Mar 2022 19:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZ22MOKn-M9V; Mon, 28 Mar 2022 19:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B6AA40191;
	Mon, 28 Mar 2022 19:55:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE5D31BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBB3A4017F
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYsIJYdPCLiT for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67B5A40177
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:55:12 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b24so18185172edu.10
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vY30Kyr8cmcEyk9Ak8cXIKbGXBLblvJt1fORvaRDYB4=;
 b=UpEjwVvpw2/KSbiZywes2+EbYCKIcQHgbkNhkIm0BSMd9Ab5LKSv7tu1EmnczovKlM
 WwEzztTVkpRne7tP6hsDI2G9vF+tE+ghrn3x8qeG2Rh12ABsR6js/2i/Y8Ch3ZAly5I6
 K6EnKDnFMVIH2SCAdfvBmnx1BQJ7nmtoDdthipQKS0eG1oOVYchI/V3mxXP/CbfglgNb
 0mNSOAiNw0BpGQc7efU9ovi8CB/CxZcy0ie5ht9r/JSjoJiUzboS4rNHxYNVxTwD4RYj
 CeuvTaK3c0LAGF7G8mGW+B+GehFOhwdh8jexGHl0IZnd5FCB9X4PnLu5HUtwYlhyXbz9
 awTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vY30Kyr8cmcEyk9Ak8cXIKbGXBLblvJt1fORvaRDYB4=;
 b=UqO9iVLF57nOBJtMGV9f5AYbHBun+XO/qBJk6Vuhyl2LOGRdZNdeP9ENQ/SuWMmFKA
 Ede/o8G6fGpyWyRGfSv+s/UqsJJRKnWDdGm9Ab6ZoVMPkEnBZWSCzWs4eNCzHSJKsCj/
 IA3vmPEQSPMR+wGVmYSnGNNcQUBv8nDPvh/667R1Ozjm3S7EYUQMS47UnvL7bUo2TFQm
 xlcLLaD3yv2Cy6RH6yUlGb0wp1GPXARbBtrtMoltEF+eDG8x7uMCcWUYAsVU6GbZkdzw
 A3yFYRLbZoAnZ87s76V/Wlsbbah5xk6d6jgObBl0j9CxYzUmMD98X+8XyHTlTzk/ppNx
 cVnw==
X-Gm-Message-State: AOAM533SndnH4RVfE0gEIHeMFRUaywYCHnrvdRHg5Jp6WB7RULhHkkyl
 oOfKkKsl9H0vZeDQYTy17Z6z9A==
X-Google-Smtp-Source: ABdhPJyflwkbfHpPchlcDQQfdrozoyx7AbdI/qWNZaxaj7eIMQ0ewDEOwEzdTAbYVzATOutlaIxqnQ==
X-Received: by 2002:aa7:de10:0:b0:419:430c:9b3d with SMTP id
 h16-20020aa7de10000000b00419430c9b3dmr17853110edv.366.1648497310612; 
 Mon, 28 Mar 2022 12:55:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a170906d20600b006ca00cb99e0sm6174604ejz.34.2022.03.28.12.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:55:10 -0700 (PDT)
Message-ID: <e51977c7-5e9f-53d4-4c56-65fe362d71ff@mind.be>
Date: Mon, 28 Mar 2022 21:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220327211505.1621268-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327211505.1621268-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/netatalk: security bump to
 version 3.1.13
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



On 27/03/2022 23:15, Fabrice Fontaine wrote:
> - Fixes CVE-2021-31439, CVE-2022-23121, CVE-2022-23123, CVE-2022-23122,
>    CVE-2022-23125, CVE-2022-23124 and CVE-2022-0194
> - Drop second patch (already in version)
> - Add tarball sha256
> - Update indentation in hash file (two spaces)
> 
> https://sourceforge.net/projects/netatalk/files/netatalk/3.1.13
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...iple-def-of-invalid_dircache_entries.patch | 25 -------------------
>   package/netatalk/netatalk.hash                |  7 +++---
>   package/netatalk/netatalk.mk                  |  2 +-
>   3 files changed, 5 insertions(+), 29 deletions(-)
>   delete mode 100644 package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
> 
> diff --git a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch b/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
> deleted file mode 100644
> index e7ccc52553..0000000000
> --- a/package/netatalk/0002-fix-ftbs-multiple-def-of-invalid_dircache_entries.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 32df6e155ccfc83216321925273c3e75e631ebe6 Mon Sep 17 00:00:00 2001
> -From: Andrew Bauer <zonexpertconsulting@outlook.com>
> -Date: Wed, 22 Jan 2020 09:59:47 -0600
> -Subject: [PATCH] fix ftbs multiple def of invalid_dircache_entries
> -
> -[Retrieved from:
> -https://github.com/Netatalk/Netatalk/pull/125/commits/32df6e155ccfc83216321925273c3e75e631ebe6]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - etc/afpd/directory.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/etc/afpd/directory.h b/etc/afpd/directory.h
> -index eb89c606..81bfa9cb 100644
> ---- a/etc/afpd/directory.h
> -+++ b/etc/afpd/directory.h
> -@@ -91,7 +91,7 @@ struct maccess {
> - #define	AR_UWRITE	(1<<2)
> - #define	AR_UOWN		(1<<7)
> -
> --q_t *invalid_dircache_entries;
> -+extern q_t *invalid_dircache_entries;
> -
> - typedef int (*dir_loop)(struct dirent *, char *, void *);
> -
> diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
> index 6c3250a005..6dead5457c 100644
> --- a/package/netatalk/netatalk.hash
> +++ b/package/netatalk/netatalk.hash
> @@ -1,6 +1,7 @@
> -# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.12/
> -md5 021d2330cb7f7cd2977aec46299dcc1b  netatalk-3.1.12.tar.bz2
> -sha1 cc1fe1ebdbdb4da9cf82835c440e82ba28a832c5  netatalk-3.1.12.tar.bz2
> +# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.13/
> +md5  697421623c32ee0ab9c8076191766e5f  netatalk-3.1.13.tar.bz2
> +sha1  16dd7fa84962a44b36b795b8c44393e728785947  netatalk-3.1.13.tar.bz2
>   # Locally computed
> +sha256  89ada6bcfe1b39ad94f58c236654d1d944f2645c3e7de98b3374e0bd37d5e05d  netatalk-3.1.13.tar.bz2
>   sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
>   sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index 0c219a2316..7cc950beb6 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NETATALK_VERSION = 3.1.12
> +NETATALK_VERSION = 3.1.13
>   NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
>   NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
>   # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

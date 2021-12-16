Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF519C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DF9540B56;
	Thu, 16 Dec 2021 18:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmCFhDoWqbeN; Thu, 16 Dec 2021 18:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31EC44014B;
	Thu, 16 Dec 2021 18:21:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 563F31BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454D5417A2
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNFY6TUWkS4h for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:21:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D5CC4179E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:21:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y13so90030572edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=mR7e4Pegw1gvZuJrZhPx1Cm0ysSie+T24VGZu+1Q8oE=;
 b=K+7dkN8Tc6mzbOacdPxPw/nWcuAG5U0eq1t11BdF1N1H321V7SCh5vALObq0cMiTf0
 pQb3Ale2JC78GKfbnJ55g6WRQSKd4GrlL6wInITFbEglO8Qe47ZXMO9zRhX3UHykpbY2
 vKR28J/drpfSRQNg13H29MC+ytPYDvVTdecbiRxPI1VkvUU6VePtQiQ/X5KFZG92UvoO
 2CP0oc5sosH/KV+9PFibWl7KwvRD7LToGQH7X+cvO/mg/NUh9fWNkQxtXMjDv1415O2k
 YyZOHY5BEoB2HXwpI3c0mfxvxbPeiQOQ4Fe+ZxeWN7SzM3sR75PmNv5hl0irKMhakVaH
 dWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mR7e4Pegw1gvZuJrZhPx1Cm0ysSie+T24VGZu+1Q8oE=;
 b=ld0ylxsSQLLUtz1R1/17JTsxhEcPELq2YeAA9sRfZpWIjzg+Gjtkt4pm76igH2/A2K
 HnZy/M6FQ5uSb537utuGWmMEmvDfd5lKLPDTK8KOp8GGGbqjeSwEs6TxkLb86MZxGkTD
 cKQz9atOnXt5vTlgD7H4BlcvoX9o2OLH7h7ugVvvD4eG+RiuCUNSXjE1NVeCVWgIz6dC
 UCyYp4eI0KL4UJm3mkJgpRTsWVXVcqLDqOfM2KfkirV+U2/T0cQ+9ZXf03+/tA50CnsA
 HDRz2fcH6uOT+OwoBr/VUcJYBf57973MVg/9Od2SPrG4El7B5QLRD9BzuCx3VblEICJ2
 /6yw==
X-Gm-Message-State: AOAM531+6dNBWxAej7mauet391kd/sgi022Y5+fYcZ9hmq6GYN/lqlTn
 Zktk3lTy8KPETafK4yzuNqUMdLC60U35DA==
X-Google-Smtp-Source: ABdhPJxdnERlzoVuaPJ5XCJYTBR1s1WWP8cIUsejyBHRoLBBfCP3w+0DllkXyLYghfBHWvsHsVS6/g==
X-Received: by 2002:aa7:c519:: with SMTP id o25mr1044865edq.235.1639678866362; 
 Thu, 16 Dec 2021 10:21:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b16sm2732600ede.90.2021.12.16.10.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:21:05 -0800 (PST)
Message-ID: <b36c57ae-9163-7bd8-42d8-1543a47ce10b@mind.be>
Date: Thu, 16 Dec 2021 19:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214221504.2937004-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214221504.2937004-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version
 0.10.2
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



On 14/12/2021 23:15, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...rc-meson.build-upload-needs-gupnp-av.patch | 30 -------------------
>   package/gupnp-tools/gupnp-tools.hash          |  4 +--
>   package/gupnp-tools/gupnp-tools.mk            |  2 +-
>   3 files changed, 3 insertions(+), 33 deletions(-)
>   delete mode 100644 package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
> 
> diff --git a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch b/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
> deleted file mode 100644
> index f8eba76773..0000000000
> --- a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 0831f77e990e363f78e3f6a5c461084988824f7b Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 2 Jul 2019 23:48:12 +0200
> -Subject: [PATCH] src/meson.build: upload needs gupnp-av
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.gnome.org/GNOME/gupnp-tools/merge_requests/3]
> ----
> - src/meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/meson.build b/src/meson.build
> -index 84b2ca2..6601f45 100644
> ---- a/src/meson.build
> -+++ b/src/meson.build
> -@@ -2,9 +2,9 @@ subdir('common')
> -
> - if get_option('av-tools') and gupnp_av.found()
> -     subdir('av-cp')
> -+    subdir('upload')
> - endif
> -
> - subdir('discover')
> - subdir('network-light')
> - subdir('universal-cp')
> --subdir('upload')
> ---
> -2.20.1
> -
> diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
> index 30f1b8293d..28a1d26ede 100644
> --- a/package/gupnp-tools/gupnp-tools.hash
> +++ b/package/gupnp-tools/gupnp-tools.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.0.sha256sum:
> -sha256  41da7ff5ba8e2425adcb64ca5e04c81f57ca20ec6fdb84923939fdad42c6a18d  gupnp-tools-0.10.0.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.2.sha256sum:
> +sha256  6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c  gupnp-tools-0.10.2.tar.xz
>   
>   # Locally computed:
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
> index 182b0145c8..7b34de52a0 100644
> --- a/package/gupnp-tools/gupnp-tools.mk
> +++ b/package/gupnp-tools/gupnp-tools.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   GUPNP_TOOLS_VERSION_MAJOR = 0.10
> -GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).0
> +GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
>   GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
>   GUPNP_TOOLS_SITE = \
>   	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

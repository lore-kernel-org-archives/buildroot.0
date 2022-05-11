Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF3BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A3360D94;
	Wed, 11 May 2022 17:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xev1PVIZPSXv; Wed, 11 May 2022 17:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96DC60BEB;
	Wed, 11 May 2022 17:15:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 588821BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4704383E6B
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kplGNKhZ3pvP for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:15:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17D2183E50
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:15:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ba17so3372081edb.5
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yZPsEBI+WN3X3RnRe1XmhznXUrZd0jZ951UIPQYD0RE=;
 b=dk4oR9FFtVzealn6VaB8GULuxFjYRhd5O6OB1oBEruJhGF/pGyJpKgt4aobolgYz3n
 EeAsK6PJqdfZhgWIZ1Sr79jIgy8Z0qyGLErbSGiqiMpF9soGbEbToXfz7w5B92tbScwr
 c57NZA0GWspIq/GKka37Uo+jCJN5HP+0U7gkjd6laJ/w9hFnHmhwt0UaYgv2QPqYc2ON
 esZVz2soLbysCTMIImi6HHz8uVvc3Ia+svFW6cGaaf4lYc05JXca1chPdaB1kWd4vz7/
 uSJgXlZbmKNqQzoD6n9ZBHd6bIYA+MFWBb+HyatxQVeJRP0q2jkSFtRgVtqZm90ygm8D
 V4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yZPsEBI+WN3X3RnRe1XmhznXUrZd0jZ951UIPQYD0RE=;
 b=0AdpFanzQxEii7O8+0Wf95gxECHB++wgNSWzTJhS+Brugfp4sr0/YAOZcE+THZiTmT
 8dOt3oVTynf35bGw4b9YtfiIIj03dj+sJJVc1lwILSPaN/iPTTOk0jkBH7FeIuvxxTPe
 6RU2nJSs1n81246mcWRxdNk2KJMzSru7JOhUZWYn/ubR9DTc+mzHYmLrr8xicTDzksR1
 CQfjTRwhEILHCSspwshIKJ0OpTUijb/9eYevz2vOIlaU2iKqtDb2xUaggP2Yi5297n/a
 5SMupIH7S9XvFru8PVgdK2nAXlGE9/rr5mKMS3UyaplI8w110UofjtsIz7RFLGk4taRF
 Z2mw==
X-Gm-Message-State: AOAM5317NZ3S/xNAbQ0lZYQyjTNI5V/54m/N8I8jBgItqjSVAPC/cIp6
 4i4+0QtVUB+oImus6qogp4bJobCQ/ZO4uQ==
X-Google-Smtp-Source: ABdhPJzSLgYNR4dPS/6yKQaEuH2fZea+4cbzlgnqBYuo2RvcOWu9kF7b16GZ//B4l0S0yfeAPJXzNA==
X-Received: by 2002:aa7:c403:0:b0:428:8741:63a2 with SMTP id
 j3-20020aa7c403000000b00428874163a2mr22257269edq.219.1652289321256; 
 Wed, 11 May 2022 10:15:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i3-20020aa7c703000000b0042617ba638esm1468040edq.24.2022.05.11.10.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:15:20 -0700 (PDT)
Message-ID: <1e866bf0-454c-81a8-7194-19a5b22a1605@mind.be>
Date: Wed, 11 May 2022 19:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yann.morin@orange.com, buildroot@buildroot.org
References: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: explicitly do not
 download package withtout source
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



On 11/05/2022 08:23, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Recent commit f0c7cb01a960 (package/pkg-download: do not try to vendor
> _EXTRA_DOWNLOADS) got last-minute changes when applied, which changed
> the expected behaviour for packages that do not have a main download.
> 
> Before f0c7cb01a960, the dl-wrapper would not even be called for those
> packages, and the original patch that was sent also avoided downloading
> such packages, but f0c7cb01a960 now causes the dl-wrapper to be called.
> 
> It is however an accident that the dl-wrapper does not fail. Indeed, it
> is expected to fail if no download was successful; we pass no URI, so
> the dl-wrapper should have failed, as it basically does:
> 
>      download_and_check=0
>      for uri in "${uris[@]}"; do
>          ...
>      done
>      if [ "${download_and_check}" -eq 0 ]; then
>          exit 1
>      fi
> 
> However, it does not even go that far...
> 
> Even though there is no output file, we still pass the path to the
> package output directory as the output path. So, to avoid downloading
> files already present, the wrapper checks if the output file exists,
> and checks its hash:
> 
>      if [ -e "${output}" ]; then
>          if support/download/check-hash ${quiet} "${hfile}" "${output}" ...
>              exit 0
>          ...
>      fi
> 
> The output path does exist now, because we explicitly create it just
> before calling the wrapper, because that's where we also locate the
> lockfile.
> 
> So it ends up trying to validate the hash of a directory, but it fails
> to, as there is indeed no hash file for that package. And a missing hash
> file is just a warning, not an error, which makes the download actually
> a success...
> 
> So, this is currently working, and this is by pure luck.
> 
> However, there is a potential issue: if a target package is a virtual
> package, but the host package is a real package, e.g. the same foo.mk
> does (or the other way around):
> 
>      HOST_FOO_VERSION = 1.2.3
>      HOST_FOO_SITE = http://example.net/
>      $(eval $(virtual-package))
>      $(eval $(host-generic-package))
> 
> If there is a hash file to validate the host download, then the current
> situation will cause a failure, because there would be a hash file, but
> no hash for the output path of the target variant, which would then be
> a hard-error.
> 
> So, revert to the behaviour from before f0c7cb01a960, where no download
> is attempted for a package without a source (really, without a main
> download, now).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 38219ce088..b233b07548 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -192,7 +192,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>   			break ; \
>   		fi ; \
>   	done
> -	$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)))
> +	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))

  Perfection is the enemy of the good and all that, but a few lines below, we 
actually have the same issue for ACTUAL_SOURCE.

  So maybe instead the condition should be moved inside the DOWNLOAD macro, and 
it should check $(notdir $(1)).

  Regards,
  Arnout

>   	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
>   	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>   	$(Q)mkdir -p $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

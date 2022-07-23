Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B414C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D78014048D;
	Sat, 23 Jul 2022 20:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78014048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOm3rnF7wftn; Sat, 23 Jul 2022 20:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AAB44019C;
	Sat, 23 Jul 2022 20:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AAB44019C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 001FA1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE21160E14
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE21160E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZDAyv2mNLJY for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:16:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63C760B77
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E63C760B77
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:16:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so4210485wmj.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JmHysY4JEz98PuBfNRpUEGGj3L28eHTKPzi8oaRexyw=;
 b=du2pxidt1H5mdEYCY487yqEpxk6x5S8RaVCzuMerBhpV9P/6MGD1swcFbtycNUd+I7
 5ouIpn4e4GjMKvBvMNy09wNfDwQ9ZfCPSTeCn27VMBButSzXgMbYMp7U7TfPFH4LoteF
 s7VYMDR2qk4TX3oa8GEF8YgqTxu0iBQXGAh+sgs1rJ3OXqOTdkOXI587ztMGW/nyTEcD
 F3W/wAHIqfT3S6sVV6J44SLiWIT+A8JH8s6+nXdCz3Uz78XBNob+o7m79e+4OZLcUDHw
 GncHOA3NoE+kGA2fZ7EPbV+hZf1jAq0Zzk28AIyJg+2oy8qxJpcy76n4LdRSVGgr4nbo
 ejEw==
X-Gm-Message-State: AJIora/Eai2TAwmTCzNyTU7AyxC+bt4j3wdO6QVmcgPDbHBVfcuEYg1+
 HrCcS6gBmYIK7XiLSIYLRQNc6A==
X-Google-Smtp-Source: AGRyM1suh+8wPD9eLx0Vcvd4cF/G8XBdjxoG/WeLO7B7pCkM6qvdYTSvrNVooomeq5G8uWV6iEiH4A==
X-Received: by 2002:a05:600c:3510:b0:3a3:34e7:cff5 with SMTP id
 h16-20020a05600c351000b003a334e7cff5mr3752953wmq.191.1658607384902; 
 Sat, 23 Jul 2022 13:16:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a04d19dab3sm21975699wms.3.2022.07.23.13.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 13:16:24 -0700 (PDT)
Message-ID: <ee3596e2-09f8-b13c-b9cd-6334e0061600@mind.be>
Date: Sat, 23 Jul 2022 22:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: kory.maincent@bootlin.com, buildroot@buildroot.org
References: <20220622135248.1246416-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220622135248.1246416-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JmHysY4JEz98PuBfNRpUEGGj3L28eHTKPzi8oaRexyw=;
 b=W6M+2O6iYL3vTeNDidRfe0uOOjqdq6zc94wqz5AQKFwWK/LSZNWIUkvHw4pjPbdXw7
 I1H1M6e5NMEsXQTh1N/QnXRWaYMr3NCCnp+Xt6v0fvAGBRLqY9Hp0fwakcZjRX5SnlaX
 iuGxRPq68rRvcj88EOdtwCCSZ/dWv0sBCXi3cbYNiwLqwkd58/Z864sX2tVb/kVEB/+m
 YMkbMY8BbbGz1ujXr6jxCD3rBSPZCvKuDrM63aERA9j48KzQPUgdsMzXDtCHm47uTF9q
 xsLnoDi+xfw8fhSdJrY5J3fVm80rcfU5HiuVnCUMe77oEMRSE4ZblqWNo8yJXkKE+OAt
 rJFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W6M+2O6i
Subject: Re: [Buildroot] [PATCH v2] package/gcnano-binaries: bump version to
 6.4.7
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
Cc: scooby22@web.de, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2022 15:52, Kory Maincent via buildroot wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Update to the latest version of the gcnano-binaries blobs, which are
> compatible with the soon-to-be-released 5.15 kernel from the
> STMicroelectronics BSP.
> 
> As we are installing all the libraries and the pkgconfig files we do not
> need to list them anymore. Therefore this patch removes
> GCNANO_BINARIES_LIBRARIES and GCNANO_BINARIES_PKG_CONFIGS variables.
> It also updates the installation command to follow the path and naming
> of the new version and the pkgconfig files to fill the prefix variable with
> the right value.
> 
> The new version of gcnano has gbm.h header installed in a gbm folder,
> this break the build of other packages. The patch fixes it with a simple
> link.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> 
> Change since v1:
> - fix subject version error.
> - made few code cleaning from Thomas review.
> - add "-f" to link creation to avoid "File exists" message error.
> 
>   package/gcnano-binaries/gcnano-binaries.hash |  2 +-
>   package/gcnano-binaries/gcnano-binaries.mk   | 36 ++++++++------------
>   2 files changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
> index d4ad96672a..1ed66e3753 100644
> --- a/package/gcnano-binaries/gcnano-binaries.hash
> +++ b/package/gcnano-binaries/gcnano-binaries.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  32d91d6ce6e6551cb7ad0eee4698041fdeb10a4f216e6564adb06408476edc38  gcnano-binaries-969d11518529bb70a132909b02ddcc5736c92d91.tar.gz
> +sha256  d3aebbc87ca27e743fdd21d71025cdf0761af748907bbdd7b193262eb48ab3c7  gcnano-binaries-a20611434ef048d3d0c04f55b6cd7d75a2156d43.tar.gz
>   sha256  7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
> diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
> index affe0a6063..dc309ec3c2 100644
> --- a/package/gcnano-binaries/gcnano-binaries.mk
> +++ b/package/gcnano-binaries/gcnano-binaries.mk
> @@ -4,12 +4,10 @@
>   #
>   ################################################################################
>   
> -GCNANO_BINARIES_LIB_VERSION = 6.4
> -GCNANO_BINARIES_LIB_REVISION = 3
> -GCNANO_BINARIES_LIB_FULL_VERSION = $(GCNANO_BINARIES_LIB_VERSION).$(GCNANO_BINARIES_LIB_REVISION)
> -GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)
> -GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20210726
> -GCNANO_BINARIES_VERSION = 969d11518529bb70a132909b02ddcc5736c92d91
> +GCNANO_BINARIES_LIB_VERSION = 6.4.7
> +GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
> +GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20220524
> +GCNANO_BINARIES_VERSION = a20611434ef048d3d0c04f55b6cd7d75a2156d43
>   GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
>   
>   GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
> @@ -44,26 +42,20 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
>   	AQROOT=$(@D) \
>   	DEBUG=0
>   
> -GCNANO_BINARIES_LIBRARIES = \
> -	libgbm_viv libEGL libGAL libgbm libGLESv1_CM \
> -	libGLESv2 libGLSLC libOpenVG libVSC
> -
>   GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
>   
> -GCNANO_BINARIES_PKG_CONFIGS = egl gbm glesv1_cm glesv2 vg
> -
>   define GCNANO_BINARIES_INSTALL
> -	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
> -		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
> -			$(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
> -		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
> -	)
> +	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
> +	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
> +	find . -type l -exec cp -a {} $(1)/usr/lib \;
>   	mkdir -p $(1)/usr/include
> -	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
> -	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
> -		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
> -			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
> -	)
> +	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
> +	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
> +	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
> +	for file in *.pc ; do \
> +		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
> +		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
> +	done
>   endef
>   
>   define GCNANO_BINARIES_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

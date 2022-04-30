Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB35EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB69415E1;
	Sat, 30 Apr 2022 18:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N042t2bOQBsm; Sat, 30 Apr 2022 18:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21921415D4;
	Sat, 30 Apr 2022 18:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE2FD1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC7C740491
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSy7pv-HoDFh for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4009400F1
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:46:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j6so21011036ejc.13
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=atdqkZorg8YZGOT/v+VUjBYTT5wvCeC1Apy2n7oWVtY=;
 b=ZsBbOrAoz2e9xP6J972M3Hj979oZbhd8zhK6Yi7YJjnNHlOFAJsnknD1AoNlumIcvI
 iQdHK7jKAr5GmBn+9wQ22F4388tpCg+fSgi+EuIwh9KLpRL6fhZn/G6C1k1666XYczRw
 H9pT6wEjhTPCVR4RKyCz9TeSLyQTyho+0Wkpxyr5nIosvmtKynTe/fnuF73aWLzqNCg3
 HJV3ij+XhGUE9qkeeSCz4R7MK1GkHOLKxOBmy5uUZVBIM5FIP4e6oHPoE/OSTPdhMBTc
 3bntkkAS5LUfmuZeNNMIKJwfPiJkteS36ccQWcC+brmxqYCAx/OBR17YWdgxO0dtrvW+
 1AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=atdqkZorg8YZGOT/v+VUjBYTT5wvCeC1Apy2n7oWVtY=;
 b=BHpiVzZaDQyuX5XLEbLB+/n7V0crCjsfr0jZwv0MWBOXNbVRra7Wv+Io5QtP0P4i//
 Ig4izOnnHXYDVxShV54rAlHa+CyG2i/11LP6VaKWTcRRvjkx+AXdv5Cb74IBayf6Af+T
 Ns01lSoZtME+hLuEF8/vNst7VMpIJt6PrMo63mIxhG7NfrKK1DYNx66lX7p9Uo7/fi1e
 /v7OnBava2jayvRS+xt3bP6IQ2eJGdfbGJ6qoX8P40vMVnkCnkjdbYcLp1x2IDzZ++rZ
 eTPKJLOnKhg6XtokPloFytmsb7rzr8uCH3BYJT4C22582ozgWlALvOXY1XKj+TXmJO25
 2Zlw==
X-Gm-Message-State: AOAM533UQ+vylbmijJX4c/yrmBTDTLl0idSEZM1oB/fH0pcSeBID0z3i
 vWQEb7GVEixSKJTMNasd/c8o+Q==
X-Google-Smtp-Source: ABdhPJxXmAwhA/ZqqEdf/fCoI8OAF6zhUTYwxRkBWFMb0ma0b1CAGE+08QtAbrpIYxXs1mm12EBOtA==
X-Received: by 2002:a17:906:19c3:b0:6ec:c7b:ed28 with SMTP id
 h3-20020a17090619c300b006ec0c7bed28mr4697809ejd.612.1651344405049; 
 Sat, 30 Apr 2022 11:46:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cq10-20020a056402220a00b004278942f86asm1067320edb.7.2022.04.30.11.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:46:44 -0700 (PDT)
Message-ID: <c72acb89-b898-d934-4efa-318f51f19b61@mind.be>
Date: Sat, 30 Apr 2022 20:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220427204249.3207448-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427204249.3207448-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libv4l: drop -largp
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



On 27/04/2022 22:42, Fabrice Fontaine wrote:
> Commit 07ac045655d08255fbc2d17b16a42d0f0017632e added -largp to LIBS but
> it was not needed since
> https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=b187b94d8e9158973ad17ea1f9c4cb01df117ba3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/libv4l/libv4l.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 8300f5c970..a781ffcd5d 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -28,7 +28,6 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>   LIBV4L_DEPENDENCIES += argp-standalone
> -LIBV4L_LIBS += -largp
>   endif
>   
>   LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> @@ -85,6 +84,4 @@ ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
>   LIBV4L_DEPENDENCIES += sdl2_image
>   endif
>   
> -LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
> -
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

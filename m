Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E19C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C38F560F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C38F560F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B5260ADD;
	Tue, 26 Oct 2021 19:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-pCknfmaI3r; Tue, 26 Oct 2021 19:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABEAE60AD7;
	Tue, 26 Oct 2021 19:54:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 382BA1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C1B404EE
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHKAp6leLrV5 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:54:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 720B040369
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:54:32 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w15so997478edc.9
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7HLQDC9ECMV908lQIKX1brgtrrKWnEst7f/AsJKu3dw=;
 b=blf2JbMGwJSe3SpWFlsSkcPj9w0QiAs776YPQUOX57Zz+tP+Ar6iKmH/mJEN6xn7sL
 cK0fJPNxRkWDvzI2+vbdhNE9N6W+Cju4UCxFzMVfpNWIPzxxMospY2Xt2rI9JZaVipbc
 2sI7FMKRq8WQdDpmaM1plZ6UtX2xcesKFANhgbdxEbH2ZCsoNP+7uutu89zMHAE1pDV8
 0lztHyodxZNIwJRgN192k5UBl5Ks9d7NvRGcvO5ntxDZdG8KYhnJ1IwvI11BblURUWnC
 Xh2fogSRJMob0dsijSe9nibxHLWiPaxk9YBGFn1uCFiQT70xCa2GHOo/o3eKdUjEIcZz
 diqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7HLQDC9ECMV908lQIKX1brgtrrKWnEst7f/AsJKu3dw=;
 b=Lxa84NvPKPHSwJvzZbz/QFXXdC530+DpbnpyuFQK/KcIjG3H/jNmf8d9FS5mrJKBF1
 pILjxrU4rT55q3gobhzgOslGYu15KrLGy/RL25p9VdMIBYTUYqqkzUxyxqET8WKOYJab
 64IziTvIU4XivmP3nGjXFa+I6OA9z64t5nnr9K2459I2OK9P+QPDAcJ3V8J8xb6IEq5e
 JJs0081G4VS+JVuNN20DhtfRHsfSTagZ3VGTP4C+an2L74SVZtOMYJPFmuPZrnZJmoEX
 3THHzoANX8/qOU7nQW2dSx/wWBluDNhSVSUHSanrAfRq+gwVsv/F34flVy1rpeB0shnE
 Nv/A==
X-Gm-Message-State: AOAM530VVjCA6R5ZGh5T4qnS/ay4+BMRnMbuY4M4NpcNhUSkwz0FEpgv
 auwmhT3lOICP+n68oSvL0uje3g==
X-Google-Smtp-Source: ABdhPJwLaNFgsuk68qoi7oOwzob0AeeDO7tXkZrBmLDJ0R1bpLBOLUTdDXAkWxYa+DdGVu1kH95OXw==
X-Received: by 2002:a05:6402:42ce:: with SMTP id
 i14mr12623447edc.276.1635278070828; 
 Tue, 26 Oct 2021 12:54:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f22sm11487353edu.26.2021.10.26.12.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:54:30 -0700 (PDT)
Message-ID: <607b3464-0042-51ae-5337-d4c8f46b779c@mind.be>
Date: Tue, 26 Oct 2021 21:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>
References: <20211025084310.4055707-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025084310.4055707-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: remove launcher-libseat
 meson option
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 10:43, James Hilliard wrote:
> This option only exists in main and is not in a release.

  Adrian, you just added this option, can you comment?

  Regards,
  Arnout

> 
> Fixes:
> output/build/weston-9.0.0/meson.build:1:0: ERROR: Unknown options: "launcher-libseat"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/weston/weston.mk | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 69ee11d23c..6dd5439291 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -26,13 +26,6 @@ else
>   WESTON_CONF_OPTS += -Dsimple-clients=
>   endif
>   
> -ifeq ($(BR2_PACKAGE_SEATD),y)
> -WESTON_CONF_OPTS += -Dlauncher-libseat=true
> -WESTON_DEPENDENCIES += seatd
> -else
> -WESTON_CONF_OPTS += -Dlauncher-libseat=false
> -endif
> -
>   ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
>   WESTON_CONF_OPTS += -Dlauncher-logind=true
>   WESTON_DEPENDENCIES += dbus systemd
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20517C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:01:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A67A60200
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A67A60200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74644817EB;
	Tue, 26 Oct 2021 20:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-XPgKwjvQBI; Tue, 26 Oct 2021 20:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9CAF81865;
	Tue, 26 Oct 2021 20:01:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66F491BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63898606AF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlwcT9sXXRff for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9775460680
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:00:53 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w12so1012893edd.11
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 13:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Ly+K0TvOnsSZfKPvLyIglUBAQ4QVlHrCTJSAChPTOmA=;
 b=e6yaTMio5p+u1teLZ1b/gtc285Pdmq9QsKjI1fuYSOiUQlEuPtVssDdHU0Mx6LoI2o
 7YW3+DM20MLDfNks3ys3snBt5PS7IFxx6bvCFErHyuICNqcKPz8o7W1dme7Doe1UNP3L
 J36r48Jl/iPYWKk3JSO0rR4Rd8Wtmc9RnqJD+GsLS2fUNxmtDKN2r7nkt8R3uWyB2lGt
 F18aOjrStD15j7h6tTilWyoMrXK5MTOmKylXDSrboEhMQndBMD9WxSuy2nOUKRzNA2Bb
 etZigaEUVJI0EdABVAB1x5xU9SjT08y/m3e9iFjELiPeqaFVEJ8Ddu6fGze8Fp78dZ0j
 RUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ly+K0TvOnsSZfKPvLyIglUBAQ4QVlHrCTJSAChPTOmA=;
 b=HHC1Fc47f4rtZtdFxdityTCxnCRDGgaZqLcob+x2hwYuGBAVklWD1kOodVgN9eXU7S
 n44bamt8/OWr51mTLB9z8j3MgFL3N/r0/xBsBm2TfnwrZE4WTGq9BhKNfc9upYjK3nZc
 semnLIZQI5j9UJ6+La2gE/39oFNbgNvhRk7v0auVtOiwoGXz/8QDNH04RKD3ZLIu+Ufy
 1XG2jZkrzWtDFjMWdCFLfgC3DqFnky4oJ0L73Ykt+Ms8BGOypheX7Qrnmsy9HBHCk1J9
 b2Nf7S6hdiQu4dr/sZI/edhs4dndTKoEaU+UKVvYNaRi3jREvp2vzFLonzTYhoVLXqxe
 4XNQ==
X-Gm-Message-State: AOAM532PTBiEoF9U0SNR++im+Bf1DpRedsPDXgoyQoPb0sJ6DZTO1kxS
 b/Y1rYeBut9f2/Js8+CRS2WceA==
X-Google-Smtp-Source: ABdhPJy/dlMBr4kbGQQ7vUSrac81OAN8evLzTK3dGDMJMfxt2eI3oKRw2HAS8CzSwLdoLqqXRfrV6g==
X-Received: by 2002:a50:be87:: with SMTP id b7mr39296731edk.382.1635278451823; 
 Tue, 26 Oct 2021 13:00:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t6sm11726652edj.27.2021.10.26.13.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:00:51 -0700 (PDT)
Message-ID: <660d07f3-6187-dd9a-8641-321a3f172a28@mind.be>
Date: Tue, 26 Oct 2021 22:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025083217.3988476-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025083217.3988476-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: fix
 tests config option
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



On 25/10/2021 10:32, James Hilliard wrote:
> Fixes:
> output/build/gst1-vaapi-1.18.5/meson.build:1:0: ERROR: Unknown options: "test"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> index 497c6df0d3..9810b12cf7 100644
> --- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> +++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> @@ -24,7 +24,7 @@ GST1_VAAPI_CONF_OPTS += \
>   	-Dwith_wayland=no \
>   	-Dwith_egl=no \
>   	-Dexamples=disabled \
> -	-Dtest=disabled \
> +	-Dtests=disabled \
>   	-Ddoc=disabled
>   
>   ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

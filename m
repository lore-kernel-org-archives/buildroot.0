Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4B6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ECF983E40;
	Wed, 16 Feb 2022 19:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64KbEhX5_HsR; Wed, 16 Feb 2022 19:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 572AD8330B;
	Wed, 16 Feb 2022 19:50:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7AEC1BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D734E60BE5
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aW6Ed5La56H for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6C8D60F64
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:50:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so1668676ejc.7
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wGr1v+zzn9K7QXbmirEH1fvYNm1EL8JEQPnGIGGaCDk=;
 b=HyC+CzcKVTQnJKWSzn7OrQ6cU7SKS0lieo2MansRQoDfK7QwqBCzDuDltDoSm6N6M7
 cpyMEQ0rUQDywVlgrfxnYlWDspM9rzhveLybN6tNYS/TgCSC5n6GCoJ5RSJJK51ImabE
 k6VGkNUeykj+8wzB8TOfV30VLMTiAYG/uGEoMK3RxV3oQVWzhJq4l/NyPHVu/xHw3Kwb
 Uvln5LtxRkeV8426o1ceQFRnye6FI0+sdhS4y04TIiJ2swHRHTZrMLO8EXGnWo0N62Ul
 WapS26NTx/awymgZxyT2Reyz5iN4bVhhVEagy6zFO7e8HB01A4etK1BKvn5OLY2wGphy
 M6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wGr1v+zzn9K7QXbmirEH1fvYNm1EL8JEQPnGIGGaCDk=;
 b=1jCv4GVa9Wsop3I1/Z8HZWIQoavFqOVIzpyWM6uo/fQa5rdjYDbdqdJZm5B1WOfK9H
 pq6dFI1183hKZcFpYOIsbMUPibqgFgKp64S0rZGEs4z5NHXF/ON1X3cMpXWP2AXYmMAP
 VfPZxQbqmmcz/BuoNP28Bz7DXY46Du521/9pFe8JSBMMfi5YVN7DSi29jMNx66BkGCRw
 X/oI+pcmFzAsZ6JE/UlUnvUanZb32rliNSbRZ/crfE9JUK0s4Kgu/5jqf9iYNO19SaP5
 8ibuVRlJt55KejXFDusPqDlzVRhHSZIOMa0k0AAfbk09V1qKy8uHKn7vDs8gE71QYGWW
 KTPQ==
X-Gm-Message-State: AOAM5319/nFczjuuCdmLM7ilClBAijX9Ohh6RDFmkU54LsXVMNMBUcmO
 k2dPuRcSi8InlTtis2dFDy6PfIT4dd4uLw==
X-Google-Smtp-Source: ABdhPJzznrTNAsIZba75q2qhP4VOLXiO6drzFJ+lR4/ZKhLfmVY/H17uPypZ1cgw09d7WQE41GRNeQ==
X-Received: by 2002:a17:906:3b4f:b0:6cf:6503:324d with SMTP id
 h15-20020a1709063b4f00b006cf6503324dmr3556658ejf.356.1645041031220; 
 Wed, 16 Feb 2022 11:50:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e14sm2243670edz.52.2022.02.16.11.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:50:30 -0800 (PST)
Message-ID: <1f101fba-478b-3881-5195-3be61cb4d8c6@mind.be>
Date: Wed, 16 Feb 2022 20:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20220213120258.601369-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213120258.601369-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] boot/barebox: bump version to 2022.01.0
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



On 13/02/2022 13:02, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   boot/barebox/Config.in    | 4 ++--
>   boot/barebox/barebox.hash | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 23f8a5ac8a..c16fea3cea 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -12,7 +12,7 @@ choice
>   	  Select the specific Barebox version you want to use
>   
>   config BR2_TARGET_BAREBOX_LATEST_VERSION
> -	bool "2021.12.0"
> +	bool "2022.01.0"
>   
>   config BR2_TARGET_BAREBOX_CUSTOM_VERSION
>   	bool "Custom version"
> @@ -40,7 +40,7 @@ endif
>   
>   config BR2_TARGET_BAREBOX_VERSION
>   	string
> -	default "2021.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
> +	default "2022.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
>   	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
>   	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>   	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
> index 0a853866b5..3d52d40beb 100644
> --- a/boot/barebox/barebox.hash
> +++ b/boot/barebox/barebox.hash
> @@ -1,8 +1,8 @@
>   # From https://www.barebox.org/download/barebox-2021.12.0.tar.bz2.md5
> -md5  199b6d7ff3441cec2062ab18a52454dc  barebox-2021.12.0.tar.bz2
> +md5  753ba533ced54f4113f9e97846c13fc1  barebox-2022.01.0.tar.bz2
>   
>   # Locally calculated
> -sha256  555569fe9e71524e0bf927eaa2c1aa2e81ee2c34dd71e39fe21620db6ccc8aa6  barebox-2021.12.0.tar.bz2
> +sha256  ddf7898075bec05e4865ce0f7a2ac19c2b1efaaa0d066eba1939494e25711d28  barebox-2022.01.0.tar.bz2
>   
>   # License files, locally computed
>   sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

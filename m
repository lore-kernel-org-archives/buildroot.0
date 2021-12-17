Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C238EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FBB9400CE;
	Fri, 17 Dec 2021 17:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zATqMWVna5xN; Fri, 17 Dec 2021 17:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E74840C04;
	Fri, 17 Dec 2021 17:38:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6B8E1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF95761119
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZ3emYXc6T5Q for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:38:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 353CE60FC3
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:38:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x15so10730118edv.1
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ypyC4HgdHPyR1bke0qrIKP7xYdN1oWn7QWxvKhWCrTE=;
 b=U3K/aPG+7G6smc3RLz3OGhlYEL6AykxNvHfm0r2mnur1D90F8EqjJWFhT1MXjvqVp/
 ObKE7CTE8JsdaDCXfH9Ut+XVOZ91eBcaoGo6Jyji9hSfjcFIKrHKBvzTW30A4MXdcUL0
 vFZC6saUaVDbBeB7v42aeS77nQF+J5KAiAmoT2JyRNtm57UBUUJdvuaDF9j+WRl2lJEN
 /t5ohsoaBAVk3Wwp0/MLZQYA/BqdeA/kp2mQRNkPeUaJPfczxYfm8anGMBl1E/HV5WAe
 ekjGWXe4HXCnnA0DtKRVu9TTFeKP53/L0xlqZnTlhVQpulehEhSnJxsmyh7oFqrvuYZx
 D2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ypyC4HgdHPyR1bke0qrIKP7xYdN1oWn7QWxvKhWCrTE=;
 b=UspEeySIQJfjcXBBeFL9akwlMJbZe4gHLyGpEt7bAzcYY/Dd20L+sSr9NqSlr4UrsD
 MbjeEbvnpSq4tOgH7b0JNj3jcARdgbPYSXxsTmdgqhC9FdjnZ78HSjXx4i6SNK5njttg
 IlDsXZHqrfOvGMR/kBd5Xz0vxYnkpFYuslflNcloXDoy0z7M4NVrZAoGuqex06CpfQwW
 QDK2N5JVHujDWaPTtENtYKv8s8hM0mahf1Dp9xresm3zxLRe3Z1/lNHeoZzws2BDvWZ+
 k5W/OscBrWeWV87Y27Ngmutw57eO5HTvq71IqkQHdyJ7oQo6XtSUt6NBy090aV1ETflv
 FQ5g==
X-Gm-Message-State: AOAM533QsYSyXpm8adHbdKq5R/ASn/y1ADAWoYeoxZEmB6YyKeilDmhN
 vFodkAKZB+kNAAKgCkRjTcX37w==
X-Google-Smtp-Source: ABdhPJxmOnSmA1+hL4j4equOW9+O9f8TCPqbwBbGWlhwgdLdq2G6kwMs8Z1fhjb6BzlnuKl7rtH2UQ==
X-Received: by 2002:a17:906:9b91:: with SMTP id
 dd17mr3316767ejc.371.1639762724206; 
 Fri, 17 Dec 2021 09:38:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o17sm3010852ejj.162.2021.12.17.09.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:38:43 -0800 (PST)
Message-ID: <219083fb-3351-170c-d256-9e52098c4f3b@mind.be>
Date: Fri, 17 Dec 2021 18:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211216212724.787872-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216212724.787872-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-mediasdk: switch _SITE to
 https
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Theo Debrouwere <t.debrouwere@televic.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 22:27, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Series applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-mediasdk/intel-mediasdk.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
> index 58334b3ddd..9f082bfa90 100644
> --- a/package/intel-mediasdk/intel-mediasdk.mk
> +++ b/package/intel-mediasdk/intel-mediasdk.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   INTEL_MEDIASDK_VERSION = 21.4.3
> -INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
> +INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
>   INTEL_MEDIASDK_LICENSE = MIT
>   INTEL_MEDIASDK_LICENSE_FILES = LICENSE
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

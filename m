Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4A5E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E731283CB3;
	Thu, 21 Sep 2023 19:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E731283CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rT7SiIQaVvo3; Thu, 21 Sep 2023 19:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D55183C16;
	Thu, 21 Sep 2023 19:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D55183C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F285E1BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8DD783C16
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8DD783C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeDrJd1f7a6m for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:21:33 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D621183BA6
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D621183BA6
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5041cc983f9so2222856e87.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324090; x=1695928890;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OjGSZh54ocRIlGWN5S8MgaM9J68+1KYtCS8rqt731Ls=;
 b=DNOWbXG6wHq1742+En411rJrmLdVJ0v99+GX44efcT8OpF0M5/EzCN1T5NQI3unFWh
 BYV+r9719wAudBCiOH1Umq5ZMkUaNXEuB0Dr/v1R4nNl9tYqJNXuNx77TzMjYp6PUfvf
 X3KMKpRcWlKRFc5eu50Z+Ni+MSBO57S/X0d4He0gZVDtqZBvc6/vNgjnfWAhUId5BeWE
 8KQEjp4BSqG27E1Lrs3UeL42Vgxzq88zw6v61dZjR5oupQCjNinyilD2UfTSdJWYTq7i
 ORipysEbiSPFzxvoPazzEc8wz0wv2qumSSlwfaFkhcWzxbd6S7/Slu3fAlZeUfJgy9DZ
 tISg==
X-Gm-Message-State: AOJu0Yxnr3MnZhooAcuiNQT3vovN+3YRooFAhShg/WCq6gUxtFCUlM+n
 Ih/4lskF4oYvw2b/dPcYcRN+Gg==
X-Google-Smtp-Source: AGHT+IFgxup+wBdYZSQFCGmiAZ4NFDnHYvfhmMocIZa/YknSOAHszcJOGd8ZQ7SPUuJKHpkvc2RHyA==
X-Received: by 2002:a19:e051:0:b0:4ff:8863:be01 with SMTP id
 g17-20020a19e051000000b004ff8863be01mr5108610lfj.8.1695324090566; 
 Thu, 21 Sep 2023 12:21:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c38a000000b00530cf354746sm1232071edq.48.2023.09.21.12.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:21:30 -0700 (PDT)
Message-ID: <127267ec-20e1-4761-522f-fafd7fad004f@mind.be>
Date: Thu, 21 Sep 2023 21:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230917202926.10930-1-ju.o@free.fr>
In-Reply-To: <20230917202926.10930-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695324090; x=1695928890; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OjGSZh54ocRIlGWN5S8MgaM9J68+1KYtCS8rqt731Ls=;
 b=MLujlorcqKkaP1gFsBIR7WBQ73dUCWwp0tJSnVdqI1uVfGwaV9hhGlDD9h1llO21LS
 uBuNBSJwxHBzFBxOUYDjFmzV8Ro2yIihRPgqiUUCMpUg4ttLymm5GZvXTAtz9yhgi3YA
 a8ls0L8mfOCCTqeqoAVeJpYT33IOoXjvWY45rw0HH96L7YB8XMr5dVAftBr6MwcnlHBI
 jgUFrrjnwaI2/BJpRe/MKOdwyOf9dJSj1sE0OVtpRJpEd+9kegpjWihCbyYPv18t/YXf
 vG0tvagCPGKuNtRtcQ9EWPuBKNhWgB0ZxQBAcs7gVijkUX0weIn8jf6VT4nFIg8cTzgI
 2h9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MLujlorc
Subject: Re: [Buildroot] [PATCH 1/1] package/expect: update Kconfig package
 URL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 22:29, Julien Olivain wrote:
> The old expect homepage URL [1] is now redirecting to [2]. This commit
> updates the URL to the new one.
> 
> [1] http://expect.sourceforge.net/
> [2] https://core.tcl.tk/expect/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/expect/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/expect/Config.in b/package/expect/Config.in
> index 5557f4aee6..67dfe643b2 100644
> --- a/package/expect/Config.in
> +++ b/package/expect/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_EXPECT
>   	  Expect is a tool for automating interactive applications
>   	  such as telnet, ftp, passwd, fsck, rlogin, ssh, tip, etc.
>   
> -	  http://expect.sourceforge.net/
> +	  https://core.tcl.tk/expect/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

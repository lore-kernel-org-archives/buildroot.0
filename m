Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CC8C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A0880F0F;
	Sat, 22 Aug 2026 12:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCdWcOh-fyyn; Sat, 22 Aug 2026 12:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787401975;
	bh=Xcumx00vKo4gRMZWkNES4ihoIRHZIN53Q2VZvP0/C6w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M6IjOECzuu+6V5BIgG0x4gtKr3HUh1i89XEfZReb0JxB99upsradiBLYqGlOJNIen
	 3DzAiI9sKwO83kC/USKRHqIVcsgDM+MS7yW7WqcZr33QtVVKRTwZOmaAzLONaIBb5Q
	 J0I9J49rqLfubfZVeyReVZ7UVBcMMEep2ulzHfwexsFRoY+MBQUyQB+ukyljA169WU
	 NED1BxLVyEcR98m08lrMkc+vB2N4o7xCPAA9Mv+ucn+KQDV559A/5NOnRNFNTIJtr1
	 fEVOxWdqkJLfORtpu0jKKRFneh1dL6S1Tbpu5sLS5uqKSIi6WfghOQ/6dPR+v+DRTQ
	 c+zE2z1LUGxbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A522C80EFA;
	Sat, 22 Aug 2026 12:32:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4AA82B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C237860608
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYfzgdKkL1f5 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E84DB605FA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:32:52 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6a422090b2fso2949863a12.0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787401970; x=1788006770;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DWRFbuc5efIJFkwpiaGIdl+eAmFbDyb+6r7VGDn3TSY=;
 b=MZlhOOkkj1Zq/58uTJaGK8yCKetcnUOS5YwlzLasGQiVj3vBROCsViAtyzGmeuFy/D
 vSxEnWEy/EcVl6YJ9ZC7Ym3Pe0zd+owGe7zh1pCq77n9gVODTP+TQWEsJ/NUyWK38SvO
 0Q+AFuQOsWUM0GxSJiD9HNflIP/pYj8R83ZgBilFKfyA23+Qbbaod0y6IhuOAGHISxzl
 o0gIxK0Jr0sWINSVlhyNfqIzPWT5UCQsni1UgKLhdwMwx0fVIDUEWr5wG7Bf+K76NI0k
 DIzUeLR1kDn+TS+QryQJrIY95737fwzVGO/yfefvVhPs7SNclAmvTMiYCeKKxw+C5hx6
 dE3w==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro0UkpVEExpk4JKznsouEVV1H+xrSQCFwTVoS30EONLlBGFuF3i+ttCPWcQvlwMv1msGRWw2qNZz3s=@buildroot.org
X-Gm-Message-State: AFuF++ng+sLkXYY/zK5EPn2tuVe5U7Qs/LK38BSK6RgdqCov0Mpu2+fW
 jLhgIYRrrdFgQQyjm9US/Ctj7W80Jsc0NZUD8J6G7wGH4X1P6VCFhV86Loxt0sn3BSM=
X-Gm-Gg: AR+sD12zE9sWN6EnkDQsEAksYHLsH6/opoI8l5YZgCWIhuZtsrj6rkH39u0E0AbKA1l
 iEBr8j7QGb8CKqgu4VfVXjNw0OXeVv415y7SinEdhwklI4iDpV6yF0obokQhGBV0FqYdHyYKE1j
 hMdRUrCIdTUSQsWodpVNN+dYv5CrDtAFkp5R9aGarxeFqsEFalET6UadBHwDp76n/5nWTimST91
 ren5LwzXzovDibosf3D0CvdTcN3XFE1R/gJD3rhy82yJej8jbFpCRuHx1V8jCRnR9FxXeGR7rqz
 sl0UPkSCEhRkY0eJwIu1BGaufPzBwGPpl/VqsKQb8xpCpvx/aIq7zOlFaLQnv8ZL5JCdzfsR/fY
 RY/8okeq3ienrlknRGT0Q+o8Eb/eRD28I/MlxJZwq0QsfzlZNuHn5Oq9EmAgbJ07lDgn31flL1u
 SR4G61+PSFOj4KCvPeSwU2msVYseAT7mApVhDSJSE5BBy2ThloNhbSmPrC6EQCEVH+hzD8ZAJw6
 rzjJt/+6yoJ9u2aqdeo6DV7/IKcwDUozCimi98+cp0WQNVg
X-Received: by 2002:a05:6402:27c6:b0:6a3:f34d:8f67 with SMTP id
 4fb4d7f45d1cf-6a42f19fca6mr13975347a12.5.1787401970289; 
 Sat, 22 Aug 2026 05:32:50 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff170601sm11317548a12.25.2026.08.22.05.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:32:49 -0700 (PDT)
Message-ID: <00fe77e9-a560-4418-90ae-63083816479e@mind.be>
Date: Sat, 22 Aug 2026 14:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 00/10] Replace all wiki.gnome.org URLs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/08/26 21:58, Fiona Klute via buildroot wrote:
> wiki.gnome.org has a big deprecation warning saying "All information
> on this site is out of date and should not be used." I got annoyed
> some package descriptions still had such links, so this series
> replaces them: mostly with Gitlab links, in two cases with listed
> project websites.
>
> Side note: package/gstreamer1/gstd is the last package using
> package/libsoup (as opposed to package/libsoup3), if that would be
> updated we could get rid of package/libsoup.
>
> Best regards,
> Fiona
>
Series applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

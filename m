Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E15DE7719A
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 00:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C806640748;
	Fri, 10 Jan 2025 00:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WeTWanHn4bD; Fri, 10 Jan 2025 00:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD13B40757
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD13B40757;
	Fri, 10 Jan 2025 00:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3301D942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D03740757
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw-bdvc-4P5K for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 00:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 565FA40748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 565FA40748
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 565FA40748
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 00:09:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844e9b83aaaso110140139f.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 16:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736467762; x=1737072562;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CR39rRKK1ImjhE1504n9ybPWZJIrEmgss+RhPC66cXg=;
 b=V0sjr7GtEnZVgcDIZAc3pK/jVqJn1075gRQ22iLbJCbMWCeilnvC8Ib2u6NyFJM7r2
 1tjvZ9yTP539LbXcEMGWkRzu9TA63PjcoHMvbfPZ8t5U8ttLXvr7N3pMtrHslm6ux/pj
 iZsa7rQJuUURCFy/wKtQJ8j6cl8rBimy7r+igK3rc7LbWqhXnXKiTvwrItHFsPa14zom
 V+ny2SBtJyIhfqPJEoosGaDRxEQAzbanXlzoS6q8iP38EkMj8PrKi0GbPratL6GUriSw
 hpOAp6XQD54iLRC+Y06nIxNtRSyTT+osmjpXT6J2BR7PzXiDYGbf+4MvVVu26agPkeJt
 9Mpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX741oiBxOVmgPr9NIVnn7IisfHez6kE/MsZaUkRNe/2xcOi8QNXPdZqAMy+A2InAQJdSnrMusIpQA=@buildroot.org
X-Gm-Message-State: AOJu0YwnssHJpjwc0nCMoP5KnH6zV7nc2atXxgIph9r0TDyCpDKQ7jXD
 IyzA0uveKdLOH+XM5QmcTSeMrpcTvUJLBvRHB6pF6iuPDD6pxzU3FqnWWbO3
X-Gm-Gg: ASbGncvllxx0aqNCTrzXA3RUawtdCflHo0QrZ5PemvxSGdLZJWT43+hiVih2neKqP5s
 ZEAtO3BYfGkQvxdGBo8ghL84eRU5eyzsFWJtDkt2uhKgo2c+TtbQsiTs0Jf/PusqGOBQA8PAswB
 XdRfYTTAI+1dFR6a/Qr8eL/NsvhLMbitbtsJX6qLXg277z0/Bw7hLpn9KoSNJH1d4kdITg2dIfp
 mEbc1ir0ZzUaUbJMf+ZkvkHyjcFllQ1Cl4AI3OYlwe24nxWt8y6nEtmb8nvPEmSarGCsWuxuEuM
 o6D8Munp2SAo5U8LL5AD+yePo2zJxH0=
X-Google-Smtp-Source: AGHT+IFZ6Zw5Svh98OHmnYC3lTzFai0tuqBLb2JTdYpys9Un6v9J28u3bFIhGMqqKVzlo/JhPT10NQ==
X-Received: by 2002:a05:6602:481c:b0:82c:e4e1:2e99 with SMTP id
 ca18e2360f4ac-84ce0162220mr756975739f.11.1736467762226; 
 Thu, 09 Jan 2025 16:09:22 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fb20esm583678173.16.2025.01.09.16.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 16:09:21 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 09 Jan 2025 18:09:20 -0600
Message-Id: <D6XYG4LBE2LC.38QNBW4XAS9FG@gmail.com>
Cc: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>, "Robin Jarry" <robin@jarry.cc>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Vincent Jardin" <vjardin@free.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.18.2
References: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
 <20250102164630.25695-1-vjardin@free.fr>
 <20250102164630.25695-3-vjardin@free.fr>
In-Reply-To: <20250102164630.25695-3-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736467762; x=1737072562; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CR39rRKK1ImjhE1504n9ybPWZJIrEmgss+RhPC66cXg=;
 b=Pl7ZQaFBVcjkqzSIgcz/AAKmhpUUSTPjy2i2wKYdnSFBx+Q8R8Um7IE22667tt0fzT
 lp4PxprtMxcix7sIPvAHwAq6LK9J/RTIa2Xd75X6Ll4T0iYkauLNDkjSR8JRP06Dvvb1
 jTmfhfvQx/k9EMtM5vMc/mlZnyjh1I2g1ih6iWHNjjd9WwiZLGPgWeQBzO88yl0Q0PpE
 QIu4oUZXupJQTZ4yJz9IKfT+0FDB24M2ynvJemb2cMIoEyDCDvJmgiQmWLWj6o6UM6BD
 qTs8Tdu5/ftiVxCEiXHDNCdCIhMHtmAkICOeOJU4Tj3Q87VK+EFRS+XVRlBJx1k+s2ds
 k5OA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pl7ZQaFB
Subject: Re: [Buildroot] [PATCH v6 2/2]
 doc/manual/adding-packages-meson.adoc: tags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Jan 2, 2025 at 10:46 AM CST, Vincent Jardin wrote:
> Described the usage of FOO_MESON_INSTALL_TAGS=YES which decreases
> the footprint of the target since only the runtime will be installed.
> All the other development header files or libraries will be installed
> into the staging folder.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Suggested-by: Brandon Maier <brandon.maier@gmail.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

> ---
>  docs/manual/adding-packages-meson.adoc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/docs/manual/adding-packages-meson.adoc b/docs/manual/adding-packages-meson.adoc
> index 01891e03cc..b7c987ddd1 100644
> --- a/docs/manual/adding-packages-meson.adoc
> +++ b/docs/manual/adding-packages-meson.adoc
> @@ -124,6 +124,11 @@ will therefore only use a few of them.
>    +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
>    +pkg_config_libdir+.
>
> +* +FOO_MESON_INSTALL_TAGS+, can be set to +YES+ to enable meson's `--runtime` and
> +  `--devel` installation modes for the target and staging folders, respectively.
> +  This configuration is necessary to prevent meson from installing development
> +  artifacts into the target folder.
> +
>  * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>    +ninja+, meson companion tool in charge of the build operations. By default,
>    empty.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

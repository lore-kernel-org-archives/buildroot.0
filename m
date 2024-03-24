Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EECC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD09405E5;
	Sun, 24 Mar 2024 14:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hdy1z_Ll86WF; Sun, 24 Mar 2024 14:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D650405F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D650405F9;
	Sun, 24 Mar 2024 14:56:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3ADB1BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0DAD606ED
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xoi2anU1YADw for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:56:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0AF1605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AF1605A0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0AF1605A0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:56:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-341b01dbebbso2379231f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292210; x=1711897010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BMXHMdwjEMwVvHZbs3VUcZ32gXd5FLoR2Yy9yd1fgI4=;
 b=F3HPVAv7Q0zmPjjzx9G3n55pxb9heaR5LkWqzrXwfUFEYeGLuNVXFa5wG3XNFO/Zcf
 FOtUBFxvUB4lCtlZxR4GL39adi3U8gsqFqlbPh1hSmRRES4SpxZTqLiJVsHivY5dMHIT
 IVbrexrmqZVfmZtFfZyiWn1XaB5mFOpWumbYT+rF3AHusMY9SIqS36LX+fBLaC/C3eJZ
 xSp60ut9UiWVNs4HtZcMPb5C6mu8olLv6hS/CHs28oe2fFTYiNMNCZ3WnzQLDBCpRzxL
 FkhsLRYP53tT15n/HEttVskMY/YWFFbFpU838hiK97Y1j0eg7xFMQi+/W7Yx90SDce5V
 vQuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxpvWji9k59ZK28OqELbjqQYhZ65T6C0m0Now0XsYtYV5Ll0m3MG9HUGi9xmGXhGPiq5vQVijDio2hAgn3dbZOnRaMx2NLfA==
X-Gm-Message-State: AOJu0YzqAE+SQjitr8vevT8Ov27skNdOFnQyzt0N0xuLaNDTKL1W9XtQ
 JZocM6flw96Jy4XhfuNyI58AVVnLeOFZpiS+EDTZUlIW0XruBitc6YkfzMukbhcjFN1fTzWrl+8
 h
X-Google-Smtp-Source: AGHT+IG3UfcSmMUd3H5L2dK4i5UkZ29Zx7PTc9HP0+rLP3EMZfDjUe2ihZBVfSJrWTrS6LWtIXJZbg==
X-Received: by 2002:a5d:66ce:0:b0:33e:ca3a:1bba with SMTP id
 k14-20020a5d66ce000000b0033eca3a1bbamr4082762wrw.20.1711292210648; 
 Sun, 24 Mar 2024 07:56:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:56:50 -0700 (PDT)
Message-ID: <5cbbcf39-fcb1-4420-a702-7a00e1cafc7e@mind.be>
Date: Sun, 24 Mar 2024 15:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240324130603.29810-1-bernd@kuhls.net>
In-Reply-To: <20240324130603.29810-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292210; x=1711897010; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BMXHMdwjEMwVvHZbs3VUcZ32gXd5FLoR2Yy9yd1fgI4=;
 b=ZrHuZr4uB/T3wPpHk9CMz6o2nEFd0/QFTu9aDFpIFqoyJD7Wt9TfJq9o9YMGfL8dUT
 6A6YWBQMoz2xsvjUeu8lBMU2pezEB83p9QIoKQOsZQbAEZJrR1gA9h93EagWlemIr/2j
 rZE7YxZm581FntWl9NtWUwDMM73cxvrGwWsulfn9vfHV5JFkor91ygqnJJtfBhmDMz/S
 x3J6yPK+9jIo3dN+NP/SilNrTPY0uZwplvOrfWAIeCVzMZX3YV5ud5LoStP93NgoB1tx
 LsX4BhyEGVEsCbNIyDX45fPoTdBzzNseaTURSpT0iCI4bDklmlI8++kioMtlDcyWxnRW
 FVpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZrHuZr4u
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.6.10
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



On 24/03/2024 14:06, Bernd Kuhls wrote:
> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
> https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst
> 
> The fixed CVEs are only relevant for Windows.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openvpn/openvpn.hash | 2 +-
>   package/openvpn/openvpn.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 6dc470360a..932483507e 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking signature
> -sha256  5ede1565c8a6d880100f7f235317a7ee9eea83d5052db5547f13a9e76af7805d  openvpn-2.6.8.tar.gz
> +sha256  1993bbb7b9edb430626eaa24573f881fd3df642f427fcb824b1aed1fca1bcc9b  openvpn-2.6.10.tar.gz
>   sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 28948a3ab3..abcb123eea 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENVPN_VERSION = 2.6.8
> +OPENVPN_VERSION = 2.6.10
>   OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>   OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>   OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

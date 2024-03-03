Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F641C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 08:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C055840BB5;
	Mon,  4 Mar 2024 08:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SS6SSek1T56q; Mon,  4 Mar 2024 08:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30BF740BAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30BF740BAE;
	Mon,  4 Mar 2024 08:51:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2101B1BF580
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C9E4605DE
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKFdEH79LfrT for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 08:51:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDB88605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB88605DB
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDB88605DB
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 08:51:27 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so8739144a12.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 00:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709542286; x=1710147086;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72bLgYWbOzrx/AMd+O3M1aHqr01vE5+cW+Pl2VXAi+w=;
 b=UO8nZ3BldgIjSDzyDTbWW9Vay81lXCO3+/6EBceXUo0Y9OYYjbzFNl4qj3UinFkFen
 wbWg4prW95mJINZIqTPOE6dlq7jT2AAoK61hdXVetwhVXFAReQZVVrUpnEA8k7L7bvYK
 q74M9/0zJvpH5ij31pUgc1pUOFBkHfKxsZ8VeFarp22kid/qagau0m+m2szcOkBN2TX1
 yWJV2EivmYOhWJ6vFGdhWVUNU/9myVCLs3t4225IXXgdFln4zAxCg2oBhDh/fk1wha8A
 mnohl7tfVhA3EfCrSuwi7eQgvK8lMOMEgME8Gwm26SnvD7rla2BdzTWpZL6SEnZWbZuO
 yZyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhi/WfIsjTDkPD+IgoBwo7/k5GXb94+cENiR6RrZt5iD3fHJcdCcWHho3DAXDwrGuqzkOt/1neZL9+1eL9uTPgRcYjgVCpg==
X-Gm-Message-State: AOJu0YwyCjYwGXFN9wASm4wKyuM4dz32Wur27bh5a0sXx1IsD3YzN7rT
 L8xPxg1RJdo1XmfaJD2EA+qTdYmJUDOfhtEK+UL0PsRpF4ktOS0TRE46ft7/clA=
X-Google-Smtp-Source: AGHT+IFhBr79Py/dL40iyVs4CjU6tSC+eb5oOdmdZjkiKC1S5sJkA4osd1G6egOQviu552m6R/qVAg==
X-Received: by 2002:a17:906:cb90:b0:a44:cd4:95e0 with SMTP id
 mf16-20020a170906cb9000b00a440cd495e0mr7224958ejb.1.1709542285992; 
 Mon, 04 Mar 2024 00:51:25 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 mb17-20020a170906eb1100b00a4490267ecfsm3393779ejb.221.2024.03.04.00.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:51:25 -0800 (PST)
Message-ID: <ca553969-52cb-409d-8447-c3cf3bfe71f2@mind.be>
Date: Sun, 3 Mar 2024 21:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20240213020420.1339668-1-kadambini.nema@gmail.com>
In-Reply-To: <20240213020420.1339668-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709542286; x=1710147086; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=72bLgYWbOzrx/AMd+O3M1aHqr01vE5+cW+Pl2VXAi+w=;
 b=bNFFK52clB8OeRv0y4vd9Rl7TWXXAzbeTsztJkBVszmaLZeTGKuV7+uARS8oOVu0Y9
 azPY9fC0CdMPFzTUGC+LACaaoBJloCxlTqDOD2UcNDcXPB0D2BlyMvOR3iK1roV7jUjx
 bl9Wh3ysRdWXiXCxuHOSbe7sPohsFusKIz5pWsEkr+60U7dVXuhvBFmxOBaR0Cp+9hnq
 XJBJ4T2zrtpExU08xtXu9YYuDXm1Q4xXX6ixJ7mmrOf3jEWXFlT7hnl/UZOmqup8D9le
 y7tThZA3FBf9HhMbOHNaf+OyDI955Ud4cEsEbGD7ell4Wyuek81xyp6jiXvpgzv9n9rv
 oKiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bNFFK52c
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: bump version to 5.4.6
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



On 13/02/2024 03:04, Kadambini Nema wrote:
> Change Log - https://github.com/tukaani-project/xz/commit/0ef8192e8d5af4e6200d5d4aee22d1f177f7a2df
> Updated hash of the COPYING.

  Rather than just saying that the hash is updated, you have to explain _why_ it 
changed.


  Applied to next with that fixed, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>   package/xz/xz.hash | 6 +++---
>   package/xz/xz.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index 3d93ad6b5e..e8025a8065 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,9 +1,9 @@
>   # Locally calculated after checking pgp signature
> -# https://tukaani.org/xz/xz-5.4.5.tar.bz2.sig
> -sha256  8ccf5fff868c006f29522e386fb4c6a1b66463fbca65a4cfc3c4bd596e895e79  xz-5.4.5.tar.bz2
> +# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
> +sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
>   
>   # Hash for license files
> -sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
> +sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 547959c743..40fa59ca7c 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -XZ_VERSION = 5.4.5
> +XZ_VERSION = 5.4.6
>   XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
> -XZ_SITE = https://tukaani.org/xz
> +XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>   XZ_INSTALL_STAGING = YES
>   XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>   XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

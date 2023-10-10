Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F385FCD98C0
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB0256148D;
	Tue, 10 Oct 2023 20:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB0256148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukWtkYuYimhJ; Tue, 10 Oct 2023 20:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15FA6147B;
	Tue, 10 Oct 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B15FA6147B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6A31BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8551640012
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8551640012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jgd1jhuxwt20 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:52:47 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 593634047B
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593634047B
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a9f139cd94so1021069566b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696971165; x=1697575965;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKN/1/C6Z0sONi7DCd41eoy+v+teC8jUN/oN9fOUMbQ=;
 b=wt0FlA7Jzpt1iOhWsDfwlX/zwBwX4M4vT9P4h0nKwhDqGO/d0/rmZK1gSvrvMdFx33
 1Pl9N5PgENX39521Tqn2QKYxGB26AVlGQNUdvrUwuqMArI4wjza+fpcIxFmgwR0zkWJE
 CdhrG9bX8NXXOuYCdtkwWZwsKN7nJ/LQmS7d328tjpZO3lQbc8vmQpy0YarUXklPcEO7
 lvi9Pg8t3vIC5KlPGjad4s+Mc7RDZRIKrkCcuOf6AXIUcIGegtv2XGn7CpzoT7ivyuTk
 /f0B/wB5v0L9+7mJLYqVYqxjHzGgdlStDnC5ooCxDsEy+l0geeL9pKGZlgNkhKpbkT6E
 BwVA==
X-Gm-Message-State: AOJu0YxmW18JDzsCTzjUtrlfhj63ei/rOMqOGsrE88jJ2eMxt+LJ2Si/
 Fd3xmacbDvp3BYk583rl3KBwIA==
X-Google-Smtp-Source: AGHT+IFFxNxZBHE/hpWXXiq/4S5PCYEi7XfkIz59gR1yCmiM1YsaL3dYWnow2reb0g4Uy2KbhSUJrw==
X-Received: by 2002:a17:907:1dd7:b0:9ae:48df:2235 with SMTP id
 og23-20020a1709071dd700b009ae48df2235mr16443983ejc.55.1696971165539; 
 Tue, 10 Oct 2023 13:52:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b009929ab17be0sm8856366ejn.162.2023.10.10.13.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:52:44 -0700 (PDT)
Message-ID: <57818d90-c714-f612-465a-3194f7206076@mind.be>
Date: Tue, 10 Oct 2023 22:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231008213418.85380-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231008213418.85380-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696971165; x=1697575965; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKN/1/C6Z0sONi7DCd41eoy+v+teC8jUN/oN9fOUMbQ=;
 b=B0bFRtFHRVEg2EOz0EsInxdonvlQXUr0VHW92Ls3Zq3/crOFA0AMMSnZoIFvGIHqo4
 eKFvoO+T48Ily9hR3l6lGCV/vOzIaPNK7eVQeHkz9VAgSODL5tArWpyBahLZ5jrLBNq2
 Cweu3inp+nXb/gNRS0WNbT5bZ9yNqdGUH2hZ6ac9DzenX9cEE7vL8e6zLX83RnRc42kC
 P0+d8fn6KtbjrIEdMSDjf0fNMaYFCuLssH9gqUXqjFO8jlGymmps9iSKWQECAdAIJ3QS
 7M01why+5TK1QyWMEUw9golLIGgfJ/Q1RqdL2JVExT5tYB7fmik30rVhxvyG/qjIkwzn
 UDdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B0bFRtFH
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: bump to version 1.20.1
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



On 08/10/2023 23:34, Fabrice Fontaine wrote:
> Update hash of license file (modern MIT license text used since
> https://github.com/c-ares/c-ares/commit/6d077838f7e3f1899ba93da9d301b7fe49b311ce)
> 
> https://c-ares.org/changelog.html#1_20_1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/c-ares/c-ares.hash | 4 ++--
>   package/c-ares/c-ares.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index 3e1573f2cf..c2897f6e44 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256  321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e  c-ares-1.19.1.tar.gz
> +sha256  de24a314844cb157909730828560628704f4f896d167dd7da0fa2fb93ea18b10  c-ares-1.20.1.tar.gz
>   
>   # Hash for license file
> -sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
> +sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 46b8acd673..7a49b2639a 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -C_ARES_VERSION = 1.19.1
> +C_ARES_VERSION = 1.20.1
>   C_ARES_SITE = http://c-ares.haxx.se/download
>   C_ARES_INSTALL_STAGING = YES
>   C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

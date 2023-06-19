Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19851EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE94B4154A;
	Mon, 19 Jun 2023 19:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE94B4154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMQM6eSjqz6i; Mon, 19 Jun 2023 19:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7C8B401F3;
	Mon, 19 Jun 2023 19:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C8B401F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 774DB1BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C2B81F58
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C2B81F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtT_DuujLNwH for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:35:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C0481F54
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14C0481F54
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:35:53 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f8775126d3so738488e87.1
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203351; x=1689795351;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90muBx+fb8oFOoPupFFVhkASXvGFpUIk9FyjyJWkybg=;
 b=NE49IZYxirETx3fAEWZvE1f3PeRjzUUlmQXp4fl/pYJ1klrDK6Va2s0kVBN+VtD9N3
 3Higp9mYrIgolKO5HCZtWJdj2raYLYq78AtIcyFpcf2tMfbhdFXQEKAgZEMcmhLQ6UxA
 9XeTcBHfuTPaO7sb+4OlVH4htxMQHUzvJjM2v2ge6F/m/2Y+40ukMZYIqCen5JYOLsmM
 zEzhzgrxCn5cOeQEcDgguaVzh1iZGjkPLccxYE/HdjVFw3EFZkiAHRmQE8QZGgxIQzRF
 omnNs+kGMojf0Lp4HJOXMBdJFPPmV8GFh9GZAPRy3sV7eO375/SXET6ANwZNlGDqBXQz
 h0bw==
X-Gm-Message-State: AC+VfDzvBpLvS243Fstf7v1ZIB1I6SXBFRy/u532k9xrvkt843CHPURi
 /EDfeKKdeYHs2oJeg5K+B2L2Zd6V4VMTEI2MNkA=
X-Google-Smtp-Source: ACHHUZ6jEEbj1xM63qFAhi3kmn3S1Z+akIOWL8LERojrK4xAnZ7ZwiZYSc28jh7jRXJB3AKgmn8V/Q==
X-Received: by 2002:ac2:5b4b:0:b0:4f6:1c08:e9ba with SMTP id
 i11-20020ac25b4b000000b004f61c08e9bamr6373011lfp.65.1687203350974; 
 Mon, 19 Jun 2023 12:35:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ca22-20020aa7cd76000000b0051bc7483bc7sm93700edb.78.2023.06.19.12.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:35:50 -0700 (PDT)
Message-ID: <395e4f92-4eb7-fbc1-0f23-ee920b673d1b@mind.be>
Date: Mon, 19 Jun 2023 21:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230619170440.727597-1-bernd@kuhls.net>
In-Reply-To: <20230619170440.727597-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203351; x=1689795351;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90muBx+fb8oFOoPupFFVhkASXvGFpUIk9FyjyJWkybg=;
 b=E0MCcI1hHnwRLscU1LaDE+FM+YgSK4/CZ76105gcq48GmM1jIg0KbuD9GQg4dpJUIg
 PVhbH0JJtxBdykr5UBno7F+UZwhAQvaykcCkRTLezcni1G0S/DBrcKW6OMyfdGwrL/tk
 WzV9fTC+Ul5mlw9knoZKQin1oqZias9aXUA81O8i+l8UaWt/G405ALJqXTpOMLfnjYSr
 fnm7Y/S3zwN5AACkLYiJZj//mi6Ccu22F6gXXck/LP7mAVMeJbYPOoMYMbmBuaZdQXun
 cgYNVRQwKlK+jqRL7Z43Sgs2MKHdgHIlWGjKsZ75OxPExrjk1RsP0NMMAJcU8bUkeTsV
 MSbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E0MCcI1h
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: fix license hash
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



On 19/06/2023 19:04, Bernd Kuhls wrote:
> Buildroot commit 1db3f0f84449843476c2887d2ea09323c66f33a4 failed to
> update the license hash which is needed due to various commits in 2023
> updating package versions and copyright year:
> https://github.com/ccache/ccache/commits/master/LICENSE.adoc
> 
> Fixes:
> http://autobuild.buildroot.net/results/41b/41b3427e30b6e44352fc78b27360fdadf9e46393/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ccache/ccache.hash | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
> index 2b6cd65a74..736122e0ab 100644
> --- a/package/ccache/ccache.hash
> +++ b/package/ccache/ccache.hash
> @@ -1,4 +1,4 @@
>   # sha256 computed locally
>   sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
>   sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
> -sha256  56cf64f68b7b8150300acd79899941615523ea5c56c120e92f5b175b7cc78e3c  LICENSE.adoc
> +sha256  55ce274f2b898dad70d3695ab13f82656fd455bd8fb6d1c85d6f7c453bef0b2e  LICENSE.adoc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

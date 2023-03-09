Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F54DC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F338482249;
	Thu,  9 Mar 2023 21:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F338482249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2mEJFSNSdjG; Thu,  9 Mar 2023 21:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46FBA82243;
	Thu,  9 Mar 2023 21:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46FBA82243
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D16041BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB0CA82243
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0CA82243
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oqgm7K4nWfqA for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:49:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D35682195
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D35682195
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:49:45 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id ec29so12817001edb.6
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 13:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678398584;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wuM76V6eWy1SKGClT3q6vtHUmRxDpNQD+uZNveqj4Aw=;
 b=YEmLSCWkk7rCzaPDQ0fYvCau653WcNj1g12UiXc/N+cdjCkgx6VkY8f5bJJ4iTqlZw
 yvFDL2pw0jSmkxz4J1pvsYE42XkzRjISUE77/fNnjhxe4aFxMx/0NfIVlMNYHblCoLYM
 MC70j6dX/+YJpKcxPAakL9j9jE2C653PU4Lp/fXwms9WtUuT2C18+R6OQF/YW5a6FfPv
 R9IjhuGIsCWf+rAptBQcwWcsA3a4fcjxw47aKuWBXTcFrolokHeID0E+Wz//9OKkclyZ
 ZdTxyPMq1s757op41az/paOzqHsNbETKUatT/Eaqo72A1UnH+KDZMj2XIPOGs8LNaNcX
 DXUQ==
X-Gm-Message-State: AO0yUKXme0liR43zBi0pbIN8GMWcaUjBz0s/N7peHpE1ZahhqHvkQysW
 WxaLxoAXY1rJ0x5J/qZ/feKQfIBWJS5cBk1gJeU=
X-Google-Smtp-Source: AK7set8EkiOvEfu0kgLC8pndB/mQaHyl9rmj3vzUHM5G8JfZBQlc0/SnU0fgOnsKzgVPsEzR/pg3KQ==
X-Received: by 2002:a17:906:3b4b:b0:85d:dd20:60a4 with SMTP id
 h11-20020a1709063b4b00b0085ddd2060a4mr21563269ejf.40.1678398583774; 
 Thu, 09 Mar 2023 13:49:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a170906234900b008b95c1fe636sm41832eja.207.2023.03.09.13.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:49:43 -0800 (PST)
Message-ID: <1896069e-e9bb-0b05-c4cc-5f432539648b@mind.be>
Date: Thu, 9 Mar 2023 22:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230222191850.182174-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230222191850.182174-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678398584;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wuM76V6eWy1SKGClT3q6vtHUmRxDpNQD+uZNveqj4Aw=;
 b=X9DB1PLOon9+jYG2+15lumHVb7pQhgBZveMBEc2aCkUyhjRs+QGI02Qpc4J8rUGC2l
 abd7ehZRktNxLsOYMPZWFMhZ5kYtzO7rLfCD+wMRatazwZU42L5KKtERo67EgdHWAyJu
 10Edt2gScRCQjOzBhmGYyOxdVNeSvQhHlEwFzr8malavEHxYZIvRrm8li1aWZ9tHctt6
 8inOnZkv5FzfuS7/VVqwgL4eduhD0glBGjGYOBVjOCX65c3Pf4r1p3gjy+f/HqPJXbK9
 EZxae1h0zJtrs1fMehvqXw5GXzc72sk57rBIe7tVLKjtmTgd09QFm1i9Its14+89OBuQ
 yNsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X9DB1PLO
Subject: Re: [Buildroot] [PATCH 1/1] package/libgcrypt: fix Thumb mode
 workaround
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



On 22/02/2023 20:18, Fabrice Fontaine wrote:
> Fix the following build failure:
> 
> /tmp/ccRqWxnA.s:98: Error: instruction not supported in Thumb16 mode -- `adds ip,fp,r0'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4b96f4e41724e5c9c806a6c7df397a58d1ae1b1e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgcrypt/libgcrypt.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index 6cf9b235f3..dc19116df6 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -27,8 +27,8 @@ LIBGCRYPT_CONF_OPTS += --disable-asm
>   endif
>   
>   # Code doesn't build in thumb mode
> -ifeq ($(BR2_arm),y)
> -LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +LIBGCRYPT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
>   endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

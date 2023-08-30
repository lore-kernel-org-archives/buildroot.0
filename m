Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39426C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFACC417F8;
	Wed, 30 Aug 2023 20:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFACC417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9tv7xjNEziG; Wed, 30 Aug 2023 20:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 178EF417F9;
	Wed, 30 Aug 2023 20:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 178EF417F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEE7E1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B391682F87
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B391682F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1t9g1V15uSM for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:45:31 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9417A82F4A
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9417A82F4A
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcbfb3705dso4118971fa.1
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 13:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693428329; x=1694033129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSBL3dznZMysV9bMRKxPVZgBsd9AThjNZdByxWvWues=;
 b=h8Lnx33lVY4LJ2qV/6NnScDhtp8YGZvzK3W/ar4FTYZCu9wF5wJULfbCsHoFaoOUKT
 EpFe13BM2RtdcjQnCPimnO1y9UCnpL2plf+2E4uBaBXEGep72uFABhYnnoDOY3uHA5JD
 XFbBR283kK7Ifz5ewCjQRAs+54E/NiqdaqTwTZ+JukFhkbEXtwYXbe8sve+5T34xhQiH
 WeyjwzCHAri0Zqv8sE7VVInRjv471KyhjxI2B7pLvtkMJP4IOX21arsa0iP1m0+YZS9U
 EZ3LLI6qWViGIrq2G8x+e6tIJe4igJ+HZd9pm54HSzdRw39cLHW7w2PIVE/mf/ZSQ9vx
 TRmA==
X-Gm-Message-State: AOJu0Yxe9J0VODj0RUtMT1DoL3pGTbe36Ow8x14bQ79bsE6xVjt3Y76o
 i7O0SRKqLVBfeJcf1cMKm2ekRg==
X-Google-Smtp-Source: AGHT+IHY+VX4g+gU0h1+2k9TehEQlsgWX0x+3y+7zKcWT8YB9PtCeDfRU6lqnNjdx0FM+0UjrJdmdQ==
X-Received: by 2002:a2e:3207:0:b0:2bc:befb:b602 with SMTP id
 y7-20020a2e3207000000b002bcbefbb602mr2424200ljy.1.1693428329231; 
 Wed, 30 Aug 2023 13:45:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gy25-20020a170906f25900b00985ed2f1584sm7626055ejb.187.2023.08.30.13.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:45:28 -0700 (PDT)
Message-ID: <dd220b44-25a5-582c-388c-a5e44b529439@mind.be>
Date: Wed, 30 Aug 2023 22:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693428329; x=1694033129; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSBL3dznZMysV9bMRKxPVZgBsd9AThjNZdByxWvWues=;
 b=AMu+NcgjfRiWxBm7m5/QmjWN9ZdGOZmrutMbrZ+KZQvR+BY5l2e3tAfx/EEvELAATc
 nJj+nsk9m5QigrVBOezuitvzyyBs7rrjidn5r+WGb8cny2Et+MeItvzTUHSqAZEenxwx
 uPDaQlkxvwCsW/WzB9ifhdv0IePOFo5vf/RfpPv7i06XjBVZsNgnh2s4q0v/cB3deR16
 4zDB7aNqkwXojA910fgCfYSH5F+aILObR9K+zOI9cpVkrSQlGankM74uZUujZ+b65jYa
 v0DHr+FDSLZbgYiFGWtELatD7HxYNbql4P+j/pKD41gl7RrQ/PzyWMzCb2gqCRAFwirR
 px7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AMu+Ncgj
Subject: Re: [Buildroot] [PATCH v3 1/8] support/scripts/pkg-stats: fix typos
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/08/2023 21:28, Daniel Lang wrote:
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to master, thanks.

  (Note: I'm applying this series to master instead of next, because we will 
need the new NVD API on all stable branches.)

  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 3248e3678d..eea900124c 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -84,7 +84,7 @@ class Package:
>       all_ignored_cves = dict()
>       all_cpeids = dict()
>       # This is the list of all possible checks. Add new checks to this list so
> -    # a tool that post-processeds the json output knows the checks before
> +    # a tool that post-processes the json output knows the checks before
>       # iterating over the packages.
>       status_checks = ['cve', 'developers', 'hash', 'license',
>                        'license-files', 'patches', 'pkg-check', 'url', 'version']
> @@ -259,7 +259,7 @@ class Package:
>           if var in self.all_cpeids:
>               self.cpeid = self.all_cpeids[var]
>               # Set a preliminary status, it might be overridden by check_package_cpes()
> -            self.status['cpe'] = ("warning", "not checked against CPE dictionnary")
> +            self.status['cpe'] = ("warning", "not checked against CPE dictionary")
>           else:
>               self.status['cpe'] = ("error", "no verified CPE identifier")
>   
> @@ -499,7 +499,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
>   
>   
>   async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
> -    url = "https://release-monitoring.org//api/project/Buildroot/%s" % pkg.name
> +    url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
>       try:
>           async with session.get(url) as resp:
>               if resp.status != 200:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

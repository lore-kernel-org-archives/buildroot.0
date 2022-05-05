Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56507C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18AD414CE;
	Thu,  5 May 2022 21:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Buw0OAq-FNwb; Thu,  5 May 2022 21:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F22410A5;
	Thu,  5 May 2022 21:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA3441BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B82894055F
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQcR5-W0O_8z for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55400404BF
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:22:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d6so6621692ede.8
 for <buildroot@buildroot.org>; Thu, 05 May 2022 14:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yE+TI0uJ9z5eESq6CJTaNGrljIpNWd/PDw5TCPaHP9o=;
 b=OiWISIaUMvzb5ffaF9T+GAdHUL8KLt42+XIevdcgpnNtGCuHgjLUNxFiiHABDqP3tG
 ueOECwD/BCa5z7mgKbwPEtL6dmJWvDLNt2Xwa+oAoRdQN6ndPaI6DMlyu7qUd7bpUk9s
 fEzbstM3/zl9Q1zhCwCStWkNKJZlA0ds2zbsMKLkZhEf4AbsF99fV3+F9djQm5vCTvoi
 jBU3IM5BrlPg4scRUiU1bNINglsDCTPsWlVQBAqf5/dcvVlKt7Zy0lx7xdxwC+VYML6c
 n0x0tE/ZH8SPFVxKoSUyU+kVOdRMuBXQ8TXH91CStl5PMxAoLZFhG/lhtTgg7BD9C1XM
 VX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yE+TI0uJ9z5eESq6CJTaNGrljIpNWd/PDw5TCPaHP9o=;
 b=0XBF6Xt8keaSmyR5weqTgLCENtw+xkKmAulx6yI/tpUjb2TIy3g9mlzVNP4YpD8/i4
 /kT7WiJ31P+ukRkFNiUoGSbN64I29zKGxKoTvp41o74U0k7Och+DgEePZ0Wj4n9ut4Cc
 X+i186kPrV3bs2I9psBMz5DeEUsERmm7TKDjf86dX0buWgL+2XgUUSz5s06Bjs1/m+uV
 0loahC+2YA47FMD7oAn4q0HAcI0ncj9ZbSRZx1ORjgoRanTxEAGTbhvj4I8AihRyZ5Gk
 7cRZdz/CTWmBbx4TUEgCjFpUUHj7EEZJawx/oPf7Ek2hVIHXAxuJOHJGClMti7/3UFSO
 lyyg==
X-Gm-Message-State: AOAM531kmL3mQ+QfrrkDwWBHqzA5ZLel8sTbg9oDuMZZ9xDVeHjqtRic
 jK4YbQ8tYdKnAutKgfOfHPyeUdEj7b3Dfg==
X-Google-Smtp-Source: ABdhPJx46HqDmdIsaEmc39k4/z2Y36Dhne7mfAlXeBbLw72WSKvb1qvYvZPX9oCpHiGcTRny3yEnWA==
X-Received: by 2002:a05:6402:4391:b0:427:f2f0:607b with SMTP id
 o17-20020a056402439100b00427f2f0607bmr176409edc.45.1651785731286; 
 Thu, 05 May 2022 14:22:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3ef214da1sm1168160ejc.7.2022.05.05.14.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 14:22:10 -0700 (PDT)
Message-ID: <bf4841ac-0b2f-1640-f6dd-e12c75df6fe3@mind.be>
Date: Thu, 5 May 2022 23:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220504232752.4188723-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504232752.4188723-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ninja: add make jobserver
 support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 01:27, James Hilliard wrote:
> Switch to the Kitware(cmake maintainer) fork of ninja with make
> jobserver support.
> 
> This fork has tagged releases based on upstream release tags with
> jobserver support added.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  It's really sad that we have to switch to a fork for this, but no progress 
since 6 years, so I guess that's how it is...

  Regards,
  Arnout

> ---
>   package/ninja/ninja.hash | 2 +-
>   package/ninja/ninja.mk   | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
> index fd2c594a77..ecde199844 100644
> --- a/package/ninja/ninja.hash
> +++ b/package/ninja/ninja.hash
> @@ -1,3 +1,3 @@
>   # Locally generated
> -sha256  ce35865411f0490368a8fc383f29071de6690cbadc27704734978221f25e2bed  ninja-1.10.2.tar.gz
> +sha256  549c31ee596566b952c600e23eb9b8d39a4112cd5fdeb2e5a83370669176da40  ninja-1.10.2.g51db2.kitware.jobserver-1.tar.gz
>   sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
> diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
> index ab1941023e..bc84046414 100644
> --- a/package/ninja/ninja.mk
> +++ b/package/ninja/ninja.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -NINJA_VERSION = 1.10.2
> -NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
> +NINJA_VERSION_MAJOR = 1.10.2
> +NINJA_VERSION = $(NINJA_VERSION_MAJOR).g51db2.kitware.jobserver-1
> +NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
>   NINJA_LICENSE = Apache-2.0
>   NINJA_LICENSE_FILES = COPYING
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C68CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B50A8402D0;
	Sun, 15 Oct 2023 19:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B50A8402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeiDnGdI-jqQ; Sun, 15 Oct 2023 19:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79A13414BF;
	Sun, 15 Oct 2023 19:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A13414BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD74E1BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B270081DAB
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B270081DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvLk7nVQlzR4 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:58:54 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45E5981AA7
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45E5981AA7
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so6628180a12.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697399932; x=1698004732;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4adwKp9E1s6bzPp/1N7QKpY2/5g0mJsLs5o4O7NlN9s=;
 b=r7417uq1yf7RP/xra9HSZ0vT+o4OgluqxtTcLpQ5A61JyNoqmOIzOdVd/2jzo3YuuT
 aGR5ussGtx+2Z+C+lL7mQFx++iMjlEv1PDsgfJNHF6st0ZzWAV3q4HVbdDalYvXzuwb6
 w/KqNh2V9CdIgrZuIW9BBWP4gGW9tidG11oQiE8FJo3Ou3A+yveNA35u02jPUaVKr1xg
 6+Qp0CJbfxMGX9oL594Zx0DAf30kmnOytxu0d4tzRTQqd+V2eOe2yDy0AZSclGZeQ3VF
 wtUq817Ui10WfZusSMCmxPmPpQ2r4OMeQb4P6pnvCCCsONG6x9wju5yLp5AaKqxSHDtY
 eYgw==
X-Gm-Message-State: AOJu0Yx9fAthXC2BREHbepGbfQNaEino2UQNbYLZtaxptd+yu8lH3qcq
 Msj9ZEyW6mcjPFyj16zCr/TYvg==
X-Google-Smtp-Source: AGHT+IH15G6KWGmK4WUYETpaHF7uAACLCLeMOzwwoKgRLZyPu96GrpBSazmdr3/GEWiLvNqAZEg81Q==
X-Received: by 2002:a05:6402:1d4b:b0:53e:1626:f55a with SMTP id
 dz11-20020a0564021d4b00b0053e1626f55amr9273322edb.17.1697399932285; 
 Sun, 15 Oct 2023 12:58:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 er24-20020a056402449800b0052febc781bfsm7144596edb.36.2023.10.15.12.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 12:58:51 -0700 (PDT)
Message-ID: <e328ccab-44e7-9607-e958-49cf4e64f722@mind.be>
Date: Sun, 15 Oct 2023 21:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231015191508.735072-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231015191508.735072-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697399932; x=1698004732; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4adwKp9E1s6bzPp/1N7QKpY2/5g0mJsLs5o4O7NlN9s=;
 b=CRTd2R4G2Y2yJY+6PVdneGxE8LQzcFfNytluYeR7x9yH6WlsfDGHk5kvIZtiInTcJG
 un9IqFd2thZkkbYpfOeiVmULtXx+DVrTi//uD1trytqnTGV5XyIL5rS2jx8d0hJMQbfo
 9qdd4JrQyCOXepIK4DVOGpqXovvvCAG5++e8tjrBpLNmczdHq7/RiuSmaxGcuiiQ1flR
 O8EJPlH3uD9mzyZKOsP1sK3YEzrWeixR8e3x9LfxK7KkMkLObi65wf5gNVXyzQv9iLAH
 HbyZvctFDjbmCHPBPkjyeaPVT7BoKvIFAK6Nc/aP+TjINoW2GFao1Leav7Ee+7AlcNVw
 zTow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CRTd2R4G
Subject: Re: [Buildroot] [PATCH 1/1] package/nushell: bump to version 0.85
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 21:15, Fabrice Fontaine wrote:
> - This bump will fix the following build failure with libressl raised
>    since the addition of the package in commit
>    f8047ff5987efc80f6ead51edae126911c02a8ad:
> 
>    This crate is only compatible with OpenSSL (version 1.0.1 through 1.1.1, or 3.0.0), or LibreSSL 2.5
>    through 3.5, but a different version of OpenSSL was found. The build is now aborting
>    due to this version mismatch.
> 
> - Update hash of license file (year updated with
>    https://github.com/nushell/nushell/commit/a256f6d0d15c9fed69365be36b3484c4c8418d21)
> 
> https://www.nushell.sh/blog
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8b7e277bb67c52a57e7b9f17c30f1780b9c5ea67
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nushell/nushell.hash | 4 ++--
>   package/nushell/nushell.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
> index b553a6c2bc..02fc8214b6 100644
> --- a/package/nushell/nushell.hash
> +++ b/package/nushell/nushell.hash
> @@ -1,3 +1,3 @@
>   # Locally generated
> -sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
> -sha256  e189616e535e9f7bf410a72e6fc51ad1e0ae461c58d592e186c2669daa5d1e5d  LICENSE
> +sha256  94af22278f584b59c7c4b2390e2d15d9934d5207a756309259d1c4b92f5af7ef  nushell-0.85.0.tar.gz
> +sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
> diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
> index b9c1ee6434..779a3c4393 100644
> --- a/package/nushell/nushell.mk
> +++ b/package/nushell/nushell.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NUSHELL_VERSION = 0.76.0
> +NUSHELL_VERSION = 0.85.0
>   NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
>   NUSHELL_LICENSE = MIT
>   NUSHELL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

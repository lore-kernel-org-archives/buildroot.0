Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA3EC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F658143C;
	Tue, 26 Jul 2022 18:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F658143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K7KUvNowqRIM; Tue, 26 Jul 2022 18:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F7781447;
	Tue, 26 Jul 2022 18:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F7781447
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 804A21BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 668EF4092C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668EF4092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id liB--qb4Rdmx for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:55:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2B5408E5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C2B5408E5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:55:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so11872021wmb.5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 11:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DBuvuZReje1O11oZ3nEim8UbikjmY55WDBZKsl3LX6Y=;
 b=PFWp3GdNs05pybYEwR5IQfJUVj+c/3374HIyi+UXTKyBtwiysnCCbfueT6wnbtS4HJ
 2XZL35BfmC4u3dIwwhdxBkvynLxQ/0b2XexJvs+zjc2eSvBuv12ktR/98uOtN6GZL003
 /Uj1IVhSpMR8KMCrL5R2hJ0h9rlyR8NhxpNyaad0h1ManRD8kKTFIpPf+9lmHp6ugBW/
 cmug55dgprfUKvoz9ydNQOVp4PiuyVmICWVn5QDw+8L+G1t9UFcafgdxegDQzu+bK+RF
 +gFFqia9WLEhDL759ZxdChtZlnXMbDamDcUP+VdjWpwfsbS7h8yNxT5hHO+elmQSHWgS
 6GWg==
X-Gm-Message-State: AJIora/pga3L6BMe/4dT1LH9QezX2DTSG/6Ue/I9D8vfdv8bVLzgc7KC
 foNFQ44hfOmSvScq2I+JMUF7Mmc/mi2h+A==
X-Google-Smtp-Source: AGRyM1t8kuirm4peC5gf5tcNq5xCbmLba4GyUVjBzGqAoSH+5Yw9+0HTLKnihWAYtPbIMEs5soyeng==
X-Received: by 2002:a7b:c442:0:b0:3a3:bdb:e84c with SMTP id
 l2-20020a7bc442000000b003a30bdbe84cmr379562wmi.101.1658861743986; 
 Tue, 26 Jul 2022 11:55:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a5d4486000000b0021e47fb24a2sm15188544wrq.19.2022.07.26.11.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 11:55:43 -0700 (PDT)
Message-ID: <a6bc2746-d90b-f2c4-38eb-0d40250cbde1@mind.be>
Date: Tue, 26 Jul 2022 20:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20220726174505.2976048-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220726174505.2976048-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DBuvuZReje1O11oZ3nEim8UbikjmY55WDBZKsl3LX6Y=;
 b=FuDyyuZUOlvo+Ip+WRanHPN72MIy76q3hceBrILPZ74kijAm4FB+0jCARMFuVfeC9m
 r4sOMDySOEZIZOk/NqbFRE41+PDFztPItwl9GxPkPGTbtPpsJMB+Bu63C75CgRXYFCP/
 3S2hT7PNEal1C+7bs88XtnEZg3wUSbLeZ/eo7ubvLr/hwOI4nECjedpIEAAltTUaUKRA
 vV5lR7nmL8sQIhwNEOfVVy9BSB4TCUsao9tbii5zeoXeDFGZBVY1lEZ0f+F7VWvPR1jy
 XelYKR/ia3oDrOIWfe/OEzu3G0AFRz7rr1HFYr5D9ceHbktN2+saJ3FcWGM7PHWKa8mR
 IzFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FuDyyuZU
Subject: Re: [Buildroot] [PATCH] package/mcelog: bump to version 184
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Vincent,

On 26/07/2022 19:45, Vincent Fazio wrote:
> Minor changes necessary to fix building the package:
>    - Call out host-python3 in the makefile
>    - Patch genconfig.py to not use hardcoded python3 shebang
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>   .../0001-Use-env-as-the-shebang-target.patch  | 33 +++++++++++++++++++
>   package/mcelog/mcelog.hash                    |  2 +-
>   package/mcelog/mcelog.mk                      |  3 +-
>   3 files changed, 36 insertions(+), 2 deletions(-)
>   create mode 100644 package/mcelog/0001-Use-env-as-the-shebang-target.patch
> 
> diff --git a/package/mcelog/0001-Use-env-as-the-shebang-target.patch b/package/mcelog/0001-Use-env-as-the-shebang-target.patch
> new file mode 100644
> index 0000000000..ce9fc9c44c
> --- /dev/null
> +++ b/package/mcelog/0001-Use-env-as-the-shebang-target.patch
> @@ -0,0 +1,33 @@
> +From c6eee289225beccfc40c73d31baa4179abc5ac57 Mon Sep 17 00:00:00 2001
> +From: Vincent Fazio <vfazio@xes-inc.com>
> +Date: Thu, 21 Jul 2022 16:56:11 -0500
> +Subject: [PATCH] Use env as the shebang target
> +
> +Let the script be flexible when it comes to finding the python3
> +interpreter.
> +
> +Some build wrappers, such as buildroot, will provide a python3 binary
> +for use by scripts but it will not be at the fixed path of /usr/bin/.
> +Instead it will be available in a path defined in $PATH
> +
> +Using env as the shebang target with python3 as the command will follow
> +$PATH search priority when determining the python3 interpreter.
> +
> +Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

  Please include a link to your upstream contribution, i.e.:

Upstream: https://github.com/andikleen/mcelog/pull/xxxx


  Regards,
  Arnout

> +---
> + genconfig.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/genconfig.py b/genconfig.py
> +index a387cb3..48c1b3e 100755
> +--- a/genconfig.py
> ++++ b/genconfig.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python3
> ++#!/usr/bin/env python3
> + # generate man config documentation from mcelog.conf example
> + # genconfig.py mcelog.conf intro.html
> + import sys
> +--
> +2.25.1
> +
> diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
> index 598aa648fd..94b5f2cc37 100644
> --- a/package/mcelog/mcelog.hash
> +++ b/package/mcelog/mcelog.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e9c82b565da06673c2630f9e6bc668634ad7d2c7f13c70db1900cce110ae62dc  mcelog-180.tar.gz
> +sha256  067d52006f0aa42045acc6d9c04d590362448bacd8ef415d42729e6f35825028  mcelog-184.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
> index da7785ca91..6a0d806661 100644
> --- a/package/mcelog/mcelog.mk
> +++ b/package/mcelog/mcelog.mk
> @@ -4,11 +4,12 @@
>   #
>   ################################################################################
>   
> -MCELOG_VERSION = 180
> +MCELOG_VERSION = 184
>   MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
>   MCELOG_LICENSE = GPL-2.0
>   MCELOG_LICENSE_FILES = LICENSE
>   MCELOG_SELINUX_MODULES = mcelog
> +MCELOG_DEPENDENCIES = host-python3
>   
>   define MCELOG_BUILD_CMDS
>   	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

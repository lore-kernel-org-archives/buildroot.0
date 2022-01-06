Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2482EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 18:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD5D44294A;
	Thu,  6 Jan 2022 18:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Obj_8sRAVVwH; Thu,  6 Jan 2022 18:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CE542951;
	Thu,  6 Jan 2022 18:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8AFA1BF2F9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 18:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5919401CC
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 18:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1noRG9-uBO8A for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 18:03:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED1DF4019A
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 18:03:19 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e9so4868387wra.2
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 10:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k+WCbUF7QHrGRv59dUKIaciMj3/ENDYI+y822TnjG5E=;
 b=BoIRUc7KoK1a0QbdfgUaPxAoZDcGilGNgb9lZOybVJpySWpgBpGjFVxYDr+4m7iQF7
 nbO4zcJ57MyfgBrdoLqx8VHTuTKUSKb3JijXMLTlFDqsNlUwAso1l7OvH5pt98xvWSCs
 Aca78f2Snm7MP32vOBVjhGpP+X+rq9o8OeDBIPtrNL6Icld3RrdHIEeiI6A9M4IzgB2C
 H9ZSG6lYI5LBPoekIbzolvgJji6z6emGTdi5p5oM20pVxOVjZj6lDZwrw1t2h2B16E+J
 tf8tRm57ymidMLSplbofviV4T1SibO9bngCOXwSGQ3PP3stjkDE9EewiL77B8Zt6e/RU
 PIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k+WCbUF7QHrGRv59dUKIaciMj3/ENDYI+y822TnjG5E=;
 b=hVRGD1OKlepK4CQgNmE/moOvD/8TvrkIA3U5gMKDMDGZ1BuPkc2JuhMJK4u0vVQ9Cx
 3ro6BggOnXaP48PMiGX3Llf36jHibs7OWGEN/2mXwK/pIeH8xAknicCKhMKq+RPA4uUZ
 eI8avDHPmiHeoIg6kTKvRdTAROGudVayu5u2oK2UaIrbcQC3VTlyYcXmcccq2gEVfKSo
 BBLzkjkSJZNeRkj6PtfZ0t2pzJRltPToFJGrft+uPlUQ5Pi8qNPfjPSTnYRuDzSQiDF6
 0JCL4Umc4NER4rgG8M+1o79HWVle9Bik1/wy3s0SrFj/cxbEo1/CYS/GzCJ/1A0DiUOV
 r6UA==
X-Gm-Message-State: AOAM530n7lgi2zVZtquDbTKr/T0sbBCK3SRokh0Oq+nHGdSA0jLOAtTp
 LxYWS/yiLOt3ZMq09iuD3+xSLA==
X-Google-Smtp-Source: ABdhPJzgdnuZFQdbonkwrKPT9HBkLStmJvyP+uma9FjXXTDo4+1izjWuWchuiQgVv3RRuquMkXBEmg==
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr7424487wrs.692.1641492198048; 
 Thu, 06 Jan 2022 10:03:18 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id q14sm2638200wro.58.2022.01.06.10.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 10:03:17 -0800 (PST)
Message-ID: <5a11f784-6685-f33a-002d-654253e9bb61@mind.be>
Date: Thu, 6 Jan 2022 19:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2 0/5] Rename sunxi-mali-mainline* to
 sunxi-mali-utgard* and fix Mali loading
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2021 23:17, Giulio Benetti wrote:
> With this patchset I respin the first 2 patches. While testing on hardware
> the patches they work, but I've left back an error while bumping linux
> version to 5.14. The error is that Linux's sunxi_defconfig(used by both
> a20_olinuxino_lime/2) enables Lima driver, but in this 2 boards we want
> to use Mali driver, so when Mali driver tries to load(being it a module),
> it finds that Lima already has taken gpu resources and fail. So here I add
> 3 patches, 1 to add a Linux fragment to disable Lima in Linux and other 2
> to use that fragment in a20_olinuxino_lime/2.
> 
> Giulio Benetti (3):
>    board/olimex/a20_olinuxino: add linux-disable-lima.fragment
>    configs/olimex_a20_olinuxino_lime2_defconfig: use
>      linux-disable-lima.fragment
>    configs/olimex_a20_olinuxino_lime_defconfig: use
>      linux-disable-lima.fragment
> 
> Miquel Raynal (2):
>    package/sunxi-mali-utgard: rename from sunxi-mali-mainline
>    package/sunxi-mali-utgard-driver: rename from
>      sunxi-mali-mainline-driver

  I applied these two patches to master.

  Luca, your review was very much appreciated so if you could maybe review the 
rest of this series as well? :-)

  Regards,
  Arnout

> 
>   Config.in.legacy                              | 42 ++++++++++++++++
>   DEVELOPERS                                    |  4 +-
>   .../a20_olinuxino/linux-disable-lima.fragment |  2 +
>   configs/olimex_a20_olinuxino_lime2_defconfig  |  7 +--
>   configs/olimex_a20_olinuxino_lime_defconfig   |  7 +--
>   docs/manual/adding-packages-virtual.txt       |  2 +-
>   package/Config.in                             |  4 +-
>   package/glslsandbox-player/Config.in          |  4 +-
>   .../glslsandbox-player/glslsandbox-player.mk  |  2 +-
>   package/qt5/qt5base/qt5base.mk                |  2 +-
>   .../sunxi-mali-mainline-driver.mk             | 41 ----------------
>   package/sunxi-mali-mainline/Config.in         | 42 ----------------
>   .../sunxi-mali-mainline.mk                    | 49 -------------------
>   .../Config.in                                 | 20 ++++----
>   .../sunxi-mali-utgard-driver.hash}            |  2 +-
>   .../sunxi-mali-utgard-driver.mk               | 41 ++++++++++++++++
>   package/sunxi-mali-utgard/Config.in           | 43 ++++++++++++++++
>   .../egl.pc                                    |  0
>   .../glesv2.pc                                 |  0
>   .../sunxi-mali-utgard.hash}                   |  2 +-
>   .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 49 +++++++++++++++++++
>   21 files changed, 206 insertions(+), 159 deletions(-)
>   create mode 100644 board/olimex/a20_olinuxino/linux-disable-lima.fragment
>   delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
>   delete mode 100644 package/sunxi-mali-mainline/Config.in
>   delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
>   rename package/{sunxi-mali-mainline-driver => sunxi-mali-utgard-driver}/Config.in (60%)
>   rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
>   create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
>   create mode 100644 package/sunxi-mali-utgard/Config.in
>   rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
>   rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
>   rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
>   create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C920C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:59:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3591560F92
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3591560F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC97740777;
	Thu, 26 Aug 2021 21:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hO9Urp1sWrMz; Thu, 26 Aug 2021 21:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA8840765;
	Thu, 26 Aug 2021 21:59:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 825E21BF2B7
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C0361487
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwgsyj2TIsME for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:59:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFE1F606CE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:59:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n27so9454080eja.5
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5pLve7rSXn4eurojJybrLuAdgwsR01St69xNYuRUnks=;
 b=VGqtXiF2W0pvwRCyBWhFPamHDya/TKqH1gaDExodVNNkq3u4ZpejfCDlxsm41PAQb0
 POnMFGmumFdJv5keq1uZykEdyShUizvfhg6Bj+4Xhjs8sUWN0Nsx7sWnKzRfXc1ioORQ
 G0Tkcf0i1tPR7bf7NYXey3OnAail/9msf1rhEesiw+tRHS2ydIc+1/uhMSv0J+pL7Qyb
 pglK7ITo5x14p71+4oCrRygFY+B4btBq2ADW706OH9H341wM948Dfs61U7Rw3WZKlNzk
 SWM05rPv/3fWKFizn5UZz1UvXecFxtApkopG76kC3LPLFTSPKl2HHN1SmEM3lv+dPDIh
 SlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5pLve7rSXn4eurojJybrLuAdgwsR01St69xNYuRUnks=;
 b=oQuirUmOg4UxN7wZkdvfzz+/VLA5ipxgHDhZFlQqWluob/JsO6z/SC++sxa77e3yZc
 Pelh8NX/tTDAwYol7Q83knkREMHJgy13mf75vaOd8ncmhWMd3FkEGHDXyAcZDLTepT36
 bmrqRXDMS+aBQ8scTsrctgk+1ukw5MCChQjAdhTPzRZIIOmMtbKgQquMuYWwSGV0HPMc
 Ax4UtRrq9f/3UBkSNjoZR2wIXpfL0nFii0Ae9PK58TazBkVb6jgG8gzAT5HrgloUhyBh
 v2r9xp6yfRx2ySOtWma7cJ2e2vRiXlsQHerDD5htgVJ+/JarW1LiYLzC6osikaSGZBY2
 0mrA==
X-Gm-Message-State: AOAM533antrNjk4O6sxTvBL3WyxcMnmeENQA+vJsLAWg/nS53x/lZjiK
 wc0pdFqE8yIxHso47MILsjbIQYMLGQ0nkg==
X-Google-Smtp-Source: ABdhPJybtQcmRBBIyyDkF1L5YlRTIvmBd8XX/BT0Kuc6kWUmFlFUj5huk63BbPw8iLLkCaVzPGVq7A==
X-Received: by 2002:a17:906:d52:: with SMTP id
 r18mr6504046ejh.47.1630015156046; 
 Thu, 26 Aug 2021 14:59:16 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a3sm2377904edu.46.2021.08.26.14.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:59:15 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, Guo Ren <ren_guo@c-sky.com>
References: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
Date: Thu, 26 Aug 2021 23:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] csky 8xx toolchain issue
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 21:39, Romain Naour wrote:
> Hello Guo,
> 
> I noticed that the csky 8xx toolchain doesn't build with a recent compiler.
> It trigger an internal compiler error with the gcc installed on the host (Debian
> buster, gcc 8.3.0-6); Fedora 33, gcc 10.3.1-1; Fedora 34, gcc 11.0.1-0.3).
> 
> [qemu_csky807_virt_defconfig]
> https://gitlab.com/kubu93/buildroot/-/jobs/1535464974
> 
> [qemu_csky810_virt_defconfig]
> https://gitlab.com/kubu93/buildroot/-/jobs/1535464975
> 
> [qemu_csky860_virt_defconfig]
> https://gitlab.com/kubu93/buildroot/-/jobs/1535464976
> 
> The last know host compiler is gcc 6 from Debian stretch that is still used by
> the gitlab-ci builds. It was not noticed before because csky is not tested by
> Buildroot autobuilders.
> 
> Since csky is now upstream in gcc/binutils and the csky internal toolchain is
> based on gcc 6, it would make sens to upgrade to an upstream version.
> 
> Can you update the csky toolchain?
> 
> I'm not sure what we have to do for the upcoming 2021.08 release.
> Remove csky defconfigs and the gcc csky fork (select
> BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT)?
> Thomas, what do you think?

 I think removing things is a bit heavy-handed. Our CI is still passing, so it's
only people who really build and use csky who see the problem. In a similar
vein, I think it's OK to still apply toolchain updates for csky this late in the
cycle.

 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

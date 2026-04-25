Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D7EFF8861
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 16:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB92B610C0;
	Sat, 25 Apr 2026 16:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jVC-bi3YU1f; Sat, 25 Apr 2026 16:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F5A610B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777133253;
	bh=Lr3KRXuGkSBfciINIkLq8oqDXnt3+aAN437iAoAk3Ak=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/lXytr5Iv5p0yZH5qMu4FaAWSpQ9RvjmqdevnarMZYRyqSs/CAIHPvGqA3WhH7XW
	 PsL8EAI3Cme4QrFwHNTFtaIZiN6A9mQd2fvWqrY5/CWneLNLMNZIabysfX8nJ28o4F
	 c1P20zHTzqchR2whYY5FruT5l7EmDHYl9h2x6CzCrJqXjHHfw6a8fGAim9RKC/XDU2
	 Q1+FPSqpeNkKHGl5cylxVbHvSFsd0nFVPsqRZhhqS2BvIPvFLpLOoCfaiELAIWT2bM
	 jXWVwfRfdjZlejBIvn5hPlm41nRPAiuc7+tPxp99bHleUZwOq4oB6fmkJFGx1foDag
	 uU6v9aPPYhhGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F5A610B0;
	Sat, 25 Apr 2026 16:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE9E2DF
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 16:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B172540891
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 16:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWcfTB6YMlzr for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 16:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=maxin.john@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A651C4084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A651C4084D
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A651C4084D
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 16:07:30 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-38eab6cf7d8so84533781fa.1
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 09:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777133248; x=1777738048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QMTxiTJdR5wB7ewz5iVK8553DRmqCUPpDVzzjcXwFbU=;
 b=UvSAphrqRmh52bR1zaXUbH7mhWpUVnNFiIMYU1tgXUnxuaJmVyZNyxlHvXLBnOnqbh
 F6VRtzINd/vttcZtzwptar1/5PggIbklTJXPx/yhjLdqF4vzK9mo2shGe2hJz4PPxdxG
 8dZPbTaT9+iw3UaMKH5BVV7PF1KtmmgQTTxv7wQHIbR7gVGOMHkAlwaxGRA2D8aei2ug
 2mMBK61bgnEqC7fjXSYLj1VvXGkfwuCFt2q9OQ6eaEp/j93U8O6pFdsfkyOh+dWYIMUP
 y4cw8eYvAo3jn+NSbGycoApbWyCjhFi3TCC1Bknls1iS26K5myPTG2P5z34hrKvgau04
 MZ6Q==
X-Gm-Message-State: AOJu0Yw6ejiY7k/bUNIySUSboF6LVeP7w8ry6G12KPr9cCBjhBcdZppm
 n/P1yWzC7xhQQbrggrfLo4d6ycRNTKluuREgk6qWBvvem64RPWyygJfM
X-Gm-Gg: AeBDies5p2QI3Gta4pVGl/OkqZgvd+mKucUngWSCezes0hn4LL6BgaY/kHnvqbBfGCk
 Eneg1hjlOMgEN3O8FDiHWP5LUTs/JrT6lqmjrkfk1XMQjCFahHKWqaH3vI0UB5xEtAZfGRIqMeU
 eIvH55BowWV6R0p22bba7ZeHvrMWhRYF5nixwG2+Z0Z63Mw4FChmwuujVZNhhwuU8qSWlQenbCc
 YIyx9DEI98M8psOsTtygynEs7khK6FJxRullKSMjJPCRMptm4z9FJZ0pCVq9evkw2GCQ0KnUr8d
 7QjLs/iULJXWykOI8csXOuiOOqdSry4z4srOZi7Ol7WSMkEUWcf4i7jRsLUlDS+PDwiKvzfMhrK
 UHibWY6nr5BTfW/rX/nPXSsF7OKyyDgafgNS/aeuWDXSr/5bS/zmtvX7HHD7Iqj99bnjPIbmXJH
 UnP8h0GozB31r0W7SQ3ChXDZLS6XWNrO2OcQ6wSi5mncLIuEY5BkWi3VdxjCG5jdG5JeRh6uSLY
 JWNoX0Ky5Yh
X-Received: by 2002:a05:651c:41d7:b0:38c:6b42:3d77 with SMTP id
 38308e7fff4ca-38ec780c22bmr114477731fa.2.1777133247879; 
 Sat, 25 Apr 2026 09:07:27 -0700 (PDT)
Received: from Thor.home (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi.
 [2001:99a:a58:9b00:9119:221d:45f0:de83])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb75e67dsm56835631fa.40.2026.04.25.09.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 09:07:26 -0700 (PDT)
Date: Sat, 25 Apr 2026 19:07:24 +0300
From: Maxin John <maxin.john@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aezmvPtlpAFdf8Ub@Thor.home>
References: <20260425062705.74982-1-maxin.john@gmail.com>
 <0459c13f82431b7c833d30f3147b4578@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0459c13f82431b7c833d30f3147b4578@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777133248; x=1777738048; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QMTxiTJdR5wB7ewz5iVK8553DRmqCUPpDVzzjcXwFbU=;
 b=JdavCtL82lAzXhW1sdbgeb37rWVzp5eVi25jQf3U2KNPWy35s+1ofAloy6kc2WnIVn
 ECeQjTAVbAOpqrO3w1oy9hPOtODLRVKTIfBwXZ72LobSGvWahFhjPDb7dIwtD6QufU1V
 Hxqe8QpDLWt0SW65ZyZSleF8jZ+bQK2es8CCNBFur+j5W7lRulz0Yp9YSNs5p9kiDE8l
 0YEUnYN9/qlUanukRPzY7AtpOCVwyh8NOzf+SWOT0WpK77aFZN+iNumi1ZmmijbzR4V7
 ZCKsywSUNjvbbJIqOTlYQW8kTp0d7Eih8KK+Q/fUq3v0owc6Zw6GB2x0kQ/XGojmyzZH
 Mwkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JdavCtL8
Subject: Re: [Buildroot] [PATCH v2] package/mdadm: bump to version 4.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sat, Apr 25, 2026 at 02:07:47PM +0200, Julien Olivain wrote:
> Hi Maxin,
> 
> Thanks for the v2. This new 4.6 version is introducing 2 issues.
> 
> On 25/04/2026 08:27, Maxin John wrote:
> > Drop upstreamed/backported patches.
> > 
> > Release announcements:
> > 4.6:
> > https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/
> 
> First, it breaks the mdadm runtime test. See:
> https://gitlab.com/jolivain/buildroot/-/jobs/14088239652
> 
> You can reproduce the issue with the command:
> 
> utils/docker-run \
>     support/testing/run-tests \
>     -k -d dl -o output_folder tests.package.test_mdadm
> 
> This new version asks a question and blocks the test.
> 
> This commit should make sure the test keep working.
> So this can be fixed by passing the answer to the question.
> Adding "--bitmap=none" to the "mdadm --create" options should
> fix the issue. See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/support/testing/tests/package/test_mdadm.py?ref_type=tags#L72
> 
> Also, this new version breaks with toolchains with old kernel headers. See:
> https://gitlab.com/jolivain/buildroot/-/jobs/14088277312
> 
> You can reproduce the issue with the command:
> 
>     utils/test-pkg -p mdadm
> 
> This is due to mdadm upstream commit
> 71574efb077131701b3da874df0045f259ca3448
> (in mdadm 4.0) which introduced a usage of MD_DISK_FAILFAST but was also
> including the definition. Then upstream commit
> f5889f9a1b8753a1472dfef9d025da2bae395239 (in mdadm 4.5) removed the
> usage of those local definitions to use the kernel instead.
> So mdadm has now a new requirement on Kernel headers >= 4.10.
> 
> The bootlin-aarch64-glibc-old has 4.9 kernel headers and is now failing.
> 
> Search for "BR2_TOOLCHAIN_HEADERS_AT_LEAST_" for examples.
> 
> Could you add this new requirement in Config.in and the explanation in
> the commit log please?
> 
> > 
> > 4.5:
> > https://lore.kernel.org/linux-raid/CALTww293wnLE2+eZsZ42oyNZhS_cc2agB4GNqTz8j3xiP0ALWA@mail.gmail.com/
> > 
> > 4.4:
> > https://lore.kernel.org/linux-raid/20241213121438.7ed6a0fd@mtkaczyk-private-dev/
> > 
> > Upstream mdadm project has moved its primary development to GitHub:
> > https://github.com/md-raid-utilities/mdadm
> > Updated download site accordingly.
> > 
> > Signed-off-by: Maxin John <maxin.john@gmail.com>
> 
> Could you send an updated patch addressing those issues,
> please?

Thanks again for the detailed review and pointers. That was really helpful. I
will send a v3.

 
> Best regards,
> 
> Julien.

Best Regards,
Maxin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

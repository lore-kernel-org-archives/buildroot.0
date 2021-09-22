Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920EDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 16:01:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067576112F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 16:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 067576112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9539740104;
	Wed, 22 Sep 2021 16:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HG4olviY6Q21; Wed, 22 Sep 2021 16:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8F724011D;
	Wed, 22 Sep 2021 16:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 981261BF3AF
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 16:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94CC24156F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 16:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFP30nCHufEp for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 16:01:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89D85414CD
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 16:01:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b15so13351798lfe.7
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=5D6rICVioZ4zLIafePNepxL5w9Pg2c4/IM1NK9JWwss=;
 b=FrPUUhsL2V+ytQHAl+PZLFqH4OAN5JDx+BY459fQnzQQ7StfuLpxEtw8tLGoZ13KGd
 /cyfCjnBDO/hdTBECOf46Z2bU0zsqOqbciaBvwQP3YVGEcekRLPH01zCHKtOzos+d0eW
 163Cjqkq31gdVKj0pjCG2eawKIKsL0Ro+heLgaVQrFOJ3ABSsAiayM/zitkgoAeMwV5j
 MYB90Ua5Ys8aJ9cv6cGbxhDyxTQVNXy6fR+B/t1SxN06RP+1YXgzQQUZ9n+t9qauP1x2
 11AtP9XYjYHQVSfku7wEkCuv/dYHP4vabh7yZwDKSmNSvGzvKdfiYUB5tWXxnh1d2f69
 dvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5D6rICVioZ4zLIafePNepxL5w9Pg2c4/IM1NK9JWwss=;
 b=vBDGXctxUe1topbprnJoKZU7P2rI4fbpckpZqpmtjBgBp21Q1lZ/+7nZkXAWPBkBIS
 TkqklT7YcV3ue+SD1DxHJ6ckEENj+N2Y/gyMZhOPsEh1uvNvGUk4u6mZW6lBORxSOheG
 0MQDRfYphW6CbOkOg2x3xAHtl/6UYikCUXzEOm6lXQOGj3ANgBqOZlc1MYBDpVXOtyph
 eccRPvnSgvDJiBriSBdFXn/Zyv+OdxgfzOC8UdPLI9ZrI+PtfCRrqdqx5HeTKNndEnfU
 TOfqtAbof92fvbayj3OxK40VvqTA/JfdCoh6e8vbLrr7YxvV958iba0pmagAtByRRPTN
 mEXw==
X-Gm-Message-State: AOAM530dbbgw2PfZ3qQ93huT0uSFrJBIM7eH00pkD9DWj2gYjnJD0yK4
 aAAyPRbsb3EugEPBtalCH2Pfw5kTb90=
X-Google-Smtp-Source: ABdhPJzLPEqj4hMs9ci47I9JWXJs8oj/4AMJq1qTugu0yt+mKls9SRfiy0zXEqXXFbBtsySTWngaIg==
X-Received: by 2002:a2e:a447:: with SMTP id v7mr273100ljn.349.1632326370024;
 Wed, 22 Sep 2021 08:59:30 -0700 (PDT)
Received: from wbg (h-158-174-22-41.NA.cust.bahnhof.se. [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id j24sm206869lfh.302.2021.09.22.08.59.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 08:59:29 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
In-Reply-To: <20210719093815.2017764-1-troglobit@gmail.com>
References: <20210719093815.2017764-1-troglobit@gmail.com>
Date: Wed, 22 Sep 2021 17:59:28 +0200
Message-ID: <87y27o38kf.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 0/1] Add support for teamd/libteam
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>


Hi,

sorry for the ping, I know you have a lot of stuff on your respective
plates, but I'm starting to suspect this has fallen through the cracks
over the summer holidays.

Best regards
 /Joachim

On Mon, Jul 19, 2021 at 11:38, Joachim Wiberg <troglobit@gmail.com> wrote:
> Hi everyone!
>
> Third time's a charm, I hope.  Here's the updated patch to add support
> for teamd/libteam in Buildroot.  As mentioned previously, a few musl
> libc related patches have been backported from project's master branch
> at
>
>     https://github.com/jpirko/libteam/
>
> This time the Config.in dependency handling is actually fixed.  I did
> not really understand it before.  Huge thanks to Yann and Yegor for
> patiently explaining it to me!
>
> I've also dropped the previously selected team modes, as suggested by
> Yann, and rearranged the directives in libteam.mk slightly.  Could not
> find any official CPE, so used the package name, as other packages do.
>
> Basic tests still pass, and as of v3 br-arm-full-static is now skipped,
> as expected:
>
>     $ ./utils/check-package package/libteam/*
>     199 lines processed
>     0 warnings generated
>
>     $ ./utils/test-pkg -c libteam.config -p libteam
>                bootlin-armv5-uclibc [1/6]: OK
>                 bootlin-armv7-glibc [2/6]: OK
>               bootlin-armv7m-uclibc [3/6]: SKIPPED
>                 bootlin-x86-64-musl [4/6]: OK
>                  br-arm-full-static [5/6]: SKIPPED
>                        sourcery-arm [6/6]: OK
>     6 builds, 2 skipped, 0 build failed, 0 legal-info failed
>
>
> Best regards
>  /Joachim
>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
>
> ---
> v3:
>  - properly fix dependency handling
>  - update package comment, depends on mmu
>  - rearrange .mk slightly and add CPE vendor
>  - update team kernel deps
>  - drop team modes from kernel conf
>  - update help with info on team modes
> v2:
>  - added missing libnl deps in libteam/Config.in
>
> Joachim Wiberg (1):
>   package/libteam: new package
>
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-revert-disregard-current-state.patch | 51 +++++++++++++++++++
>  .../0002-fix-build-on-openwrt-musl-libc.patch | 41 +++++++++++++++
>  ...3-increase-wait-time-for-daemon-kill.patch | 37 ++++++++++++++
>  package/libteam/Config.in                     | 30 +++++++++++
>  package/libteam/libteam.hash                  |  3 ++
>  package/libteam/libteam.mk                    | 24 +++++++++
>  8 files changed, 188 insertions(+)
>  create mode 100644 package/libteam/0001-revert-disregard-current-state.patch
>  create mode 100644 package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
>  create mode 100644 package/libteam/0003-increase-wait-time-for-daemon-kill.patch
>  create mode 100644 package/libteam/Config.in
>  create mode 100644 package/libteam/libteam.hash
>  create mode 100644 package/libteam/libteam.mk
>
> -- 
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

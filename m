Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6A8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B4360200
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B4360200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B65D4403B6;
	Sat,  4 Sep 2021 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AmeJqOURjNr; Sat,  4 Sep 2021 20:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00093403C8;
	Sat,  4 Sep 2021 20:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29E7B1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2626D80E1B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkAt1p2_toMG for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:36:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C0A280E1D
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:36:37 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id me10so5089132ejb.11
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=drCeOKms1eLTz6XGRUTPVv6dHRf4Q96qtH1BvbAUn2s=;
 b=TWsmF1E+7MzwCpVZz8CgWekNHy1zVWBy+aA12uesUb1GdAIZKLcQKu6wIMO9IGLgcc
 1nD53DjUyVNrZuXDctFUnCEMmKFZKbUzROmdXySC/+eevVUFTn8g9hB5g7gXHcVASnw/
 JIi89yFHzcpyhBMY+OLeKxkczwxI8W5Acxe2NEboMRBT9BInSOnedYhhggR8juydBCkL
 bi+NW/+ThNBHUimwQYWG4A3ij5JY66TjWmhDyrSAhmMkIrFqBJ2EM8f7BXRo1YD9QzWn
 yCftLUR9l2D0VftRhRt52j4hhVYSyyKtRR3LRNaczxm5GJCqgYjfjSGimK8WXmnJhfP5
 OkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=drCeOKms1eLTz6XGRUTPVv6dHRf4Q96qtH1BvbAUn2s=;
 b=PLko4gjoMyLPVUYvqGQZCG/yj3fWgUXMH1hHZxeNHRJ4GWHZFClSW3KK30r9V7ZxkG
 L58HUOfox+He4Jqdciv2ZO8m8CGi8bmPL9kG8n3uD6BMaZKe3Qa0tRLE/UZtW1E2aF2M
 MG8cpO5vc8FnmIBxL7KL11mVyfZVespf09/17dvweiFbwefWf+Bsg4Cx/0WM18Cd7QCy
 /zEzxB2wAPUgVssvJGqNpywdZXt8GK7D6qNQ+i7sEtlR3e81dHYsRDHcYj+IvTAQJAyi
 dDYAaT7n484oSkZ3UG75x0IM5y5CQr5hYKMTwRYtahibsi3Fyw9AJnpjEsw7+WUqEYx7
 dYwg==
X-Gm-Message-State: AOAM5318JtK4B9565tpVH6SidHOKB+2pc3f9+it+yXYN9j7vbFryt/Kx
 H4kjXw0q40iPqbXv5QtIW1b6JNpdObE=
X-Google-Smtp-Source: ABdhPJz+VPJF9saBNI4ArFO3Mlxp2dssj4CDk7EaWvgSJ5r2piWpS5w4NelflNyvCC513WckGBpGvg==
X-Received: by 2002:a17:906:6c8f:: with SMTP id
 s15mr5788653ejr.52.1630787795658; 
 Sat, 04 Sep 2021 13:36:35 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x11sm1833243edq.58.2021.09.04.13.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:36:34 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcOw-0005Br-8Q; Sat, 04 Sep 2021 22:36:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815123746.1389936-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:36:34 +0200
In-Reply-To: <20210815123746.1389936-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 14:37:46 +0200")
Message-ID: <874kb0nkml.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/terminology: set eet path
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set eet path to avoid the following build failure raised since bump to
 > version 1.9.0 in commit	6ac557a54bb4613e79728ad96724e7681c9c3c18 and
 > https://git.enlightenment.org/apps/terminology.git/commit/?id=f15dd2881a5e87e7f3b03594983826f7480c12e7:

 > /home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh:
 > 30:
 > /home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh:
 > /usr/bin/eet: not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/767acf73e4eade48cd3fdb43e9dd599ba7ef9661

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

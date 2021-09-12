Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C262C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:40:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A104061051
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A104061051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D02980F91;
	Sun, 12 Sep 2021 18:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSvq2ejWhO-S; Sun, 12 Sep 2021 18:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F4180F8A;
	Sun, 12 Sep 2021 18:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 393311BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 273E4401CA
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmI5AWwnHkWW for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:40:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC0DA4012B
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 18:40:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ho42so15983887ejc.9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=KW+Ztn5ardXKOh8AWGN84118oG1dNNNzHV0d7YRhTos=;
 b=iWI8ZaAfvyWom5QZzuffxsE+JURcaeSDF7Zvy1zZuVPywdfgvsqt6h104kcdBnSBnY
 nwUywLKi2Gb+5W6+rGE1S2+NShKEczWknMVS/ooorC540CO027omEc0l2brXM6kjm7Pq
 rzWAEhHK6SggjXtTNh0nVWxQCnIU2/hxZ/2eocQg/PCld/yXvRGrjtFA/vgS5kvuKtPi
 pYyF/qy2Qj+QNgNs4VAQyMA/MMz3UqMnhnZFfi4r99DaTXp1qg2AJUyXCR3MQyzdt1vG
 TTqDPCrP1BJVP556cFp6znzj5oyFmpCG6VAp2AOiHP8uFogBmUwWIhSZc668Dlpt3HUV
 vV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=KW+Ztn5ardXKOh8AWGN84118oG1dNNNzHV0d7YRhTos=;
 b=p0ZWzIiuIVQe83oNVFL++uLcFapyKmnjtCXIabZ5O3xLQOPJxlKusrAtnlANfOpBOL
 H8f3Z7Ox94hTvexd0JB3DONLg4hl1EJ4BqKu/ZJR1iZe/wgm6vKMurWCALwX8RgfKTgW
 b1+OEfiNjZkxRo1h1hGlwfQo9THoxoDPo6Z5812V9FP6D1OBGMG1dqxCr0+EQznz9JRh
 oAsfaazsfyWZAXv91PSjIIT20rUgxgNvNcJCxYFcmHRS8mJSf5ORFejpUHyB+Sss82GA
 yNE4wA8IT6dxoNyDUikfFwwcgFW086cT+fV3ln31M/tJcgWfTQPc0PLdP2uyFdgI26oM
 CFTQ==
X-Gm-Message-State: AOAM5303/JIyOA+tQMZIDDELDzOitRrUUcePKG+qS7wMquhCvt3HGXXT
 Y2BC3iYIh3vm8GgTXz9bI/oydH8D+ho=
X-Google-Smtp-Source: ABdhPJwAd755FIbo/dni54ANKEeqH+J9bqxFPRCbys6oXmZq4M/yR28oRdqVxvvSgt8F8qC9wtIiGg==
X-Received: by 2002:a17:907:76e7:: with SMTP id
 kg7mr7293336ejc.344.1631472051056; 
 Sun, 12 Sep 2021 11:40:51 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u11sm2480340edo.65.2021.09.12.11.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:40:50 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUPI-000197-Mn; Sun, 12 Sep 2021 20:40:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
Date: Sun, 12 Sep 2021 20:40:48 +0200
In-Reply-To: <20210910065532.31730-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:28 +0200")
Message-ID: <87tuip4oy7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/x11r7/xapp_xrdb: bump version
 to 1.2.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-August/003107.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

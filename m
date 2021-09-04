Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E87C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C0360F3A
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47C0360F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AD1240205;
	Sat,  4 Sep 2021 20:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJtx4D-eJtRb; Sat,  4 Sep 2021 20:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32FCC40167;
	Sat,  4 Sep 2021 20:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 708FF1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB1C404C4
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BKiEGLKpl-8 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FBEA404C0
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:51:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id h9so5179580ejs.4
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=nD4XGH4Nldo/HnM0oyKnEEm1xFH+TUcxhkiFTx0n6a4=;
 b=AOWbmyjeR5ZLSQTH9XCVCUKW0cj6EqJzd8BxALpibTBVkOGPIkuXuVYzeiOvllY4eu
 WV4FL7313BhP8JqlDBXM86Rl/+rUoyjDo36bO63l3IBpqQ4M8mGbxlYVjfovPpCDBwr5
 SXlhsjhouz0kLWXRFyRgG3ow6zaFbX6eMZ/Rg51iE6/NCe5EVVk56km58za2T/hdJiOW
 g6v7QFIMWiL5cw+eaNRscbwLc6NiVjRagf2/j7CROYX+S3AooJjciZuLiZmRzNh/t8lu
 JdfY3fWnXuvzeNKG0ScQy92mXmWjbRJT6YlPoSSGY8ZQbCE2EWp52U9IAoLMTcDobqqN
 s/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=nD4XGH4Nldo/HnM0oyKnEEm1xFH+TUcxhkiFTx0n6a4=;
 b=bqqGl97bepXnr5/JbaTOJVHzCY8LI/YKneEzl0MKrcLiGJwzsjfmeAwst3EchQaEjp
 ip8i9KA6yqABVvf6/ewSavxNHPklqnhT/GOE9DEek67WvYwBr38uIZzGCbmQ9ReJ7+vm
 b+zG6l+Oo8wKjIGaB3cXeOpfR++ObeVhJxO2aKXIPzGuTbNf+A8BmT/RtxF6UbDTO2WN
 x6rve6AyZcN8EFlEo030zK/TTMUE2sSAK3UtGiJYBz/ZRH67Io1wQCH3aWwqo+MQb55v
 6C95Wp7okTbMHq4ZXNdDkL8GtGCaHBeV2PFZENUpyRuRlFpgNaoTsRuGrH5SdRw3n4rt
 ae0g==
X-Gm-Message-State: AOAM533kh+hPXOFIyJeaaiSbOH4cmr9Uo12ialG3xz/e75ja981jM+T4
 b+lPIGTFPZPeumwxiXUCaYtJxiERaEA=
X-Google-Smtp-Source: ABdhPJwEpUhK+Irq/XBuyornto7nwutCQ2Zy+z8nI3FHN0mnsYSzzgCSEzidqHE5HArx1a3fHnGtkg==
X-Received: by 2002:a17:906:3f95:: with SMTP id
 b21mr5623460ejj.368.1630788680472; 
 Sat, 04 Sep 2021 13:51:20 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 w3sm1841169edc.42.2021.09.04.13.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:51:19 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcdD-0004Nd-5Z; Sat, 04 Sep 2021 22:51:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20210816224237.983048-1-christian@paral.in>
 <87czqc7e6l.fsf@dell.be.48ers.dk>
Date: Sat, 04 Sep 2021 22:51:19 +0200
In-Reply-To: <87czqc7e6l.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 17 Aug 2021 08:55:46 +0200")
Message-ID: <87r1e4m5dk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.16.7
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
Cc: buildroot@buildroot.org, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> go1.16.7 (released 2021-08-05) includes a security fix to the
 >> net/http/httputil package, as well as bug fixes to the compiler, the
 >> linker, the runtime, the go command, and the net/http package.

 >> https://golang.org/doc/devel/release#go1.16

 >> Signed-off-by: Christian Stewart <christian@paral.in>

 > Committed, thanks.

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

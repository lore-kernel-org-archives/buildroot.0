Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A36AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F4160E8D
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4F4160E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99113403EF;
	Wed,  4 Aug 2021 12:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGjGNpE8TaWg; Wed,  4 Aug 2021 12:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B67024010B;
	Wed,  4 Aug 2021 12:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3D71BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD3CF83B46
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZlG9j1ufSs0 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49F8583B3C
 for <buildroot@busybox.net>; Wed,  4 Aug 2021 12:31:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id n11so1115148wmd.2
 for <buildroot@busybox.net>; Wed, 04 Aug 2021 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=oEv5/w86+M5qJPy6G3iaZdsgqJiSvV2CfpSkDB3SO5E=;
 b=bC8qHCFTdIEk4crDVP9NIBtDp0VohLXsyYaHKMLxnTsWqFZrSImLsFr3rzODdtVle8
 d6lxmB4f/pYHGGvjXvVuGh+4lcrhb3myq9WSwr2OQgmj8o314UbsRWpISj3ylVrKjmJ1
 jIKVWNTAphjIrD8ilugPaxCQweS9dwFaELgFhsvIxTnK7pDDvI929/jjgnsoTXam0LsF
 gKjfirRxAouhUW5hwjVOciQjGb8OYtr5J4aoMFAGDJtDHlHAt7xQQt9ZS9DkPEPp8a3G
 WS7tUqZ4WNZLKwc9IbWUCUzUqOc2bRtHxWkzteQYydaRjgXyIKYA8Kqsc9BVVVu1sBVm
 /tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=oEv5/w86+M5qJPy6G3iaZdsgqJiSvV2CfpSkDB3SO5E=;
 b=Vygf1BW1Lewpo5DcwkiDh8RdCsKv2LJrvHOo+npYQNGbCM9/F7oANp6NvajkmQ6jTp
 C3HMYEg1uagbAoyN1zQ/VF3VrEd70ARa4aUYK4efGcv4iojGtAFAGzcymqhev3T2tjyz
 QCR338WHgCMnwrrwLg0N3Kw0HG3NAuFH1UH4fv4JTnnUtU7CYEG4sl5pRsWy+mXGssyD
 zyJnxp2kftUo+hzgsVw2CJInRHh74cFs8e9fUTnCP8N6tOLucmqu0ojejxAfPcElmQvI
 EZyaBQedKFFyL/Ka0nzcBja4Om1QTTnmDT2GT0x6IX9DKaNv9Bo6idvsKuYkArmwxfhR
 CWrA==
X-Gm-Message-State: AOAM531TaERbCqxI7ZTCdYOV6bOdDkmbFEAbIWDlJ1tznBKVrhzkJd6a
 cIoJd+XjpOB5X1ZqvIu6KJE=
X-Google-Smtp-Source: ABdhPJwpVZhDhw/weLdBnxWcwRDWqgZG5BdSGnn0Qjf+gJSWhSNw8WWtqdz7FVtOJYPRGfiJN++QGw==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr9463975wmb.156.1628080314504; 
 Wed, 04 Aug 2021 05:31:54 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n5sm2060571wme.47.2021.08.04.05.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:31:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBG3r-0001yz-U6; Wed, 04 Aug 2021 14:31:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Geoff Levand <geoff@infradead.org>
References: <cover.1623643496.git.geoff@infradead.org>
 <911da07d-394f-f598-fd38-d8c60d587bc1@infradead.org>
Date: Wed, 04 Aug 2021 14:31:51 +0200
In-Reply-To: <911da07d-394f-f598-fd38-d8c60d587bc1@infradead.org> (Geoff
 Levand's message of "Tue, 22 Jun 2021 06:45:26 -0700")
Message-ID: <871r79tmq0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/flannel: update project URL
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Geoff" == Geoff Levand <geoff@infradead.org> writes:

 > Update flannel project URL.
 >   from: github.com/coreos/flannel
 >   to:   github.com/flannel-io/flannel

 > Signed-off-by: Geoff Levand <geoff@infradead.org>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

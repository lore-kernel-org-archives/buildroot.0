Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31FCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:28:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE4D61039
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EE4D61039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F09B401AF;
	Mon,  6 Sep 2021 12:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gb92W0PpVXwU; Mon,  6 Sep 2021 12:28:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89FE40182;
	Mon,  6 Sep 2021 12:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA1F1BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ECE2607AE
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lo4ZkKI3m6P9 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50C2E6061C
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 12:28:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s25so9384304edw.0
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=n2ww9WGt2+A/cXUKUqgc9dHMNMTw+Yu8uevAcFrEIAE=;
 b=l/MrhXoKQhzXOl+002m8mQtow8OMYH+GsLT5d+m8vUPTOuRYg9BdzKAaSAPBOUZ8RI
 XDtzPd5nAxdjQ0MmQof/DJoqWBvA7aBV1rT4UnEEfn3c2uXCYnVStFKpLIvoKSCaDobT
 x4mwAHLud6GMHGSutsAGYuy3iGyELyYxWQ7wgpfjFO1Lybr9SoTkAtsBjWMElPNIpHeb
 zAEY8PkitQAdfqiCwegog2Fd+FFYWCdjvB8xFHB6Tau5sCw2ClLU1bpLj+O+LrKQx1FT
 PIG7KqXsFA4aMO+dgaE8fxagZsHSdliq4dk+6c3THKBXZqTOmFey/o9WqR/UdJG/c4c3
 ksSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=n2ww9WGt2+A/cXUKUqgc9dHMNMTw+Yu8uevAcFrEIAE=;
 b=kdP39MvfFEHxDPdUXUa6U4jIYq2UhFy1qQ5lzeQuQkj7JyTr3i6yzNSux+4FEXpUYe
 T/UlkDFpAV7v19LldSaKvyHrku5RFupktaSWLZMA2yn21EQzDRM+lzaP62bHVGIe06bs
 bA1su8gR4FUoxX9HD5MUFFabyKrpT3qFSrmsCxHVIC8tY171gkAzcUnhDnG7vjClM6W6
 XXrXEmmbKhr8XuTeUFbetFzPT/JjNodl4aN4fVuBOAGDBULhydA5Kd/4fSJA/gQK9EpA
 tGv1MbvS/nCy7RaROMmqiBZ5eUPK2OPoWntezfOKdeiwnqzQgiIK3Zo64tySBrqflnE+
 YuHA==
X-Gm-Message-State: AOAM532wCRDYHT/Yre80A00Nino/3YQ/1v4DCQPq808P49Tx3582EuJC
 YTlr508JrLuMokd5rRfgqfU=
X-Google-Smtp-Source: ABdhPJw2xm6Ti26lXd2B8u6JIK4tsBPhHJQQim/s9rsKt89RYZBGZj3nreQHfDdZErcbjmVL/rDwAg==
X-Received: by 2002:a05:6402:49a:: with SMTP id
 k26mr13336786edv.279.1630931306607; 
 Mon, 06 Sep 2021 05:28:26 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 bx14sm4586916edb.93.2021.09.06.05.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 05:28:26 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNDjd-0008Gk-FA; Mon, 06 Sep 2021 14:28:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210819152458.1aedaae4@windsurf>
 <20210819154155.1570326-1-giulio.benetti@benettiengineering.com>
Date: Mon, 06 Sep 2021 14:28:25 +0200
In-Reply-To: <20210819154155.1570326-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 19 Aug 2021 17:41:55 +0200")
Message-ID: <87r1e1khw6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] DEVELOPERS: add myself to toolchain
 topic, and to binutils and gcc packages
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Since I've dealt and deal with toolchain bugs and their work-around very
 > often add myself to toolchain topic(toolchain/) as well as
 > package/binutils and package/gcc.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > V1-> V2:
 > * correct alphabet order
 > V2-> V3:
 > * add myself to binutils and gcc too as suggested by Thomas Petazzoni

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

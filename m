Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66775C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 20:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8113D61051
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8113D61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C3680E26;
	Tue,  7 Sep 2021 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7xu2X_TexUQ; Tue,  7 Sep 2021 20:49:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7742380E48;
	Tue,  7 Sep 2021 20:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342301BF332
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 20:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 308F480F3A
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 20:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbwHZUvx8mPX for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 20:49:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F237680E48
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 20:49:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mf2so737056ejb.9
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 13:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=J58H9qPuBUJZgJAymmcF6xoHTWeKdpFYtW+H39dHsG4=;
 b=SjiE/k6QJxv/JVtsHO7WMygotnqjGgPFe12msBhkqCiAJtfHNridsNe6/wxgZN2Hx2
 MKMOn7TxhkdO7QPO7OwOee35rP1jmb/uY9Q1d0gri703D8S7vnDVCDW4+eqdLxus6DDZ
 z0DmQwJglcsTdVvY3VAOynYqZNwVZNqFriR3VHpNkbHi1OedoA4YSs96KUksJZAiMZeG
 y5lJn4X1m8m5PO8w1le5DAEzFvL/t69VKxdUlzn3mQ02U7KCP0ZPpigA+NPMY8PSAv75
 3f6r+tSmNUVBtxJZ47AsRp9fKmVcspwO2eTEjGfzHvauXu2NJSVRD1bYGw/SC8bZSL3C
 FPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=J58H9qPuBUJZgJAymmcF6xoHTWeKdpFYtW+H39dHsG4=;
 b=q4/J+siLJ7AvQoICNhF3e4go2Yh4eWtuiFUIpI4kHLdNJ7cCMys8z6m2nRT2PkyJ5+
 tdp+KiNlNZpVpheAv9TrmNAioTJ4OZtzFossB1Or8boqR+Miru/Yb/F1O4TGuRernlJ/
 HoFe1OvHQE7zPGUB6aTid6q3fUfugEWhPvzB0g9jkXMsspwycl13vEAnfq0f3EkcmQwI
 Ofo0a6dpVsW++idt34VGc+X3aKxGlqGsvEjs1XJe3fo/zkQdDZhYUV15+H7YLrLr7rxI
 3TL4V0aUzXcTSISMwhDSmIm1ovoJPfSEqmtmkgsqtO7n3Fhg8Aujn2vaKRFtLggOAebP
 hCKw==
X-Gm-Message-State: AOAM5336eBFMCRuE7c2fzMrmvz22LIICeqcbiIRAXM30FL56ADnxOpMS
 lSnuCWD0SzmyDJN16ZpRl7efBDwQjCM=
X-Google-Smtp-Source: ABdhPJypUDYnoN7pGSfjFPOZZSF/hNmBFkl0l3lvB4M+uP6cLCvKWUJ/3kPwlCB2Ybs9AuGl4a2PYQ==
X-Received: by 2002:a17:906:fa04:: with SMTP id
 lo4mr230895ejb.558.1631047787289; 
 Tue, 07 Sep 2021 13:49:47 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 a18sm83822edj.52.2021.09.07.13.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 13:49:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNi2L-0002VW-Nr; Tue, 07 Sep 2021 22:49:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210828082531.585788-1-bernd.kuhls@t-online.de>
Date: Tue, 07 Sep 2021 22:49:45 +0200
In-Reply-To: <20210828082531.585788-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Aug 2021 10:25:31 +0200")
Message-ID: <87tuiwcdqu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.21
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
 > https://sourceforge.net/p/fetchmail/mailman/message/37333073/

 > "It contains the security fix for CVE-2021-36386 of 6.4.20, and fixes
 > a regression/a bug that causes log message truncation/run-together
 > prominently visible with --logfile that was introduced into 6.4.20."

 > Updated note for CVE-2021-36386:
 > https://sourceforge.net/p/fetchmail/mailman/message/37333078/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

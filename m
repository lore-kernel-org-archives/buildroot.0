Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBDEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 07:48:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB1060F14
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 07:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FB1060F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB2483ADC;
	Wed,  4 Aug 2021 07:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4D23G8Jdh6W; Wed,  4 Aug 2021 07:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB64F83AD7;
	Wed,  4 Aug 2021 07:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFC631BF954
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 07:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DD8D4014B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 07:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gi5HiYOtRN-q for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 07:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7787F400FD
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 07:48:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h14so1129325wrx.10
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=fxZO1JGj6CpLv6UKLyd1jGJEzcPOTeG/Y4fW5K0fT2Q=;
 b=YatqGUc3iiNcwJPROtb0d0H8goKBcEGSlVFf6KVZdds6H20W0IepqRmTLWMuFbzgZI
 XsvDa7KlWylAgKyCM/0AcxF6NxneMxuhDDjkCLnfhjYyco9VqQiVDBaocTe3Tm63IbB0
 88wHYsNmoQ8u2TrgfudSHqnr7D/1w0KFqum027/4QUO0rTI/Mi8Mq5eifdsIhmfeBI34
 A10F+62SAxFAKVBs/EgeoDxj0DyggdtHKgPtmAx0fxx/puQVTz8YqfMWsc/0QMaySToo
 1dgPPlZ2FQ3hvNnlBGI/x2Rbp3q33g90ni8l98KVVJW1B8lfBWlE0UeqctdosbtC29t1
 AU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=fxZO1JGj6CpLv6UKLyd1jGJEzcPOTeG/Y4fW5K0fT2Q=;
 b=YEaxADv9B+dmjUtL9oMHBYKiigFGQoBuJv3YDDe7oLT6hz4Exi3RDjunxVSzThEeiW
 lm4SuuyvqTx/k+vAUDlH3wNzc8EywZyUPw/HjjVpprLVAwZoadp5WZfMnhbay1J+v85G
 L2qqPVIERhAm34S92VD6j4MGCR++HdQVJmyWiKyAabkTUfmyRSE7HUwKNtSgcUdLAVYa
 fGo1xg1mvwn+9xSBlMV77MPyhhLOWxc7WHOtXalTIk0/pgYogaebQc0RPms9ZSgtnTNu
 UH9pcnrcqaRbyJB9G0eTn0/rPB2Rksnctg7RXCCo8AhJTzNUloF20V6IGbLbIQkF6YFI
 sjtA==
X-Gm-Message-State: AOAM530LHxeg/TSw7Tx5Ig0NH0gLpNafPPRwp8VZ1k6TCIt3MMtoPZf3
 K+dLJ1HPkQ9KfYOAknAcIV0=
X-Google-Smtp-Source: ABdhPJwe3t06PfcngEB8rXl+6PaIfx8z5sAIzLHgB1mzfL8iMqNgrgw+SIOuDPB5V0vj6vZ01Isghw==
X-Received: by 2002:a05:6000:54c:: with SMTP id
 b12mr26161275wrf.319.1628063302558; 
 Wed, 04 Aug 2021 00:48:22 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id x15sm1463610wrs.57.2021.08.04.00.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 00:48:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBBdU-0007cA-He; Wed, 04 Aug 2021 09:48:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210618183150.618-1-ps.report@gmx.net>
Date: Wed, 04 Aug 2021 09:48:20 +0200
In-Reply-To: <20210618183150.618-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 18 Jun 2021 20:31:49 +0200")
Message-ID: <87v94ltzuj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/sane-backends: fix uclibc
 compile (missing stdarg.h include for va_list/va_start/va_end)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add missing stdarg.h include for va_list/va_start/va_end.
 > Fixes:

 >   - http://autobuild.buildroot.net/results/88f4ea971875b1a5eb88662326d9343341eaaea2

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

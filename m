Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A506C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A4F61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A4F61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 776B6402CD;
	Tue,  3 Aug 2021 14:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feQoSzoR_FE7; Tue,  3 Aug 2021 14:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9992D401BD;
	Tue,  3 Aug 2021 14:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5191BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CDFA404BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fA0SDPQ2Ja1A for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42E2840483
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:24:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h14so25497174wrx.10
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=T8WnbreSfeq9v8tfQC0GPpXm9YHIzP5kbH2hqpziATM=;
 b=vOGGdDs80dzyU4GSUaItskGtEvMz4V9OHA13PN/KFhHuBHiMrGFb4kDWu6QCc2hlbU
 SX/MNRBYr0j5tBELyPp7aXKRameZFGLvC+20hUlMU1VcCQUnCThlHxULX/FDIo/3mYlV
 0BVNhc1V0O6z1aY2+5zeZm53nO4gLuVHjnG0x0qJXX6bbxWTpZQR8fyVzmv94LEQjB/e
 lNoNVfmohBYepLmPw4wsqpG/2hLYIekyLISOB3meDmiQnPRhZKLRs+SjR2KsFOAsWQ4Q
 2Qe7+wxQl421ptT9m2nnRG5qnHqDfxMpid4k4jQCHAcDWp0CWxVNPBhibE6pYCKc4qTB
 lRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=T8WnbreSfeq9v8tfQC0GPpXm9YHIzP5kbH2hqpziATM=;
 b=XrTKGuY88jCsZuF8FWNV4SK9evatBFIkEGzUs2Zm3bQpnaSgehHI3aHr18dSdOwtnp
 ZiBLAb+9X+NPBRYmUQXyBwUt+LlDyi5fcubh8XepOrzH7mjpYpJ7szHHG2aBwTImfbSs
 vP18+58TTksg4htoYSLDkAd4h4XxxP1ttM5Jq+FbJr6vnDObQSCvJG+1tuyuezXiqo/B
 LrAJDGl6cgHGYMQ/zpplIdauhcoXB4r+L27zu5KZiaw6exLG7pDAEGR0FOtrriJyHFs2
 bLWBM6RSO8x+weUEIu/kENIoLEJORGR2q/kWdauAb0id16x+1v2dWN9ucIFpAnNuMjsP
 lCoQ==
X-Gm-Message-State: AOAM531AsIqSUMNE5bWK9wGykZUP9JAPMdyAImCG3JXHON0OqtIvyAIW
 XL06y2bwA9aqseE8wrgI7y/3cXdICLLzcQ==
X-Google-Smtp-Source: ABdhPJxidSbWLjZvbHdnjU8hrpMuFy/ACuRBMp7ovEdsQukxOqyi1QhitsRT3mxYgydGktIm+Fg6Hw==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr23843404wru.304.1628000643566; 
 Tue, 03 Aug 2021 07:24:03 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w13sm17532291wru.72.2021.08.03.07.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:24:02 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvKr-0001fF-W2; Tue, 03 Aug 2021 16:24:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210705211453.3518832-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:24:01 +0200
In-Reply-To: <20210705211453.3518832-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 5 Jul 2021 23:14:53 +0200")
Message-ID: <87fsvqy5by.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: security bump
 to version 1.26.6
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-33503: An issue was discovered in urllib3 before 1.26.5.
 > When provided with a URL containing many @ characters in the authority
 > component, the authority regular expression exhibits catastrophic
 > backtracking, causing a denial of service if a URL were passed as a
 > parameter or redirected to via an HTTP redirect.

 > https://github.com/urllib3/urllib3/blob/1.26.6/CHANGES.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

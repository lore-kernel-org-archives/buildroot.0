Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D54C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84E760F01
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A84E760F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5008840167;
	Tue,  7 Sep 2021 12:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvSUJU6PQ5o2; Tue,  7 Sep 2021 12:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F934014F;
	Tue,  7 Sep 2021 12:23:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 292651BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 193CC400E6
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIn2--MFk9T8 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3433540016
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:23:25 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id t19so19266740ejr.8
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dBWr/34clISCkLh0wbEvt+7juKQijnzn322pPAPKZDU=;
 b=mn0bFYmVi4TImUJAllyyjcN77M51bywxOh36QyjTRyGiWuhnqNF1SKi+9W+jbsoqFT
 sUa9Y60267fRNW2fHWeXT5tqnHJ6cyJPboE8R6zNa3/2Ckerk6pWJR3CDFG5e/zMiHJz
 xOF3NlXzyCzSvqKOqOdQPvzJwNpLnCHrNGgSrs/RwqQWOXpsYCsm82pTzo3IYWygjCmG
 XJmycREnUYFvvcuXd5ZxFyjy6v+YZ17a9dF+IilhQyEMLpVihVImCTpM/cqMqjS70k32
 0vw5Vs//RMm4hD78bi5g7pWK4UCobhR/ktYtSPNaHUs9ytBXkJYvDHOut666s/dPsGJP
 NY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dBWr/34clISCkLh0wbEvt+7juKQijnzn322pPAPKZDU=;
 b=gZlclgzNn6wbYmbs0QaEXgjO4ryy3VyCxeAedekXQEqhzoFHY9As7YVCkJDr4Rr4e2
 Vt33PLha67+kXpRDgvMggjNecc7bvirfobe0R0zWF/Vl8nmFGVrlI2ki0R25ktpCv0Dv
 Pj/EL2eMdgokZkfY9U1P6lBltSyc8N1sowgQ/5V7/2TZq8ozaI0Prf0jpA7GQMYjtsSt
 JDqsQxWO2TZ0YaqAoImXQ6BU7Hnmzh6QcJZt32ZZzfyLCnbwYCH5a+XjHvEggTVmbhjO
 8w50EXrVqg+2VxDf1auR77HBwMgCZ2Aw+5T5raH1+nwX4tXWHTJvhaLKYhUmC0zY2+xV
 P5JQ==
X-Gm-Message-State: AOAM533bVDpk6TFU35Nq/ZeKUZrSxse7w0yS7lSAhbMCVC0nlvIAsvgQ
 1tiyfoxS1pNwyiBFYeHH3GxXGidgkrM=
X-Google-Smtp-Source: ABdhPJwAIuw84Y/ZEXT5kWYu8gc8eiS2Hqcexj97fwQAjw7uLgroUV3yx1QqchVX450kx7ER57O1QQ==
X-Received: by 2002:a17:906:1d19:: with SMTP id
 n25mr18543941ejh.11.1631017403470; 
 Tue, 07 Sep 2021 05:23:23 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 h7sm6552699edr.4.2021.09.07.05.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:23:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNa8I-0006S0-9Q; Tue, 07 Sep 2021 14:23:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210827163355.2007793-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 14:23:22 +0200
In-Reply-To: <20210827163355.2007793-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 27 Aug 2021 18:33:55 +0200")
Message-ID: <87bl54fubp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 12.22.5
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-22931, CVE-2021-22940 and CVE-2021-22939:
 > https://nodejs.org/en/blog/vulnerability/aug-2021-security-releases

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

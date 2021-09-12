Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D3AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:17:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324A261050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 324A261050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF27F40155;
	Sun, 12 Sep 2021 19:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MegGgVTqvgZk; Sun, 12 Sep 2021 19:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1172A401F1;
	Sun, 12 Sep 2021 19:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E19681BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5BD3401F1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbIw0IvtUn-m for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:17:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E434140155
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:17:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v24so4762599eda.3
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=4DRE9Sd/qDXjxeL3SI0ZwCvCww9JMaETSP983tRKtJ4=;
 b=nbQBD4iLV5LDx6NYFf0+NgaFgoVrb40GPWjGrPyCqrBh8eaDqOwlKlNDKE8ecN6tt+
 5HCQUqrR6fq1fkhYpunaObIlE9BU7STgUKlYvuFB4Msw8/RGh58oAzr825pThC6+krAo
 OWFh4wQbc7OzSAuF8hR8FzbbVYIFlQghuj/0rT27tZZlLgg/F/aamb7TS1VzUfSp0l1R
 2Egr36gTpnsge4YXJJyJrWSdNiZsgSbM1pdc7mVqIKMmE/Vo8RKHihAsVqAMD1dkvTt+
 orG1Nu6GLAmtjM6jEv5ddxFKLe65G/kA7tybUx9QJpZEWXX3TD4ycR7qxHJ0sBHEefhV
 TPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=4DRE9Sd/qDXjxeL3SI0ZwCvCww9JMaETSP983tRKtJ4=;
 b=Lr5TE0fa9eUf1D9XipDLcrcZUH+QHyUEWwFJxLWhw36u1+uqzkp9Fr7C3fY3dgU7b5
 I5vIeoFdVgw4a+12S1kDovbVpRDHNptu/EyEL6o7jBs0xNiMMs17T37lvRDknfdYoAlV
 9/cEhVCo808ExgOvmLnLu8i/2lAAaPXru2z6meJDCfsRZNGXLEddIpo4v9bVmDfRJVZp
 VkTDo0h1KoIs0FJEc+yuuzr0XgGWiuhdWcFGUYlBB2o+NrGWzSUtgHWjBCKS7NhOHVvo
 K17tnZqgRIoM1aHzgAnI1h2i05L9/DaqwLgG3Sf/h1j+JyBSQ6zvZ7T8cK7iGZsxT68D
 /3GA==
X-Gm-Message-State: AOAM530OMD8bBF5cjB7Iywkh9IlwYoJ1T+EtAsvCVg7oWaxPZwKqqYp2
 O9mZwoXmnjWPykhiEv1zd46PPf3BA0c=
X-Google-Smtp-Source: ABdhPJyZpNwsnoL7qHdcha0jmasAUo8MkIP5ZKCxZSoqUQP9pS20PFcS7PkXu46J7sa90o1wHdp2bg==
X-Received: by 2002:a50:cc48:: with SMTP id n8mr2426983edi.304.1631474251262; 
 Sun, 12 Sep 2021 12:17:31 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n15sm2761380edw.70.2021.09.12.12.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:17:30 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUyn-0003RY-UF; Sun, 12 Sep 2021 21:17:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210910065305.100451-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Sep 2021 21:17:29 +0200
In-Reply-To: <20210910065305.100451-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 10 Sep 2021 08:53:05 +0200")
Message-ID: <87y28138om.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: drop gr-flex option
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gr-pager is not available since bump to version 3.8.0.0 in commit
 > 0d6a7b2981d4ba83a95ff1c10a15970e41fabec2 and
 > https://github.com/gnuradio/gnuradio/commit/2d2caa205f3c3059deab7c82660908656167fd90

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

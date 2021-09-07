Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43C4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:30:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522A260EE6
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 522A260EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F301D404F5;
	Tue,  7 Sep 2021 12:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5T71w4hcR73; Tue,  7 Sep 2021 12:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A26D404DF;
	Tue,  7 Sep 2021 12:30:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48AE31BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381A780ECF
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPS40IbYajaY for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:30:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6240F80EA3
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:30:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v5so13663725edc.2
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=PQf3oHDhEuNDMeCkacAq/gqRAvBBPXMlQqHTPR2FAoA=;
 b=p00e/oBZ2E3TuXEyzcvcbrwK7VE5HRYipG+5AVNv9DIzL/Ap/aP3gwyZw7DWE0EZY3
 DKMDB4SeerRhhtb2uubAG/4G//h7Xct+z5QmwnJfAoQeA1ftky1dDHDJL48mY5Pu3sXt
 w59gl7L1uoM/9W/t6KxRm3LlQj6utc7zNJhV+9c/aequG9p3N0u3++jHVQT2SvTsyi6Z
 QOaTFN4Nfgbeo5LtS3FeKJ/s7LI4B/YdzKL5pmPpsJN78O7eHqLMgaQ71zijyFTzhtrg
 nxLqYZCjeju4oxk/XSjt0yyjXm5c7lP98mG+SujoaVGfSlyA+f7qNcclbyrVw8lC0TbG
 5eVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=PQf3oHDhEuNDMeCkacAq/gqRAvBBPXMlQqHTPR2FAoA=;
 b=pWxWyOeO22euN9k+yBr63GDfdNNtkqkMMgNcpI9CTi0fV16e5rwrOMUcWkuTNEzxWC
 NhNYY5VvxDvjd/pjQcdUSlS66uCb43wYsvxMjl2vvOC8ZikzXMDHI1c5FKt14wnYOw+L
 TCd7xNdNO5EaMZIm1b/8xPKmPNqtlp+xONuXFWQNzz4aHHndNm7ZSLaRFY0OZQyQsXcZ
 DEdbdGxAFZYI1xIHLd2ZIbuk9GhEPHhTAX11Bqfz4aWgE15vUME84n0THDROGtnN3/5y
 nvpkslbcbu5YSutj20JyWB/EqnyOJHdsr1Um2DzKZc5cKWYQLn1afhOQNtw9bDpUQi+h
 G7hQ==
X-Gm-Message-State: AOAM530/faKseC4gdMj2ReHLmT6lWxZqO+hL5lkSPAp0+SR7+ms9sr+Z
 THwghnQieBEEXOhnz30Txpc=
X-Google-Smtp-Source: ABdhPJwpvT3oYslrkAJpZ9OXrpj1C24A7FfbIynITDNwKiUPGvHl14QKKOjUqR3x+pNqEBepiEqf1w==
X-Received: by 2002:aa7:d887:: with SMTP id u7mr18068196edq.366.1631017847749; 
 Tue, 07 Sep 2021 05:30:47 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 m17sm5546752ejr.27.2021.09.07.05.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:30:47 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNaFS-0002cN-CU; Tue, 07 Sep 2021 14:30:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210827162311.2006524-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 14:30:46 +0200
In-Reply-To: <20210827162311.2006524-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 27 Aug 2021 18:23:11 +0200")
Message-ID: <877dfsftzd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,1/1] package/ipmiutil: touch config.h.in
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build fails since bump to version 3.1.7 in commit
 > 011f31ee244b7fe4621b3f69ca3d7e7b1cfdb5bb because config.h.in is older
 > than aclocal.m4:

 > make[1]: Entering directory '/tmp/instance-4/output-1/build/ipmiutil-3.1.7'
 > (CDPATH="${ZSH_VERSION+.}:" && cd . && autoheader)
 > /bin/bash: autoheader: command not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2005af881726473f2cda176e90c1e41e4baea67c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - touch config.h.in instead of autoreconf

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

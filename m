Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A5DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E756F61100
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E756F61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94FED404C7;
	Fri, 10 Sep 2021 11:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpo1wSM12d3y; Fri, 10 Sep 2021 11:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E613040282;
	Fri, 10 Sep 2021 11:24:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1431BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D55780F42
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMWUNL9I6edZ for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:24:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BB7380F3D
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 11:24:12 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id am9so245124ejc.7
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 04:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=d7MdOig9jO63aahTrtt/fEOY5CzEnA4X5L6GbVBFzqw=;
 b=SJdrFmkSU1+ZxkWrvvqjSczqU5LzvjhDD8DcuH5smkV45H0NIYf/s9RnxG2BnylZxU
 w45+DZnFni81BCrqsP3FRcF3Gc0Z8rm3NZ48tBdXp5i/txWV05IkhgSJh+c2MifKjq/2
 XtJoq9oKaTxBxrPDClX/KOyRRE1jPrmetisp1FOuiAEK3nZpIz003doDc/NutUgX2TNc
 uuCv9S58bPWbnPx3rV8N3UzRvbIoQNdVolhwAc+t5dIUAT6pTCqgD0bUOsTIau0uPoE+
 62zqk1R4Szrw+/m+y6KskAR3wYp28Kssv5PQ2F+1mxQ6ySB62ZoT4oWujryQ2GMVUr35
 JBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=d7MdOig9jO63aahTrtt/fEOY5CzEnA4X5L6GbVBFzqw=;
 b=q2hbHqJYjHLvg9a1TPxJLuK4ABpy6cqG8mkHnn3smqzufZe6JO0jw9p5qUKJcG6VwV
 X23mVNQi41DCUHKggaux57HCSK4GLZlROjj3B9B2AMozw/rXahZ0L8rm2Wv0SJBt0GS5
 lc54QgqN8A+45x+KcIL6KbIab2oGO4DtuwkXaTNEZwofwpnZRLvFNMVbZwvjrn8ZgKGQ
 vFS8Vb3LEhYZL0Qg9J9xPYvvnYufwlCl5U3gI2RqUxYGFb+EsVK2t3jsbbyFqvFuFJ7y
 Q6oHsCaBI3Ew8BfkIs+jpfNwrFSUVmxfVelrCyRVBoFePEGcdvjXb6ZlTZXzMQIkz+tg
 Y/5g==
X-Gm-Message-State: AOAM531dK1in0XZF6WfFGj6ztO6Rxzj2b44uAkIAl2fr81cOI5S4PrMl
 7XWIqsgLk1aSNqCGYNRY1g1MlPRE1ng=
X-Google-Smtp-Source: ABdhPJxmBZ9nJMj7+Y+GsHhTSDlAPbnbL0OE20ue6z08wZiHNPl5WO1k1FbmvrZUPfwNetlpJTAULQ==
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr8709485ejc.494.1631273050462; 
 Fri, 10 Sep 2021 04:24:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x15sm2247322ejv.95.2021.09.10.04.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:24:08 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOedc-0008PH-2K; Fri, 10 Sep 2021 13:24:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210905065755.1828799-1-francois.perrad@gadz.org>
Date: Fri, 10 Sep 2021 13:24:08 +0200
In-Reply-To: <20210905065755.1828799-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 5 Sep 2021 08:57:55 +0200")
Message-ID: <87ilz8ad2f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.9.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/harfbuzz/harfbuzz.hash | 2 +-
 >  package/harfbuzz/harfbuzz.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
 > index 774b3104a..a101f3e7d 100644
 > --- a/package/harfbuzz/harfbuzz.hash
 > +++ b/package/harfbuzz/harfbuzz.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7  harfbuzz-2.8.2.tar.xz
 > +sha256  3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a  harfbuzz-2.9.0.tar.xz
 >  sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
 > diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
 > index c7f5dfe9d..ccb0d940d 100644
 > --- a/package/harfbuzz/harfbuzz.mk
 > +++ b/package/harfbuzz/harfbuzz.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -HARFBUZZ_VERSION = 2.8.2
 > +HARFBUZZ_VERSION = 2.9.0

Doesn't harbuzz follow the gnome-style odd versions are development
versions? If so, do we want to have 2.9.x in Buildroot?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

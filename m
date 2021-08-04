Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0694CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45E160FC4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A45E160FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC1440620;
	Wed,  4 Aug 2021 18:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YV-xNCBzbPGb; Wed,  4 Aug 2021 18:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB1F402B3;
	Wed,  4 Aug 2021 18:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53DAA1BF381
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D2B3401D2
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YTKOmCBNyVo for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0750E40137
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:05:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l18so3205987wrv.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=JF8vJyGvUQgyHuECxl0zNNG+YkazIiCZ+WiLgU8d5VE=;
 b=Y6aHuHHOO0g9gmUU1Pjh38QokUJnr2C3vVtRwCT/rdRC+3OWV8cXlf87QAsexziiGs
 7dSMoCbTK3mFaQZ9iYwrGkfPIf02JedFiuCxDfeDlEH3hin/deLz+m7V77E0UuP/hySI
 jyTPYjbjP0KalIO4eYSJOET0mp9799blXPR66chJStTMVua2TsgPEQN3re+bAMu16KJz
 mBRWQwwJKDF2Nh8fUhzba8mS8BusEd36CqD/76bbwxFp1vLKOBq5bOyikxUGz0epWmGa
 mdMAE70wEgel06Ttfq0qUl27PGGwQ0lP4jOR+J/Q9wgt/SZEZTwmN3YFhdfhlfONtKcu
 z6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=JF8vJyGvUQgyHuECxl0zNNG+YkazIiCZ+WiLgU8d5VE=;
 b=FF9FvAyqVjBx3Ha7mYNCI41l8UkLNrHoc+gr92RDhOhS+0SUTADKdmxfcXU2lheNUI
 sCTg6cmOZcJanTx0NNOvLbJdXBB8p2OccIKMRbMPccEswLHfXKmC6MLupnjA6ZxNyG0s
 EIcDm/uwck1xxcHcngI6K+W77TKjndazxKOlufXQ0KYVsAgmWPB7ZbKWYQy6PpWZn75P
 RG0qUbvSR59ePhGE2vCfBM6zN99KIIeXBtA2lAwlPL1rVRpDn1tzGzV6dRIAu76yz5Jb
 6Hh+LHFgXvdYwYD1/doZml7Ea+0Z5Fw8Putp5/aq+ls4uu8qUqkzCLJL4QdhyzHxVEkE
 607Q==
X-Gm-Message-State: AOAM530fWHn92XdvQAcpGUe2yns8EUle9b/DTtoAdAFLDaxgN9aqix76
 d1PHYy1dEXUrtkqs2D1soy8=
X-Google-Smtp-Source: ABdhPJw+ZJyXAQozueBiMHbjWKdPyGVbG9cWzk9ZCwFnndlRgpwXrwYMnEIWcODhUjGox0vMOOlGyQ==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr632493wre.406.1628100308264;
 Wed, 04 Aug 2021 11:05:08 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id s1sm6586530wmj.8.2021.08.04.11.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:05:07 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBLGN-000650-0m; Wed, 04 Aug 2021 20:05:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210614204749.10693-1-ps.report@gmx.net>
Date: Wed, 04 Aug 2021 20:05:06 +0200
In-Reply-To: <20210614204749.10693-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 14 Jun 2021 22:47:46 +0200")
Message-ID: <87zgtxnl0t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/4] package/libxmlrpc: bump version to
 1.51.07
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

 > Changelog ([1]):
 >   - Abyss: fix bug: wild memory reference when server times out waiting for
 >     request header. Introduced with Release 1.44 (December 2015).

 > [1] http://xmlrpc-c.sourceforge.net/change_super_stable.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

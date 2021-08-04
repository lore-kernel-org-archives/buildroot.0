Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC51C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:29:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CE760E8D
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14CE760E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA7B7403B2;
	Wed,  4 Aug 2021 12:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRmfzOppEAj1; Wed,  4 Aug 2021 12:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFD564010B;
	Wed,  4 Aug 2021 12:29:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39C031BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FCF181CA3
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOS_th8ZPGKH for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:29:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9010181BCB
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:29:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1346369wmb.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=+j6CBZRH2lYoe4OrxgtsBJ7+MTs+jo7Q94dWz7mb6Rg=;
 b=QRaik/iC+T1sjJPBHkMT/DxSSBvK2xrNrOU6P9CX52XakIxGhA2s6PPpUVzr2OmTxi
 91rzXhm3vyzp6a24HHu7YLSz478nbbdseL22ksgNmKWO9hnZa31/iWRv9So0v24ycvhx
 P2qrE+wwsNnZtduT/XWG3vFP2btPAQ1ik8a8xeJUUQmo3dI9Tn5EZVpC2vxE2hUmaLb1
 VzaLHKxce5teSOODsk1HjMUVkfDpgBw8NPMx3FA2EUQIccSHFMpZlv1Q470avxiUJctt
 ai8GTfNBahvCJrcGIw9g2KFxYjosUe4x83v811eq5RcLX6+iqDlMPCWv5PdWdrD3Y8nK
 YyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=+j6CBZRH2lYoe4OrxgtsBJ7+MTs+jo7Q94dWz7mb6Rg=;
 b=iSwuwZgKLJluz6HikyMGt4OXXmBJMo8QJotMY0YNFhBePXDpRA2XHmYflrczWgifc2
 njumKv7QZ4YW/cy06EmL+UtxgYqAQockY5g7Y3JXj1clcp1L9Ej42XbZI/+RYXbHZ02t
 Nw/UJP0+tKGLi/pK/n2YXmxgZoNgnOFGZoEWxenQ52+8zwjgrd0qd6Nha00cGl11IF+o
 EEgZw9ZGX4IaidoRpwC82P39dwVIOedLTsGVIjpns8L0oD8Xpo/16qLImAaRWrq7ZMNt
 dHOVwscD0ao9W7iou7xIrJWrJB0Qs7Ei6L9dSIYgGL/lPPhRhaczgK1VgEnEVmmG7DIb
 SKog==
X-Gm-Message-State: AOAM530mK3PkcIsNr5TMrmqG3TCgXmGO+Of3bEgJlo7FGcK5cvf2EWqD
 RaXkSkIIOPgwkA8UE6tV8+wIn/MjZIM=
X-Google-Smtp-Source: ABdhPJyIP5wGRs0Q6ubt7L70z2S57wVRaqsZM4GOAnLd3bCfcw8eakYstKzpk6GTblVB3eN4KXTacw==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr9335321wmk.55.1628080157840; 
 Wed, 04 Aug 2021 05:29:17 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g5sm5619432wmh.31.2021.08.04.05.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:29:17 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBG1M-0001pB-Ht; Wed, 04 Aug 2021 14:29:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
References: <20210701050101.23916-1-gwenj@trabucayre.com>
 <20210701050101.23916-2-gwenj@trabucayre.com>
Date: Wed, 04 Aug 2021 14:29:16 +0200
In-Reply-To: <20210701050101.23916-2-gwenj@trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Thu, 1 Jul 2021 07:01:01 +0200")
Message-ID: <87a6lxtmub.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/gqrx: fix comment dependency
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > comment message for gqrx is always displayed. This is due to an invert
 > dependency: GQRX depends on !BR2_STATIC_LIBS so comment must depends on
 > BR2_STATIC_LIBS

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

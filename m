Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7633CC432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:53:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CBE60F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28CBE60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041BE608DE;
	Wed,  4 Aug 2021 17:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRH6Tu5pYGrN; Wed,  4 Aug 2021 17:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720F8606C0;
	Wed,  4 Aug 2021 17:53:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB9AD1BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6CD983A4E
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Abohfp2jgGIF for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:53:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD9E683B29
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:53:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id n11so1689204wmd.2
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=s7EEyo9rR5VRtZAVWR4WYWHFNDDQmTb8BRtXnNgKnYc=;
 b=LX1BEZ8kF0052HSbfxNVUfDpTwjpf2QilF0pHqUQASE88tS9lnDDrjHyRfI4CXNcth
 BAEawt0cK5t2A3Q9YQdFCHf6lNMoOSP9CKndXlE+s2ai/YGG5p3SIYJbpi90312ubKnq
 o2ryvzIme4GL+OZlUb52LcM4WTXNzxOLf0+6XnPxZ6CYVR2rl8B9sOfuhg/Yz+yGXIWN
 iebir4F9swaaING24ko+3W36y9+YIAkWz8GYeYTuEyxajWx/C5fFrlIktOz9b85Yf/ho
 KcXJ9aDjZVyLkgPCyBLBh15IgDWzDLIwhT6MsQ/ZVsP47EJIRn09T9kU8CoJUeW9e1n9
 64BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=s7EEyo9rR5VRtZAVWR4WYWHFNDDQmTb8BRtXnNgKnYc=;
 b=IaAp46ClfpuR5SPBvg2yYeZFD4amSwvvF+12P5E1DVR5fMGzAg5WaV9qbmYmalugyZ
 Pd8Od5qNnd5p9CL45hy/IQMG1GyXd8Yb5wi/F4IwRRRvdREXlkC63NlWjkKPynrX+Qif
 gl8c3w2NsoJ50rqJaR8R/DylIbozjapbUoe7QfTGnrYZBcWdFRrr6V6KQeF+p3+eFw2/
 2aBuopI+yb7Zbk6z3glKdzEqibf7rhtDCcJUwmqzkPRhvbOJXZMqdaWiUnB4J2H4bKIA
 wKVlffoSS6Y0kFxye2zJRF5A32CNFq4XsVe8clmXz0LVRMLIkJfY/P38ohvNDzD50Zac
 5gKQ==
X-Gm-Message-State: AOAM532Uq1LLYRnbsmA4z+ls5z8aDQdZWGI8qhNWdsZai8oqKaD++o5H
 xU6ZQRXAoyY5aAKzleiSfPI=
X-Google-Smtp-Source: ABdhPJxRShlmI9N5FGE2FKJKF5GSeQU1syHsf/OI85wy72w4sE4yNKVhncx8rEornM1l4pf81FD12g==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr730364wmh.165.1628099620157; 
 Wed, 04 Aug 2021 10:53:40 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id f2sm3357085wrq.69.2021.08.04.10.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:53:39 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL5G-0005t3-9m; Wed, 04 Aug 2021 19:53:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210723160806.212502-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:53:38 +0200
In-Reply-To: <20210723160806.212502-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 23 Jul 2021 18:08:06 +0200")
Message-ID: <87a6lxp04d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/proxychains-ng: fix build with
 xtensa
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure with xtensa raised since bump to version 4.14 in
 > commit 35953d1e61aa8581be09c9dca39365955b10590e

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9529C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D04260C3F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D04260C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED7D606D0;
	Sun,  8 Aug 2021 20:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2MqqqxZH2Fg; Sun,  8 Aug 2021 20:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B5960658;
	Sun,  8 Aug 2021 20:49:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36C271BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341BF6064D
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVH5NNkFDNHZ for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4930B60607
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:49:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l18so18674428wrv.5
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=VueD4F+yaXjMVn06x20mqshY5FDP71UyX10KuuwZyWo=;
 b=cGhirqUWJnMuKAG1kSW8YYF7pYa5NtcgG86rW6Nn94BHrvovnUiLAgu1Bry9UnUELr
 ySEZ5lXlzqVc/kcO+aMTYyFDesUeowpWQAQoGe1GKwS1+PsnBksj8IVjMn9dP1FVnaR/
 9Kwq47lOi+r8Sr6M5myhZgCI+8i+hXtTieDPFv9Ya2MqkOz/rY0o/mVGKtkTmC0JzNLd
 akb/IFv51EizEsFhMTis/YJIOlgNFF06VQ1tFag45eeGm3Isy/0Y3nG5H9yR4mJbYLqB
 e3B7ANt1LX7tMEdN9eehpgCjJcn8rk3vY8UE6wG6jxunJz0BhEPQrl5cDnFqOXkO4pgv
 ONyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=VueD4F+yaXjMVn06x20mqshY5FDP71UyX10KuuwZyWo=;
 b=sOYFsGQ79X/4ljcjimxeefIbXHKzvRth9VzWaLzahevn9LsqQaWHHIPwXjU1AEu0Tp
 CU2Mh9QZk1jvGTTb6fvbbFjDMzEhvNLh1c8WpWgAZct8ZY5fB1zam8++TOrslF9SM/is
 VSbWkKh8c+2ZJHU217IYsap6C+afcyCB8Kdr5bXjrd6skg7anDLQHT5qzAA19n4xAE/6
 NGHdVMLIzfch1OYjLwUpFfdrnZgdXg2Ik2Xv80sq/B6GSb4gVgNST72XpCNtQDOsemrZ
 juPEmv+6jslAcPEOtJuS2L4lwC8mAIq+vaYVUcjY9AKWn2VtI0rLXD7msFBOSlJe1iqr
 WLOw==
X-Gm-Message-State: AOAM530AR7hB7WnaQJtNQvyhVD1e1QzEjPIbSLWN8rJGnZYojX1TMXhS
 tC+U+zbepcgYVtNRd+KsPtOw7Fnt4tK1YA==
X-Google-Smtp-Source: ABdhPJzv4EtxMaXQ2H93NtnYAvyB+CxY/mqM+RxpBChKUaVkLzpW99RFrO6DvCBp3BLwoF0tyEEbnA==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr21401892wrv.77.1628455784382; 
 Sun, 08 Aug 2021 13:49:44 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j140sm16051358wmj.37.2021.08.08.13.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 13:49:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCpjp-0005em-Ty; Sun, 08 Aug 2021 22:49:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808180223.25135-1-peter@korsgaard.com>
Date: Sun, 08 Aug 2021 22:49:41 +0200
In-Reply-To: <20210808180223.25135-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 8 Aug 2021 20:02:23 +0200")
Message-ID: <87r1f38xwa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.22.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-22930: Use after free on close http2 on stream canceling (High)

 >   Node.js is vulnerable to a use after free attack where an attacker might
 >   be able to exploit the memory corruption, to change process behavior.

 > Drop 0002-Fix-build-with-ICU-68.patch as this is now fixed upstream since
 > https://github.com/nodejs/node/commit/e459c79b02

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

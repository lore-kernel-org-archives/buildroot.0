Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63479C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:52:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24EBC60ED6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24EBC60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE83C80F7D;
	Sat,  4 Sep 2021 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZW_c9_kjvfr; Sat,  4 Sep 2021 20:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B2480F6F;
	Sat,  4 Sep 2021 20:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE831BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E79860790
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VBQrBGjJcL3 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0837A6066A
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:52:54 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jg16so5195193ejc.1
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=x4YbDweslqCv/1bc1WY2DwtRQGWGGWuVbhXAOJ2I4xA=;
 b=H3V3vuj7Nan6Ltq4E4MjLdnYQJAF56pdjvkkjng6gQPRo280RU1EBSZfBRY3LwgkFr
 KzR9lYDnr1CjPOXI0pNiirYwPEW0SXwCm7JEER02hO57TLx4Ox97WbhBMn/Q3TmoO2wj
 8vv8xwDItCmWVpckVGCjViDx9sgv6YbRfAGEUwPfXSmwdOgFkNj3u5IXW1U7zwHqyloV
 WVHLjrJNwn3AC4H22St+iSsioe/YDFnHcpRdSoOxU+Twbmt7yOCFb2D37NSv0wItA/wN
 l9J+LhTQptmIH+Xx57ejFaueBdZZXtMRAY1yPsn073PONRm4cC0sI7HtFiLSAam8FUH5
 umog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=x4YbDweslqCv/1bc1WY2DwtRQGWGGWuVbhXAOJ2I4xA=;
 b=skDsnPh4BrdqQAP6qlf5HAyLN2pZQUZSAukIMB/XQBXadXxlZWP84ky7uFpwhveh0a
 h9DTYGykoZMs1+baFO2CNxTTL/+ynNNRh7cdDnSnGvPY2GT+1JqJx5n4C1ZviDCkD6kB
 0hkOmYp4RCQaUHONQtQdqVON4BYMDkWePjCHDEn23FDs3RcftQy3iIsXdVmM0IwovNR5
 riGLYxJpqZYBnRlm4ebVfs4LT0cnX9rl5RsqxzWYPpEHq4zpGnFko/9iP2bi+C9hqufF
 608p2LX6lvSYJRKfR2R+ORWSJ+6Xu3ds2WSePrDC6moZ1RgSyZWA6/pi+vb1HWjp7VpI
 Rr+A==
X-Gm-Message-State: AOAM53392wjhHm9QV0Grgb2oJf7BgSOIw/4jOPLNoFZO+z6/dKEbgIxM
 bn/hZSEnZuzac0jOm6aRuL7Xpuerzy4=
X-Google-Smtp-Source: ABdhPJw9KyZm4ANKniXH3nwW3HazppXkGXI8R/iyVcHLQUK/KV+vxGehmcwSjxS6i83kpY9mR580GA==
X-Received: by 2002:a17:906:9b1:: with SMTP id
 q17mr5692598eje.546.1630788773314; 
 Sat, 04 Sep 2021 13:52:53 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 v8sm1519070ejy.79.2021.09.04.13.52.52 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:52:52 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mMcei-0004SM-6a
 for buildroot@buildroot.org; Sat, 04 Sep 2021 22:52:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210817072304.8ECBE8D32A@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 22:52:52 +0200
In-Reply-To: <20210817072304.8ECBE8D32A@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 17 Aug 2021 09:15:11 +0200")
Message-ID: <87mtosm5az.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/unbound: bump to version 1.13.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=aaad2ab8e355f2894f90bdf96909deaa39e14fb0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The release contains a bugfix to fix the make install of the python
 > module after build changes introduced in this release RC1.

 > This release contains a number of bug fixes. There is a crash fix for
 > broken internal structures in stream reuse, that is used when many TCP
 > or TLS upstream connections are made. Also a number of features are added.

 > https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.2

 > Signed-off-by: Kyle Harding <kyle@balena.io>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

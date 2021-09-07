Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2995C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:20:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01330610F8
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01330610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97BDF404F5;
	Tue,  7 Sep 2021 12:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flBU7e985Oe8; Tue,  7 Sep 2021 12:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5F2C404E8;
	Tue,  7 Sep 2021 12:20:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33AAB1BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D4EF60BA0
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQQ-necuQT7b for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:20:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5107B605C4
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:20:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id eb14so13611267edb.8
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=aiI3pCgSWpvuTtPPGyDRHV5+Z8V15Dc2lbND8413osA=;
 b=RT6Auz6iDohhIAu1n+Xc3wt8ugG1h9Y3lgbgoYBJT8eFeu9+vsSk966Gyh0rMewgno
 s0CcNyzZdwQKSCOBydfOYmm0hudQ+6Ewacu4yzVMhuumxgVQM/rLMQysNKAd8LTFIDoZ
 qlFzG+sbTRrIz8jFx7rbuukU8YoGLrcPHB0mlIErF14twqZTX7vXux674HZV2gdy5dlB
 mgfNH+hZn7eBRfGPgTLyUdKAmaSdVD4VMMfILd3bkUapSJ5/mwWp7zOFa8uep6zwcq0Z
 ym54WEbqhcoVdxZo/P9zJTsZPt3nWGEy7OOV37d5UmRSFloIO1QyYg+JRtc7pDws5G4w
 jcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=aiI3pCgSWpvuTtPPGyDRHV5+Z8V15Dc2lbND8413osA=;
 b=BifE5vU5s4cd8w3/7t1jk0+cQGVCzAGmhuTk3Uadm+DvKAcEJt7yqClpO7fc32iNRG
 XEs5CVVRZpJYtdsAn9O34j8nmVHAPdF7AZNrX8MnNENpAKeg/aUU0F/868EOoy8f0N0z
 p4JyvEYDBTGpo/4LrVpD1pmcMXmmHZ8M74UFt2gYa9+rCxtLTGvbV7ii9h4KKiGOnelU
 gwsmO82riCQKHN8EORbME3IEyN3qHC508N+FM3qgDQ0cpJcAl1UaKPG3/mZcHp8ryqyE
 BMeIB6+gl0Fnb52SsUfOzFfHe66K95Hb2q1cgUgYSMPqv8BZEW+OZBsWdrKSXCT9TrjB
 T1fQ==
X-Gm-Message-State: AOAM5315t3fIe6o5SMWfDKIbcqwn54JITPO6bnoAndNefTFqAUEzB0G4
 7rxQmuUa8WFx5UB4Y3GYpC0=
X-Google-Smtp-Source: ABdhPJySktE1ZhPwYiJogjXClsgTjGE80NawfQm+fRSPSkPsWqUYyvxlgBdv4kB11CiM8e05iAktlg==
X-Received: by 2002:a50:8e51:: with SMTP id 17mr18043631edx.308.1631017214522; 
 Tue, 07 Sep 2021 05:20:14 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 k15sm5449311ejb.92.2021.09.07.05.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:20:13 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNa5E-0006BP-Pd; Tue, 07 Sep 2021 14:20:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210825220038.7757-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 14:20:12 +0200
In-Reply-To: <20210825220038.7757-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 26 Aug 2021 00:00:38 +0200")
Message-ID: <87fsugfugz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/ushare: fix build without msgfmt
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without /usr/bin/msgfmt raised since the
 > addition of ushare in commit 74097fd659154499612f21fabeda4e3e7c8fdbfc:

 > make[3]: Entering directory `/home/buildroot/autobuild/run/instance-3/output-1/build/ushare-2.1/po'
 > /usr/bin/msgfmt -c --statistics -o fr.gmo fr.po
 > make[3]: /usr/bin/msgfmt: Command not found

 > To fix this build failure, set GMSGFMT to $(HOST_DIR)/bin/msgfmt and
 > don't build po files if NLS is disabled

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9f6b5b8f38386135bacd2d8f6e97c1fea77bbe69

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Add --enable-nls and move GMSGFMT to this new block

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

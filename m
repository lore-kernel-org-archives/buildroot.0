Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2449C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B36E611B0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B36E611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB91B60B60;
	Fri, 10 Sep 2021 11:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBe0Pty29p9K; Fri, 10 Sep 2021 11:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D21D60B59;
	Fri, 10 Sep 2021 11:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2931BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F4DF84A4D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z43yrx6aNCMg for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:12:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B310B84A4F
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:12:10 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c22so558132edn.12
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=axg76dTq4WNaCCIqgUM8xwduM74G5BaHlUKToDgguQ8=;
 b=SYzXoh63e77cIDRI7WqCuBBPMjPoFkVYJX/fUabE+Bwf4f9QJ97uijocXFVAZ+aPJQ
 DCKJPROTKcPGxvrl385JnhWSo1I48pZDFPK5w8LnA4tx8ypzKGwEcKet7NAUu3wZuIi1
 Mj2oWh+D776efUiJTNIr5gfhtc3SzQNGTBnBeftFZdrtLfJsl63+77fDJfnymAWqD+h7
 HN2JgRJxm2l/YREBnwfQvTwYcmDPjBMmp53kNcvwDIDF+QBDaFG9WkgSk/9RSwBr5xkN
 EH2xvgX0L96mRpPUXpuGgKIZ3ctbbwfZciVRMI9NQ4m+ufuu198n9NydkmNQ8reULxbu
 cFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=axg76dTq4WNaCCIqgUM8xwduM74G5BaHlUKToDgguQ8=;
 b=73HRxkO+B6IX7RbOhTjMYL6LuO+n+W92D7/o9mPwpotqZ3L8ybo8EN+R/ByIwfflD3
 Cq1Vhf+GmjCr/2cSwiVQqCDEx6m3H92m19O1BYQf4hApPYEBDVSn4igzEXpOjlBSeI0l
 //F7GEDgjwiNfsOx99nMdA0/7/u+XYeFFnaa7UujOPJyx7/ePrZjzooVwWrDwm3yCcI8
 ThU7UgwjMXcMxoxevxBRrZ5tA9zGAJPRvsZ+VyO0KO7qbVv+iY1FD7GhBGYFWExLGEcf
 FoY/trxKMlEByZwlFOK/WQNhDuc3mCEFQx1JU1IT5faeLSE1SeX1n9O0jWe9QKPmPB79
 IQAw==
X-Gm-Message-State: AOAM533o5LgNc6uuck53B4XikTKwIeXRmvxRUgw8vUJdsCnOQjtd3WEx
 q/7HmWKMeky0Tlwf9u1rwCg=
X-Google-Smtp-Source: ABdhPJzObgCa6dya/C7NgpN8hzF+Apn39lkK5GEfNXooAFzs4R0LA/CWnIfJsPZ+55nV6vR0wnLyVw==
X-Received: by 2002:aa7:ccd6:: with SMTP id y22mr8361632edt.363.1631272329007; 
 Fri, 10 Sep 2021 04:12:09 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 bs13sm2287711ejb.98.2021.09.10.04.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:12:08 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOeRz-0007tE-PJ; Fri, 10 Sep 2021 13:12:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210901202912.193241-1-fontaine.fabrice@gmail.com>
Date: Fri, 10 Sep 2021 13:12:07 +0200
In-Reply-To: <20210901202912.193241-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 1 Sep 2021 22:29:12 +0200")
Message-ID: <87v938admg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wlroots: fix uclibc build
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following uclibc build failure raised since at least bump to
 > version 0.11.0 in commit 0bc9c89612cc1f41f9a64f6e889f8bcd8a871e30:

 > In file included from ../include/wlr/types/wlr_data_device.h:13,
 >                  from ../types/data_device/wlr_drag.c:7:
 > ../include/wlr/types/wlr_seat.h:221:18: error: field 'last_event' has incomplete type
 >   221 |  struct timespec last_event;
 >       |                  ^~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3501ceb4290638b2f6d70aaa4d8ce74feec3a525

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

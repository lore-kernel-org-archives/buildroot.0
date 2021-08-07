Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B98C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE33E60F35
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE33E60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83FA9607BD;
	Sat,  7 Aug 2021 16:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCPvonuSPaRG; Sat,  7 Aug 2021 16:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDA6F606FF;
	Sat,  7 Aug 2021 16:16:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2201BF5AD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AFAF403E7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8mAMt57DuuC for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 16:16:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80F3440340
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 16:16:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p21so17783654edi.9
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=e60HSV9SzoZN0kD2GVVHqzyiOvRL/YQJS/O82RBCp9w=;
 b=oraiWEYx6kAd50gK8xkltQ4iheMk6U4Lrz8EJF8Z3QRt/a0i9MEWnrVFREPjHOjvZ9
 PDxqyHZteZMxLJds1Bj1Kk86sGzqkiBN3Wy1aD3G8Uq362p0uQ5jx8EEa3onGwsonFry
 GwaUIAGJdJz8CKBmuqf3hxH61+BQQntehwBAR/XAYzsr1hEY1deTEMbP+CWOoTX3T0S2
 DN+oDKZMwOynv9w78u1g1NgHg+Aj75ALffz89Suj/rAB0pXHbYoNQ9mvtWXT1UUhT/rl
 K9HKbi7XrLmiLYqiD+TFvnn6QPrVFVkL6nq9r7/V6JH/ZobbMXy0dr9aNok/b0sbggGl
 DoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=e60HSV9SzoZN0kD2GVVHqzyiOvRL/YQJS/O82RBCp9w=;
 b=WhcTQGMziSa8bOjhHx3shlo2VxM0X8k/zqPjFgmyDr7vkzDrjvPI2zpAE5OYDf/UAp
 RAaK3ZIJk6StOIYqgKcPCloOwcJAKoSr8hHj4gd077zjejPVhxTUNMJuoFMqfobBIKOG
 5Dfhb57sxxTPK86Okz2qkchU1bz0yomNwC5IXPQW6q1LrI//iBQqYBXzrz352+t41hDP
 7peVKJ+AVfsTmM3pn8F5kCwgmoBUfkJa6DxKJMoAn+PMMBWRAhhXSdQccfc9H3AoKuvp
 7hVT8J7mUPULTRBh5LF2xFDYUyY/aSaxe4a42hvE2zRnbdBCIeHkKYtcCw2D8p9f7hj3
 ojfQ==
X-Gm-Message-State: AOAM531RD5FuCSdI9ZLHiuEzT65OqoELUk2lLkgI2XbomqTW30/BM3iq
 c/74oNrhyDcvgfd6/d429N8=
X-Google-Smtp-Source: ABdhPJwA+We0NPPJN1g9nf9szH7Ejyr0iispfs0mTZ6daov2x3f2dTSi5tUZ9xN5e+G+e0NiQDVecw==
X-Received: by 2002:a50:d098:: with SMTP id v24mr19298651edd.288.1628353015658; 
 Sat, 07 Aug 2021 09:16:55 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j5sm5335256edv.10.2021.08.07.09.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:16:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCP0H-00031R-Lt; Sat, 07 Aug 2021 18:16:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210718215516.3296585-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 18:16:53 +0200
In-Reply-To: <20210718215516.3296585-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Jul 2021 23:55:16 +0200")
Message-ID: <8735rlgrgq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tftpd: bump to latest git commit
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

 > - Update indention in hash file (two spaces)
 > - This will fix a static build failure with gcc-10 thanks to
 >   https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=18ac1e26f756dd47fef33f5f706b0ec8fa696216

 > Fixes:
 >  - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

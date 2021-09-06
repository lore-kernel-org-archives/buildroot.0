Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A237C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 19:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2589561052
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 19:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2589561052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00D9608D9;
	Mon,  6 Sep 2021 19:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxM3JGmcsu2Y; Mon,  6 Sep 2021 19:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572B2608D4;
	Mon,  6 Sep 2021 19:09:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79D4B1BF34C
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 19:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76A5B608D4
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 19:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYM9eXi7Dcc9 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 19:09:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C945E608D1
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 19:09:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j13so10609290edv.13
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=giSYMtxdR8WPm6IbtY7GNJACyL5JDRCP9VKG1OlfVqQ=;
 b=Ct7cyy+WG4JBFtvIDnGpeTb4QSJ4X6Ml09HpEbMDbYbDJKwSPNwT4icMoGLi7smen3
 xQYIFj2gwTC4/VAuy2q/29cA5Knks46uqwqO+R8TQD9G3MsHruh+locSNdt8gZoL9zJy
 qAad/2fodquUjdRvcBWforT9hAhkpjsYCqiR1UarNqbpPukCjkolKj+Uz3tvqnFbK2Em
 oQkQjeRAT2SSchy6D0iTFliUueaJKqVf8w+4L2/jb22BWzkrVMWFaKfs7P8tc+GUbhwc
 pZklpZrMC9beEutvITFOKmSyQ2WCatnNGgppDLqCDbPl6AQm2qY1hxy+jqxIxE2lUcBJ
 Rt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=giSYMtxdR8WPm6IbtY7GNJACyL5JDRCP9VKG1OlfVqQ=;
 b=roIwKPIxOtzpb0AqA3BxfVFUMeqtLK5F6fHr4l1inf4RtEp141UXG9qXAcwyzgUUiR
 zVEp0hetz0AQ6xtuTTnI9B+MkxICKRruLEJKuf+nPnUHbT9Ya/3+R9rMr9vZdG2dAL0d
 7gc2qqUqwb3SAxzuOgDozqJ1+zCsXXn3xXLw0nYODxQhHen9ESCI0qFq0NBenpEcsZPN
 bTrUMtNuzfwl7w1oh+nW8pENKcU9t2tZBKtb4Ossfi9+MQAUTWZDRQeYG4cTTyDykAr+
 Suek2m8GqeQ7CqsjD49AaHWxkGa6OePFlpMRAL5NoH9oh3YYYSS4BubF+kxdoATcNi+L
 jQLQ==
X-Gm-Message-State: AOAM531LFBJcHKMds9o4Ecri78BAM0025Y4JrR8xZRe/j2S2nf7CBNnN
 TFUFFvIgGoZWkj6avKG0xNL2rkXYUSY=
X-Google-Smtp-Source: ABdhPJyTnFMKmsTlfUGTJ2SaRqjaNmwV6OawqnqwS1NnX7cQpt86JOh//E/3+XEAAl+c6iRkgA0jYw==
X-Received: by 2002:aa7:dd93:: with SMTP id g19mr14839195edv.262.1630955372105; 
 Mon, 06 Sep 2021 12:09:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 p16sm5093778eds.63.2021.09.06.12.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:09:31 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNJzm-0004gZ-UG; Mon, 06 Sep 2021 21:09:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20210822185309.2914068-1-romain.naour@gmail.com>
Date: Mon, 06 Sep 2021 21:09:30 +0200
In-Reply-To: <20210822185309.2914068-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 22 Aug 2021 20:53:08 +0200")
Message-ID: <87tuixh66t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_docker_compose:
 bump the kernel to 4.19.204
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > gcc 10.x is now used by default but the kernel 4.19 used by
 > test_docker_compose doesn't build with it.

 > Bump the kernel to 4.19.204 release that contains a lot of
 > fixes for newer gcc.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

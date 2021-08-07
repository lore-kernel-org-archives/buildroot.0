Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C20C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A432861050
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A432861050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1CD83004;
	Sat,  7 Aug 2021 18:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbmQEk9t9yuM; Sat,  7 Aug 2021 18:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF3C482FAE;
	Sat,  7 Aug 2021 18:00:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 186011BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1588D82FA2
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFLOP6iNmYze for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:00:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B3DF831BD
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 18:00:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y7so18043561eda.5
 for <buildroot@busybox.net>; Sat, 07 Aug 2021 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bGL+UCdd/Q99X2J3t1Rpijxjsy2wCPZELspHhQfmGdo=;
 b=XXSYwiT2awMO9jKxkknUes2PX3IVi0nycYDwyTADLC1V4ZsiV+w2NnY8u7RmhFUk47
 Vekww3ROun9XH7ae1Jfs+oYiAB4cT/oYdy/G5MT3nEuKnw+0a8qmNBd4rn+wnLhTbxo1
 ab/JhohNeUiNeZwjoKNIh88LSeX+GgKOkpaoeQPl2866HV+xgX9t3Jq2CDfjqDIL9jKd
 f9Oj8Lhw/MTHyo/dwNxie2lNkXPyrR9MAkzuqAuYFOw4u5UukXqzxDLfcSF52Wul4uB5
 4W+iyju722V39ceF8AbY5A1WMD3lSsf9ZivzBuFgy7KVnZDRqslb3KH2J8UvvyvMR5DK
 2uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bGL+UCdd/Q99X2J3t1Rpijxjsy2wCPZELspHhQfmGdo=;
 b=YLlTA4SCAMmtDQvCCQ+9n2iw/BbwET3RQzvcxCDwON9dO/H1otyIvhtyX21dFdkkuc
 mVkrvdbwieNcB85/waEKiZrH/YriN7kxai8PJU2wVra+2XsY/1L5VnntyBz/ReTU3GL0
 rFtYM0b02YeBIygbFVwnhXOe5yrKP2gOrUTPMATnPoleInTglziOQAFP7nTS4FQqT+vJ
 l4kxs58aaCD9qBicfHoND8OwIujEUcRv+Gc5J3Mq15YXUYPxPbuF6REpln0onxH9mqkx
 SK42ghSIxYA4dd1wB5TrW/MXV7jMAeFuAFnPCXRM3X94NdbzdWC8pLnjMoMClgYe3+nE
 7LhA==
X-Gm-Message-State: AOAM531FNCiqbArPKUyDsMHZWQ/fpKTGp2rrwCjjeVwi+E94w+dcIbxI
 N5d7mQLG7/CKkCzV36q3JIM=
X-Google-Smtp-Source: ABdhPJwd67xe5c+ZwyOUTk16BcjBWtwU63i7MKNTyRVBb6E3sGgfOldwxga19+6O60j9YMGQK4WjMQ==
X-Received: by 2002:a05:6402:348c:: with SMTP id
 v12mr20114125edc.159.1628359205591; 
 Sat, 07 Aug 2021 11:00:05 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id i11sm5425149edu.97.2021.08.07.11.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:00:04 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQc2-0004Rf-A9; Sat, 07 Aug 2021 19:59:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210801082956.3113190-1-francois.perrad@gadz.org>
Date: Sat, 07 Aug 2021 19:59:58 +0200
In-Reply-To: <20210801082956.3113190-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 1 Aug 2021 10:29:56 +0200")
Message-ID: <87y29ddtk1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.30
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

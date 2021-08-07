Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FBDC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 672D261050
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 672D261050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 117BF401D0;
	Sat,  7 Aug 2021 17:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLHrII-Bc2T7; Sat,  7 Aug 2021 17:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3825040112;
	Sat,  7 Aug 2021 17:56:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 057121BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB8E240404
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8r4-EiTG0OVI for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 516FB403E7
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:56:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hw6so21158899ejc.10
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8wRm/vz2Gn4IH/Q84Wq8sWio2lJZwt80p7eiC4rRnlw=;
 b=q98rRxabrndXfm6FZ6iDGq+VIjEiHbIai+F0DVyw7lIUwF4fa27DWBPaQAefbH2Yp0
 BS2SC+1KW6Y62VJCMKcl10xmuYrxEWS0KAxhWsyf+26Y3AoGO9nI2KCfhVAGSVvM+Mfi
 1eiXh64CHN5XskluIXXUbiIr9NOHnlxdkmoaZS56wXubiwGnhedQ5YONcXKmxNcHGRlN
 crKvakWUKQ7f4EvDvjeC/5ODxSA/owOvsZSsxfj5Lmo1PWYnVmCeFlGIPzAqe3k3lMYL
 jV7zuv6fYEhqaohwmLM5x9H5kQt9VGIU7mewVmQ4pnSSQkkuTrmYy1WybmZP/lHn+HDy
 VNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8wRm/vz2Gn4IH/Q84Wq8sWio2lJZwt80p7eiC4rRnlw=;
 b=maocrY2hsL4aIl6qHMdazDrmFjZBL0MSo24eOkhMWSU48Ym/1ZMBeBYqFm6d5IpGFW
 lgY2WOPr3v/O3Qrba9c+poNvfTNMeTtB1kU4Rf3QkR1hsCJIgXeNecifzLEPsdqTWxjd
 ZvQ0p0B7f3JXvnVEj9vbEe32QLpi41jxwAgjgAVhaUIOwyaHQuHHEAIL4IHrIb/kux8F
 ZqqHVaaHLLtpvVE9U6YYd7J9PhPaUGnPuMeo0M7QX5bk11CeEJIBbJn1VGwEzi7LhjhX
 WVoOOW3ha53skPNQbMh45VA9FaELH4JS4FADyIbzB82XzCk6kCuyRbOvQxSrapdH7XES
 PXqw==
X-Gm-Message-State: AOAM533HpU6RmxJpcVX/erkUNhFXcxD7ZTfxRa6GtJrp8eDV2it1e+kF
 liTD1ZFkmp9xIqkaMXlH1lA=
X-Google-Smtp-Source: ABdhPJwRbxbTd1s6eDSHy1jU0WRrpDcMqjJXMQyGnIpi99yCJKa8gazLxuvxmVHCL3+zMiT5TKPlJQ==
X-Received: by 2002:a17:907:1b02:: with SMTP id
 mp2mr15518416ejc.196.1628359001392; 
 Sat, 07 Aug 2021 10:56:41 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id b5sm4043817ejq.56.2021.08.07.10.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:56:40 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCQYq-0004Kb-A9; Sat, 07 Aug 2021 19:56:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801081344.2681071-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 19:56:40 +0200
In-Reply-To: <20210801081344.2681071-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 10:13:44 +0200")
Message-ID: <8735rlf89z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ibrdtn-tools: fix build with
 gcc 11
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

 > Fixes:
 >  - No autobuilder failures yet

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

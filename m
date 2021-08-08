Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BABC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:00:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6F560C3F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC6F560C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71DAB82F4A;
	Sun,  8 Aug 2021 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N67ONY2nCXtA; Sun,  8 Aug 2021 17:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BD182F0F;
	Sun,  8 Aug 2021 17:00:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 762D91BF283
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 735D782F0F
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uE13wGG3bsi for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 17:00:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D14B782ED2
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 17:00:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c9so18115134wri.8
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=6GxmmVBHm7BERaNZjFa2H9UOv85wuMhakdNtP9EBBus=;
 b=L7bJkcS2P20Z97Y1nSWpXbH6CyePTr2xsfqvRPgrOBywQtj/40+htLN60AgJY5OLGR
 Ob1Qky0XyCUUxWoddOPmwo5yUdLOQLTKh95SmHzgLByCZKuNeRz99EP8EQdWD6s8Xs5u
 HHmeVhQUDWdO4vpMELbuPf5iKhoGNujfeHxLeCwZyjbgpJW5Z5hoNqznuX2k7BmfzNzX
 OsRFf5VK7byVYNscZi3w86Rof9C7IXF1zrhii4Tc1aYy2DOiqNdiLoH/W6BJFbfVQba7
 5rDAuX7y79cAwbDJFaq9it5aflBlV5wTLYjZ8HB3UcOsmIlgS4Lcz1x2zg9n3cbHgTu1
 Nv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=6GxmmVBHm7BERaNZjFa2H9UOv85wuMhakdNtP9EBBus=;
 b=hhm91JNg3BvFHbqy0o3SCMlUoJsjUHiB9vSwSoNXQlIcrvcnagGgRWrO0pwGQRZzy2
 xnIGm9lltGKBeXzRKfLP3J5UdIWEiivrnWRzhJUamCwysY7GyD1Zt9/d2RRVmaSo5USB
 QpUvoPi1twRhXwiiLqqnj57ndWdmWlqNAeJLLSmhbKPx74TzCwloKwR4R9FHvmUqIAXZ
 cEiE9voMqsXT/0jcGb+JCfj71PstROPD9BoASyTeprFWS7h2fKLAMrTvq4Htl1rrQxnX
 KXVGCQW5xuVLXqsT3dvsIR6PzDC06oQgSSQxB/kR5/TsI5EnNYyFbcCXCTfWaZaqNyyB
 U2bg==
X-Gm-Message-State: AOAM531J1ipLvFzRC+F+bYfYfj5wuBOcE4CxJ7qgMYZuz4QfOWl7eX5O
 6iMhshFcGmgd6NOiTAb7J8h6htQXGAmxmVbL
X-Google-Smtp-Source: ABdhPJzwxl+A8DzXkNVTRM9G8cm45ugt3dfOexLeTzwvWpPgm+QovKVT2QwMvUNuukBn6Kj7V/egpw==
X-Received: by 2002:adf:e548:: with SMTP id z8mr20753064wrm.57.1628442018996; 
 Sun, 08 Aug 2021 10:00:18 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id r12sm17601505wrn.31.2021.08.08.10.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:00:18 -0700 (PDT)
Date: Sun, 8 Aug 2021 19:00:16 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YRANoFGCfoSx9766@pevik>
References: <20210808103506.3651341-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210808103506.3651341-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: disable tests
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

> Disable tests to avoid the following build failure raised since bump to
> version 20210722 in commit b984cba490248e6636b53b4b26b959cda5ed6f6c:

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

I haven't seen any failure when I updated iputils version in b984cba490, but I
was surprised not to see any error.
Other option would be to enable iproute2 as build dependency as I thought
distros would appreciate to run tests, but understand you prefer to disable
them.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

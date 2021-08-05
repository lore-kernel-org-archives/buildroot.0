Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC024C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E18161104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E18161104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B0180897;
	Thu,  5 Aug 2021 20:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJwm9dTasblm; Thu,  5 Aug 2021 20:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F8983B23;
	Thu,  5 Aug 2021 20:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3E511BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9023583B6D
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXphLNY6VYCK for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:49:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FD6F83B23
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:49:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso7274309wms.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=TlqwFYwU1aQvUTAy/38p08SfmPSQD6NufTeXV7gcElw=;
 b=d9iEmhmExzU2pMIIoZTV/vyJIXqzVGVrGVkaNssR/aNqjzu3WT6jW1da8VhlXL6F9z
 RyrNO9tZsoXVuDgGh9Hyc6SbfOVl6qkzlcXe2Hz0mpsWgUF7mWIxJtphq055CbBBCdzR
 nSMke01Vc0c0pwL+cJJVDpWY6m/wQRjmPGBI1IHOVlt+R5XK4SvxeUzXCwncJVImGuAx
 9IznsTLsE+tWYueejg9MI/A94uKMXZ845q/u4hl+L6TDgw16K1ocNjTvZ6TyREfN5+KE
 RAQvxz7LvlOnwO6bwD90b+oqBGxwUriT6IU8jid4/0pIS9VAZKOUhnPN9C8dFUVe5iet
 Uv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=TlqwFYwU1aQvUTAy/38p08SfmPSQD6NufTeXV7gcElw=;
 b=QdolpJAUPjkEfG4VR6CU7qIrWjp70quIdOkZ3WR+24p/2a44vgoDnzzhBIJlIZdRYm
 iNACAeEqGrRGO1/rigf/axem80brp7n3gnH7TfIU+oYy3dFEC3BczWKTzni88p7EM105
 2755icItjZMJSIUv49OyZgfBZugjtGjFRR2Uliac4cvTwuNCRqsg4NvLckgFvL4utTai
 207J+JDfAVuhzp4z+P96m6Inyu5OlfqIx5jBP8L6Jr6nLB0n2MKjQsMhVwXvqSxVkKoL
 J4jL63dMIzqtOYwfrq1AemfUthS5D77DG9Vkh/OItYvhQLYh73PYrgJENPc1RN8gCLd9
 a06A==
X-Gm-Message-State: AOAM532WpwmchpSrLT6QtEXzIEd5it4KuavbPYX2ZtY1Th6IhGo5EnPg
 WTElzXnEFoMe/oBQbqjz784=
X-Google-Smtp-Source: ABdhPJzHy6Jz9Y9XPnTiSX3QQh3Hxeasd2Pp2VpkSNu5Jr435PZp8F95QGDXxbjIb2xsEk399UrRZQ==
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr4240wmc.83.1628196545547;
 Thu, 05 Aug 2021 13:49:05 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id c15sm7285040wrx.70.2021.08.05.13.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:49:04 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBkIa-0004kE-8q; Thu, 05 Aug 2021 22:49:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210726061610.539117-1-bernd.kuhls@t-online.de>
Date: Thu, 05 Aug 2021 22:49:04 +0200
In-Reply-To: <20210726061610.539117-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 26 Jul 2021 08:16:10 +0200")
Message-ID: <87pmuripmn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.6
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.14.6.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

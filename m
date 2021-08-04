Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807E4C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:49:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314E760E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 314E760E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC24E404FF;
	Wed,  4 Aug 2021 17:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLrTUk-6e5Xf; Wed,  4 Aug 2021 17:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07E0540239;
	Wed,  4 Aug 2021 17:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8B41BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38F59608B5
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nONOE_dy8BAD for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:49:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F3BC60776
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:49:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m12so3123184wru.12
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=L0cI9qMvblATgL2uz4eCIwjhKgeW1HDzVeEVzMpiUrM=;
 b=sPzg8b2Z/S965X91CtTn7iSATnVa5QnejBXJBJSYJSzcQwpzVltelebi3ClxeVUbWz
 BZkxUwq0a7hFGu/jgKX6t/G0CSROVOQt1RCazGFnsTvOjmIZ+vX3woBlcjwFSphq1xbJ
 XooaeWjfSTodOuFHfaqFSeNNt/98t/SJrzs1vMgDijntMfz1SgRxYioD1IocbcqPp8MA
 e3a4NSSl8qX2IhpEtaB9iYh5+gbxwXAS/GteXdImyGFm/ySzIA6c8S/tStXxevYdTHFV
 QPItv0b8CNfFay0BLUxBsIrLa6+78y/1mHn74E8NL4z2SCYIHWB41gb+yUlrfQUUkjbU
 eo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=L0cI9qMvblATgL2uz4eCIwjhKgeW1HDzVeEVzMpiUrM=;
 b=WH0DqAQ+N/e/M9BYkY4x6mk1ckftnbMSWu3fPVyQzRPQpPhJT4pA4LGhdZiwRod58u
 ybJnffoCTuPZI2RPtncghK8Wh133yVNxQS5jS5gBKBFT1J3KUMbzwkqv12F2mDtMgYFJ
 yUKDzJBUs8HU1qPlg0D2bD29F8qR/8EvLFEvtXvvBY0I/wgRdxr/9Xw8h4QF+FtUN1vl
 14TDVjJGGbt+2nLZR/KPaCVl5CGyhi7O/dpTdoXUYVmL8TBp0Np9F6BEeBeZBsiL6CAc
 uC3ch/2bKRXEsGQpr6MX46xkhDgzieoliFfxBJfU9TLZ1b9F4L9inqObMaYjAe3BAfu7
 X10Q==
X-Gm-Message-State: AOAM5303QXhklxB3gAVSbjgnYbzHMtYObQIgfa6Kdg/a+0qvtAqks07h
 xhy7hVM4AXo3qP/gMcfpuWM=
X-Google-Smtp-Source: ABdhPJwl3EuaJv1wZmBG9qAG57pu2cMJN/p3SEMX0LOs2upWpSZZJMcoC67i/wEPBw8STqM+sUXjFA==
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr571881wrx.88.1628099371465; 
 Wed, 04 Aug 2021 10:49:31 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id p5sm3602860wrd.25.2021.08.04.10.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:49:30 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBL1A-0005g9-TT; Wed, 04 Aug 2021 19:49:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721170952.488953-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:49:24 +0200
In-Reply-To: <20210721170952.488953-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 19:09:52 +0200")
Message-ID: <87r1f9p0bf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Support for tor is added by the services/tor module in the SELinux
 > refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

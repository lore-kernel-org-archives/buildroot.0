Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5B4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F1260EBB
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9F1260EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43AC82C75;
	Sun,  8 Aug 2021 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 116MpH-8lk2o; Sun,  8 Aug 2021 19:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0859F82B51;
	Sun,  8 Aug 2021 19:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3561BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 566F982B51
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r32rvcczl0eO for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C65782A8F
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:47:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so10007511wmd.3
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NINvokUtRe+tdI5rAzCkO47oeV/cHcEv7rfg8S5i0F8=;
 b=RSt8cTOe+ioJE0P/Yc04IKrgEkespQKTSS+G7Uw8Pb1s/ezZw2BC8fHuCqcbvZPBB8
 Rpp3RgQyh3A+h5QESGWq3ogZ9EzsSXg9gY6nxpIqoHX3fBWUtqa/TT3o6ksMRxD3etaQ
 GYREuagcTkXG4jTsHIRY3JYXoHQ+lHoJpoKZJsc/pd+HOORjzp0VnNMz0kdvYkcVx9MX
 j6v48n82U+78AVYckhaVQL6awldNXhv/TZ/ZkgG2LeKv/fLQJDyzNyVoFimKL/QR6Hwa
 WZmb63dLW2uM05pBRFRhgsF0leoTDRQe0iTocOs4ACJPbeO0dv8YkEEq7ZGbw8aIoXRP
 z1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NINvokUtRe+tdI5rAzCkO47oeV/cHcEv7rfg8S5i0F8=;
 b=YiTNZh9U3ESqg4v8GSwIqg1nyc2eMXs8QJZHXsAxI/KBWQjcYESBeB4r6xbiZ54sLS
 vUh49hjXQ+eICeClpl6X5M/A9PuqdJy7kEs1yv5pIw5MBZqIvq1GJEd7WUGmmGW4RsUZ
 IEZ3z9O3y8dvUHM2wo623wKh4Yg78MhDTIJzy7n9Ii3nf892+srM2SDw2Fbo96nxtGlc
 zLDrGgUgBveMxM+mvUx0bXDETehEQ+gEdI24g7lS+AeM1YuWxYT8hi8TihSEIKPEzPOD
 lT0jQROpzittvSedoGl4ZGfT3XnFczXmvaUW1SenT8xFVDFRT4t47BLcugURb4mASA9l
 lWbw==
X-Gm-Message-State: AOAM531tHYcXvw76wxvW4dMA74Zc/NqMEtJjckfzZGGw4G2n4QaEQAhe
 n1c0sfBReq0jx5kwjIhHPUshyYIvv916KA==
X-Google-Smtp-Source: ABdhPJwJReY4m2BzjAcfXWL5vg9tjJZ0R3K34QnZQqbWVyDCMrernwWWybGMtVHo4cBODoDoj7Kd5A==
X-Received: by 2002:a05:600c:19d2:: with SMTP id
 u18mr7396352wmq.19.1628452033600; 
 Sun, 08 Aug 2021 12:47:13 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w4sm17535650wrm.24.2021.08.08.12.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:47:13 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mColL-0004b7-SO; Sun, 08 Aug 2021 21:47:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808185905.11617-1-peter@korsgaard.com>
Date: Sun, 08 Aug 2021 21:47:11 +0200
In-Reply-To: <20210808185905.11617-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 8 Aug 2021 20:59:04 +0200")
Message-ID: <87v94f90sg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-2021.02.x] package/glibc: security bump to
 version 2.32-50-g737efa27fca5c97f5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-33574: The mq_notify function has a potential use-after-free
 >   issue when using a notification type of SIGEV_THREAD and a thread
 >   attribute with a non-default affinity mask.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

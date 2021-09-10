Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EC6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A95B0611B0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A95B0611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745186076A;
	Fri, 10 Sep 2021 11:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6F29EOjdUgs; Fri, 10 Sep 2021 11:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E452D60B45;
	Fri, 10 Sep 2021 11:09:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03A621BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4B0383B51
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id END9ZqrrxHPh for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:09:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFC5383B42
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:09:29 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a25so3467185ejv.6
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NJwqjtsK+rn2gTgkVCQ192GcUyiTbUFfM626XM7PQk0=;
 b=CBDcuEiSlfDF/EelE23SM/0NGDfn0OsihB/idSP7bO7cv9HKhiDkkkDphaQFOugtze
 RHE547byTccnAjPgnEORlVcpWq97BjiC626lZDmPybpA5qKUeDhfArQzm1ElhchN2Vh5
 qwQ9EJHp8zvy4Hhs7+xioMCKKFukLHp/xIxGUoFg0hq2TV3NDhLMB2+p9mXPK3DbFJsw
 111ZihdoibOQxgNBMEtHsJl52SNBbhQvrtNGZ2Dmy3blFrvCXaI2JCI/adXikfHWMqvr
 2ycXV0A7n90x+eZG9+fB8nd8Iv7vIvU3acMbRZFW9cAXpVQDXur6dUARDPYXmXpCqdho
 x+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NJwqjtsK+rn2gTgkVCQ192GcUyiTbUFfM626XM7PQk0=;
 b=qOBQRbW9lEdaa51NsQDos3hReIOBXnllQXSKJ7f9EgXvBH/djR8W2B0+nRmlb4HYts
 T9Iy4Mmdy85BQs99e/mMsXovgwfCSZhu8axSR5hhP8eMcCpfmcSpSZ053AMkxzkRbQKh
 l+3xx6pa7tspr01RkkPFJGRCutYWpmyCwBfYMLVsw+ndO2MM5V0ewkPPF1umYQ/knkSY
 M95SCLb5NGy/8qcSb9HdaGIO9vNQk1i3B6W0FCKSK/jRobxRSdJ+Av9jcXZd+6iLfcXQ
 WX0TXr09/5F3pVNKM+EplNASiR393PHeBRNc45MhR4F67WkQ5ZW91xWnKyB1dKPfXlFb
 Xwhw==
X-Gm-Message-State: AOAM5334Rt/lIhZt3P002UiPleUQA1fE0CyYvjVIcLwMJF/toJLdWw7N
 CdDTVaVvSyLYMQe4cBI4pbs=
X-Google-Smtp-Source: ABdhPJx0b84Vo44oGQTF8TwxjMNUE77kVvykyNX5DAsQYbVA/VLeDqyY2JVg6XdAb1KunusLSm1q+w==
X-Received: by 2002:a17:906:d789:: with SMTP id
 pj9mr8515435ejb.134.1631272168115; 
 Fri, 10 Sep 2021 04:09:28 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 m12sm2293917ejd.21.2021.09.10.04.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:09:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOePO-0007aB-5H; Fri, 10 Sep 2021 13:09:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210902162222.2232480-1-fontaine.fabrice@gmail.com>
Date: Fri, 10 Sep 2021 13:09:26 +0200
In-Reply-To: <20210902162222.2232480-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 2 Sep 2021 18:22:22 +0200")
Message-ID: <87zgskadqx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix build on
 riscv32
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on riscv32:
 > In file included from thread/qmutex_linux.cpp:45,
 >                  from thread/qmutex.cpp:804:
 > thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
 > thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
 >   116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
 >       |                              ^~~~~~~~~~
 >       |                              _q_futex

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ffedfc000029072d5d724e98ab4551fe973658ce

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

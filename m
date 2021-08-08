Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBDFC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98DD960EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98DD960EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5C740393;
	Sun,  8 Aug 2021 09:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pI1iDPR9wTL4; Sun,  8 Aug 2021 09:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5DE5403B6;
	Sun,  8 Aug 2021 09:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4031BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68C8D607FD
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjmD-wbL4FwL for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:52:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 910AB607FA
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:52:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id bo19so688926edb.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=0KkEnGIrdakN7R3mAeU7ljpspW33d0ZWR4jUOYiV+Os=;
 b=NR+SD9BC1fjL9HN0qNP+6SXBn+vOPwUmgjy5ZXEeCQ6wAQKUre5Vtqi1zNl06p13k2
 sn5aTBaf32tluNmdO0Cav8mWITSxmal5LcmdIZOdyjatI597wllirmrbkXPeCtotPYkR
 LoLC4dAWDblKoSczXbz9wGk+9Tbp1jz9d+OeV+mW7vrOXp4KE1xLlT+VF6wti45qHPyy
 fZgmWtWW8U239YlIqnAzqgTq+PwL6WH2YMfYEHDCzd2Eit2TmBgL1x2IsdSz3vq9k9z3
 cpCZ6RBFyxCWts5dU7LqN0rwkeml18LPJaaHRaheLSs/ZYHG1NWp1cilYxuw3v/l50+H
 lS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=0KkEnGIrdakN7R3mAeU7ljpspW33d0ZWR4jUOYiV+Os=;
 b=rqdap1jvuuPst5qJ+lFhUVtX3DCDeXYWGemUeKUm11DmOkutWMxEFZTVsA9V1YmZHX
 14VH4NekkPc4kfnXAsQCt9A5b7T098AEfDLytzBSI1h/8D3pOPypUi6sY9/a69C9pqai
 GmFMTmzWdPkB0mNeXuDmtZGKJTwIX49xTwie9WWl2EDOh96+Sjw1ollv6YaOzt5NzPci
 fg5Ir+OukrAx0Q8kUJVxfBepFVVkf63AhPj8BLbtTeaaiPlRIRDjoVCfWbJR/wEYaC1F
 0so51zeu9Y4x7sG9CleNky74tEUfFuOHJeNUTd++8Bu2nWeDUwTdBoLYHyjn2VetYpfr
 SQbg==
X-Gm-Message-State: AOAM532CkSc/2KhrID0E8kowWtFeN0UP0BRXyS+5LwgMk2XCFXris3FN
 Tl7ZjvvTy8bPlP7J0rkf18a72dLZ8hV1hA==
X-Google-Smtp-Source: ABdhPJxSC6X3QOGovcpx9n0rt2G2T+42p0m+aTG9/XgQGk6EwfuzyhULapjjUpUyZ6KRIyLS3nyfZw==
X-Received: by 2002:a05:6402:35d2:: with SMTP id
 z18mr23635507edc.282.1628416354797; 
 Sun, 08 Aug 2021 02:52:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j11sm5019120edr.49.2021.08.08.02.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:52:34 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCfTt-0003Vj-Mv; Sun, 08 Aug 2021 11:52:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210805112123.2111703-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 11:52:33 +0200
In-Reply-To: <20210805112123.2111703-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 5 Aug 2021 13:21:23 +0200")
Message-ID: <87sfzkb6vy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libxshmfence:
 disable on riscv32
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
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > xlib_libxshmfence unconditionally uses SYS_futex which raises the
 > following build failure on riscv32:

 > xshmfence_futex.h:58:17: error: 'SYS_futex' undeclared (first use in
 > this function); did you mean 'sys_futex'?
 >    58 |  return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
 >       |                 ^~~~~~~~~
 >       |                 sys_futex

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b3523e35fde0fac04b96a6278cbc6ffdfe56f7d1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

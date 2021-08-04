Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F8FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D9260E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3D9260E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E43608B5;
	Wed,  4 Aug 2021 17:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vij_1qB0Km8d; Wed,  4 Aug 2021 17:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AEC60776;
	Wed,  4 Aug 2021 17:46:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D215F1BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC9583B29
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARo1Bbt6ZUXR for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 253B883ACA
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:46:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b11so3164222wrx.6
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=qU5jZL1DsXZbpplluBH/VWcj03E54XrSq72iJb/RW/k=;
 b=RdKxTalBxLzSFtAMcrZUVkWCslQv2Kc5yTzzWmTjscwN0ioP5nawedxodH5RgMG4j0
 CDhgHBxhQDAVtYLZgIzJgKHrlvSfUQASnkzS4mHLS43rjMv+rExsg4BKIx4JpwU4xLXQ
 +Triw4oHeUmYomXw429Gze6r9LJqT/tyvJQBc8tUMz5krRFlh0nIlHYZI5vfud1fnFHi
 Yl4EmtvjuelmxLkAzmjXrfxqo5REohAD/IpH3+aU2C546uf0S2Du1+TtSjXm9A1IC+gp
 36KWotk7ut2kANa3u0nLDNhmS110TBoZmyPgYXGDSClgIu8K3QrOJ5sTFFvIkrGJws8o
 kMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=qU5jZL1DsXZbpplluBH/VWcj03E54XrSq72iJb/RW/k=;
 b=HXhT7R9q3vlPvjyM/tjjItz21qJ07qQQ0fRrSpj48R3B+8+EVAhzoNXKvPnx9had4D
 CWlT6HNuDvFuF33Wgb4JdFBpKitITPIobFo0dkk6210+UqJCnt4KZ9m4XLHdZsqYaXei
 U8t5bPc4ZfN4drWdatJ2QbivPZ3ukj75QRKvZDv2erEhwUGML90kLMrjyo9ELSOGdM6e
 CPNl8ENCEhbjaiK5KGPM2fSkPx9Zg4LGOOvCgpBWUwF0KcZHaRYb+7OEz0eQSuMCX3Os
 nnIrjh1u/Z32mJOSaYh34x1/HZJG3qSYC4X02JS9lUVvfymVv0iE47XUI2jkREDZSzFL
 rs+A==
X-Gm-Message-State: AOAM530oiT9uN/WSmHmfyFnkBNhNi3yev6VRtWrTYweT576eBrzjlP2b
 lzwGK5VnsfiSG/LUmBrDtIU=
X-Google-Smtp-Source: ABdhPJzFnvCNlY3OXtrOi6JuzDlig8IM0CVk9qw6q6Vbd5G8zcuw8aGC66z6tyHNYeev2erQJCwpaQ==
X-Received: by 2002:a5d:65c1:: with SMTP id e1mr546107wrw.320.1628099212413;
 Wed, 04 Aug 2021 10:46:52 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id q14sm3474704wrm.66.2021.08.04.10.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:46:51 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBKyh-0005Wq-6p; Wed, 04 Aug 2021 19:46:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721063813.440330-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:46:51 +0200
In-Reply-To: <20210721063813.440330-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 08:38:13 +0200")
Message-ID: <874kc5qf04.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Support for dnsmasq is added by the services/dnsmasq module in the
 > SELinux refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

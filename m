Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29847C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:05:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D1560FC4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87D1560FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D9D405CB;
	Wed,  4 Aug 2021 20:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvSiHOwQq34P; Wed,  4 Aug 2021 20:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA11F405D6;
	Wed,  4 Aug 2021 20:05:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11A1A1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E7B560744
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z77x6_Ts7wQo for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:05:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EADC606C9
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:05:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z4so3519566wrv.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bSclomyGt8LdDNEkUk7P/dvISKqv9Vq3AJYVyw0Ghp4=;
 b=A1p3sOkv1eu+lD5/H0ZesKWtsn6ICCyu0avRh8txH2dkdMZPCsSuQdzG65oxjkT4Ko
 7qQM0X7sb8cwyBtl5W5Qiy01JwPHhNucD+7Kxea80xpb+Fdl0+U3sAwAjTKyqI+iSSzT
 HLS2CGu2ZmQZ1b2Mbo2Z7rn3RSW9pvHNITdwGi11dstkmNxt+KFIRosKXQ5seB72n2t5
 80oNIowZ7li/Vd1BjhYA0X97z1eTpzufiILPRVLUX2g8l/HJGFGsgHamaa/5qI+5H1PU
 iy8pd6oMxytu1ZbigfFRiTtJfOowawfxDmB4SKo7w9PUbO3dGps5QSE3NjGc0HquywY0
 rvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bSclomyGt8LdDNEkUk7P/dvISKqv9Vq3AJYVyw0Ghp4=;
 b=UY3x01hPEw+3gPmbAmhYKA9MqGBDZvZBNBNVLd6DcrX5wj1EoTLLaD1C9TJkvePQEe
 w8KbF0w+Gao94/Ycb6iT6fShu/uyuurEN5hMd5dM5BZFNPtkEVFvYGxTYXOutgtfnYm4
 nCznIQxsbJOu6SuHcO87ehjQRLlmYYDxRR/19XOiSG6zF0PTbjmx8fLpDGwvuDYMmdBU
 0N2nFzXEe++Bc/CPQonFG8Rei5nFawhSm2qAfj0ylxJHtR908hTUNM+TfEzLz7ZVBg1d
 9F7rW5LeHUFEGORHHsxcF5QdhI8QUyNANZAb5B7skap0MMLMoN0ear5RhxVUFmt4buJY
 jPiA==
X-Gm-Message-State: AOAM5311DfXEO/myI+acbNZDtlnAR7f/+GeQ7V01hDcoS5/ZpwXzF//u
 d9kND6wKJyv/lTXBE15kh7A=
X-Google-Smtp-Source: ABdhPJzfYcICdB0KJNLAnJ98aCUXp6BXN7RlNK4N2Q6azZv3kdjk1HYZoHQBRe7rHWJUp6J5i29czg==
X-Received: by 2002:a5d:490b:: with SMTP id x11mr1054781wrq.322.1628107511073; 
 Wed, 04 Aug 2021 13:05:11 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id e6sm3259503wme.6.2021.08.04.13.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:05:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBN8W-00071u-IS; Wed, 04 Aug 2021 22:05:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721200139.502098-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 22:05:08 +0200
In-Reply-To: <20210721200139.502098-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 22:01:39 +0200")
Message-ID: <87r1f9nfgr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: add SELinux module
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

 > Support for boinc is added by the services/boinc module in the SELinux
 > refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

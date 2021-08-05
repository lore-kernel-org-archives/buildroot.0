Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2E4C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 18:52:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C3D60F01
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 18:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45C3D60F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00496078B;
	Thu,  5 Aug 2021 18:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0tYqFQMaaNv; Thu,  5 Aug 2021 18:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731B96065D;
	Thu,  5 Aug 2021 18:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 193521BF2FE
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 18:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0827A83868
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 18:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9oFIhQcsi0f for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 18:52:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12E7E83843
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 18:52:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d8so7858413wrm.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 11:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ZCPKBptt3+SPj6jGk4+U14ACTsf0f0RITfrSnYxBIyw=;
 b=nlKvE+ubdkc/syzACMIuPB6Q3d8cPl4BqOhY0jg3SCAL6L4VbVw0m7DUQvkwiZZOEF
 CYFei9720JFUv09+2DV09JQ4v/0J/Eh4WnnCRvJDToOqfy6I+11s5cGVl4v74JMUT+kP
 qH8ExEr5HRzMWZpyd65EuYhDGkClKl27KLmDky5n/e/QfDwQGSrdypqvyc0J3Z0wvLR8
 +Usv3aWh+psvvYBkiBC6AxKDyS6MvFMRHYf+01LihCl5P7XM5miMi0P8+Pam+AETTWiV
 uD5KLjPCalCcIYVtcC3fzejQrKkC/f9Gynyxn55A7lr9HA5mkKB2xgCCt0DLD+7uwoib
 uhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ZCPKBptt3+SPj6jGk4+U14ACTsf0f0RITfrSnYxBIyw=;
 b=npvWlUg5a5dRIj4dX8rpDg4aR2zpUMCID6Qact99S4521AcPkDHTt8Yrvus+NYnyP4
 7E8GsIlk3os5bQkJUeXrIGI5kRE8wxl2p6kXG1aypGUCQ8Qzn3b/t10n66LZ2HTeMVoK
 h6ruKGifPK16Y1Y84BlErAxrKux7PhBMKerMouz+Wf06jaJc9DGRy8P1CwvTxq1VAXPy
 M9JqGuDoa5C9WUmQmRxi40ejjViO86VMbwsXOdChVdYSxuf99O9s2WTIlX1R9McHvub8
 WTwg23WPBA2c4aTs2sMhAQf8OqBYRyI74wreqj5UEMvu7FTmHE1mHHVh/Dxj2jcTR9pO
 D4Ug==
X-Gm-Message-State: AOAM533jlnlnIzcoxtHF/j3S5JcgHwncRysigFPsJVvw7DznjO9nfpTy
 Q1MG1KBc8H2Y+odWappbKrA=
X-Google-Smtp-Source: ABdhPJyCaYXHmZ62cMsceuxb2rxXW2d9sH3vE8pFEX2AATlyn0iFry6ayX7pHdXH7ZJf9NVSmR5AUA==
X-Received: by 2002:adf:82ae:: with SMTP id 43mr6808139wrc.73.1628189551692;
 Thu, 05 Aug 2021 11:52:31 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id t8sm7393685wmj.5.2021.08.05.11.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 11:52:30 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBiTl-0006Rf-N2; Thu, 05 Aug 2021 20:52:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Petr Vorel <petr.vorel@gmail.com>
References: <20210725201736.766489-1-petr.vorel@gmail.com>
Date: Thu, 05 Aug 2021 20:52:29 +0200
In-Reply-To: <20210725201736.766489-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Sun, 25 Jul 2021 22:17:36 +0200")
Message-ID: <87r1f7k9le.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: Add myself as rpcbind
 maintainer
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

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

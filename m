Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492D9C432BE
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:27:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0D460FE7
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC0D460FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E06960ABA;
	Fri,  6 Aug 2021 20:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzSthZsktPLI; Fri,  6 Aug 2021 20:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1EF9606F7;
	Fri,  6 Aug 2021 20:27:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEB6C1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE03083BF6
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvEzCbXkwwRM for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28A2283BDB
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 20:27:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p21so14735044edi.9
 for <buildroot@busybox.net>; Fri, 06 Aug 2021 13:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=qFwwefZD1ODeFJM957RVz44oRuFA5WOgulFTjwu0C9o=;
 b=KZUszpT5hJdE/zYQsZPddN9mIbyamNQVgm/TupaYKUKIkwjoPLzHsSaCHtshZq+MPK
 X4GjBom2D5caxvxkh69ndOou/hmBiL0QOyfA7y+nqm7O+VdUbdYNgVBcUCfBI9B7A+n8
 +WCk10wUkabeoWyrTcNHWewBY+GjZJDtQiukaAEBUEChZDeEHffE2Hiiih+SSsjby63R
 KTQWOiLHjD8ljjvjUHM44h2YYoUlMIitYqxuYM+y9N8OpncIwXHfD6U7a6OqOZpPYeDE
 GUpQr1tKIeGFjyLLZ5UrLM/w92sqAOYtmmgrEEY2yM8100Xmbg6gkYdLkzYLTzpGNKjk
 4ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=qFwwefZD1ODeFJM957RVz44oRuFA5WOgulFTjwu0C9o=;
 b=qVlcDrK3vf/UAXSUow/fIOSX8ID95RojkdxBJk0LtOLoGFbpMSaBoFEp7bmslatAVX
 GkXBrYaoTqXGRnyJ+8RoDM+QRscmajOHOKtCUguNQy+12Ox5i2+i6a6Z8xxDY1EZexeS
 jYlqtZ5+h0uM5yBbt0IhxdS7ch5WnmcaRqYvmpINXLvR27neWYl3HE8Y6rXrMD3gMSkg
 vHsNoFFW+GPGzt8wKgfHxaTK81J/oT63IDZJmZ8Do+aWGI2Gujc5rFPt0r8OSKqk8xVs
 Z9yqvrSy8CG+FewltvYQLV2M7pqsO8YIMZKDuHImamjc+/s0bROZIkKBmu/rZbuJ8p34
 OC4Q==
X-Gm-Message-State: AOAM533uKI85z207/MAUExrrysqyDqV5UAqlCcTEqYQKHPVMLLP5Txag
 AecxvHaeic9+CRCo//e6hZU=
X-Google-Smtp-Source: ABdhPJwj5o8O4UIwBHwzhOg0nzJykZIwHF9ZH+SNqKUTbVS/LtmsUzcIGHJQGLAQ9arFP9xVtP1RLg==
X-Received: by 2002:aa7:dd84:: with SMTP id g4mr15244425edv.134.1628281670151; 
 Fri, 06 Aug 2021 13:27:50 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id qa34sm3151481ejc.120.2021.08.06.13.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:27:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6RY-0007to-Bq; Fri, 06 Aug 2021 22:27:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexey Neyman <stilor@att.net>
References: <94578b85-8388-1cf0-5c57-d970a092a712@att.net>
 <20210728021534.273986-1-stilor@att.net>
Date: Fri, 06 Aug 2021 22:27:48 +0200
In-Reply-To: <20210728021534.273986-1-stilor@att.net> (Alexey Neyman's message
 of "Tue, 27 Jul 2021 19:15:34 -0700")
Message-ID: <87v94igvy3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nmap: fix ncat on Unix socket
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Alexey" == Alexey Neyman <stilor@att.net> writes:

 > Starting with nmap 7.91, ncat segfaults on an attempt to use it for a
 > Unix-domain socket (`ncat -U path`). The fix has been committed to nmap
 > in r38121.

 > Signed-off-by: Alexey Neyman <stilor@att.net>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

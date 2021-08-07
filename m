Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238FAC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:16:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C781560EE1
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C781560EE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7B8607F0;
	Sat,  7 Aug 2021 17:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOeuQCXW8Z-a; Sat,  7 Aug 2021 17:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE9160611;
	Sat,  7 Aug 2021 17:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BEFD1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279A4403CB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3RkDFt26g02 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:16:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 513CC40315
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:16:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id x11so21016213ejj.8
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SkG7ZmMLSQttOtocg/2uezLo+Ya+40QNMzgSVd3adI8=;
 b=ihnxadgnvKG6XA/mc9mgim3RYT+ym4SyeN8W7EMQPF/lWU4RjA7gVRWiJhNAYrI4tP
 biDS3yCOW0o+x6utwND6+JT5QcQTVa3JYkpBvMXjSdJZX+MqKIXZv3PepHonvVWdKemb
 UcNXwiQ9AlkjFggKhkdD1EQTa2kmP+1U/wUSvVE6Eh+kfwUi1tE1YqRrGbJd8v9N8kH7
 sDbEcJr5X54Ij5KXAe8hTL09R7bHyKx1jXcWDrIra3EDIRHhR0Vi97F8xO/431iLM81P
 s1KNqVZrwwApvpoua4+Nk5SuyB5Rz/fx7gdfMAXGVZ/FYkoRnLUyyOdTfDkiOwQKFM6e
 95wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SkG7ZmMLSQttOtocg/2uezLo+Ya+40QNMzgSVd3adI8=;
 b=BgT9Vn4X6FTi2dOMdBpCNCH6IGaoaK++Ina2aij/ZhkcGVoLq8R0lZwTeot/KirtcR
 /O2ihUT6PbkRmbWISqCK8zpixndNGRC7md5XQ1nZkB7vqr0rfkBDbMbmzmFfIsc1X2+B
 EY+UO34e3u5RzOX5ifeuzIjhEfcW6HjlwxK6QYZYetT+iZQhvjwVQYcg3bAxbYgzLZkm
 hL2YPDtHUBQcnqTwqaEcwCuRvzYKtQPd3+dgM3VwTto+rs89sq6dqJq5PpG6png07/nO
 dhU7brQm+KSH6FOiJ/TjQ9B0p9xdFU0Aah8hNXDAIKhVvHXKnLooPBZaLjpXiUsc3fop
 kYFA==
X-Gm-Message-State: AOAM532DKSnJcK/8ahGCfFPHv16xfYeemQHQLVIgu1N+lhCELOEJNrRb
 pNgLlQhMlwpshbs6/yngaAuIZujRef4oTQ==
X-Google-Smtp-Source: ABdhPJwsNUwlikYS/K4g1rY1lp6b5QqFvtIjyKOOr44+PnzIVVlUHk6KkkNZDBpcw8ezRofaxdlezA==
X-Received: by 2002:a17:906:d10a:: with SMTP id
 b10mr14829476ejz.26.1628356594549; 
 Sat, 07 Aug 2021 10:16:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id de49sm4016168ejc.34.2021.08.07.10.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:16:33 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCPw1-0003ik-1H; Sat, 07 Aug 2021 19:16:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210801063507.13004-1-bernd.kuhls@t-online.de>
Date: Sat, 07 Aug 2021 19:16:32 +0200
In-Reply-To: <20210801063507.13004-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 1 Aug 2021 08:35:07 +0200")
Message-ID: <87pmupfa4v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.13
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
 > https://lists.x.org/archives/xorg-announce/2021-July/003100.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

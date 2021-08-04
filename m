Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BDFC432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 15:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BD460F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 15:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98BD460F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4477783D0C;
	Wed,  4 Aug 2021 15:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbw1etRCL7E0; Wed,  4 Aug 2021 15:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C39C83CD0;
	Wed,  4 Aug 2021 15:17:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06B691BF2B6
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 15:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3ACF40431
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 15:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBJeee8hOQz8 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 15:17:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33750404D1
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 15:17:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so1687543wmd.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 08:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=vNRYe0AWexvwxcw67KRQ+iJfwdH0V4aVAgUEqErTP7U=;
 b=DMDsp2l4ffxbTQ2bHD9Ct3VYQe0HSW5vV9x/U7rphmYSpZgYn+q2tihoKB4h4bpPXc
 XDs7J1KVqjf5QqCpKEU4AMRAWdwkR4dZf3Nx1PAnz1BN6a077ancc8YkzHez3sTThSpz
 xb9UWgnBrh8Vfq/TeLDN+MTPPElv+ejzI7e1R2hgr1Z+vbIkz2HimfbiK1h6sy85ZC3h
 ejKWjxMBbIpPwtzOQT5V3cfGKWqnj1MLObMsa0iG+LFOPcXno58C/INFZKvkPGScgW9p
 xPyD5QvtpFUGCV6KgyQtM4BWjn/LvoQQ/16H8bt4qNNkPzlXannQiwnQ/v3UiTjMcCCh
 syrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=vNRYe0AWexvwxcw67KRQ+iJfwdH0V4aVAgUEqErTP7U=;
 b=flI5f8MXGJBaTzg/1h0WWz8cnQ5LO6zlcrK7jI/lNzGP9sApQXk4g+hwD4BawVYuUA
 ixP0r5ABmDHjYV9dISL4y+kNfozgHVf5hM+BLdwJuHLpYdd96i3vEImvBlYkZTB7eXfa
 T9l1YBQCKhnQmiRzjnJ1If+JFT93gccFng8xhaXJKPfMwYmlWgtEsQ+YBZpvZWaBg7It
 zV9OsC011ihrlNjsE5vYwjDBwLBPtuAo/VYGaU2j23/qMvGWinSn11TCy8wd4LNRTUPa
 VJtpoh3ykYZ/E+oqCNqNkUvAk18nTvh+vkJoXQWgXA/kc9EWIiT9bbouJ9jIljr03osk
 i1Fw==
X-Gm-Message-State: AOAM530iNfeHtpGKvnc4QhHtyZa7IMDbNg3nPOCEjlgAhTuk+2TCSyzb
 SmfspZkDzP8R9+uBIAZKrNwOZLZ2/zY=
X-Google-Smtp-Source: ABdhPJwGHqNdDIigMpwS12PPgs2X96tAdfDq3pv8EmKj8wTcE9mRM0GfXfbh0oFDvu6TYZDSN71bTQ==
X-Received: by 2002:a1c:1d81:: with SMTP id d123mr151313wmd.72.1628090229383; 
 Wed, 04 Aug 2021 08:17:09 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id l4sm2864757wrw.32.2021.08.04.08.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:17:07 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBIdm-0004KR-2l; Wed, 04 Aug 2021 17:17:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: John Keeping <john@metanate.com>
References: <20210614104210.2100899-1-john@metanate.com>
Date: Wed, 04 Aug 2021 17:17:06 +0200
In-Reply-To: <20210614104210.2100899-1-john@metanate.com> (John Keeping's
 message of "Mon, 14 Jun 2021 11:42:10 +0100")
Message-ID: <87czqtqlxp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: fix tmpfiles.d setup
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

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > The configure script uses pkg-config to detect the location of
 > tmpfiles.d but imposes an unspecified ordering dependency with systemd.
 > Instead of relying on systemd being built before cryptsetup, set the
 > directory path explcitly, and ensure it is not set when systemd-tmpfiles
 > is disabled.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

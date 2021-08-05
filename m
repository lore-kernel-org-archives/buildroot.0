Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B352C4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:06:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB9E61004
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDB9E61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F7B4045E;
	Thu,  5 Aug 2021 11:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4dtCiobEzMH; Thu,  5 Aug 2021 11:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F0240355;
	Thu,  5 Aug 2021 11:06:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 157161BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0168C403E8
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwVyCwDzYT4k for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:06:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24C26403B2
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:06:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p5so6010319wro.7
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=VWzst6beNeKwC5QBHd/oxFY+KBwQAQm0p5TUIgrwG4I=;
 b=t4g0FPsDVeZ8EyIDYfNFR6UTVtOmkydIRlrkLPddYjOHiU+jK/+msWEuy9StnFvQhm
 9IuvRmtJZN7b9R2Igeqwl5ix4UvrgNQRbNxRaqxd73Q6u0wkIo2UELAHZEebhneTarDR
 OWIgchxiAeW3SK3cgmlenq9SS13WuVs84i6MtwM7pWcU0U7Ey7P/lnnNHLAymppMmB4L
 PCqQEuZminGr4EZkU48b/awQYMv1QpwW02kyTzqXBf7PWoyPRI+a3pe2x7WF6KAnWn/n
 MiOoAk9nLYNg1WsafuSVLdtJxaL0uz+PBPnmI6mrZ4e/JyPxBGyrHN19br1ryNC3ssT6
 Glpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=VWzst6beNeKwC5QBHd/oxFY+KBwQAQm0p5TUIgrwG4I=;
 b=FPR5mx9l8rEnXcdbb8tLKqyWRNt4u3gXXtGq2WUjTiAUtX8jAJLn64kfA0CL569gKx
 tsdnsoMalS/yD0WcGMmCOghYnnIllKlwED8q6EtW4UL9kBe/tQCpPALs5KqZI6pW+vNy
 3ArNJ1Pud+Y+MzeBsjHVLgVQ7PpVOeYszx78QncLNjqgIaKP/xISb1Sxw+RnxKYwbsI3
 YcOiCFGGLkoPEPfKgH8lsNvlV1/dy5Hoe/8+/GzEDkbjZbaIi7tCD0nUK51gaudDDwni
 9UACxc2DNwDdlILiS9OMzLYfbQQw0/HPDTAApLfNnpGsT3KW44XSQLGVxifa9z3XjIxC
 537Q==
X-Gm-Message-State: AOAM533mI729ih+WxV4LkUVx37g1iP7GleS7ZFqBbkhNUGxk9JEApQRw
 xN0VdkOYjkzidjrylurmnu1LiVZo2h4=
X-Google-Smtp-Source: ABdhPJy2ZsYAN86w9KJmcQoQGkDx9zm2sec8S6IaXqKWl3/rcmgOqX1/8oMF9Kwk2j0PoBQyMyqp3A==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr4547654wrr.64.1628161584359; 
 Thu, 05 Aug 2021 04:06:24 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id y192sm8541541wmy.1.2021.08.05.04.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:06:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBbCh-0000pi-4J; Thu, 05 Aug 2021 13:06:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20210722181929.24015-1-ps.report@gmx.net>
 <20210722181929.24015-2-ps.report@gmx.net>
Date: Thu, 05 Aug 2021 13:06:23 +0200
In-Reply-To: <20210722181929.24015-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 22 Jul 2021 20:19:29 +0200")
Message-ID: <874kc4kv68.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] package/mariadb: provide native
 compiled mariadb_config
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
Cc: Ryan Coe <bluemrp9@gmail.com>, Scott Bartolett <SBartolett@thorlabs.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - overwrite cross-compiled mariadb_config executable (used from the
 >   mysql_config script) by a native/host compiled one

 > Fixes (qt5base configure):

 >   Trying source 0 (type mysqlConfig) of library mysql ...
 >   + .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config --version
 >> .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config: line 100: \
 >     .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: cannot execute binary file: Exec format error

 >   with

 >   $ file host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config
 >   host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 5.10.0, with debug_info, not stripped

 > Reported-by: Scott Bartolett <SBartolett@thorlabs.com>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

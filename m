Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C550AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6596360EE7
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6596360EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3371E832D0;
	Thu,  5 Aug 2021 20:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9XmxbLSm67B; Thu,  5 Aug 2021 20:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C85583026;
	Thu,  5 Aug 2021 20:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 006F51BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3AAC400CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_Wl5dPBkc5n for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:07:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EE1D401CA
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:07:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l18so8108126wrv.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ZSeuaPmSTXNyC2A/4eUEpBMOxOElo9mk+3ovc4L8cvs=;
 b=rbQt2gq9i+RKEF6JZZo58fgK/3nNvQs3NhaO59Of/Az3upF6st/Wr2/WVABN+lKP5e
 MPdqbJQ8X7puMdYDLdKAxesJH66HwnMw+g5sPAY8yTZggMA3rjhA3g8j9MZc4HjOOAZ8
 VkkUCX6AYmYUI19FIF/l1NV0WbtYCkKa4q7vC7PEmXBqRJeWeIB49M4E31QlBY0jzZsr
 f1zCs+JmtKi826KFIYBCS9YyjYrwUFd5ilU5QQwYPNQSwMyX5GTIXJ+eWnXKOkwhKnv5
 9TkzUJiftnM6bUTZabv7gmRZcXLbJhq6PH/+17JTtWqOLMIUNlaLYMchwmNna3pmVujE
 Wkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ZSeuaPmSTXNyC2A/4eUEpBMOxOElo9mk+3ovc4L8cvs=;
 b=EMuNzfRmBK0V7aQYl/gfRHiaMGwWpYlWGA20wNS+D9twYw7mFD3bwfaxLbTgfZjy5L
 wmn8wWnCZue5U8+2OinUg7yxJaN7Fd6aUf4W8RDZrOLJ7xcMibvlJpDBffhDrHBSdIpC
 +8zyvdWolo6IVY+qdc3dS1BCO8fyy9ON78ybZI/iZob54qQoBpx8lY7HJQlYZnRwur7a
 zSUXHNStMe4m7C1smy2mjdYs41LMokje8ZVZJkW5S8qJVf7HjSH99xWCBrHX74kQ6meb
 ju2gZvNSd2/81TgQlQFe4EIJdfSiNQ3hpTSmCw5zw7GP7MVlfz13JN9WNcYkeOMV+tUB
 01Ag==
X-Gm-Message-State: AOAM533RBh6fdre8lXrFUYdHRrOF0ak4oOiZ4bZkY+VNTwKvg3yJmItB
 /GdC/c1Pu7MSOux3hDALZ6k=
X-Google-Smtp-Source: ABdhPJzeW1GAGELva0Sao64elFIZ3BZ+fR78/dzizlg8jw3N0doPrcLsIpx/edztFX87a7WmrrxlBg==
X-Received: by 2002:a5d:5685:: with SMTP id f5mr6921004wrv.369.1628194059347; 
 Thu, 05 Aug 2021 13:07:39 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id p22sm6394241wma.10.2021.08.05.13.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:07:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBjeU-0007AR-5Q; Thu, 05 Aug 2021 22:07:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210308134542.22324-1-patrickdepinguin@gmail.com>
 <20210308134542.22324-2-patrickdepinguin@gmail.com>
Date: Thu, 05 Aug 2021 22:07:38 +0200
In-Reply-To: <20210308134542.22324-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 8 Mar 2021 14:45:40 +0100")
Message-ID: <877dgzk645.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] utils/scanpypi: allow installation of
 commands without 'main' method
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > In case the setup.py file of a python package does not directly call the
 > 'setup' method, utils/scanpypi was hoping there be a 'main' function which
 > would do the work, normally called via a construct like:

 >     if __name__ == '__main__':
 >         main()

 > However, this construct is nonstandard, and there are packages in PyPI which
 > call 'setup()' directly from the 'if' statement, without a main() method.

 > But scanpypi does not actually need to make such assumption: when loading
 > the module, it can decide the name to be '__main__', just as if setup.py
 > would be loaded interactively.

 > Additionally, remove some logic seemingly related to the previous trick of
 > calling 'main'. There should not be a problem in keeping already loaded
 > modules in sys.modules, as this is the purpose of sys.modules.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

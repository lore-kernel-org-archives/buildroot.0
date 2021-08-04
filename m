Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8905BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F17961002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F17961002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1667840555;
	Wed,  4 Aug 2021 20:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejMOe4P0T28L; Wed,  4 Aug 2021 20:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF83140298;
	Wed,  4 Aug 2021 20:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C41DC1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF6914060B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwbC4eJaUHOG for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:05:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B962405D6
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:05:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l18so3536266wrv.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Mrz4Ko+pv2XM/p8m8NWw7qSoE9dkCQ9zr7xGRECXCcw=;
 b=pa+5+LoxEo7h3V75H6CS61ZsF8xqMOojVcZMe20jHd8+WJMXypDSNf7bt9cczN0tZ7
 4qot+WadXe9z7sZmEnPyQlZL3owHdNq1ygagxWSJqwyS1eW+Lx+jxHl8kw+6KCba2HPd
 vL94IUlG22lVksF7Dh450ZXgSJ8ZmkFdKRdqusAaF58rIOBwEuwCuVjvUmFP6qFDAB4W
 GP/kr+NlTJXIdTny8qGgwfYSyRFXeHQ24JM99X8QSDurWMhzxkt/nwFLHqhJ1zrmPKlW
 8DpIkr0tjxQdrq4QpQci0hHO/5xc58HSZh5fW4FQIQkHCBI0mKx/os3BFlwlqlHARE3K
 QSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Mrz4Ko+pv2XM/p8m8NWw7qSoE9dkCQ9zr7xGRECXCcw=;
 b=V1g91un2JqU7GSFK204EpCsgfarBdko6iU1hl/TFPbxmMj1wEESGYPEBlitktAhfAU
 6PIGYR2XddjV86vhiMwKmRpX8RfsLOLvTMwa/Z3h9loDOqE/qTj5XgkNnIHWthhUba9O
 qtuy+jM+bflAOGjO0qgEycld+MJPul8ywYWNSHIszVVZdlZcCzlNrl/JI+jxratjeLgZ
 JkJNQJOPDLymQL+37SeFOg5pjELexpDblV2tpnu0Wgct2e86H3yp2x+QHF5UnCP1oDca
 kvW/kp9RmfbIc7bBoqbpfLr9cCcf+TiJPqQkC4cF7wM5JwhYYk4RP5rI+L/WokT2TL04
 xnVA==
X-Gm-Message-State: AOAM531VYV9t1qkllG/KIX/UFI5vEj8CZO24PUxwI7hTXhnrhsoK22QN
 Zej6pww5zMJhTfjpCHmuAQk=
X-Google-Smtp-Source: ABdhPJwvDRo6aVqRTtQuo4x5m06x3lkw8bejNWg+uLG37eCP8q7VTudr5kNT0RhuM0XKbj44AdTc1g==
X-Received: by 2002:adf:f287:: with SMTP id k7mr1045041wro.206.1628107519736; 
 Wed, 04 Aug 2021 13:05:19 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n3sm3235847wmi.0.2021.08.04.13.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:05:19 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBN8g-00072c-Gb; Wed, 04 Aug 2021 22:05:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210721200218.502238-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 22:05:18 +0200
In-Reply-To: <20210721200218.502238-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Jul 2021 22:02:18 +0200")
Message-ID: <87mtpxnfgh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: add SELinux module
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

 > Support for clamav is added by the services/clamav module in the SELinux
 > refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

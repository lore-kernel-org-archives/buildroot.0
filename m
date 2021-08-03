Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E17C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B427C60EBC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B427C60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7937540458;
	Tue,  3 Aug 2021 19:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTQ0BoWUtUro; Tue,  3 Aug 2021 19:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C3540451;
	Tue,  3 Aug 2021 19:57:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 595CF1BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD27404F9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1t2WPNc4h5S for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:57:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 086C64037E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:57:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so107943wmg.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=5lbzFcfHQn2Va47TZPspM6YlBC49kxcKFVnwrDPQ5ws=;
 b=g5tjTwKTvprQLSnkLk2/g95oEiDR96N4JozFF/j9/Z9b1PBfMHuPoMF+oSIjSMcHc3
 obRKaFf0zPQQ9jvBfgP3Ip26EreXChijIthU9BuY56oCq5Qkk3mW4++CkoCsVTONoCSX
 4J8NpU6GtVSSiGApQsp51PpTuD87l+M06a9bzx8uPKPazM2FxXzWnNve2w3AFx34Q9Sr
 qzQV1HuY7SdxUBVHrEwkNIz4Ucjd2uA1BVVZMSbvjOJQGod9PzEpO6CnS9ui6fq6CpAj
 JkM8HfSKXeRaHe/o8XtMXyXpLSK18e3vWs7NNZP2RA5aKcx8DWTSe2rFP8wMw2N95RGX
 0y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=5lbzFcfHQn2Va47TZPspM6YlBC49kxcKFVnwrDPQ5ws=;
 b=aibOz8Hh7iCcY32SqRGiC0iTYJIXDeEPwj74crn5SV9s/4NabIB8Xh2/xCaDQUF12X
 TGt+dgGJMhlEMxuixONDTjQpGKHSnZxRd4lR3PTtw4vekpUPy3SViuB3pWb4UH+z0CTF
 EP5kQm4OibFJL7YwPp61Fz2UgbKPa/uven/X4rUT+y65IGVPdNwITdD3uvfRHJGqb3Yq
 7rjFrwwu2Ta6OWeDns+tWaDb/g06LmQax0ucEKoBpKRvLGFNnv4yTQcTjqxF34U01VEN
 pQWbFlmiqFfxtKhKaZNWjd2FP4/u9RZOLPsP263ZHQ6uE/+cU2eIJ9li+zDw0/pIiMJC
 v4oQ==
X-Gm-Message-State: AOAM5322yfCqCHd2YPdTzpqzMMV83/1tiECD5Pii7CMUr0hQ6edLZC+B
 KYr+Y+T43lqjg7A62xEBp1Y=
X-Google-Smtp-Source: ABdhPJzvgY4T8DQqdG82oZ1aQpWZybze5JJvML0Ss5/8NmSX/fCXR+K+2MkdP37mkPI4Ndlw3xq8UQ==
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr6141376wme.61.1628020623280; 
 Tue, 03 Aug 2021 12:57:03 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g198sm4478418wme.0.2021.08.03.12.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:57:02 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB0X8-0005pD-2d; Tue, 03 Aug 2021 21:57:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717093313.954035-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 21:57:02 +0200
In-Reply-To: <20210717093313.954035-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 11:33:13 +0200")
Message-ID: <87r1fauws1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: fix CVE-2021-36217
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Avahi 0.8 allows a local denial of service (NULL pointer dereference and
 > daemon crash) against avahi-daemon via the D-Bus interface or a "ping
 > .local" command.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

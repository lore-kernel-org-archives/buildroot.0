Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA69C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F746103D
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43F746103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069CA81A5C;
	Sun, 12 Sep 2021 19:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_LHgDVBta5G; Sun, 12 Sep 2021 19:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FC281A3B;
	Sun, 12 Sep 2021 19:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF561BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7701281A3B
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdPLbRO3r7UA for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:08:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DA6481A29
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:08:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g8so10928597edt.7
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=OmOdlAGa92gk6NsQvuk/nyJ5GXgICr6WEll7jvGzSBg=;
 b=dF7bqNu/HIo/YWXMWOSoqHktfbzHqsClwIaSDz9FBZ5/m/nFXE4XaTH+uhpTyntPqF
 tUE23w09P4ZySzB20Ge8qbnBKHw9z5MvY4L+dckaytmz+3HwdSQLVVbH3EruGCNUnTEG
 HCTfUXRcKWboSaV59dT7edif8fryHzbI0pX9AYRYvbys5cYM7IUG5nBlAcHsGMEjYNru
 SZZkz/gWw3wkopWxJtAGZOOtaE3/uGtXbeVc0QJFTQjmFXt5q/2T6R+7tZtDyJqoQPu9
 2N/ZHh2hiGjAI1DMpHkzy/urY8iRiAxn1OJB6wM72kVFXueUUkr/tw9zJnIJJFpAEc3N
 of3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=OmOdlAGa92gk6NsQvuk/nyJ5GXgICr6WEll7jvGzSBg=;
 b=jwV30PTVzfMf2yPXlULHsUdfzPjcsj/T/4u11NUYfv4A87JvdXprEBB3a0533eA0dK
 Nj2KHnJEqoMP54h3D/G3QT7Mp5S9pSxRtdpEfGDymvGXAQNV+c5ckw9m1iw3jKM7BYdl
 Vom2H5Eqh2kyWbR838neZ9S2Ak0ddWFeaNSfRON0wXEhhehn2jZvBlV7rXADqvEand5j
 j2srUlSuL6rzMXYMGoInfdz3br+jdUPjjf8yVEKgrEojDI+CgkX8xplnxhOkj0SUiovK
 JB9tUSZ7Ue0Igv3N+gn0oOcn52XR4nNPXYinTBVZdqkJqLyOWUpbsHh9C+x4W5+yXGyH
 VEBg==
X-Gm-Message-State: AOAM530o8pZPcVoYFYEW1SCDM92Whbrl/2yoSnuMY5PijKs+3giImWJ4
 /Jqa9sxKfaY77iZ64JCcbOD6hQUhkYU=
X-Google-Smtp-Source: ABdhPJw9E/9qHjV28ZBDvQmHMsZOek9BrcBM3CPKU07iyyM4+2zRrFIcUFtVQilQ8xoRzgfBcJAwhw==
X-Received: by 2002:a05:6402:2917:: with SMTP id
 ee23mr525889edb.207.1631473698874; 
 Sun, 12 Sep 2021 12:08:18 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d22sm2415170ejj.47.2021.09.12.12.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:08:18 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUpt-00030U-KU; Sun, 12 Sep 2021 21:08:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210910140241.26771-1-peter@korsgaard.com>
Date: Sun, 12 Sep 2021 21:08:17 +0200
In-Reply-To: <20210910140241.26771-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 10 Sep 2021 16:02:40 +0200")
Message-ID: <8735q94noe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/haproxy: security bump to version
 2.4.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-40346: An integer overflow exists in HAProxy 2.0 through 2.5 in
 >   the htx_add_header() can be exploited to perform an HTTP request smuggling
 >   attack, allowing an attacker to bypass all configured http-request HAProxy
 >   ACLs and possibly other ACLs.

 > For more details, see the advisory:
 > https://www.mail-archive.com/haproxy@formilux.org/msg41114.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.08.x, thanks. For 2021.02.x and 2021.05.x I have
bumped to 2.2.17 instead which contains the same fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

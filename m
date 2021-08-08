Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39B5C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A75EE60F35
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A75EE60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BDA340101;
	Sun,  8 Aug 2021 09:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSfFspPef4uq; Sun,  8 Aug 2021 09:54:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749DC40200;
	Sun,  8 Aug 2021 09:54:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8291BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1B59401D2
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pV9-dONud4R for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:54:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0F19401D0
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:54:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x14so5060066edr.12
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8T0aLu7ETG0IDD2CYHIpUapC52aqB+87Rrcnu5oRK4s=;
 b=Pa6aLG16dY20WLo61qkWOWodA+g2aH8KHrlXeThwS2E6+vfsi0BMsMtpRiS3Gmlf5a
 pV6mL5vm1Y5hXL4tHJMT+49VAOYqk3P+o81PfGngg6//QBnifb7A9lNRIlZwt3WXZNQc
 NoOHJqLVsjWfcbQcR/N9Fa+ZvT1/joiLPPkX9rVUMjtotqW2JYZ3O7gsiLqXORhJRq8Z
 Zs8/LbYoFgxZrKNir5ikL9Z5dQ6B8prZ6reaJc7bvm14qkFhJIN+kDE469EQU7TmH5gK
 gypOWnJBcQrY0zgNp3qMFPGyXb7v5VhIUonBFYukL/4QFD1hiaa4IOKsIu7AzwrAMy90
 0b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8T0aLu7ETG0IDD2CYHIpUapC52aqB+87Rrcnu5oRK4s=;
 b=dhF9V/w93IjUCGzHGxatIYspC6dcaLOC3Rq1h6d/xS5ewQTWi3S5hv5JCdyHRbrOe7
 PsAt4Cj/uszABzKzRwdvEpTLK0LEPVB0dhtODsjpK94J3tdPj877utYmKW4OwSVlKHKj
 icMw8p0HNaYC02BPNbRK3r87oGHE+KMcXmU1A+ZlmbCmSyE2IJMoS4vwD30bYIM4Fa3V
 UEepNlJVwD+bsiLRDBhJSu8knXeb45mOf84OdaOVAYIIOQEFRCnmUa/NE/6q6V8i9hTG
 qfP5Jz2LM6GYna57fcoFe6nBiZJ7Hy98AP7jse9QdNZ8HQT7+sc51aBsIhECu6m4Tsc3
 98sA==
X-Gm-Message-State: AOAM530lFGboolOL+p8IHdhB9Ck0Y5IBU+J8yulmlwg+f9QxgRD0Ijnz
 ZIKjVUM/P22rGNkv/nB7jBI=
X-Google-Smtp-Source: ABdhPJx2RmAZ+wBngn/cxa6PRTU1GM/QGIHwKabHeqVnvdxm+MXxYT8g7mKStMBN+/JRg1XFXBPy5g==
X-Received: by 2002:a05:6402:440e:: with SMTP id
 y14mr23380443eda.38.1628416476817; 
 Sun, 08 Aug 2021 02:54:36 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id cf16sm6492103edb.92.2021.08.08.02.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:54:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCfVr-0003bM-Ke; Sun, 08 Aug 2021 11:54:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210802211040.2535969-1-thomas.petazzoni@bootlin.com>
Date: Sun, 08 Aug 2021 11:54:35 +0200
In-Reply-To: <20210802211040.2535969-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 2 Aug 2021 23:10:39 +0200")
Message-ID: <87k0kwb6sk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python3: add patch to fix highly
 parallel builds
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Highly parallel host-python3 builds sometimes fail with:
 > Exception in thread Thread-1:
 > Traceback (most recent call last):
 >   File "/tmp/instance-3/output-1/host/lib/python3.9/threading.py", line 973, in _bootstrap_inner
 >     self.run()
 >   File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 317, in run
 >     result_item, is_broken, cause = self.wait_result_broken_or_wakeup()
 >   File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in wait_result_broken_or_wakeup
 >     worker_sentinels = [p.sentinel for p in self.processes.values()]
 >   File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in <listcomp>
 >     worker_sentinels = [p.sentinel for p in self.processes.values()]
 > RuntimeError: dictionary changed size during iteration

 > During the compile_all.py step of host-python3. This issue is reported
 > upstream at https://bugs.python.org/issue43498, and while not yet
 > fixed upstream, a PR was proposed with a possible fix for it. Seems
 > the PR seems reasonable, let's give it a chance and see if it improves
 > the situation.

 > Hopefully Fixes:

 >   http://autobuild.buildroot.net/results/ae6c4ab292589a4e4442dfb0a1286349a9bf4d29/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

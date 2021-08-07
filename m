Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9813AC432BE
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:08:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5247F60F50
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5247F60F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8ED40180;
	Sat,  7 Aug 2021 17:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOQltCYWy0DL; Sat,  7 Aug 2021 17:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AE03400A4;
	Sat,  7 Aug 2021 17:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3534D1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21A95838E6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEQTJsr8RU8S for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41945836F6
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:08:38 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g21so17963764edb.4
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=6xu1nIFPnVSqlK2X4LVua1jWn57orfXig+kVQQz0YwM=;
 b=LQi2TZGaZU0stkQZ7BUetctfqlibfTzG7k9O8DCW/frT4CE+csFTWGvRPMyST3dopi
 aOwqCB9MSOMCEPb63lLsLGDmM5nKD7GXIBMxqm56rH0UBH5wz0CtM5AgOwwgzii48DIM
 iachcbbNjqm9aEBCtoPJiTivta3IfDV0aJhu2zTwOL9WSJv0O/afpaouQEp5o7CxWpOj
 wAUKOhHEHGOIPNVM3xAHYkROcvtsqssxnbac1o6hvZSWXAv2JPOiWHpoaAoevjOyInj7
 KGdQTDle4ZUBMVGSvrFib696DOi+/BPQadKg0ZwVFsrPz3L2/cHMREUKuADHj2E6dN9e
 mB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=6xu1nIFPnVSqlK2X4LVua1jWn57orfXig+kVQQz0YwM=;
 b=hYjsCte+USbgqkmyX96BPyDYxnLOBP+8nPrngIK2fiO7Ef6PEOV5hKbI46oqmL34sF
 kET0708uzdXR5HT2N9EpXJ6UeAMTN3h5Y0aS76dW0QhGT02O1CwX/gKx0w6W+3w9j2El
 tK92qjJ4EwXjiurC0mUKaUT8OW92dFmSsJqqQtV7MiiTUJ+UqCblQGvdn11Qt2+Nmq1N
 24jLhtTFhRKKgkIyByZ/V2qFu8Kk2oZcwYrJ+UjhPC3JPxJ4y/CNs9SrIZbwjP8Umgx0
 UZbOhT11G7dVIzw5VbI1vN4kEaHxRfTIlspsJNC+PidWCn3MwZDL1lUCY4XHObTW7jTY
 rP9A==
X-Gm-Message-State: AOAM532PxQ6FmqPI9F3VVXw8hgRcYWuZwz+/0icKAkOTUQdlWY2HpjTD
 MIXHcqAWLm8L2XNfeTUZ/Uc=
X-Google-Smtp-Source: ABdhPJxl4c8DlQ4x6/t1/brH0qhwbycZiSKWiqNd2nbkr8/0zqH8aObCjdowLhbjC6vugDWrOXbZ3A==
X-Received: by 2002:aa7:d6cd:: with SMTP id x13mr19802378edr.300.1628356116506; 
 Sat, 07 Aug 2021 10:08:36 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id mf1sm4010779ejb.51.2021.08.07.10.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:08:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCPoJ-0003Zs-EZ; Sat, 07 Aug 2021 19:08:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210731160701.1234967-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 19:08:35 +0200
In-Reply-To: <20210731160701.1234967-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 31 Jul 2021 18:07:01 +0200")
Message-ID: <87tuk1fai4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ibrcommon: fix build with gcc 11
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

 > Fix the following build failure with gcc 11:
 > In file included from ../../ibrcommon/data/BLOB.h:25,
 >                  from BLOB.cpp:22:
 > ../../ibrcommon/thread/Mutex.h:43:40: error: ISO C++17 does not allow dynamic exception specifications
 >    43 |                 virtual void trylock() throw (MutexException) = 0;
 >       |                                        ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7a9a4319916efe8cd7e04b8686a9ae0b233b017a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

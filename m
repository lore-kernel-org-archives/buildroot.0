Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3E1C432BE
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 18:09:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313A561004
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 18:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 313A561004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF49E402A2;
	Mon,  9 Aug 2021 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBo3Z0QaRJbq; Mon,  9 Aug 2021 18:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA934041E;
	Mon,  9 Aug 2021 18:08:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D67221BF34A
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 18:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1AC240221
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 18:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sy7CqupxR6l5 for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 18:08:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B240F400E5
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 18:08:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u15so11196488wmj.1
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=BjMg9+CIKIpvw1lMAL46GikBKhEWBqlI1/gbu9/VA+o=;
 b=bNdMc568+5KbI36u657vwpsH68kuO0fxBeU6wtDD+GM5cC+km+pFsNfaY+oU3/r1uQ
 myI7gKTFOTAJwJCyA+MaRES4Lin3Ew0miQm1yk9votQZYA35RYvLlByP2E56u3VfhCFf
 EaB5QeuhJ1OzA496dht2NHii3QXB52Ym9GnANdL55YEO0ZINPJsVHxYHg+kQna51wnDL
 78nm4/X8Tp7JiIDS2qjbF/td4onGwLLPR5s7NWaf0tSA/6pTh8PZSTQHNvylX2XBPFEi
 WAeqcPjy5qCquPEsYegAlM/QOBAslmcklJHK8gu87NPfWOoIUfzcUST3X+LDgCsAa+XN
 6EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=BjMg9+CIKIpvw1lMAL46GikBKhEWBqlI1/gbu9/VA+o=;
 b=ieAUe6gzsQ4fYG0awatEdNzaZRHrT2azzzgIlrdLysQsM3KfnJdCr+9YkT1mNAVIXn
 Z99Rl2yVlUOEWdvE514ABRYQfgq4OS9xfV3NoDroWHTNQS0OTp7UZquPzLwwW4ae7hya
 DCH5TK6L1tRR/tq+hVX1urKcNB4teiSpyk2+w4H25F1WeTJFPpprvT4MUqZVdFJLecAp
 KfU/EeDj0booZY0CkrR58JC0DZ0gLIYrY7qcs5LQd6XZVu21OvS0Wsab0V8ras5Oi84k
 EDYVaeoKrKmbAiBMsK7G8zlCE+lScWHCyauZk8DUPpJ+8sKwBfM5FpeLdlD7QuoPEizV
 pMRw==
X-Gm-Message-State: AOAM532cn23jG2+IUmIFB7ZrGShIQjrksUeMq73UeU9sa35GyYmI0OOQ
 OsLqdCHQJtzUwvIn0601sJGmyQCrpgQ51Q==
X-Google-Smtp-Source: ABdhPJwrH8rAFnWvMJQsIGQNT01BMhkh3f8ebvAW5zyDMjXn2GyAPAxFCLZ03tuyvNibHqOrrHA+ew==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr425003wmj.10.1628532530897; 
 Mon, 09 Aug 2021 11:08:50 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j2sm249824wmi.36.2021.08.09.11.08.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 11:08:50 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mD9hg-0006Gn-Sz
 for buildroot@buildroot.org; Mon, 09 Aug 2021 20:08:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808182056.28271-1-peter@korsgaard.com>
 <87zgtr91b4.fsf@dell.be.48ers.dk>
Date: Mon, 09 Aug 2021 20:08:48 +0200
In-Reply-To: <87zgtr91b4.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 08 Aug 2021 21:35:59 +0200")
Message-ID: <87im0e8p8v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version 3.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Fixes the following security issues:
 >> - CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
 >> - CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
 >> - CVE-2021-31799: A command injection vulnerability in RDoc

 >> For more details, see the announcement:
 >> https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2021.05.x, thanks.

For 2021.02.x I have instead bumped to 2.7.4, which contains the same
fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

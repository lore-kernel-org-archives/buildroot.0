Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C0EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 20:14:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33D960F11
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 20:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A33D960F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B57400E5;
	Mon,  9 Aug 2021 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5_KiWtBxJvz; Mon,  9 Aug 2021 20:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF5F4020E;
	Mon,  9 Aug 2021 20:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FAFD1BF31F
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 20:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49EF04020E
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 20:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rnnw77_itA1I for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 20:14:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C68D400E5
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 20:14:30 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r6so749204wrt.4
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=kSH4NKPbsqk9BfIVZK8ApdtMtXpQHguOogY1QuIo+ds=;
 b=kmTD1PuNZpDyLh8AOkmxt8+8nUynIOVkqo5Q0g37MgzxC97O75xCDKhhyrkQ7JkRwK
 RaOA7u5MINvykYNV/v73kAeAFr75DzS9t4oDOYsKVLrCLl5X/DQYYsCgxTu4631iMK+M
 9Qe8TcDF3kpFRLc9RBhv53akcH+wrhEJ5YQtUYyXEEyM3CVeh3ol++r+SD8hKvjYjrUk
 AycOkcjUITeroVncgZTbdRMat1je6pgZcVIDCPzFlsCmcL5XvUp2juIODUgkzDHxaHre
 b63cUc8w17fOFylFZt8moC2a40uWIOto/NhJMCe0rp4nHmrCXlBjA9ZFsVpKAqOjxNLu
 pvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=kSH4NKPbsqk9BfIVZK8ApdtMtXpQHguOogY1QuIo+ds=;
 b=lnlzgzCzwAREZd0mY0sXUEgz2f2Ty+1gd/nfaNydBomeHy6rqCqeXFPQe88NqJTJ6d
 MUvGJqv6QTqucre1zsnr/iDtjsaUdvbYJFvk9y+OXRgXI5y55/+3LCKsCDmX4HIQrQRC
 s1n/wehlA3f4r8zDmJ136rC41BmJKiuONFGOVWcOPHYjrfC7IQOjlL3NwSsY1rrucHsK
 owq8ydRK0/yv5h+ojMmybSASddiQ+8+143hxsyET4g9NfJ5uI/e8RUIVASWzpPgyLqVy
 bwmK4emS8kDhVytW2iZHlfMnpk3ZqXM94OJf5LGULx2BgyWi6bUo7aoHhumDX84i1/Ex
 VO6A==
X-Gm-Message-State: AOAM530Q9+zOJJ7nfHJW21d4e7qzlV+x3RELcJ2Nj0or1a6mx3Y3kT0B
 X+0xkbNQnWmJwhQY9ba7QmkX7801GrsvWQ==
X-Google-Smtp-Source: ABdhPJxgoUQH6//6ZpdZFOKLhqJONzQzt/w1ibAvaDe6PVdsSJyeOUXtDUPHIa54YkFVtlMZiz8F3w==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr27066656wrd.104.1628540068564; 
 Mon, 09 Aug 2021 13:14:28 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id u23sm481176wmc.24.2021.08.09.13.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 13:14:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mDBfG-0008C7-Ib; Mon, 09 Aug 2021 22:14:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210809193842.28963-1-peter@korsgaard.com>
Date: Mon, 09 Aug 2021 22:14:26 +0200
In-Reply-To: <20210809193842.28963-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 9 Aug 2021 21:38:42 +0200")
Message-ID: <87a6lq8jfh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ruby: fix RUBY_VERSION_EXT
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

 > Correct RUBY_VERSION_EXT after commit be9783951d1d44 (package/ruby: security
 > bump to version 3.0.1):

 > ls output/target/usr/lib/ruby/
 > 3.0.0  site_ruby  vendor_ruby

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

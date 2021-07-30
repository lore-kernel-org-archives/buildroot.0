Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119E9C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 16:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F8A6054F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 16:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66F8A6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FA594055F;
	Fri, 30 Jul 2021 16:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aT7sNn7wUQSZ; Fri, 30 Jul 2021 16:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B4B940237;
	Fri, 30 Jul 2021 16:23:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE95F1BF348
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 16:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9EBA40237
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 16:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngXd6RzIY1VO for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 16:23:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 960B64011D
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 16:23:23 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b7so13988775edu.3
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Fn3oJbeYTkXMLBVLHiPp0gkoiMWtuHERQk0w2yLCjoA=;
 b=SpVswSrIaxjlX/Dho8qjL07WAxtxo6w+u8tL5i2iUPf21skgJe4K2WPm3xepAn4j4o
 gj+Z45Sf558cELP82Mnrpi45sp3TlISslObjKLBAu8j/EwzvYh1cTxCHAUBk5A//a9Qy
 jZvJGaXg2NOLBb9GTOG50RYMLEujK3xfa/lXUYLjrqZnGSuEcXxhuN9W+u3n4tEWc+ph
 rDYgYXLGa9nFR/+rS9PEH2xXqe042NVCxuL4Yzx3WqnFRtwjLBMKCl35VchJYbiDrV0m
 cwjom0pljBPWRIE0YJsqDfSOH9JPgVoacI+ho5+u1IJoX9wenk8dFj2LqGfjOZhjYgj1
 d/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Fn3oJbeYTkXMLBVLHiPp0gkoiMWtuHERQk0w2yLCjoA=;
 b=EAeVJ2xkudOCRyW36uaEVS9CKlPo9as21xjNcUy0p36+zNSQ8EKXOkwohuI9Ew2vbN
 V2wHZ3AWKGtslW7ENUNIJ1EMtde1phhRcAGbYh5aZnQ6XQ8OLWnQTNmdrXRskjdDgR9u
 yOCmCjn5I41PEN/qTi8KzxiZeOrU7QDVvjLhICPEgrj/BK3IYMlzZElTIhv4eFoKokCg
 cmDyeJCPC8iiNZ6+wb8nZLZ+9g7GLDoIddb7NDOTDQkPc/cKK1zZaGcJUBItk3g1NT3m
 ze6wRnpWm5i725zhp10uUc+kBzhr9xgJF2Yqj7f+k7YiCPPj4lqDOxoGxzzIgdQ+QDPT
 vRrA==
X-Gm-Message-State: AOAM530Bq4Q+cGVfu2sbNpbZFXpQ5eLDINaXGkCko5XZ7bhyso9dCoFf
 VocMn4RDasT6RtjDGZ4FsdFoAUhCCc4=
X-Google-Smtp-Source: ABdhPJw4h7QGl7cW9kiF5XZDbZw8BvMq2foCs9xbeLOcmqP6rUjyhQJr/ErxvdGJniS2rzprYNvKng==
X-Received: by 2002:aa7:db15:: with SMTP id t21mr3903977eds.261.1627662201767; 
 Fri, 30 Jul 2021 09:23:21 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 bd24sm893686edb.56.2021.07.30.09.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 09:23:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9VI7-0004rb-Pq; Fri, 30 Jul 2021 18:23:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
References: <20210726091635.86606-1-titouanchristophe@gmail.com>
Date: Fri, 30 Jul 2021 18:23:19 +0200
In-Reply-To: <20210726091635.86606-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Mon, 26 Jul 2021 11:16:34 +0200")
Message-ID: <87h7gbzs7c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2021.02.x 1/1] package/redis: security
 bump to v6.0.15
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > From the release notes:
 > ================================================================================
 > Redis 6.0.15 Released Wed Jul 21 16:32:19 IDT 2021
 > ================================================================================

 > Upgrade urgency: SECURITY, contains fixes to security issues that affect
 > authenticated client connections on 32-bit versions. MODERATE otherwise.

 > Fix integer overflow in BITFIELD on 32-bit versions (CVE-2021-32761).
 > An integer overflow bug in Redis version 2.2 or newer can be exploited using the
 > BITFIELD command to corrupt the heap and potentially result with remote code
 > execution.

 > See https://github.com/redis/redis/blob/6.0.15/00-RELEASENOTES

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

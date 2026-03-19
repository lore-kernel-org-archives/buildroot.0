Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3154108E1D1
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 10:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28590417FF;
	Thu, 19 Mar 2026 10:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzO0v2jpdYdg; Thu, 19 Mar 2026 10:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4E4417DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773915590;
	bh=zOH4LsAU5LvSRSKyi6N/sXtHcS1PO7H97DKZAARSN3E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oOMNAGCSI6DSbrJ9M/nzMbz5NK3irBw+p+xp8t6OMofot4DV/T4rJSDnS4CBEmF2+
	 eYZ+st0G3ItP7OW3v06rIN7Uiuy1nE8FR50Zyqt1XM8RbjGJ/6Wa8DK8lylSaFbzw9
	 ZeMyibJQg3n7o0ss9z/HmHm131mCiwF3bVBj3u/h7WUIjqgOkZndlK7lzSXTcJklF6
	 PNOG0pDuq/AfdQMs9+m0VlRghgkkVycxAuxuL9EjtjLr4QXzMZTk3N1gAd7K3Or8uX
	 caDzUpmrTDqinpiBcfmnYdu4UI+s6qRqqggQJSYLlqQsNclBaKxhPYRR5+VzTGm8RY
	 pCRxDCWb8Cjhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4E4417DE;
	Thu, 19 Mar 2026 10:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE0A1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F18E40D44
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJOJfiLtbmAO for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 10:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCF2540D4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCF2540D4B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCF2540D4B
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:19:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so332714f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 03:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773915584; x=1774520384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LyJ6nTp35Fv0P4fhR8LBifrvb7nbKHH4QEdvWVmaNRA=;
 b=O9E0vMCaVE5+wuyJU0YJ8BZCBNZg/43Rdd/75gaPdTbEAHRL8wqEAMQ3qyzKHUEKk+
 4p59lCZy4DWBtLJ3bkFB/ARwmnFufA2ggV/AqLlpr4xyiOsQzibPeAf6yDYhIfO7PkZS
 gam5u6uCGgh9uWjpkRZHuoC8Ameh23lL9/NLDsr16Y0pYiQCV+Ad8M8Xm7U/U4yjeUfy
 EG0auR+CLUz4KipdGEBMhyAI4wkQnqkim9zCQby1fS7ptYWwUXVm0U+BCO9st5yglBrc
 EnzBQ+fUiln1m1rXjWvTWuzdj3Sxb6ZbEoYeaBVkTiL6rhjGzlZBRHD+BLvlLEfZdTrr
 vXug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYwsGNB4VMkg42f69Vhq/8Vl0NjMivc682O+J74BAZQKX3O2l4gGqv93N8n6It2frSLHOp2kfaGiU=@buildroot.org
X-Gm-Message-State: AOJu0Yx4tEONxeoXTGoOB1mRwQDrstEgIYvVRwMLflULY6sULrkZK8nV
 87nKB3MJdv1jj2OLRySCn2mvmkaYiPhNkfXfyQqfuJ0DAqzU25e78XnUdD7PbM+OKe0=
X-Gm-Gg: ATEYQzzDrE98W3eEL7qNzRpctrVURh2VssKz57xlQU/KE9G5gm0U+5h2EhyQcz/X+ge
 /IYzshBxe6D9d1O1bsIXiXpST4AxeBdBJuUkTh4rQgqaTF/UZv+PjdFl/bYQi6SK3L2mu6xC+Qt
 pi9tJXW8G71lGYye0wIXFrKsNIFI6fVsXucvb5O8Zx1LfrDLr8rhMGzUkNJYC8pcIxkU4uvNvY7
 DVdEaRexWDl4lq58pFRzEvez+/RHrnMzms3n144NX35e9LK6Y0mcljgh7qzUWBEu0JwVK2dgXIM
 3EXpnVvS+uPi4Y5wY9nrDA/uSTDsYVReLRMM7IKJVW+qA/zHe/oRnOsEW7rrUPXPM7p0R7UZ1ev
 5FtPtnnEKT74Tdrs6Y4oS5FTSbez6zneioqfr0B4tnGP97fqLlRtU2VFa4CIOQRl8ez6yR01byf
 cZDFJZtjbSUpWTmws=
X-Received: by 2002:a05:6000:184f:b0:439:b636:1fa4 with SMTP id
 ffacd0b85a97d-43b527c9ea5mr11389230f8f.48.1773915584290; 
 Thu, 19 Mar 2026 03:19:44 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518a3e3csm14061210f8f.35.2026.03.19.03.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 03:19:43 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, Julien Olivain <ju.o@free.fr>,
 Julien Olivain via buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Mar 2026 11:19:38 +0100
Message-ID: <20260319101938.68045-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87wlzehme3.fsf@dell.be.48ers.dk>
References: <87wlzehme3.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773915584; x=1774520384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyJ6nTp35Fv0P4fhR8LBifrvb7nbKHH4QEdvWVmaNRA=;
 b=A+lZD2Wa6ccSMJYNR8HiAu70QiAAJoXHbZzxa7cDGl9RmgEpscrqCdS7IAmaWyJ2+G
 dxQh27bZK0ySvWKwjOpnuDrpUFP22LDHjGXhmpI0KH1Evg9GalnrDxNRkbTD7x3/CQ/x
 8UDiBUwHqDkhZJ8pyBvi9fT4TXDV86NGvZf8sqxj4vF8DIGCBD0JcYPpw2w56Zy48x64
 UUUpMOQB/6UmGSVjrTSgteJHjJcTQxaIUM6Si5ceLAJhSLu9RbPZqPL5v+sS7KjU3/wL
 IenwKiZanG3rxGBmwOpsDCx60NPsaFSgtnrIXid75ZGJIyhA8VueBPIt5k7foCm/2jot
 9OIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A+lZD2Wa
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

In reply of:
> >>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:
> 
> Hi,
> 
>  >> > NIT: It would have been better to first bump to 1.25.8 (which includes
>  >> > the same security fixes) and then afterwards add the feature bump from
>  >> > 1.25.x to 1.26.x so the security fix could be backported.
> 
>  > I understand, will do in future.
> 
> Great!
> 
>  > So, right now go1.26 is the latest, go1.25 is supported, and go1.24 is
>  > the oldest supported.
> 
>  > Go1.23 isn't getting even security fixes anymore, so we should at
>  > least update the LTS branch to go1.24.
> 
> Yes, agreed.

I'm jumping into the discussion. As I'm not a Go user myself, how do you
(Christian, Peter, anyone) see the update cycle for Go on the LTS branch.

Should we update "late" to the last maintained subversion whenever LTS is based
on a version no longer supported ?

Is there any other source we can follow (Yocto, Debian ?).

How much breaking changes are those subversion bump introducing ?

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

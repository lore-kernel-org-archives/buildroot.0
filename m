Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC06DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8740A60EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8740A60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35ADA401E1;
	Sun,  8 Aug 2021 19:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTXdt4TNZ6e2; Sun,  8 Aug 2021 19:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 505224012D;
	Sun,  8 Aug 2021 19:37:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32EE81BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CA74402E1
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PZ1KNSFetbZ for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B94F400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:35:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n12so8432097wrr.2
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ZuJtDo9pvi8ci8O7q8KoubfzwV0YKndLbtJDil6iqZ0=;
 b=SDeP/Z3L8cZnujZlwxKNkvprhZsXeWF6cYvwJ37LC/XSQE0e4RDA4S9NDMRQaXah0X
 IKLJoBUSdyRY1hRSxf97VPi1vPE2qvy7Wke5nxQFEyMDJ0856bdmYCgwx3Hb/6CtQTqc
 gJBz2McGZqnUvQszn42l03oPmP7E1y9OLXXgKvcsI5ZdFKgj9IIQcJF8/4B21UQBhLdN
 dG3h9qVbCxxfrc+pzswiQgYb53NA+TZpKrv+QoFyW4GcP1v576g9qAHTWk7OWMZBo69k
 ZigfLKnxLReFP3eeyLeumge4CFjnGULH1XRPGdTLmkytD585kyqBEQAYqinsgpslXFPV
 5dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ZuJtDo9pvi8ci8O7q8KoubfzwV0YKndLbtJDil6iqZ0=;
 b=df8vS1U0rKGdLYXEME37kZjYKQy6VmDfSoO9yS5bugL44I3QDwjCrPIIB3qAol4csV
 ZdbLkze9bvydYo+etV2OdqKUG+7caEd1HzoS5RZMLYBXdkpjEbMVlUJFqaHY8vXDm58u
 ed7CkN2zF/Xl6R7hF4QWW+gcwr4QWEjyxZONMCZDTOavSlKLnkvu21pjEetIOm+KJqua
 D+ZP6l8E09+CdalMslf05Hp3DoWZTRGPD9EpbkZ/ZCb3IlZaUvduRE3S8ziVdbi4N5Ad
 aVoXvRtFe5be3cWJlVWoTC8osHGMIjDhZxd4x7OA4pstw3cLAFX1zo7ukoawQt2pZ2JB
 h9yQ==
X-Gm-Message-State: AOAM532MhOsLKOFMbNBCtRVZaGUtwJ9WYZ4lMNEVwJ9WBNiZX5DfZ5ZD
 xIiDhIbUqAFfaNKwB9WbHGYdgOjVsyg7CQ==
X-Google-Smtp-Source: ABdhPJx0hFEoT977r0uPn1OXyc4Do8HgGZNivLe55w/boTmYax4lg2Q4OsSpIbWcwyDHKkDcp2Poow==
X-Received: by 2002:a5d:5550:: with SMTP id g16mr21569121wrw.336.1628451356196; 
 Sun, 08 Aug 2021 12:35:56 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id d16sm16702124wrx.76.2021.08.08.12.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:35:55 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoaQ-0004OS-Ke; Sun, 08 Aug 2021 21:35:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808180223.25135-1-peter@korsgaard.com>
Date: Sun, 08 Aug 2021 21:35:54 +0200
In-Reply-To: <20210808180223.25135-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 8 Aug 2021 20:02:23 +0200")
Message-ID: <874kbzafvp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.22.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-22930: Use after free on close http2 on stream canceling (High)

 >   Node.js is vulnerable to a use after free attack where an attacker might
 >   be able to exploit the memory corruption, to change process behavior.

 > Drop 0002-Fix-build-with-ICU-68.patch as this is now fixed upstream since
 > https://github.com/nodejs/node/commit/e459c79b02

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DEED4A603
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 06:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE8161BFF;
	Fri, 16 Jan 2026 06:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtnQzuZThyfr; Fri, 16 Jan 2026 06:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2243616D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768544619;
	bh=n9hkO8ZjFid4ktPlsXNHT6ByHE00SyUDN+5EZdLyjac=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=hzct8phQmWa9rd6pYX911u1xEzF72gW6U2AImXldTs90HlXIoMDyG4OTCSJuNwEcJ
	 lVULQ3mmlM0BqkEWX8TpZ5jboNrEy0Mk0ENUmQU7GMo0QJrJb+0qJcRhsSsJwl7qwR
	 8o6JhCFKG7bfWrLMyj0ve8Qx/wYF/S0yG3CuTLt6306zSXBstgg8gY6qh9imorg43H
	 2yLUs0OgDI4XkHW47wQUEz3LUO+0BmPMl1mG/MePG/ckpf1gzQWtqdNQn6FrGU1s4q
	 q5Ayyv7MUU+NxZFdwuvkr9HUCDwRslYprq93KNQjnCILLMapaHl65O69hTi2d0dOfl
	 5KTcVrBA04haw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2243616D4;
	Fri, 16 Jan 2026 06:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 113ED1C3
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 029BE615FA
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFdjw_8sLQul for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 06:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E11D3615DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11D3615DD
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E11D3615DD
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:23:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso14919385e9.0
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768544616; x=1769149416;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1ArHIGOSYHUiuqM9IxK+wSjcTxkAGFaGvP5jeSaa7QI=;
 b=m2o4bbck6JjjRIjyCU+1flT4CQ0qgneGZ6jF0JUvkeBHfHoq5jITkw64481RrTK2yM
 hq+e+4kpT5EBrcBziu6Tyv7B4xvf6+CTZ697l6QoeRnq2xRnwnuf37HNfsTS5BIhvj6k
 nEBDXRNOV5V6cIk4aLKK7485c057t4Xq33NLvdT/Kz9xwqkcXrstAWrmWyRYK7mwhjw4
 dyYAviFy/1oM2cHIROskGEkGoLMRHqHQ3yG6ywPEXQ85/e2pG2wp9mtkG898aTHCl+PX
 RebdBgodRYVRZBUoftz28DhgDTfHxucUtb3kn5jOZEmkIJEliNCZz7jnlEPQYFW5Sg6u
 EO4A==
X-Gm-Message-State: AOJu0Yxs6l8Yu8DWKlULp01zOC0sUAXncSGXHPNTtS7dHUKncJu0Ol5G
 EowSuKXwkPC02jhIQ8WU/VLXGEeld1Pdwobt/CXzhIqZ92TK6JDJVtNv
X-Gm-Gg: AY/fxX4RLrObNP3EYTmN6N2vi3BVGj/0JsFYKOJ66tGTrJN6pUxrOqYlnNVgiKibThv
 Ze0NOl49WrPkQyAy6pwV4hrb9uK8cSK0raBMZDnslvkLzha9jrkXKggibQfTdipg/IosWIrqUSD
 fdYe5Wf/H6rLFI3YsIM7cdpsYnMN+OVO6xNQ7AOfXe7868+okWwwjyDVyz3POBL0iKYf2ACD/pn
 C8e7Ra0ao9J1emqFFquRMYlHPOBBGCyWn83aKmUvCThBG4pkk02J/zZBSdOUF9mztRAlSySCbCn
 /saqNad+9b02CF+Lax0BVOKgjVFeqQv4iZBzPS40Wu5lhKfLRwjw2h2qGGMMFRTdbj8t9Xzxkr8
 +e55PWhzAY2P1hKI8z3Jgs9eBC9CYti3wxrjaETBv/HPrbYd+5LP6H8ZTcifCGjJQgGts/3Bgq6
 4doEOlyvhNK9jRpRcvtZ7tR05KwN0rp4jDUWfY8H5T6so2ezgP
X-Received: by 2002:a05:600c:3495:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-4801eaadbd9mr15079945e9.4.1768544615710; 
 Thu, 15 Jan 2026 22:23:35 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fd3bcd2sm10391755e9.1.2026.01.15.22.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 22:23:35 -0800 (PST)
Date: Fri, 16 Jan 2026 07:23:32 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, Maxim Tarelov <tarelovma@yandex.ru>
Message-ID: <20260116062332.GA554275@pevik>
References: <20251221180810.3770181-1-ju.o@free.fr>
 <20251228232021.4d4e70c9@windsurf> <20251230174958.GA496221@pevik>
 <aWlEAhChn8gSm7QZ@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWlEAhChn8gSm7QZ@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768544616; x=1769149416; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ArHIGOSYHUiuqM9IxK+wSjcTxkAGFaGvP5jeSaa7QI=;
 b=aNUaPzY3Kry33auID3h5XEg6M0qm0/DKaQCdk7BU7VEIkM0k9QAxba4OH6BTLM+Hux
 8Sw+jSsgggGYDcxsuLRxigd26SqVraKDFhOP20+iE+rdMi0ao8cPFblt0qBFGqDUw5jV
 +mii7/9EMgD9NAsZGelQb5OI2MQ+uxt/zH67hEtz46IC3Mw1tD/ZNquSt9JW95/LsRbE
 /QNqJaMvLaZUrFePtwPamTlRM6XASH3x3Ip3WS0dFm/l/i0p+gbhUT5nPY73zdug4vO4
 2pfY26axErVs6Hq97oBfP8LH2zDt0ElAz5SabSLBqNR8/Vknkq1UqFqhbJhUrSOnh5BE
 kxdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aNUaPzY3
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: ltp-testsuite: replace
 runltp by kirk
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> Hello,

[ Cc Maxim ]

> On Tue, Dec 30, 2025 at 06:49:58PM +0100, Petr Vorel wrote:

> > Yeah. I don't like it either. Specially LTP tests themselves does not require
> > anything (single test is either binary written in C statically linked LTP
> > libraries, we also have few POSIX compatible shell based tests which require
> > barely minimum of external dependencies), it can be run as is.

> > ATM we have list of tests in so called runtest files [1], which contain list of
> > tests (each line is single test: "test_label binary/script optional_arguments"),
> > therefore anything which can remove the first parameter and execute the rest can
> > be LTP runner. i.e. Buildroot custom script could be really minimal.

> I don't think I would want Buildroot to carry its own custom script
> for this.

Fair enough.

We suggested the solution for the people which insisted we'd keep old runltp
script forever.

And I tend to suggest it when see patches like this one:

https://lore.kernel.org/buildroot/20260114192413.569151-1-tarelovma@yandex.ru/

> > runltp does quite a few other things but these who need them should really move
> > to kirk. Also we plan to implement in kirk and ltx running tests in parallel.
> > That will save a lot of runtime.

> > [1] https://github.com/linux-test-project/ltp/tree/master/runtest

> > > One option would as suggested by Petr to use kirk in its intended mode,
> > > with kirk running on the host, and connected over SSH to the target to
> > > run tests.

> > > On the other hand, it was a lot more simple/convenient to be able to
> > > just run a simple shell script on the target to run the test suite.

> > Would it be possible to have both? Vendor runltp for local use and package kirk
> > as a host package (+ ltx as normal package)?

> I'm not sure what you're suggesting as "both"? Do you mean, having a
> simple test runner that we can run directly on the target, but also
> offer the possibility of building/installing kirk to run the test
> suite from the host?

Yes.

> I'm not sure what ltx is in this context.

https://github.com/linux-test-project/ltx
(ltx is not yet relevant because it is still experimental / unfinished.
It's a test executor which allows to execute binaries on host in the fastest way
as possible. In the future together with LTP metadata it will allow to run tests
in parallel - speedup.)

Kind regards,
Petr

> Best regards,

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

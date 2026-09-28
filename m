Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DADCA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 020FC80CBA;
	Mon, 28 Sep 2026 11:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fU4tL3bO1kA7; Mon, 28 Sep 2026 11:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B1B3380C76
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790593697;
	b=SWn/5LtHHwO7KSdLIue5Om6qtQj2IVwknwmzggZhB+hfa5OWO6nBxdXwLZw+9ox5dYlM
	 0isHhBj71RN492pPLZv0y1iXDLjZKrh8jUrC9pH9lLvOjkRT8TaNO3X4znDoMV9TRwKp1
	 U4ek9Lyb0cKSyRqacAq1Al5hmE+SC9UuVHTVu2+6VZ+3ZOj+XNxfwHLZAJG0mexiioF2f
	 y2e5ZrunZz8UFY5W9Zynkh1O8sXvyr376nl6uULsTMnQFVqoS3CqqIJLFwMcaZZ+bjim5
	 sqYpAqyizpJlii5aOR+eo6PdCjJSc4UNLCX4oVbaiNUzoD9k1Uq5ioP6jQNTsxerEbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790593697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=N8yJ4qQkaBWyhvUT3PB+3xdXr7yFO8Awmi0usvlSwmM=;
	b=CiIwwpWbSsb41qxJ3WD7Nh6Zhc1b+qbaF0UVXIZ9lzOfvE2cuylgizuf5D2NUxkj/9sF
	 UVRmNOYNb2Kh7G7rgHKT0fBAsunTeDwifOBtK09fMIOZhJt8w+p2+1oCPPHJA8PmAJ3TL
	 rCbHxc1mGAekQYfOe4vftjdlPAi1EQmxQpb18XFkOg3mw2f+Ib8IxkhYZgW8WH4gWAUzf
	 6xTJzUguN127f7q9wWNsrsZINzo6VxdQNyEnGUNZQ0Q6RueQK5qf/r1S/Q6zNxeBLcmoy
	 4Nkbw1imHvOyDR+T7fZv22KNEdVTQqndQc0uq/S/qKt6Z9pIRfH0Hm/z3mXez6C0NrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790593697;
	bh=N8yJ4qQkaBWyhvUT3PB+3xdXr7yFO8Awmi0usvlSwmM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kHXlXzGftmJhtPMCMFIBHvWSO7+HyTeGw5ARGEZrxwq0GB+iZU48wIM062Qmew1gh
	 02eu/TnkQ4nuv1G5bH6IIpuqPkiZF7YFKsEGL7q5WzOz2f2l/0ueGwBzA83tDVT2l7
	 p/7uYzPwQ6T4gr4rWB77R36cJsBLgBVWyrDQSFkitHUAfAB4S3LARUSdHMDLqfP7+V
	 6nAzosu0fOFvptNE9jsUv0634OYmVrZfJk5TxYXLpTyK051KWLUsqg3lBrK+sBNSNJ
	 zZIXEQD0qp/s5wkK6qE7qwdmN0//KUjhX4BSbky1M3Uu0RpEhxdWHhhpDSFrQtLZrm
	 l16OxXRivHXfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B3380C76;
	Mon, 28 Sep 2026 11:08:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A7563D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B75F605EE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUXd1XFdGjVe for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2E59F605E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790593694;
 b=luRNi2FEfHKpZDE8LKyTVJC8lFmtdtpouMnFkjcZ9GcKgl82eRZxJiZJNKqzZg+ehFjs
 iLT96DFIE3f1xZsih3mV2OFBmGK9/G+zj17vFPC8+qf+avPABcHRbJRIiGj6H2qDsNdsZ
 bYlZhCuiYHTC8nA8N29Pd+2hJoxyDHDHszakpmsUCpiu1JufcwJ2jw5NsJh8mu75T0JF7
 yCma3k+tY7LNvwKF3nAXvvwTr+SWVJlGas7B0CUrVo981niQ2vuJ8y3O3oDAGtwrGSAmb
 Z1ih9MJJFsxg5abSYLzdMi5f2N0Ir3qojiZ3VG4xAs2kJBNQaGueBgiLDAyoxYJrblA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790593694;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=gm/rtywCDUvQJ0rpotDUG7H2b8rv+FoiBTToJ6M0Awo=;
 b=RgEkje+vynU04EAgg3eyj21SWECI+9kauQ51MbLW5aXXe+2fUZVA7Oeq09H8oMMr7jlm
 CFz9l78OwMxxa0DtDfoAdxtABsPrcVv9ZRvMHX/k20IAW8ZKRrylOFphlmufsSdAbUsq+
 rloSwYQSWs4yNv68ux5QUlzrBjYQhIGraocfHjCIAEZtHA+/p8mO73r67GPoj5YW3zqK0
 ld/LGlKdXYJl60JwoQfFqrt+ZYe1kcPVCmc7rbAVpYjfLMilbKS6VrAvaC+PFHAKgolGI
 TmQCstMRnRqAHWdlL/jmL7f8E4C5WBO/ccvDaAVZXhxLgIft96djw8+TbCBRgPwR7lQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="ic4A/cLI"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E59F605E1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:08:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 685AF1A0FDB
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:08:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3B0D9601BD;
 Mon, 28 Sep 2026 11:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04809102F1ECF; 
 Mon, 28 Sep 2026 13:08:06 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:08:06 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <arpKendqnCAoe3mc@windsurf>
References: <20260927221958.864086-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927221958.864086-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libsoup3: fix static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 28, 2026 at 12:19:58AM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since the bump to 3.7.3, libsoup unconditionally includes <dlfcn.h>
> in soup-init.c to detect whether libsoup2 is loaded in the same
> process. Static-only toolchains such as uClibc-ng without shared
> library support don't provide this header, so the build fails:
> 
> ../libsoup/soup-init.c:21:10: fatal error: dlfcn.h: No such file or directory
> 
> Add a patch, submitted upstream, that checks for dlfcn.h at configure
> time and skips the libsoup2 detection when it is not available.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4effebe5fc12146749e704dd56f695363cc8fbc3
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

It would be even better to explicitly mention the commit that
introduced the regression, so I've added a Fixes: tag with this
information.

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B300C5DF66
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 12:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFEF809E9;
	Mon, 17 Aug 2026 12:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8Tzp1jKXtur; Mon, 17 Aug 2026 12:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA8E680A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786968872;
	bh=5w2/YNgaQV+Y42GvpUHNcRALoYt448c3T26QSkKhdl8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nxh1j27TETq6OuGTYsJNCsO/KgSwZgXYoYMJ5j7v/HNR8gSCD3r9TswIKQqDx/Sgd
	 mvM/bNykzP3VYSXXn/CJg3qDwg1DovMIEykW5XyTMcEzyiAQaxvzLWT7BCeUV4qBzM
	 Trs8NcyScSE/uYiBX1+49xzXF1qcltZJD9oN3sz+ohEtXkALm6DGcTJNlcoESRR3jJ
	 /tHMYmODlemTdbZ+C8NZhfSq8C1UHqE7cmcQKFId0RZBOX/Ox08wc3BVnNmU/sTJ7n
	 EXSZkfOC7fdBko8F0I/uWKJAelBg73UKikvYAHpNFOtwHyAzde07lCgBfrP7+YY5ng
	 jnjMN3jpH8Vdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA8E680A79;
	Mon, 17 Aug 2026 12:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 880B8194
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 12:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7978980A79
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 12:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRj-EnNbAtcH for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 12:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68AAB809E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68AAB809E9
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68AAB809E9
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 12:14:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1BD361A16C8;
 Mon, 17 Aug 2026 12:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D6B4760352;
 Mon, 17 Aug 2026 12:14:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BFF411C7224A; 
 Mon, 17 Aug 2026 14:14:23 +0200 (CEST)
Date: Mon, 17 Aug 2026 14:14:22 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <aoL6p57YFJpr0OO7@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-5-br025@umbiko.net>
 <aoDASYp4PBJt3wCJ@windsurf>
 <46e113718286cc5ee2fdac7ca8403087@umbiko.net>
 <aoKxCBccdMnLPUR_@windsurf>
 <5cefbba7714f52842a7b47d665394e61@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cefbba7714f52842a7b47d665394e61@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 04/11] support/testing: add test data for
 mpd (1/6)
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

Hello,

On Mon, Aug 17, 2026 at 11:27:54AM +0000, Andreas Ziegler wrote:

> Because of legal issues I cannot use (copyrighted) existing music files. I

I'm sure you aware that there is music that you're allowed to
download? Some music is in the public domain, and some music is
distributed under Creative Commons or other "open-source" licenses.

> do not like online download sites, because it's difficult to predict what
> you get. So I prepared some audio files, containing test signals, which are
> tagged to resemble music files. The whole thing needs a structure (aka
> directory tree), because it is also intended to validate correct indexing by
> mpd.

Then those test signals can be generated as part of the runtime test
itself, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

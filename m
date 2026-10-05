Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6C6CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3097340620;
	Mon,  5 Oct 2026 11:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-7vOGkaUANo; Mon,  5 Oct 2026 11:20:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 27C3E405F3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791199226;
	b=EOMkf1CtA6AYVBXs5lxN7665a5loilbXg03wfHSy1vlhCqy80vPY9qd08MaLRwepBv2R
	 atJ5gi2pA4NDpwShoYE9Sc77nDhRYFgt2a1rwgYo6DRE8JTBrFi+twatYqJK/O1Wtxzoi
	 zEY49imlIDJgT3Hz04E0ALAo2dJkk5m5WiiEGjQ1SyoQRwyz1/zX1wY1rnNY5ld3yImD9
	 UjBZjBMPRgsRCgyz5L8hp+zZkPO61S2p0qUAcgKtXMYCwDLZC6mHBU9pb9eoGE+iZD0ap
	 apA7Hb/9FzLeQpcZVJBhy2jfmwOxH+kB6y9B0M1x2jfPq8qU/kPhtqMeYN/IZ9BstRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791199226;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nw499jvav4L6/qYqP9d2LvSD9kaiuRbjK4BAOQxij3g=;
	b=r7DgndypdP65qfusDRMxWyOF2593WKJ/TXT4d2jGfOsJSSxuUYBe6cLwyp5YhscW8U81
	 nLHzj7Hr433JOWW6i6UTeC/9LqrN4b9SvGdLy7U78xOAAgvScmkDQGPcofGUQeash/MGO
	 aTGwJJR23kXe2xUhpiPbb3yqWmlR1X8wdhLSycjL4kjKGpX6ObipshTEV/2O6aJPPGKgQ
	 hGu00/1S78Uf6ljNJsaX6i7j/wyiSGprKpI5Rh1D/VRfSDU3AtAuEv5h6Ji0RR4/cXjT0
	 okR3K96vJk37hrn/QtRnqDfwHk7yp8Cgloxy15UW79hWd0lzWVSghA4YKid8J6Up+3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791199226;
	bh=Nw499jvav4L6/qYqP9d2LvSD9kaiuRbjK4BAOQxij3g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k/OoZMRqxaN9wOLeQnl2hKaI3LUj+cPnNYhS5KuK25z/GAg4Fl99K/Qp2qP3jNcDn
	 nNPNYKfQFvXVTTS9BHcWyAvjwOh5WCqRfZgxaRLtwxfWKwsPi2oh5LmdYuzn9Yl/x5
	 L6XEqCC+Lc7W9mbaxDmnf4YWhz6MbGsrdtEOxJqBZgrvprYB9Pe3VM5BU0UlIjBwth
	 r598Quo05Wb9e9u5fACG1oBKfI1pnJ7WnNpr+wOCunIxpfLMvFu+YJSURoBghFnRru
	 5r12Uvj9JiYyOCzYeABPLEyYTmapXvqUfWOIsooZ8Flqv+waPteviRaxk8UZaHrjyk
	 QbomUlekPXhJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C3E405F3;
	Mon,  5 Oct 2026 11:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0B19282
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96605400AA
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxNGD-8UMP_C for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:12:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 184A94007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791198741;
 b=FBlVGRpycIF5JFn7r1oe4TFXO1sk9Y/MUzYgNtB6AGJ56RZtxTIOKZ4kDmTEFav+6cyY
 49q/nCBlMYSqkwlfpmYWm4ov+8LUi8NmdAnFr7SdNWzq4gCZD1gPWmTm5dIg0OZndg0yR
 7vMAbbkBU9bz9TN9s8cdFcVmMYh8r1rbjos3T6MWtDmyrLzvLzNjRQmp2qZwUsThuQa2r
 BQuSjjjXsToFQqEzFdzZW6LuGFs0X4NPWTirGsy5rtoXjNOQA8gyVS+mIY8OQiY1pvNjs
 vOhzrTtZt0px8f7Rsy6lJBiMaL0B4VilB/KTuKZzRkvOq/E9BdvVWAs0W7fHAPVdPPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791198741;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=3fAjMiIIrv3xevkFVQrN7pjYwEW1vNb9uRZcuMA8Tgk=;
 b=CsVJpuyzlu+Y/7TIWRDywlEIEhVBmJF+m4g2v8nerAVuj0DHUImvIMLX10srfrsFsc4r
 AwxraVupgukPxQM3VOMcnb06Yn/Fucw75I5Zz82e7mRf0qcFXySoK+7lC5BbF3SCDRj3y
 3dZO0ggyiSFSJwq9UgVWrQHTi1Sz8yIb4A7Ojbo4z8pZQAgU5NpZSgzqEAKGWHw6/QvdP
 4J3pj9xYw/U4e8psiEmQkYNpGcimUi+Amr7/krvXA3o99QOgpRU+S0ArRE4gK1mfLSky9
 LlobNRTYx+oS2MYLAbJqRK4gFgqG8wA7QNyjkn+2vFOlinBGa9fCcL0EoyEswQrrvMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="c3bGp/2V"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=c3bGp/2V
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 184A94007E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=c3bGp/2V52ZQVepAREnL3/Sq+vRpFCywJu9dTd+ixtZDHtm7yoFH8+4bQaW8LcNymqhzhuOmbHtFnHhTEydR/60P017MI+IG4xIHDhIq7OfScMZxC6E9/xxhGjWf02FMGAdvVN4Ry6G6AFbKlbRG0F89RLJimI2E9Xw7NIBMdk3jA8f24fMQKsBPSBC3ByBR/J17vspar0FXXE8N5j0t0yt0H+V0tjjj6WZov+QGQsUd57JKfiDmL5KB1IB61CbaAUgitiQhJRxggvIJNxaPza6Gtsqzvxn0CPhmYe7kvEbDnMq2UJjkBamjT7ABc6JTYOAPllSNQEfJn8rdtvt1NQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VOOlXIDvYzwNXoqqkOeL1iYmdtXZ+xtOsPQ5dG6lwq0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 915624056; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 11:12:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xDgcB-0000000DgeI-2Vle;
 Mon, 05 Oct 2026 13:12:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Martin Bark <martin@barkynet.com>,  Richard
 Braun <rbraun@sceen.net>
In-Reply-To: <20261004080256.2996402-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Oct 2026 10:02:56 +0200")
References: <20261004080256.2996402-1-bernd@kuhls.net>
Date: Mon, 05 Oct 2026 13:12:15 +0200
Message-ID: <87zewse700.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tzdata: bump version to 2026e
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
 > https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/L4IGHJRBUQR53F7RTEHM5IS7ZMBR3YXP/
 > https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

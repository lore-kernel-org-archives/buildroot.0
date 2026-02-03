Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B34E87852
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F76B40995;
	Tue,  3 Feb 2026 18:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRaraQ53LnfJ; Tue,  3 Feb 2026 18:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C30A4094A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142913;
	bh=iy4FOrFX7SCxOoVO63/UX/qvyyLsDZkBgi3ljTj+Ia8=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F8rEPJzyeWo4KecchhcI90tCTNUx3r2DBY9rhHi0qq1PCDLzfEw6vinfpxsemWTNS
	 nz88JAuxC78E1xW4q7YryB3FzGXrAKtrdhTC4eXKVTz7y5cOJUztlye67Xomzsp/kK
	 /0eYSGzmBCA5iJgxBUzFHR5A+uN2FMVYQaDKVd89QrQMum2ewK0Nlr6Qs1oQK1nH2o
	 hkViDDWyi1Ehz70LsUhTdPplO4Yt7m2qiY4CPA5Cm73suPZ2mG6ZyDA66G7iUxBVJY
	 dtHoEeuhnVI1JEXEP+cxs/MTi47ElZaPU1d6UBajEsHaEHtMFiW5CqT6CeCiixYJQR
	 BwZ5oJe8dGieA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C30A4094A;
	Tue,  3 Feb 2026 18:21:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BE013D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE878390F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCvDtisZ_IPZ for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:21:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46AE68387D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46AE68387D
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46AE68387D
 for <buildroot@busybox.net>; Tue,  3 Feb 2026 18:21:51 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1vnL24-00089t-5o
 for buildroot@busybox.net; Tue, 03 Feb 2026 19:21:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 3 Feb 2026 18:21:43 -0000 (UTC)
Message-ID: <10ltebn$ua0$1@ciao.gmane.io>
References: <10lt89l$gl$1@ciao.gmane.io> <aYI5ces8h1-KOmDJ@windsurf>
User-Agent: slrn/1.0.3 (Linux)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] How to control make '-j' parallel job limit?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2026-02-03, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> On Tue, Feb 03, 2026 at 04:38:13PM +0000, Grant Edwards wrote:
>> How, from the command-line, do we control the '-j' value used by
>> buildroot when doing makes?
>> 
>> We have BR2_JLIMIT set to 0 (auto), and most of the time it uses an
>
> I assume you're talking about BR2_JLEVEL.
[...]
> I must be confused by your question, because the answer is in the
> question itself: use BR2_JLEVEL. Set it to 8, and it will pass -j8
> when building packages.

Doh! My apologies. As you noticed, about one time out of three I seem
to type LIMIT instead of LEVEL, and they're visually similar enough
that I don't notice even after looking at the file repeatedly.

I apparently tested

   make BR2_JLIMIT=3
   
     instead of
     
   make BR2_JLEVEL=3 

Sorry for the noise.

--
Grant



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

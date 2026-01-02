Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6237EEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BAF982F51;
	Fri,  2 Jan 2026 15:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NswIG6rXba0b; Fri,  2 Jan 2026 15:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1410581E03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368634;
	bh=11AvO8RFmxrDh8PCZnF8O67BZ7pPwbaaGoTAWtnJKJQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ajRDTH/VE0QhX/YQT1/ox4IUIFOHU8Krc12kLsdcnxAW9Jpab+AOQmAjqrGggCVkA
	 BWL4ly7M3p3eJBlWcwUI4T4+Zv+kd/l4b+qyE++C9qodquNtupOOXNZVyTNSYwN6N+
	 UyTA3C+rOWx7aOwDtxHRaopMWG4BNsn6amTt+363XaaeReMN8QMfIPZy97fYOvx+bx
	 gmxO/7AjBSjru/joyl06VDW033xRbNlpu/j187FRZn/9UfLUA0PQRWr1sJELSl9H4D
	 7DeZnUjFev8o1yOeQs58RXLM0gs4ow5T/4qyvr+PzGgKrcCM5VL0VTP5L9nXDiAjpD
	 JSfZoyz65wuQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1410581E03;
	Fri,  2 Jan 2026 15:43:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D5D7351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5431C407B9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nm_KOY0n3t_z for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4123840753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4123840753
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4123840753
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:43:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 63BD74E41EFE;
 Fri,  2 Jan 2026 15:43:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 34DAF606C7;
 Fri,  2 Jan 2026 15:43:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6549113B072F; Fri,  2 Jan 2026 16:43:47 +0100 (CET)
Date: Fri, 2 Jan 2026 16:43:45 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>, Peter Seiderer
 <ps.report@gmx.net>
Message-ID: <20260102164345.51d40b46@windsurf>
In-Reply-To: <20250920074707.584930-6-bagasdotme@gmail.com>
References: <20250920074707.584930-4-bagasdotme@gmail.com>
 <20250920074707.584930-6-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767368628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0EzC24tiFiBo2bDwPXMGCL/oIPxxgngycQzJm74JGLs=;
 b=KJC5fQAqONSawlld7gy7likxAC17ZeLSBzxPtxsFFTOv24Y2tUzZzD+5Gkh7qR+LkcCj1m
 lq2KTr5EPEfdjDk9ueCve3JLoUrSm+YKRiNjW1i1iswj+hh5fBhXClazhYDJWZrNBwRYay
 ycHFI08SL+xYrJo+gFAbTH7Ve2WaeQ6Ugah3fIQLnwa/1tnM8rKCde3/tLeoRGPbLkAY+E
 TpZWJPpdK7gDpQrl3+nvkixwbb8soYjoB1uFDusap+e7wvfKH5qFhYqDxrq1fQ/NAS2/gJ
 wlAgGIvOECpAW1tZ95kbzBL1ewINps9WjcCt22vdzwcPlbtDFI1AfT/N7EuLjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KJC5fQAq
Subject: Re: [Buildroot] [PATCH 2/2] package/ncurses: Also build termlib
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

Thanks for your patch!

On Sat, 20 Sep 2025 14:47:10 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> As a side effect of readline fix in previous commit, building host-gdb
> fails with undefined reference to ncurses error:
> 
>   CXX    init.o
>   CXXLD  gdb
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
> collect2: error: ld returned 1 exit status
> make[3]: *** [Makefile:2232: gdb] Error 1

Since host-gdb builds fine for most people, there must be something
specific to your environment. Could you provide the details of your
host distribution + the exact Buildroot version + minimal Buildroot
defconfig that exhibits the issue so that people can reproduce ?

To be honest, I don't pretend to fully grasp the interactions between
readline, ncurses, termlib, etc. So if you want patches to be merged,
they need to come with detailed and convincing explanations :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

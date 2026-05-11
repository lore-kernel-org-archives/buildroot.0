Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A91CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F8884262;
	Mon, 11 May 2026 10:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrLNFAzv79o5; Mon, 11 May 2026 10:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A3584272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493612;
	bh=IjRJxENkupKw8lieWkskWbIHetp8TOnSFwmPJQIM1wI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFOexEOOA+SkUyThulBIE+ZbNTUd3ximeGrzmSkyhw9sp3xTyoyxYM/jFBxhcHYyV
	 On2VdNYsCzTHRrDo3eri7ObK1yuCq3WBxZWshpGHU12CdD+IMM9Y6YmUTbgeLMtZmX
	 PA3Zn2bBKKJuXCqyV39AawG0bD3GmaBB2ybdf7Rz9uy/qZPglj2UKNbCfz52jGCYXS
	 p7Rm+JpwL6L88rqDOuID27dZWxoo0sbOkYh/90gZzTFzzF/FVNg3Pl6eZDS5jVBb6T
	 5lTz1KCZN6GGODOJxDKYKBlNhPyqLEjxNe/KoSwspwQk/jMT9MJOXhXzAmYvhPFmui
	 hSEjXV5WmFGNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A3584272;
	Mon, 11 May 2026 10:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88E73223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EDDA84262
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ErtjSlKgES4 for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:00:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 637D384236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 637D384236
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 637D384236
 for <buildroot@busybox.net>; Mon, 11 May 2026 10:00:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@busybox.net
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1512256307; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 09:59:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMNQZ-00000009CP5-3LqI;
 Mon, 11 May 2026 11:59:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260511073118.25876-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Mon, 11 May 2026 09:31:18 +0200")
References: <20260511073118.25876-1-francois.perrad@gadz.org>
Date: Mon, 11 May 2026 11:59:55 +0200
Message-ID: <87h5oep8pw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LwewmqeKbsJ+9EP43YRuFHfmKQx0whBaEbOYq2JOgks+0yqfa5kEyHKAEJ7I4THpGeSZt+VQ3R8r0uv1uOGzwYn1srGto2uVECLYEB84NnaKm9eIBLELCUcauVBA2rmDtSmKeEF0gbut5D2Gu9fDfNJwcVlZdDM8x8VF8QmmnESXcDC/1ipmFaUCmVkscW6ir4FYCbMYd3srL71Xu1OSZ+sApKCa0xex3kp9Yk+ATFKR8CaBtpARt0hF4RdXGVn5BEcqR8cWTya2pD03JdCDSNRDGkPQ/d6dZFkaDp5oF6iNMonXEk/mng+o/l0WzDhGCgov3QMF66GBqvHoY65Cng==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=KaxqfycACD38FsXGL2cCWemNjYgeBI7UaMdD65/4hj4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LwewmqeK
Subject: Re: [Buildroot] [PATCH] package/expat: security bump to version
 2.8.1
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

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > fixes CVE-2026-45186
 > see https://github.com/libexpat/libexpat/blob/R_2_8_1/expat/Changes

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

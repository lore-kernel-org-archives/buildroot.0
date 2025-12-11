Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED71D41C1D
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 10:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B06484B6E;
	Thu, 11 Dec 2025 10:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F5-GBmTUe1V; Thu, 11 Dec 2025 10:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 124F384B64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765449856;
	bh=lALsxK5EMoB6TA5gbBW/CXPbMKpOI/s/37JF+M6Hme8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxiXlD3BlRmnFzSn2RFlqSZcwSiPhbh/YUL1pwBHEd0IuuyVlB3PTsOix03VLb59y
	 N6ZwF+RgwvISLcADn08rf1tGdfXuF8hCUyjjfX9yBXbq2LsRj8mpeQUGiKIIM16254
	 y2rWMn4N638yeFcTLi6oTqMbTqZx0kqCEHw4FGPUMG330dAJpLP1UaQFy2MHstxKDz
	 LPzTyy21c2hS+WJmmskP8rc14rfSDDGIQc0cJH9/mU9S+zL1m0MBzOlKjYYoQLigGH
	 W6sF3OacUqVsvvDxLRJjdof4mErKYYkZQekbCmXmpzIpg9SFL+YtWZKaDWZm7rwGRQ
	 Kcl9A8RbhSbQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 124F384B64;
	Thu, 11 Dec 2025 10:44:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B51712C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 10:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6CB484B64
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 10:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBweg3-G0jry for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 10:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20E4684B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E4684B60
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20E4684B60
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 10:44:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1730074610; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Dec 2025 10:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vTe9a-00000000STw-1FmA;
 Thu, 11 Dec 2025 11:44:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <20251211082803.0A614868B2@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Thu, 11 Dec 2025 09:12:37
 +0100")
References: <20251211082803.0A614868B2@busybox.osuosl.org>
Date: Thu, 11 Dec 2025 11:44:10 +0100
Message-ID: <87v7id2t8l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Yxn6z5qeDxKqkenNW9IsiJeR3TMsury2b+IVIMqDmuLr8/N1WAbhROoUmrcKDyfEsKjZhU13D0vWQ5WuEfpjMZI0aieMeOgx9vYb9XNSps50hvYr7FlRPXmze9pYCf/L2R7HAOJMb/FcB1Pvx0EqzGGMZCGPSO27TUUsl6kI1LraF1M3kqNSkVUi4dr/TezWUi7VQ6in/IFHtR2VxN6V8BGN1Bpi8Jndidqq2jF7ba7qjIbEIRIpD2AB6LUOeVOmrUtmJkaBq3EqsqnKpKe6VSU3/zObfX1q7fYRpLd9W4cLUvOFqUaLw7aeFZQ5tUMohJwDJcQ1ZEmz95v3uwRzWw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vjkU4OGRGsFyxrE5J7k68eQ3A7R3wtjByLXEkWZ94gE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Yxn6z5qe
Subject: Re: [Buildroot] [git commit branch/2025.02.x] CHANGES: update for
 2025.02.9
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=15e090190926b0288f2ae4dbcb08c7093961cc3b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

 > Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
 > ---
 >  CHANGES | 30 ++++++++++++++++++++++++++++++
 >  1 file changed, 30 insertions(+)

..

 > +	Infrastructure updates/fixes:
 > +
 > +	- New script support/scripts/cve-check to enricht CycloneDX SBoM with

s/enricht/enrich/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

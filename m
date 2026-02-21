Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18305C61DE5
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 13:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E276405CE;
	Sat, 21 Feb 2026 13:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aB25iTo6itS; Sat, 21 Feb 2026 13:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F63140583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771680692;
	bh=j/lvLNH+WbmycdRSptKwptmkkT4lZkC2YptkdySri1M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qb/WVqnMvOi/RnkSUVs/cr49HN5lrcV8zu6HlU57/U/Fco0P1yDs45d5CmTgzbtyq
	 /vZkDjvuwurPB7HD6Y0eDiWqF2bQKodFlldRQ/DbFxalTutJ6xTFOxQYBY4D7d7Mrb
	 8VBYsZJrKcdaDCIK03oabUIwX63pdijGFxJzzB5L3PwtHzyCSsxrihCJUA7OekfZZu
	 dYi75MCTxGvRT53PUoLkV9se+8M6fgxm3R60fXl/jKY3NNewnGyCqJYT+d9iTGYhTb
	 UpXZcLPg6vDc5oNrPWxubcB+8xk++RP72OowyJ3XlZGna3vUSiYSZYSI5a8jFQaV61
	 kpj4iYe1NGedQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F63140583;
	Sat, 21 Feb 2026 13:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF9B71CE
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A518940553
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QsIAg_4pKqV for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 13:31:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BAE040583
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BAE040583
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BAE040583
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:31:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1357034025; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Feb 2026 13:31:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vtn4r-0000000GOuK-29sy;
 Sat, 21 Feb 2026 14:31:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  =?utf-8?B?SsOpcsO0bWU=?= Pouiller
 <jezz@sysmic.org>
In-Reply-To: <20260220194702.3078327-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 20 Feb 2026 20:47:02 +0100")
References: <20260220194702.3078327-1-bernd@kuhls.net>
Date: Sat, 21 Feb 2026 14:31:21 +0100
Message-ID: <87jyw6gr4m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=S/IkfZBTX3/4ElqkI8p9RxXU2AN2nmiOzDu/7p9DHX+DeXdWFlwBrLQcJ7rX41WtPtYFhMSoN2RRUXUU9+9lS+4beVMJH4HCib1XI3zlP5SDuP3JTKQSuL0ZMEqMnOYrCjJ46KOG/uJ8WVxwHysimiBDgGwV9yr68G3gdVAhNTAkGk3+GITBIcY9yl/B16Ya6yCnDAiZdgmHw5Q33sIvbcICVEPEpX9JgzvLyfjeyUdiqjdqecRfHpNHS5huOc7FDOocXAxSmimdlX6bCM5CTQjCnfKihSgcoANTl9UIFXaEBvu996sq8hBtpvS3D5hceJBLNZbdX65EnON6bU937A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=hoBrInIJM6QaD30RmEeogyFe7kiv4mnNzTg6xjL3MdA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=S/IkfZBT
Subject: Re: [Buildroot] [PATCH 1/1] package/wmctrl: fix tarball URL
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

 > Current site is down, switch to Debian.
 > Fixes:
 > https://autobuild.buildroot.net/results/679/679a9f6224d1771ec2ab52e45fd74af8d03c1604/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I wonder if it makes sense to keep this package given that upstream
seems to be gone and latest release is 20+ years ago, but OK - It could
be useful and is still in Debian, so committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

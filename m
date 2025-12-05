Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B7BD374A3
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE976F4BA;
	Fri,  5 Dec 2025 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu8B9Vl6K_gd; Fri,  5 Dec 2025 20:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1A16F4B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967736;
	bh=qKAAu9EMh80jrACrxfb+b2JJUyboBVCjgaxhtDBM/sk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WdRFr1tSiZi16DbKcS3QpSlaxS+KOcjG+Pox4jHWHf7gnpTn2YBbaVXex30dla/uJ
	 9h1QhoI/5SP1YcP3pdQWz1atAph/LKdiccdpExBeR+4FIxb78qDXJRbU9e0EDTe2zh
	 IF8mzZt7oAlweyG8cQex2EWYKCCHc/wgYykxAMr6Kw3Ie3PtC/fCW9Goe18ASfvygU
	 wS+Parh5K474DDJjUeu9KQJcP9jwbYpo4kPOBoVP3dhDLVVIm0cNp2zA4ZSOxH3c1J
	 dl39tdg2ERRhmAEvR01vqPKLbTU/ia5fQglu25GvZwLOgo2tz/S9S7BOrRkVgsEfvM
	 qTltN5Fr7AW2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1A16F4B1;
	Fri,  5 Dec 2025 20:48:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B141A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05799400C4
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSOe8CDtwuyp for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:48:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D901240010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D901240010
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D901240010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:48:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1819750669; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Dec 2025 20:48:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRcjP-000000029kD-1aNJ;
 Fri, 05 Dec 2025 21:48:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251204163329.1313311-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 4 Dec 2025 17:33:28 +0100")
References: <20251204163329.1313311-1-bernd@kuhls.net>
Date: Fri, 05 Dec 2025 21:48:47 +0100
Message-ID: <87a4zwejtc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MWC3UnIdLGGozpmcELgCey5zamkBPwpMx6uReQTWh26VUmz+lLsPLdqHSOBGRTX0SWH/+lSWRyIvIafM4728hi/95lVFJnI/7ZdVM7YLjSpaYzGQ9AiINS+vqFUeb4PzP+9OC5AkVCBStIa6QSSr0Ot0cBYtAVEcc9Sl5jGRsvlCXDXrlSUeD8vw6wcsPDbz3wJdErCv9R7vvnKBUuNSs61UVIynG8VKw/jfL/6nC3YARWFclaq/BJztt/6NmWeKhtkz8H3Q/MfKOM8J5+bm92z+zOCZiVVKaBda0kTJiTE3OcndzNjaXNIB6ZbTBnfrkcEE57xHGRTWYRIQSm0mOw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mDAVbdUJtk0xVbViXo6tzGovVHeoTxNMLbMCWvaUzZI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=MWC3UnId
Subject: Re: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 25.4.5
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

 > For release notes, see:
 > https://github.com/intel/media-driver/releases/tag/intel-media-25.4.5

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed both to master as the .4 version was added there, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE71ED43359
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 22:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8771680E6B;
	Thu, 11 Dec 2025 22:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcti7l5IYQMN; Thu, 11 Dec 2025 22:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2AE981EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765493348;
	bh=U2FUaaKGOt/zmEdh2ZDBmtooXKCK12C3xzvFiGqM2zo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pw4AGUwrE5d2x1O2aDA3Lb+yryO6IE+5nIOgiVluTv3CAi2iin3s5axu+AVZdmVjt
	 Loj0184lziPFYM58efDexTUnktzmIUjuR+5lu5h8UPpJq9CmdiUQMKKqKuCwQuD63Q
	 Y1se5oJtmkqRbqCNNc+Fadt5LI8g1DHBzLqjMLn8Wr+7cuJqdvI007ozebqOe8yIiV
	 2GfNO1nx5vNKIZmoFst3GSC6t0O+UzD5gfyBLu+jB7iCRSBRu2Pn+PQymWZYyFHtKO
	 eLQ1lnfN9JuQBWpStfDFgArWjKLHwCLm3PixfrSHQwFg2LqoM+x2yTlb13c6NRP6R9
	 Y45wX1spkRamA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2AE981EB4;
	Thu, 11 Dec 2025 22:49:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF30A2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1B7040206
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akD4qWO4l9cO for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 22:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D4B340026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D4B340026
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D4B340026
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:49:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -792781601; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Dec 2025 22:49:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vTpT5-00000001HDz-2wAD;
 Thu, 11 Dec 2025 23:49:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <87jyys3b59.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 11 Dec 2025 23:29:38 +0100")
References: <20251211121411.210875-1-buildroot@bubu1.eu>
 <87jyys3b59.fsf@dell.be.48ers.dk>
Date: Thu, 11 Dec 2025 23:49:03 +0100
Message-ID: <87fr9g3a8w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ghwYSoutm6nHqeEdq7q3q409ofhYICRcL7YTK0lBfrfliqbiEFkhn/QmiHTP7GHLb5kP/HO6L+CpfFJvqiOLCK7KOujR3FqtkKOJV28qSahihCs/L4GTpFSklstMWpwOZy8FR43m+SdqA9jUQSGSQfn8GkWHZ6WnZ1lrBIuZupdik/pAHGpWvsZbRBd8L5XKyvx9c2U5k4NzQQkZNWv0jwV+wMt944KsOtdGM1ydr4CILrU9unXv0nmUXduQzqPVbyhE9qeAHJ3LP4hSqCwrr00XAMw2BSSo8RmKve/dH1MTQSOOCTUf60Eb3vBIiO7wbNKzQHsyH/+MwWuupobBVA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=soauCtELPkuzWLCoXbIrrw+SewXtr126fyKV8jvFdIY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ghwYSout
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 2.6.1
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:
 >> Version 2.6.0 fixes the following security issues:
 >> * CVE-2025-66471 / GHSA-2xpw-w6gg-jr37 [1]:
 >> Fixed a security issue where streaming API could improperly handle
 >> highly compressed HTTP content ("decompression bombs") leading to
 >> excessive resource consumption even when a small amount of data was
 >> requested. Reading small chunks of compressed data is safer and much
 >> more efficient now.

FYI, according to the urllib3 release notes we also need to bump
python-brotli to completely fix the this issue.

Care to send a patch?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

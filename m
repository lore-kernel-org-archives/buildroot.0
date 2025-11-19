Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79238CF58C9
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 19:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F4581095;
	Wed, 19 Nov 2025 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSNnxPj8qGSq; Wed, 19 Nov 2025 19:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F83C81069
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F83C81069;
	Wed, 19 Nov 2025 19:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A343D37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 19:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94D3580E92
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vf73GS2igbxc for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 19:39:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15E4380D36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E4380D36
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15E4380D36
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 19:39:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2133098510; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Nov 2025 19:39:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vLo1N-00000003NMN-3837;
 Wed, 19 Nov 2025 20:39:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251118190302.1504901-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 18 Nov 2025 20:03:02 +0100")
References: <20251118190302.1504901-1-bernd@kuhls.net>
Date: Wed, 19 Nov 2025 20:39:17 +0100
Message-ID: <87see9lsm2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LN6kPzBOwdhp2k4YLewjGwEyNgG5ylQxZHAp1eNlo09XT4fwKn1bHdVnEKJPvJKDgmd0mhnPqb8pSWnzy9foPZu0EJSCAsAuIVMHPfwqq6OOkPxUQH7pp3H24N6HVpuUq/RKZd0KKLLWmA4RdWjgZXDG9p6iizNehT5TNOKfpHCOHOa80zbmlTyQRlD/rtKqU6+Z0N1zUfv4mKFPmaWZidOAfmr5Yupbw85K0bI1PQsa5UMjsoQGijfMQMBBbHUaGwSg+Q8ccrkWTmLmVBpQCxRTFQFRBypyjG1USrf94uYnh3uNw25WysUxeyF1hjTiQlVdrSFBfKtg6eKwLgOhvA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wGdld4ZEMInpE6RCUh8c3c0g7UcOvWt1Pz/RDSDBZWg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LN6kPzBO
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: fix build with jimtcl
 0.83
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

 > Buildroot commit 283821fc31c4890f141111cbc5994e36703c91eb bumped jimtcl
 > to version 0.83 causing build errors with openocd.

 > Add two upstream commits to fix the problem.

 > Fixes:
 > https://autobuild.buildroot.net/results/f20/f20667f8fe159de6601a81a827f26d4f0382d673/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D259CD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 13:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A794111A;
	Thu,  7 May 2026 13:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JqoqonD-Bfs; Thu,  7 May 2026 13:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F16F641110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778159383;
	bh=DHCLfJVKEL3chj2taCTTLwqM+Hn31MucB9tFaIV3cKA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YAm7f19JcidMuF6lmKIeENI0tg8g9O15/OmnLGw/oxQVmSmf4Pr12F8JORNj/nryg
	 D8eg5IPVHWd16ylOITVro18mHolA5LdfrWRoZXswhWKvnloPdEyEAxOLMWEjeGYW4D
	 jkrpDFaC4ZLC4xvSg3GI0X857mJynexh1hsXBBctnzu5nrSJi+P2xIgqsbyf7aKkWA
	 mOj1xsa4o1l1D1xscKq9eyxsCJKk6O4DuapvrOuBKhOTZH3bHD4r+vJNtWxFbARlLY
	 ykxIkvgXw1fQJce3qpyicigZrT2h0JwYGeMuGn7k4m45wKE+C5Gr1DASImi3pGOyCa
	 +g5hLksEWvpQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F16F641110;
	Thu,  7 May 2026 13:09:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 684BD317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DB9B407B2
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSamTv7v7m35 for <buildroot@buildroot.org>;
 Thu,  7 May 2026 13:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE74340137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE74340137
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE74340137
 for <buildroot@buildroot.org>; Thu,  7 May 2026 13:09:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 247528878; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 07 May 2026 13:09:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wKyTg-00000003OJW-3YT7;
 Thu, 07 May 2026 15:09:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <afx9objSQO_30MhE@windsurf> (Thomas Petazzoni's message of "Thu, 
 7 May 2026 13:55:33 +0200")
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <5db0b73a-7fed-403f-bc7d-22411a71735d@rnout.be>
 <325e5bfb-48f8-40e9-b1c6-6081dfec116a@gmx.de>
 <b8636103-f323-4345-9e10-ecc8c976497b@rnout.be>
 <afx9objSQO_30MhE@windsurf>
Date: Thu, 07 May 2026 15:09:20 +0200
Message-ID: <87wlxfpdrz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WEsc5OYwZ/RHLa1gJ78+wd9H0hfTx1rIHCum7YRUvGJbGGR37r6RgvH5fjzOyZrkBQ0Utu3Qt3u2n1hc2/uJjHN0joKAEHWedzTPyop52FDNsDibHSMSFPBn20DTTg9eemF5Xsq1EfLFnm27iupIfy30F/vFE23u7bOGCg/7+fT7bwjR2LjQ4MvsUklZ5DZXxAH0ox4HDTacPX1ipd8dZkTBGu14otkb4B8uCCSn5hyaAr2U9CNkvTOiXOQNcuH/hhN1+CwAGxQNjyUuHs1y9jKDgvRWnu6q8rImL+5M2kdH548X4PkBy6CJETMgnXE1qyLak+bMm41+hlwXhc8P3Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=yQqgpWzy+EG56hI2JVvXy6gAjWEouw5C6CVEn86yZAk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WEsc5OYw
Subject: Re: [Buildroot] [PATCH v2 0/6] Bugfixes for pkg-stats
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
Cc: Julien Olivain <ju.o@free.fr>, Marcus Hoffmann <buildroot@bubu1.eu>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> I wouldn't say no to that! We actually also have sponsors that could
 >> contribute more. I guess it would have to be routed through the Buildroot
 >> Association then.

 > Totally agree: it's a great idea!

+1

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

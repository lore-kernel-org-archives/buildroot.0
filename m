Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B8B107BCD0
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 19:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94D5981516;
	Fri, 13 Mar 2026 19:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqtJQk6NZH_u; Fri, 13 Mar 2026 19:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51898150B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773429787;
	bh=FyxrW+E0ldv3e8IryMi9wEdIQZ9r2Kyhc8urhBFBOhg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkJElbYGe3pZDSegSPdutVOgrQNW0Gu0K6smyie9jj/xUigohLpYwrplZG3sbXJMI
	 ESMbz5xii7reFC4gPILTOVUEtKa1Cw3klUiP/L03xRAWpUbAuahjFAKxiJobO2mNeO
	 2tb3rVpwCWTp8VPwYeM4mYoz6HQNzs9t1Cb+PFeEyUE41+07y8S4i4jyq6LLKHUDLj
	 kcDQPcb6ERBAoK4T8UGvsy7FJ/wEuuFvvm+mNVi227kRk/5tS65vh+VUro6SNwaJyB
	 WeBzBb/aUbf58Pkl/mdWnJbdJS1Nof4mxgoIBmQRrqgvR1Ej0/5cQFvppsp4ovYvBn
	 wxjos3dwK/bCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A51898150B;
	Fri, 13 Mar 2026 19:23:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E06786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 19:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C65B8150B
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 19:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GodB35VzrYM for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 19:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C849E814EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C849E814EE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C849E814EE
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 19:23:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -638548262; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 13 Mar 2026 19:23:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w1865-00000001s8J-2Bfm;
 Fri, 13 Mar 2026 20:22:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>,  Christian
 Stewart <christian@aperture.us>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  James Hilliard
 <james.hilliard1@gmail.com>,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <11d74c7acb42b8608bae709315dd7468@free.fr> (Julien Olivain's
 message of "Fri, 13 Mar 2026 19:24:08 +0100")
References: <20260312075722.86111-1-christian@aperture.us>
 <4529c7b6d321750cc0d99e8e02c4758f@free.fr>
 <875x6zirde.fsf@dell.be.48ers.dk>
 <11d74c7acb42b8608bae709315dd7468@free.fr>
Date: Fri, 13 Mar 2026 20:22:57 +0100
Message-ID: <871phnilf2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=19qoEWrQqlBZxFH1iI6ht7X/eoCkffQ0wM9WcRRKVPW/aHT3zj6PlQRI4ki+RiXl/LLe999HQqpEPdvtdL+hN1sAZ3UFOOqsg3lrvE/PDbgUjmJ6lNxfvTXM4ucrBVyJKKJRNwsW8h1Zfo7nFnmUOPcxt+6PsYbkP51nxIej8hzcWyoqbdwvvV3B9R2i0isQxutcxzqHM//enkrJcqGuAgTNi1KRSX5LXsZium5KjH9KtZoqyGnxUnj31xrfONVqxS4AyZ/qyEIIBy5Z7a5QGLXXN24+lwsNFuYGvWOSEuHKr68k4IR8+onKOabTEQBRf8NQp6BwO5u6Pw7hFug0xw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=KPbvkmlRkENVTnCRBufr0GvhhZ4pIITZ2hwEashGCxE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=19qoEWrQ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

Hi,

 > I thought about that. We usually do that for LTS maintainers to
 > cherry pick the bump. But the LTS branch is including go 1.23.12.
 > https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.x/package/go/go.mk#L7

 > For which branch you wanted this patch to be backported to?

The "normal" non-LTS releases, E.G. 2026.02.x and 2025.11.x (there would
normally be a final 2025.11.3 release soon).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

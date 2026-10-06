Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B14CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 637C2607EA;
	Tue, 13 Oct 2026 17:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbrD5XKRMbJC; Tue, 13 Oct 2026 17:56:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A15360803
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914189;
	b=kIpHzXi+H8WWutk2vHpbqffoQnFXJ4AtwEUqow77kqGw8rHe/irLTyYVrdZGJWQIA6t2
	 E/ujYXe0OvCLBUxs/X5dzhXGT/6M0VclO5NJ2Kr683uYK7KeJlQaCvbdahfL5AhOc06eS
	 JkT+gGszM/0Fmrfp9pNFDdOWgjpLI62AqkiFEmIKCB9U81eXFCkYaaMK73XScCWPfDQEN
	 V2nrEniY2X7sfD5xuA0cpjByVPdCLPAA8y7I/yX3nGBcEVHQkvj6Yb4dMFZm/NKEyzK1W
	 sYOci3qoh37K/NK37DVsOrR3notxcLCA4ZhCshLR0QhIE66IkPl+rQB8mc6xpq9YoXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cirk/TgNsbDiEpNXxvWkbrBhEwW4ahgAa3ortjLo78I=;
	b=a+WtCXd69xUmF6bJCtTs0+tWWUi7LWEjQ+VpZrp3COg45s18QUzAdASomrqC8Y7JZdk+
	 oqFMNeHWQ0f2Mwhvhlks2Qt8IwNKzXsX8edR61lBVcvMgoOa/eDzHmhSzc4SD28WIpLfp
	 JbmB9mJOzxwMd7d7E6AbsI7/oEENHTiU/oyKpwdZt8k/WbnT2ZqfKGn5ewcbICO19O4mv
	 nMXTEeOmxsZ8YKmWG3wkQi9y438tRwFQRI+oK/2nIZlRkymPQxFWAaW6evGu/YJSvh4Hs
	 v9vFFQnMW0aVA7Ty2oxvLLZ38eT6gRfKP2PZUhtCpwnILwqMzZo5iBBVc9MQeukcwJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914189;
	bh=cirk/TgNsbDiEpNXxvWkbrBhEwW4ahgAa3ortjLo78I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BZS3QAjY+kKUlPrajV7/I8o3PTCOw1IZYK7uBdVWaiUWTlU9T2Ue4bXTSbFgryrDe
	 STj9sXh41mG9r/lFc00N83oLfpKU7Iz3mIirqfmUhqm3vdglE53ZfK8BDN7qyupy00
	 MFYrVvS3bGKHBaMcyAUesMuQ3NHG+rzt/kRKgvpBZyiPqrOdjSnikuKbJlMNF1201V
	 i688SvssyFPfHmQYHA8kkAiIfqEQJGyHkWTPYpNOZfyrm1F00V41YSU9FnMcqZMJif
	 cAvHj7KVP47T3EL+baR7Q+5XIptXjb0rSAlrO2FSbUSCEYol6FqLWtF3aWDdMfsca5
	 1ClXUHls+5gWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A15360803;
	Tue, 13 Oct 2026 17:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7285E362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643FF6080C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ-5EXb6CIDb for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A2E1607EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914184;
 b=RtlKrUKB+l1uqkECQD5CMi/Y/NwkKtcFkaQoWiyvwtdMmmqSgFWjwjfiCxSX9Zku8HTo
 /9BNbSTU1E+Pec8+wPThh3KyEuUZdLRpe/yP69kX8Gz08moaPOKsqSgn36WXepJB//wJU
 MLX5VPvZPAdD3UuOuXs7di7dBUwkVSsxOiN8yHRGze289WmFrUkrTZkBVNpRL610looh2
 4lELCAALnWb0dpq1txuH5vu/0hZ//WjvsVP4C+t1zK84b1lYSOwEpYQfcN9OWUPeMcz9o
 wJ3EArezqXNCRx5GX+xP3M0aXQobYL6AZPpWpdW9oM74UlOWgbsrAlfvNeMbp7KNaUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914184;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=C75w3hwkCAf8EKq2gBMBkqVh5wOZ6iItXlgBZI9LNmo=;
 b=A2j74yvehnyRP9S2LWn0AxbNut0xnFXC16IpqmEFvBZpO2wrM3WEAW6E+KFzXZ2qADfK
 1J6Hx7PBdtCMxwWf8vxAnroK1PiJOoOjGkIqI1ak4F2kiwOxn4UHFDwLCNtxaXCUN3lK4
 3cA6hEtOrvuodEjO5eMSzBcIrtA0bm+E0okyZ3BGW+RZJMT8pFxYYPl8mShYTFis1OOrP
 cz+e7wuK0x+7dZY1w8zIgnWvXBozlLl0bN/z3mHonho/Sr+m0QZW8RyGMOAMAXzxjplyq
 25PshPiTLkYMQZo8NdWqFwbrYpZ6W5JLlk2mPgf9WhBsaWerJvbt/Emom8TpGTmcl8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wyPSKjAn; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2E1607EA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DC3D8C653FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4698760362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:22 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id E2C3511D718C9; Tue, 13 Oct 2026 19:50:20 +0200 (CEST)
Date: Tue, 6 Oct 2026 16:34:43 +0200
To: Michael Ratzel <michael.ratzel@phoenixwings.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <asUF2a3y-jrYlRd4@windsurf>
References: <VI1P193MB07827A8170CCBBF9ACFD6BE6E1962@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB07827A8170CCBBF9ACFD6BE6E1962@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
X-TUID: mtAv/a/mjTI3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: E2C3511D718C9
X-Spamd-Result: default: False [2.15 / 30.00]; DATE_IN_PAST(1.00)[171];
 SUBJECT_ENDS_QUESTION(1.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-0.25)[68.06%]; MIME_GOOD(-0.10)[text/plain];
 BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 TO_DN_EQ_ADDR_SOME(0.00)[]; NEURAL_HAM(-0.00)[-1.000];
 RCPT_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] Build host-cmake with OpenSSL?
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

Hello Michael,

On Mon, Oct 05, 2026 at 03:27:54PM +0000, Michael Ratzel wrote:

> I personally believe it will be beneficial to allow host-cmake to
> download from https sources in some way. What do you think is the
> correct way forward? I am willing to invest time into implementing a
> solution for this, but I will require some guidance, or even better
> an example of a similar solution, to be able to help efficiently.

Thanks for your e-mail and proposal. However it is not beneficial at
all to allow host-cmake to download from https sources, quite the
opposite.

Indeed, if you allow random stuff to be downloaded during the build,
you:

- Break the hash integrity checking that Buildroot is doing on
  downloaded artefacts.

- Break the ability to guarantee the ability to run an offline build
  after "make source"

- Break the legal-info support, as when running "make legal-info",
  you're not collecting the full source code and license terms of
  software components that go into your build.

So it is actually a great thing that our host-cmake is built without
OpenSSL support, so that we can detect packages that download stuff
during their build and fix them.

So the proper solution is one of those two options:

- Adjust your Buildroot package .mk file so that it downloads all
  files that are needed for your package to build. See for example
  package/asterisk/asterisk.mk that does this.

- Modify your upstream package build logic so that as an alternative
  to downloading/building the third-party component, it allows it to
  be provided externally, and therefore built by a separate Buildroot
  package.

Both of those solutions require a bit of effort, but they guarantee
the proper functionality of hash integrity checking, offline builds
and legal information collection.

Let us know what you think!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A468CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53BA740624;
	Tue, 13 Oct 2026 17:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3kVSeBRwN0j; Tue, 13 Oct 2026 17:54:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C76340609
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914063;
	b=JqDw3FpeidMr7DWnzBPoXhLv+QzS80167ZdThkA4PG+uv1e7EV5wGY/C6lSp6Cw6oe3Q
	 yQtb4BIQ0Ye9e0LaNddV0rEcZF1QZhdTDrXh0dnmCfbq2yN1RU3WEHrnsnaluPHkrTUZg
	 q6W56g1NpxHuWyeDLx2KUxKdtQj8Ru4sO0Fl9C6JMP0nomGCbjjD9Xk+iQsPurRvGYHv0
	 944rFQif5uAjOSZVd5cQb7U9fAVCvOP7M1++YzDTqzHDGivD4wLqzNpFq4eVwm+piBOPh
	 8AdX5aahh2/V9gU+b0q2KIx8RAmevupr/VGRmG2J4EajlswtgoVcXI1Hj4ovX5hMlHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n16oxPhTuhDocY14X9CxhWtyvNRAhVTMfP6YQwCf/ZA=;
	b=c0lxQRd04/gJiNfFaDFp+qKAwNsJWPz1pFK1JFf4BQMHmy2jcU4ZQt8XCV5gyaJsbGuV
	 zdWeBADnC1l9gmvGht0qw6xq3RpxGLvfeFh6EEh8ND35VWdItp43RbbZ3lWT7Tu0udvd1
	 1hRris4PmxWNBZQ9u2HLrWoG7PDCU9P+kBSjPcjy7KtdqRhniDHJfjTULeHTwT/JLoU7u
	 +VowEfboRqR7473z34yfy9SeGJD8r+RRokuMFa/yIe8qDdvA998LafWTADBqVTqaQE23O
	 +ei2Wx3cho478vQ7r1gJNrKSiMaf2UziS1/sI2RzwrPStOW8TI+T4HjQJA+l6+LN04g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914063;
	bh=n16oxPhTuhDocY14X9CxhWtyvNRAhVTMfP6YQwCf/ZA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M516neasqtL1XLA4ZXOuAwy8SQ+q/jOiqF/QE0nhx2qF0x1LGEA7Nk7s/n3MgDbnu
	 2qSlMsFiDpAnHpmnp0OOxGYVzRIuQ4YKYKc7ImGRg+KYxrVLNqaNVHNvkWWQE9PRBR
	 4snSUYlyp0xzrfGeaNhtY4kDDxYAZUsXHrDE9H3D+WQ2YO/7gizQbCC4DDeAHj97A4
	 vz9tMCZM2PSGnsWse7+h86dVk0Xf9HDF1kWSqnF2g21ziWC1mmENLVcQHWoD3Iqkkr
	 RBPhgsWCqzAS/obbhcBlFADbwUePv5yN5Qrs0e/29A1bLfccPAE54g9Yx2Q+MN1rbE
	 hcv6C88AEstQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C76340609;
	Tue, 13 Oct 2026 17:54:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B813788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3176780AE6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9WUCmFRv5Q2 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F78280BD6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914061;
 b=Q/bu5CNQuKVbmszHkuqLe1f235qqoT8a57b3VyzE8BXlWuD+N1Y8nj0uGSq7UTrzz5Ip
 Ec/oUWMJaKHro3LHxtd9lmkSNXDLsNqZgn9V7gBZgSM1Ag24b1gyEhek4ti6FsalM/bqA
 mZEMT7ybWEB4K0pk1Xb+NsVywVulrcz8aX4zjlbU2+8E8mG4bgGViS61z7wWbFwMEj0aM
 wPTovSWeMNYUnoySUk2KjLrg8i5IFQ8Hsu7tQo6UQUiSNwGRteunaw2xdmTdfmRl3mT1h
 a5vsSZfthzHGQA0DxzMGk3Ib+KWqjGx9MahIGw04OJPeduCLLgRVEe+vbLMKyC+Xs4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914061;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=DdnfIwF2Vxiq35pZ2m7/EsLL1g0hr85h/tuO5r+/bO8=;
 b=RbVdzLO991V7I0Dq0OZwv/9Pr4KJuv2cp1zA9uRmap6SJNhKZ32hnMAgpXj2+OBtKbsL
 0Gq0eP/q/P0TlOZ4yMV3rHZJrMpGUElvn133LI2JlL/SBnPd0LBQEQzJBeXSME3EW/ZjN
 fksDrnX4SqE0QVEXomngo8kwooVaXENOqh7jpN1gRsZubX71iGLdwbUBRq3HojWGjsHd3
 gUvHprh/K7jVFaj1CViAQZPM2EVqWYh1UJJurVtniN33W442/xNBXTxz93WEXfa6ahi2R
 pb2FPsx8cr67HrkSk7kw8DcPzTY8G4j1R126ACmhAKu6DCSLSB8alXueAfU0eMH1qcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="d/lRG19G"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F78280BD6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 781B0C653F7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D650960362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:18 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id C449811D718BA; Tue, 13 Oct 2026 19:50:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:06:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <as3mjU2Tt9zSlCMS@windsurf>
References: <20261012020536.562497-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012020536.562497-1-james.hilliard1@gmail.com>
X-TUID: BBpghEuIWKOO
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: C449811D718BA
X-Spamd-Result: default: False [-0.03 / 30.00]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-0.43)[72.68%]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_HAS_DN(0.00)[]; BCC(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; MISSING_XM_UA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; RCPT_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add python-httpx2
 runtime test
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

On Sun, Oct 11, 2026 at 08:05:36PM -0600, James Hilliard wrote:
> Exercise synchronous and asynchronous HTTP requests with python-httpx2
> against a local HTTP server, checking the response status and JSON body.
> This covers the httpcore2 socket transports and the AnyIO asyncio backend
> used by the asynchronous client.
> 
> Bind the server to an ephemeral loopback port so the test does not depend
> on external services, and shut it down when the sample finishes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for this test! You had forgotten to update the DEVELOPERS file,
so I did that and applied. Thanks a lot!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

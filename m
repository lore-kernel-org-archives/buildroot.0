Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBD9CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC711606DE;
	Tue,  6 Oct 2026 19:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi6sx7WyhSvj; Tue,  6 Oct 2026 19:44:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5DDFB607F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791315872;
	b=VIuHCF5O0FXKoNF22vHVA4VLZgCkIiXAbE6p7LFszm7SucN1q1r3CrrRujaLbZjdWs5G
	 Z/7UZNO0X2pXq8HR0bNzUp1Fyaq/FMYKRkskthT4wYX4PXL5YjEuK7MrflLKr8aPa2Da6
	 a9PMvG5M9lke+Wa4eVHZsf5yXXZJjbbOAVTzNFcAzszPzkLhyFMa0is2TRO5kN1IczIdW
	 yiOZgCcLIh1kqMaHYgPx/zDQlkvfuU62/wSlKW0JRPXeuYZ6Tcd8hxmO3S2BUlEeQFt46
	 Z0yZ7YzumcHlUg3WL6LU3KRqI8OcS4IN8mG+KssdNn9BMTBNnZ+sBu5kDZoD+JMB5EA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791315872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ql5dNcHjkHdLeVDoS6beYgmpfZB+wJkktMrFqeDHSzo=;
	b=UDySo+7egP/IsmgQBcjRb3Q/YX3fN5Nmtyulw2qlsu6mTFZk97qgcjHit+t3EQibtKcY
	 CWloB4zV2RomaUuQt6agHHrcdCgxJ/xYlkL7K7NxE5UyyhuQyTzinlwNf2o0Uh6cc5tMA
	 S0A3hHX6iwaByehUrmXueZJaP7b6aCoDO2OHg90f8isxI0HF9Xy0+YQPfX+5m+C3+6yUZ
	 yOc/9rjd6lQFTDizCn2XFgpqha7tDlGELHnrf/3wC61ehcRszewWYcUR39olbGOoeExUw
	 WCbk1+nZ4KRjP7EV9+7uwom8A4r4zg3V1/4g3DwFs7xsqcBzB/xypJupBkoRBiVYzzg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791315872;
	bh=Ql5dNcHjkHdLeVDoS6beYgmpfZB+wJkktMrFqeDHSzo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CyIq8bBEonga+E+osIZeIrU8QVR5Z35pWtXZO7MX7BcnamDDaX47XetOJolBTVPsd
	 iYTVQxsvXXFzfDDm86xPEzgcwaxiA0JmIFoAatp+V4y8m2+17A+DGoQho7Bb/jenv3
	 sgPs+JiDQ5hy9C51JHswVIyVrm88c7EVu00KXCTfGjH8WyWsI5clW3Cq62Xn4EkqR7
	 hK8/X+VneHIOnhwGCHKE9bNAzX7hcNd8jJUqTZPISlHzXJlbYWhiCd8vZL2w7TbC4F
	 qRZdrTa/2hQXOPPgssf9so9cQ+Nrb+1RB1lHRfW3PCNZB436TGHrWXd59j8/+qDf6D
	 g1QbE6fZQXFSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDFB607F0;
	Tue,  6 Oct 2026 19:44:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E151C1D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7D7D402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24zqOP_HwBof for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:33:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9455E400D6
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791315211;
 b=q4zEddsuBWWzIg5X+csljLcAV7GpkiNUAEYtNZJejWGDIlVDU+ZQ6xYL6jsXZbEYj5yM
 UgmUk8bEFml8dWAOaNpgPc2wkCmc29G+Rjl+qRIsZu/S69+p6xh44H9peCEmWwfGF5fw2
 YU8BDuKTYlxXESpk8m7BfybzZzy//ZkFJDjKleWCVxqu1m6lX6rVi0QgD4cMO6LRvnlZ+
 fNbXvMKu6BB7KpOzGlqly7lDjHkYQwGreriDhgrQf2Tw9sYRxqnJ/ersNrh33FwTlkA/6
 z7DrkyszdrhZRpTbqqYpTzildpt4+AC2euDU8Zimo7QwT8yz15SpO+psfC/ZOT/rmiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791315211;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=qpduDbnAjxted1oZnnUve3w4m7gkQT12XU5Ee1egK3A=;
 b=S2WtYmydsydrfWdgu1RB0KQjnTN4qiIlrQBsMK+asWIfPYlJahml8voj2QN3sdlFzIVe
 ybfw5bWacxLQ1AMltEfZdd0DMR45nJ7qFg/7eAaYmn/Sc7oNE1LgyUAKjBXz1plwZ3TIS
 PLmOpdvqoA4dNpMKPSIJmu9K+wvkVLCDlK0SmftlTsvMkcfS7GEDUVX+Ta+h15CyG4MnX
 NV/KaML2mviil/capW0F4EpzjsnWVvoI2rYL4X5zQu0Zkk39PVUi9qk6ulsD2u54sAwqJ
 RXvgZCXpX3OpO0jasPoyPG6TSXZS6XX/impg0UIoVQ3SeIdKCAaxenh4qrtlBox47uQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="N2S0/peQ"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=N2S0/peQ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9455E400D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:33:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=N2S0/peQfzAfnD3zAIF783aZaGjIqhVRXJL4nArEvaCN27YiOIiJzqu6bsX8cgERVbhDPL+8r92axZbvh02QVe5oFCHh/8fSXiO+bfE/DYcrFB+tPcfc5ci2HYWtcMAbu/qtqhH5Bt0P91fRWnLjJI+dMO28NtfV1mCBugZ5uuMACj3JKbB2tsH2J8cxtXCcwjAvZqcFTdCZTpmKK13s21TqzNtTW7Sj2DdzZpPJ4D0inj2eqa3mfZRGKmMaXFZ4sVf2M9slEXTdTtXMx3sP6cVm2tCgn9xMD6yhfgXL0iTvGDFcAJiZ6MFncE3urP7HIQ4D5pMbRfEo++OpAWzPww==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VKVhiAYmN+3cXHsRsb+gUiyZ63eGaKfyZa/rKToW+Ro=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1229082901; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 06 Oct 2026 19:33:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEAug-0000000EqgZ-2nLn;
 Tue, 06 Oct 2026 21:33:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org>,  Mahammed
 Sadik Shaik <s-sadik@ti.com>,  Arnout Vandecappelle <arnout@mind.be>,
 thomas.petazzoni@bootlin.com,  Bajjuri Praneeth <praneeth@ti.com>,
 Prudhvi <prudhvi@ti.com>
In-Reply-To: <20261006191938.185109-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Tue, 6 Oct 2026 21:19:38 +0200")
References: <87h5j1la4v.fsf@dell.be.48ers.dk>
 <20261006191938.185109-1-thomas.perale@mind.be>
Date: Tue, 06 Oct 2026 21:33:22 +0200
Message-ID: <87v77e1v5p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH][RFC]utils/generate-spdx3: add script to
 generate SPDX 3.0.1 SBOM
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > Hello Peter,
 > In reply of:
 >> >>>>> "Mahammed" == Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org> writes:
 >> 
 >> > There is a growing need to generate software bill of materials (SBOM) from
 >> > buildroot configurations. Right now there is CycloneDX which is optimized for
 >> > application security and Vulnerabity. while SPDX is designed for legal
 >> > complainces, copyrights, and deep license analysis.
 >> > SPDX 3.0 is a ground-up redesign of the SPDX specification. All elements
 >> > (packages, relationships, annotations, licenses) are first-class Elements
 >> > with their own spdxId URI and creationInfo, serialized as a flat @graph
 >> > array in JSON-LD format. This format allows the generated SBOM to be used
 >> > with modern SPDX 3.0 visualization tools, such as https://tools.spdx.org/app/spdx3_viz/.
 >> > This patch introduces a Python script that converts the JSON output of the
 >> > show-info Makefile target to an SPDX 3.0.1 JSON-LD SBOM.
 >> 
 >> Are there no off-the-shelf cyclonedx to SPDX converters that could be
 >> used on the output of utils/generate-cyclonedx instead of us having to
 >> maintain 2 different scripts?

 > From my experience the conversion won't work very well [1]. Having two seperate
 > scripts is the best way to go I think.

 > [1] https://github.com/CycloneDX/cyclonedx-cli#spdx-format

OK. What is the concrete impact of this "potential" loss of
information? E.G. how does SPDX generated with this proposed script for
a typical project versus one generated by generate-cyclonedx and then
converted by cyclonedx-cli? It is a bit annoying (and potentially
confusing for users) to have to maintain two different scripts.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

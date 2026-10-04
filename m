Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C417CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66DBA6063E;
	Sun,  4 Oct 2026 16:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMImSyxI1R1t; Sun,  4 Oct 2026 16:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3512A6065C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130238;
	b=b6EXbfx0F5S4dJwree+lIi7LpLqomNbfQfCYSnzDEn+LAwg4vJ4rshsQo8SpG6VzqN4x
	 nZZcw4zOZfbTDm4g2pROYKMsggRT/VjJIbSBtWGCaQw151Upys8a8/sMvsCnsX5J5dtLg
	 9LKf4eHfNhFdr8Dya6r3bQyW5kGqjzasuYWEnJZS6u8PnwuqlsK0g5HKP3zqjO3DKYDx5
	 H2S/IO0ue+8RkyKYR+MmMfRZ6M5bR2j4wbGIe6gNf9LqiMxZEQ+u4qlzQ9Rrpzw8rw37l
	 GJIpx0TAlgBNeithrRPzRM45uTKekr+MmdGS0GLpgCgCzDxtE/SIf2WrW5l3qDSz/yA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U0Vmqv7NRscLn0J7mUO1Ja0XhU0diEs811qkAIRoopM=;
	b=SvCTS8TCMZx10+JCR0fz/fmg8GJgftXZbozVQWrRVjAwFVlkNWZh3OMDAo5zSHBZMJSR
	 e3pkIk7Yu83ziIiA0LnBO9c/lQ8rnLbNb0skTWr7ZqiM1zNiRTb4SNG1VUgUK7Y6la2rY
	 ovp/u6M1a5Jmvp3IfDNwK+JuNAdt8lkVQx7Q/2wx7WuYcKWvGAmRjps/+CojLugyD5ggz
	 fOVVahVmKk6v98ic5CIvW4qb0MaxCEKOQNykAmqEQZ4hbtjzp9+KN2mMrgT5QNe4FdHj7
	 IheU/tg8SBZbjFiems6VfMt4lu0gEW4xUrAhD+GasvBvjylEXNF8oZEnD/foR5MWOpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130238;
	bh=U0Vmqv7NRscLn0J7mUO1Ja0XhU0diEs811qkAIRoopM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tIXFPLZom/+ERgd5Kjb6Nlu1NVwXtePJpA6mw+HCmu7fcAhCtTxTkI4apvi6OyFf2
	 KlIx8E6Zeg0afo7VWSM5O8DrnzUzYyaBUK5J5wQtVrMkdyrssEn+C0hyenwX7Z9vzc
	 7n07N0IVUVSRiJ3+gmHY3knOBbEGlTdO2IttB9qCbJRDmyGRP9PT5CVTZfBLN2qJMA
	 xxq+BCsYHVHDt1Mpri9kQ0P3B1jV8qgaMKDf/RGgGx3l/dWWjgBrBEDnzo+HOxNyQa
	 zDpSv5Ah4bOkCUY+4y055zn7H7jxfGj9J0IRGTKQjOXNcO3/KtbqtDh8jHQWeXguid
	 DtiuWw6ZrgRuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3512A6065C;
	Sun,  4 Oct 2026 16:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2CC12E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A36406C3
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Egwda__erJBJ for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:10:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 327D5406AE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130234;
 b=WUseBHKOiQ2hVDEC4K/docSMCXHSy7+DK/DfWgk5Bv17M/7r16GsSvaTI/HHum21xrW/
 QivevhtMDYzwlRfWn+AaKMb2SdHyjRdNnN23HjauPI6Mg2UQ7cUxryNDN70uD6FexlgVB
 +mpjw1NAME4C25U6nNTNOpVua4PttkpZEgMPfTAq79G2TVz1FULESZrLds7Oscq+VE8HZ
 EoDaxl4/eDRHqnm8i4eUNUmRmSE+RsY/dwcjxJHe7fzh+ZMIlp6kmc1s34dvtWgBN1We1
 mIdJjNKR6qbE/OxJSs636vC4F0ggoHQH2R/ECMe/4pup0ibGESua/SaDKsD8vL5200Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130234;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=z/5E93jhEgKtyO8M7oWMPgg3dmxwchN5mxDOYxhFPD0=;
 b=nIJNMTshBNL40/PnIHMC4zsdUKLVCWu1PqCVf5281oM12W/C4Pnr6F81isJdAgRGGNjD
 PJhThojP3oY2bKwPgaZ3zQlMnXHLqJ8QGsSx7ryRtXHiQORZkYX9WD6tyYNvMNKHcnUip
 Rc2CxY1x0r8Sx9x+iIVqkLQaoG2XaH4JFI5cM1XPcqNZO4WmK0QIPNMA2xKLcDhoLpm9f
 zfzXy00j0XEe12pRPJr4GzVtmcK3jmFydrxbgxF2DBn/AgiyNCLprsKLzgTCmPWoZKhtD
 ud2fuVekfKShzmNVQR0eQXkhZ2SoQmdN7VbpcqlNYCt8lBa+0zaalN4Pvirsh2FSBRA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=KW4IxXu4; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KW4IxXu4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 327D5406AE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:10:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KW4IxXu4Wl9tndlykLsYvK2RQy6uu8mUy79RSvKzuHKAWAsPJpAhdHeRcm5UZaE6FPFZfr0Cz5i3yR6Hu4REebGv65ELFEIhQLzBgsvpyL8lV5FDUVDnGIpeticpydWSXugdFkQM+Xyuk0xC1eQpilESMcyryg2gf7DIh3NoGNoHuV1yKt/+cFDLy36j67B5ZKVik5UFIvnEcW1VQUUi1XEiOnLKcimy+IQa7Y9XL+JQfUcG0Xj+P1Uk49j/pEb611DjQWEjFIyAGVqDzbjg7j2tbNeGk2OuktNjVRVqq3c4i4+42tszsxCLrGKp/l581GHchaVHeaSe0fxb9+vA7g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ICwErIoRGSTxBL3DQkyT6QXcjz4aqsA+GXjK3B0DcRs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1522954865; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 04 Oct 2026 16:10:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xDOnA-0000000Cg1w-2qla;
 Sun, 04 Oct 2026 18:10:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org>
Cc: Mahammed Sadik Shaik <s-sadik@ti.com>,  Thomas Perale
 <thomas.perale@mind.be>,  Arnout Vandecappelle <arnout@mind.be>,
 <thomas.petazzoni@bootlin.com>,  Bajjuri Praneeth <praneeth@ti.com>,
 Prudhvi <prudhvi@ti.com>
In-Reply-To: <20260923105122.659234-1-s-sadik@ti.com> (Mahammed Sadik Shaik
 via buildroot's message of "Wed, 23 Sep 2026 16:21:23 +0530")
References: <20260923105122.659234-1-s-sadik@ti.com>
Date: Sun, 04 Oct 2026 18:10:24 +0200
Message-ID: <87h5j1la4v.fsf@dell.be.48ers.dk>
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

>>>>> "Mahammed" == Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org> writes:

 > There is a growing need to generate software bill of materials (SBOM) from
 > buildroot configurations. Right now there is CycloneDX which is optimized for
 > application security and Vulnerabity. while SPDX is designed for legal
 > complainces, copyrights, and deep license analysis.
 > SPDX 3.0 is a ground-up redesign of the SPDX specification. All elements
 > (packages, relationships, annotations, licenses) are first-class Elements
 > with their own spdxId URI and creationInfo, serialized as a flat @graph
 > array in JSON-LD format. This format allows the generated SBOM to be used
 > with modern SPDX 3.0 visualization tools, such as https://tools.spdx.org/app/spdx3_viz/.
 > This patch introduces a Python script that converts the JSON output of the
 > show-info Makefile target to an SPDX 3.0.1 JSON-LD SBOM.

Are there no off-the-shelf cyclonedx to SPDX converters that could be
used on the output of utils/generate-cyclonedx instead of us having to
maintain 2 different scripts?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

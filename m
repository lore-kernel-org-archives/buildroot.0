Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E11E92710
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7705060670;
	Sat, 27 Dec 2025 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWSQiOEVDqwQ; Sat, 27 Dec 2025 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A00B7606C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766869072;
	bh=ptQyOwxAsgmEDYRM12Lq/G8cNRgg2eOVMoSgSA7DylU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hVJYnNsBZnUyu5JJ16OV0y+dsI+b1I08VYVxn8PGxAYU+I88tsfU84pYMI+OeSw8u
	 7Y9zZeaT13Z1rXRafEDBB8hOep/0IrpTl5uWQdRaaVIjmUy4Wil570N46TYRpIC0a+
	 k8L0BF4N7xE0uwJi26gbzpEaP1t5jq/zvxRT0ghQrLdLw7UbHCe4ZUuZcTpqr5afd4
	 1nFoQ4FdlTTnxug89seLsbtgdbLaeFgSBCvsaWJwdjqQht5Z/LZ5uxIm1T/uCoYeJn
	 m2qb1k7uw8AwLGueB8xsENFMaApe34MY7w+ToZkHc86O5Iclqihb+590rfCN1pMcVp
	 4MZ9rHRn1oDDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A00B7606C7;
	Sat, 27 Dec 2025 20:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE035D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBCE2405D5
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkRuk07NgOmL for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 20:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16CDB405C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16CDB405C9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16CDB405C9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:57:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3D83D4E41E1E;
 Sat, 27 Dec 2025 20:57:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1590160725;
 Sat, 27 Dec 2025 20:57:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB55F11978A62; Sat, 27 Dec 2025 21:57:45 +0100 (CET)
Date: Sat, 27 Dec 2025 21:57:44 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <20251227215744.79d17b9b@windsurf>
In-Reply-To: <20251124140517.2833351-2-buildroot@bubu1.eu>
References: <20251124140517.2833351-1-buildroot@bubu1.eu>
 <20251124140517.2833351-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766869066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=t4o06Gx2aSw5Spx3G1MFtaKMm5L8NbqS3OU8DPWckqM=;
 b=KcjGFzshUy6DpQOuqHAzNhK3p5a0gMYXbE4RGEyWewXC2CG9IlOR+lTgIevigELqCWR4uJ
 u5ZlHPFOFj3DtcHDMgNFDb0xEoFFD+oFEGnIseCmVVTJwuapXynG3kEkl9YrhumxI6DSrB
 O7rt1idJNHDEiuVjUcu7kM3WdRgSb9RRvx1qlPTnVrpqXAH+M8S4aPQdzP9qeM8HippbPp
 WQIXui2jW18Lh9BGMDVWn3DnHweVlzHe57IoxvEbZd0n5FUaZaZl778wTbohkr0FSTGBgL
 EXC84YA7Fu7uXmL/r3jXTo6zf3YaWpmitsLt/Uby1Vb45fFCecNlnaDINc/DmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KcjGFzsh
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: python-varlink: new
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

On Mon, 24 Nov 2025 15:05:16 +0100
Marcus Hoffmann <buildroot@bubu1.eu> wrote:

> Add new runtime test for python-varlink. Add this in a subdirectory, so
> the separate example interface file (which should be named in reverse
> DNS notation) does not sit loosly in the general package test dir.

I changed this to not have the test in a subdir. I kept the interface
file and sample script in a subdir, but not the test itself.

The reason: consistency with other tests, that have the same
organization, the test is in support/testing/tests/packages/, and there
is a subdir for the artifacts that are needed for the test to run.

Applied with this small change. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

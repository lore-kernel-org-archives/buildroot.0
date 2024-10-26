Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB24D10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 10:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7043401E2;
	Sat, 26 Oct 2024 10:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hn-pVMUq0pyj; Sat, 26 Oct 2024 10:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E547401D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E547401D8;
	Sat, 26 Oct 2024 10:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C833D5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B763F80AA8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_qWaqSn6oYO for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 10:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E5E680A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E5E680A93
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E5E680A93
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:21:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B14A2C0003;
 Sat, 26 Oct 2024 10:21:22 +0000 (UTC)
Date: Sat, 26 Oct 2024 12:21:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241026122121.5640d01d@windsurf>
In-Reply-To: <20241025165529.3523312-1-james.hilliard1@gmail.com>
References: <20241025165529.3523312-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729938083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0YXwy6iolZx9PwcVoI7tkBo5pCSzPstEsGK9xgn420=;
 b=XXHIiRmFKW+RYrKxKeVf5cJXHFF0WF1J0YC57cpnAvDVzg6A0eRzx1gfGyCIr8YTdZjvku
 QlygbL4w40nWIJcn86+ipK11nq03CcZoCDCI+KaLVl/60yDxyULqeor8ret4lj68ZVsGh6
 G4UCjMiIQrO96JPxhdJf8Hy4S5DbkpyCJAwqvEQGEbiduFh76bSKwne/OHnMq47R5LDQM2
 /kYlcv5I/sZYXpfrzNOEKT0xlON7C3JKGX8Az+hCyDW1pvZNKvurv8SqtvZaHHdnpDIXvu
 mOq3nbFyjF9NCOYYRa7MKwrRQcFvVI2v9W0TKQJY4axTWQMvHPNZ0eg/MBDAsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XXHIiRmF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.6.2.post1
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

On Fri, 25 Oct 2024 10:55:29 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-anyio/python-anyio.hash | 4 ++--
>  package/python-anyio/python-anyio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, as well as all your other Python patches in this sequence, up
to python-grpcio-reflection.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

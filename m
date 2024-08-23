Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C7C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB9A81349;
	Fri, 23 Aug 2024 17:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKOfd3ocd3cM; Fri, 23 Aug 2024 17:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B50FB81234
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B50FB81234;
	Fri, 23 Aug 2024 17:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B57D1BF3F3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63921810E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BorAPyqqiB8t for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4776281456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4776281456
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4776281456
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:35:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4CEF60004;
 Fri, 23 Aug 2024 17:35:54 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:35:54 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240823193554.6dd75172@windsurf>
In-Reply-To: <20240822095953.524686-1-buildroot@bubu1.eu>
References: <20240822095953.524686-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPTsrCYsV4BCTNfmEAL8fkPrY14sD8hJqQ4M0uLW5RE=;
 b=pq0SSQORczYmSU7jwETl2vpgRDrsRPK9z0ssR7xacPLg6jQTrkxkYBcZTT9nCu2EMlY4x6
 3KT8lBb8sexAWB2T9TKzAJJ2cIHwyaZdQwk4ulDEjoIOF/0Wwt8rTd55jyxPJaSutJTNgv
 hM0EQSPawjhJY2vikxZGsV1m26qXFZtfrslVXY+diloMAfkxIrqoHVFL6pPV+HkdS5Pnih
 r8v5GrBOeThThLrKykmXuDg8T6omNwdOW5DUrZ86pFHW4u0HdsXeP/e48vMwacpluCS3+C
 6N+fygLQNYPsOliRSFAbG2t1Q9rA4KbePIC4VvkqG53lRDwYCDmugSoL1EYD6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pq0SSQOR
Subject: Re: [Buildroot] [PATCH 1/2] package/python-can: bump to 4.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 11:59:52 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> The tarball name prefix changed from python-can to python_can.
> 
> Changelog:
> * https://github.com/hardbyte/python-can/blob/main/CHANGELOG.md#version-442
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-can/python-can.hash | 4 ++--
>  package/python-can/python-can.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B541CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E839480B1E;
	Mon, 10 Nov 2025 19:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGOCzUshyBsv; Mon, 10 Nov 2025 19:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2619080B07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2619080B07;
	Mon, 10 Nov 2025 19:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B3DAFA
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E64B180B07
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrQrIH3rjNy6 for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E15B280AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E15B280AFB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E15B280AFB
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B795613F861;
 Mon, 10 Nov 2025 20:10:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:10:02 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:10:02 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251110082303.413036-1-nemaakhilesh@gmail.com>
References: <20251110082303.413036-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <98a93f0fcca16e5a09858b846181981d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801805;
 bh=8IPrsC4O+zavyWCnfslfeEZCA34K9c656SdBOsQ492c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PS89qNEHHSMSGOjhyushN0cgu/5B95ESp66xC94X5ytSWaE48I7b6GD7CTAau98nd
 eQEWtYj3A3TlHgGsA/km84+xVfFFcOYWj9xxUPSX49k+X5ELWgWE65myKYi6mFeWj1
 0Z1Vm9FjEfN6GbVJ1RMPlwl80nmS5PYYWJUEEa2MR0QUzGzRJJyz7Ax+SiYuF0j7uC
 bq94r4JEwtNQrBDJig57EQ99d8aFYHMGAwalqwb70ymrAYNbhpVk5rSiEddOjZHAf0
 egzMaiLMoH/87asPTdMlYYg9RbkHFLXl47VlhnXj3XT9BOEMX3eQFnbmwj9HY0NRQP
 wxDU1ySunSMiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PS89qNEH
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.32
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/11/2025 09:23, Akhilesh Nema wrote:
> Release notes:
> https://marlam.de/msmtp/news/msmtp-1-8-32/
> https://marlam.de/msmtp/news/msmtp-1-8-31/
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

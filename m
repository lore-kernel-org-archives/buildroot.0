Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E3EF364B1
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C44F4410E0;
	Thu,  9 Apr 2026 20:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gP8UJ21v1IQ0; Thu,  9 Apr 2026 20:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6088F406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775765154;
	bh=MLIpSIRZimfAv2+3mDcYh1SbviNocCHkCYXkLC9T2+A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=riSK6nhI+EPU6oBF3bpHSgmiyUYFp0WQhckViGrIaxv4zYscKhnD26BpNUszhlu7h
	 DQjbEUTtR34LgxB3eYNJ85lZVD3UbB5E9pawyoBQW1fezVfMZkGXpsYIdkgaoiGJlz
	 2JJTO6gU3cMV43/8CZaZ4vZgRuuSiw3JCHRs2wq+ZKDEL/Q45QSWOmu+71Xw2rwfBm
	 ltAEQWmCds+6ETyNaLLRA7heTsoFyzPNeZZQEoLMVjMhIFSe32G+V6IzYo0t5MS9Ay
	 KQIHVQ/gM71ct1gpEr8Wt7hH7uh1Nj7N9Mh8SiauDgLTppauzwsdwGSBAoo5RK7wUR
	 5TZS3RNKRH7/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6088F406FA;
	Thu,  9 Apr 2026 20:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7620194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B96E3404A8
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szkJdmYJQ8Zf for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:05:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B4B6401B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B4B6401B0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B4B6401B0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0A3A719F574;
 Thu,  9 Apr 2026 22:05:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 22:05:48 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 22:05:48 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260409174204.3949789-1-dario.binacchi@amarulasolutions.com>
References: <20260409174204.3949789-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <9a43afa8cf7257738f4913b841c285c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775765151;
 bh=LGib7KxByxGgKJ51X2D8oTvV67RYC+UKKF2Zt42fAMM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FWPECNah/RdgRaUlEa6hanQ9F7C7E0zzU3YIY3SrhXP2usImnFNv2j8qxX7uVrVWh
 5oSWV+/9Bc8kqEjBM/7roF+Ow5YzcaeD1coNoxuu7xHJ01YkLm3LhXKArJpIyPJIIq
 LEArmqWvzOBmqp61XLE7+4bTKUPLf33QuEAIaJ4L3qt463yTAFUyYPAgzX3hNoUKMx
 dabo2TSmT48YOMuFsxIYKJGw9bs9H19d+Jg7XrdpUBvOWTOrA+lgl48OdwX+mC4yKy
 QVMp4WiB5C0QHxxH9eROkp2bIrADJmtuQwyaCemQtjbItYI5zkRgIJfuFj2audFZwz
 nSnSogWX7r7OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FWPECNah
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux
 to 5.15.202 and U-Boot to 2026.04
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

On 09/04/2026 19:42, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.202 and U-Boot to
> version 2026.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

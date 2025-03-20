Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B1BC28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D843382075;
	Thu, 20 Mar 2025 22:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WZBt1lZmt3M; Thu, 20 Mar 2025 22:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E2C81EB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E2C81EB5;
	Thu, 20 Mar 2025 22:20:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BA531A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E65CC400C6
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKaq-HN_5vsM for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:20:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BC9040477
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC9040477
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BC9040477
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:20:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5C0A119F593;
 Thu, 20 Mar 2025 23:20:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:20:52 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:20:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317223429.3068047-1-james.hilliard1@gmail.com>
References: <20250317223429.3068047-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ed7e3aaa525e018f3165214739a693ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509253;
 bh=kBFKkEZ3GIDjocry1VIlD/x58N2L67WyWPOQHOIBO+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GJwaaXMn03Nfcn0WsnucKpKMJrH554ZZnakz8bJ7t43MIk6JbqbQJ7BIZBKO2Pc0E
 KNV7QetSMJA/eHN3nEMex2IsIpHzvxZKsXxTcgCaRFF4fE6FqPqP5wWP5Embot1i5s
 3QfK6VWEli1Iqa3RvEFmokL9G0pA1Z/NY+Gx0g7QTuQPBSp30QHPzMzglnK+rPx2WW
 7WQg1ZQgi7n9WpUFHe7X+oAOmnsBX887CF/iGugH+94HIRccc+rdtbcLa+Z+2Er3Wp
 GPgCy0zceOeDZCWMP0kcNpWk6sR7Ngf4dF8Q24s4zDHs47yyd4sKVTeNwRHVUAd55P
 nnO8RU93wGeVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GJwaaXMn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 76.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/03/2025 23:34, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

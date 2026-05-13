Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3E0CD37AC
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D2160643;
	Wed, 13 May 2026 19:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oA_KGYAuJS-C; Wed, 13 May 2026 19:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC9D760644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778699316;
	bh=7GUeHayq8ItXXfOsR5tXfaEWeHecQ25tTf6FcMhdqwY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vc0RTKCY5rDxtZ46Eq1lC1f08f7736h1SUDDmqxcKQeTdihDshaPR1DhTR1Ezdv08
	 QFVr9VbpTKjrYGNJTZdgTghaFFPmBY3GCfjjX9GWZZKP/6qQz2yuTH0hhwRh9soIv1
	 4y2zDBxTdBafZ2xIoLiq8T63tHspaSp7rTzdDQyfqBGhon8AHuW61z+hiqbFSL4DSq
	 TKL1jDanaBUUrtYlVE/4/khFphlCrCgpOsnj4iOyd10e1x9Spc2KxmW9pDeT761pCY
	 3bHtfoh8b4wfoC0ODTI+Q/RrdNnJO1oRzdDnqiVvtmgseEzhAMNciZucNf8iI+rCuN
	 qIslEi2Lv3Fpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9D760644;
	Wed, 13 May 2026 19:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1099E270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00B5A810D4
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RW4-qR2GW4zT for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0CD8810D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CD8810D1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0CD8810D1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:08:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CDD5013F8C6;
 Wed, 13 May 2026 21:08:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 May 2026 21:08:30 +0200
MIME-Version: 1.0
Date: Wed, 13 May 2026 21:08:30 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260513112857.433733-1-thomas.perale@mind.be>
References: <20260513112857.433733-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <9d406a06bc9bc169618339597bbed515@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778699313;
 bh=P4YpVt7UlDcOi2abrM/yAR7TP96GpXWmJE+RjC4MXkE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=anynT06dUsPrOY3qdHiVVDcnYk2HfxaF3AIl7wcH0AwLCibWdZkcxXxGnultDuSnP
 jzqSzl5ZFg9+/ijjMPABDRSkl/ZoLtRQnpMhFWy56J+yzlkhMiA1YSiilBotG6cvUF
 DGUGh+QkGvEi5tDnzGGv9peYGb6Qj2mHtcYbppP8N9onDG9DbMrBSujcHt30n1t5/G
 okfUlQ1RlvcLtMs1/SXCthW/UnkN4bBYkt9thn2UukHlFG7e2PJQ1JnVj16urUbG3O
 Wq67YmPf9qqOdjn6SZ3/ocIBQCgsik9qZ53LKtG/vUjCaMCAas6S+UeYflj4vhWzdp
 elS+f08TVXcbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=anynT06d
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: add CPE ID
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

On 13/05/2026 13:28, Thomas Perale via buildroot wrote:
> The "cpe:2.3:a:agronholm:cbor2:*:*:*:*:*:python:*:*" is a valid CPE
> [1][2] for this package.
> 
> [1] 
> https://nvd.nist.gov/products/cpe/detail/C9CB66BA-6D92-430D-B3A8-D20C43E0655C
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-26209
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

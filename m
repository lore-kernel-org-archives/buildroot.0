Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5102CCD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 16:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11608412D1;
	Sat,  2 May 2026 16:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkbtp7dEUGUm; Sat,  2 May 2026 16:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48165412C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777741019;
	bh=e5vXDH09xOmW6pOLMXN6u1FjgTAPVHzUPgQ1QsslYrs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QZu6ibhp8FyyRAQV7X3kbcUpzP4Ljw05+bna9f59/C6Q4wTA9QhC94UgnDNpOGadQ
	 wttHdc7bGvrkqeXygDnpwkxDcuU/jt73jWu8to4MM7+N8unNG5Qo/jUKo+yyZat5nA
	 yvDHQARBVihjeoU8AT9VsdTQ4wNMt12Vc/1CU8J39pbHVwAZI87YaqjH7vl6OeBFuo
	 B/HLHrxtqBAwOy8quOkAjtb2lU4nASyM8Xk+XTgaCvSKeuobwinQsSGIM2Yjqt5dIL
	 gxxlcNK57AwDuZ2fbVmy3K3DzzCfLgkVrNzO6pi+197izyxMNIrO4ZbrgEABV/7KoD
	 I4fh/TtQA1v6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48165412C9;
	Sat,  2 May 2026 16:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 295C6127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 16:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB1F412C9
 for <buildroot@buildroot.org>; Sat,  2 May 2026 16:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvHuXn03zo2y for <buildroot@buildroot.org>;
 Sat,  2 May 2026 16:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E80B5412C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80B5412C6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E80B5412C6
 for <buildroot@buildroot.org>; Sat,  2 May 2026 16:56:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5E9B15FFA3;
 Sat,  2 May 2026 18:56:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 18:56:53 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 18:56:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260502062713.703617-1-bernd@kuhls.net>
References: <20260502062713.703617-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7a0c15c58adc12ca7bd13571374d84d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777741014;
 bh=h/abZJNedZbKDKWLoR8soWq8JTuTITOrW4oN0mfaj3o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HOWE7n6HcQmWAjIUQ+aItV52C0pfH4md0QKyl7HiZcwK7xuPsrCO4/VePL6ZH8J52
 gNX6DMBp/yBNXxiOUPgKJVh/xeVe3jtucpsIABpkXQEvVJdAA3nL4rTp9QHidYX3s6
 OyJnJyeSJWLzu4N/aAZsN7Qs91MHNFqZKwYtVLPqjCYWy01CuotccuBf08dA/6ode/
 reLdtXPGjdz7PHVIsNeLC9eNMxURThKwgHKXuqprbrqjgGkiIhLG8av47xcEkiRYA4
 7gzNy0emvqG2/X2yGkezt4HTbJ6SSwsIq5p2sjQBnIwD/kF7+FLMbK7ARup4gtwwSO
 47Lf77Ev6eNVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HOWE7n6H
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.4
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

On 02/05/2026 08:27, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/blob/v2.7.4/Changes.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9B0CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397CA848B6;
	Wed,  3 Jun 2026 21:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5s_EHHEe-bw; Wed,  3 Jun 2026 21:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67977848B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780520598;
	bh=PGvvicMhzkXaaUw/LuKFspeVyU3+zvmLGHHEHBNXkrI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PbEUdnd0Y7K5BTWsGMP7kMfN6KsSbzq+jz4CP7srCKoFWTN6I7VmmDoFaWYFvr8Qe
	 MskwS2c9RlPKig+Pcf4RWxz0TRm6UW7RI7B68kuI38s7NhSXtxWXkAVefkzJrxEYCO
	 wsqxJs20I7xkaDdoCkO+84weX0TXhOmXwyXoMi7VS312EOC4ylGOz4rMU3foc/MLEc
	 wsrWyXoltjJmN1J9Vou7sNsJXfFJqNtNMBWlCHXxN8jscQsvScRxMig2PLCRqOHYU5
	 XfcdUK6/6xSmNuYTbRHOFmHPjaFGhP87Y7l869dsEwajWGrmOUjFbjFXv7E4tBydFa
	 oIuVVRhZGfABg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67977848B1;
	Wed,  3 Jun 2026 21:03:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DD122F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6398B848B1
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPH2zwtPb7JT for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60DA8848AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DA8848AC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60DA8848AC
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:03:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4E899B00548;
 Wed,  3 Jun 2026 23:03:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Jun 2026 23:03:13 +0200
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 23:03:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260603155343.3504802-1-bernd@kuhls.net>
References: <20260603155343.3504802-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <f96213f8edab1be939369c85fdbb7102@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780520594;
 bh=6vqgQp4PQTeUlWjmnKVI6UpoCtGZOqRSMj2m8qFCg6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gvv/rsegqs0HE/vYwOFTqlpFu2Wkd0g3+rRr7/er3EqVcxtBCaM2SJm1Krce/PaI5
 J2J+/CUQBzap+Qbsq8Jp963vPJ80wXSI3Az7y5H7CVRTcJLrUzBk9POw0jKwSt+dz+
 E5sir01WusNPKrbnzYThDz+zM4uYU7UAN0gEl9HFiECYnMLNpNXwJVe2sKi+FbnfuU
 YJke9f6vDgNuRdnkTRmkSeLpReNbadK7f9zfIWs9LC+Q2R+UBfk2S8IJ2hNSib8la1
 s+z4OD5+7PZNXclWXxdMmgHuoZF4EHhVjEcgVctBNfb2oYFNRyDWrb/llDtYf5qVBV
 nIMsc+fj7he1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gvv/rseg
Subject: Re: [Buildroot] [PATCH/next 1/1] package/transmission: bump version
 to 4.1.2
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

On 03/06/2026 17:53, Bernd Kuhls wrote:
> https://github.com/transmission/transmission/releases/tag/4.1.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

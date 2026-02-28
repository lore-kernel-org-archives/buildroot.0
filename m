Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910FFFEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9680C60B70;
	Sat, 28 Feb 2026 16:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSyA4C3yjZY6; Sat, 28 Feb 2026 16:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7F0560AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772294754;
	bh=e4/ZJbXjr64Ho7Rrz6oQEWXMYwJ4YUoTmnkPHBvJRh4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ruLL9SUj3mXID8LHQVu2aUS0PVVS2kfte2ct/7+austKci5/tpa/Psj9/JcwdwSDz
	 BibBt2vCGOl/nJcmZYURtviQMYKRwRrgrh7risSkg/yKKXDAHI9+cFsHU/weHIg4YA
	 5ODJy02Jyn9/b8rYUa+qKlsdTBO2KWooUpL0Nz1XZ31aWlTHl6BBTgHTycbBM5EHjt
	 lhFo0+jnE6Y95fI192mNOTVTNUSWlhlfecp6QpauBtEib/+bycNz5TBMjDFrRHrydm
	 urpTx5x5QaDOaEmv9/FzzeU5O+Cia2fCt1sAt8lwONEF+SX09r/poTpamypl42fgq6
	 8UV4zg4Ys3ybQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F0560AC2;
	Sat, 28 Feb 2026 16:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E6D1D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E307C417CE
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA31aAyqgxC2 for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A1CB417FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1CB417FF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A1CB417FF
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:05:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3EA61780395;
 Sat, 28 Feb 2026 17:05:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 17:05:49 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 17:05:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226202334.2275873-1-bernd@kuhls.net>
References: <20260226202334.2275873-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <c9b2fe0d876276cf8c32dd65873db2cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772294750;
 bh=8escL9Qtt/7R5G4yxovp/4OoywXjZG+pzxQM2NV/Cts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jsf8tbj60gQ5sfn0x2UV4zA8hMAIoUMwlqHt1sQwTGEpJaJy8H4lRLvKYn7rrvFF9
 VpOvJ5I11zSKanUJlNRkegUuQcmamaf4HPP1plnn7dBD7aPAbecildKo/D44POxCcM
 jLWmoqT9uFlV56myJ/yZaz2DlrEGtkjJ33T2iTtg0dfqLfa/WSn2dcMW36kG/yDkaz
 qKD2e+jXrgInRHnivtSRcokdtTlYIZu0rFuVqQLg0Uh1ms9df3pW3aohJv2xgyBauh
 44ouVLOwj4Xrurr//PNRGGzoE4Jhl5i1Pp+h2ElJnhrdcMfOgJPbQPFGnKv1opSckH
 +n/NNpQOjWK2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jsf8tbj6
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libbytesize: bump version
 to 2.12
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

On 26/02/2026 21:23, Bernd Kuhls wrote:
> https://github.com/storaged-project/libbytesize/blob/2.12/NEWS.rst
> 
> Added tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

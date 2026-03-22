Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C3FC72C2
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 12:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6EB58418A;
	Sun, 22 Mar 2026 12:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gio4ntDUsh9j; Sun, 22 Mar 2026 12:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C856C83B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774180874;
	bh=jYDRvkGYQcOuqKYuso3qlZHm5o81basBObfCtdU8UFE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m2LMSkFNMVnfz767XqBKm8PDhXBOQtwC3H5Wpb4P4gZTeMhM5JUHXL+iHks7Pz0TW
	 PmVU9nAl53bRF9vWSTPV2jjV1rsDXw03h6fyO/9wK+P8waLeT1RZv5DYWl+7QJFF4C
	 vroxTOQGlsI/iUJNHUB3UHiyhIK5TELwDe7JcwSBAjW90xhbXmXZFJvsF8jjKWS/aL
	 JaeSQ9uvLDq+cuv9/aIME+fNwPK/OTrOp4oIQQb1BuO6gkOx/6srj23yM15z1XH7sN
	 RWB0ivy/TRuyuSmiDattksntE1sFfct39H0BVdLm9ulrEFQvp57v0Jp8z0FqPKTZf7
	 X0uoOCsSHz7vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C856C83B7E;
	Sun, 22 Mar 2026 12:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D92B25C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 12:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B09960E69
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 12:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZlavKN8Kris for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 12:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D385B60B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D385B60B29
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D385B60B29
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 12:01:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A45BAB0051E;
 Sun, 22 Mar 2026 13:01:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 13:01:07 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 13:01:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Tzu-Jung Lee <roylee17@gmail.com>
In-Reply-To: <20260314165942.3057310-1-bernd@kuhls.net>
References: <20260314165942.3057310-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <758808cfb3c2281b17e4bc5865e996ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774180869;
 bh=19o1+GWrS0EIjHQgxbirI28pXLXLDrRQsPLEyCkDcQw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iAslB2nhf5k2lVNTRBZqc7AennpZyrt8bKLnnji+ewEj4tI6G4IqXQHh9ZiHO4UCK
 KgyMprcJoo+z8o5P7oV+Yk4EKQyrnDeAzoqOaRUrwNwSIPYK6EPFe+Y3ctTIJYKpjK
 p1uz7U3fp2MdaYqLTUecCuN6sFh9V8IDEYQF7kOb39OLett7vRnCzEpBAE48Or/9Iy
 WtceSeXjA6OcwmSFiy+pbQNU9/gDj3gzrfDc/3/sEHVyJ2K8xrTHEjCbhf6KS7wahH
 Korshh/vh03qirjl+6YjvBZSRQKrjuKZ828E0EP6OAOhSdFZ89fTWVpa9IBm1Bla1e
 DqDVXzz8vTxGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iAslB2nh
Subject: Re: [Buildroot] [PATCH 1/1] package/dropwatch: bump version to 1.5.5
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

On 14/03/2026 17:59, Bernd Kuhls wrote:
> https://github.com/nhorman/dropwatch/releases/tag/v1.5.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

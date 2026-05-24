Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D22CD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 11:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6534C60E65;
	Sun, 24 May 2026 11:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRnEvpOKOe6b; Sun, 24 May 2026 11:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2DF160E60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779622946;
	bh=xnkYTpuLD7iIBkRhIuBFDNpnK3UpQBeJMHX48iTAQW4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jGtu00u1nbE5NtstLAIt1F+lj6htxI+ohxXuINoLIVSrN7xXh77Mij9Hz2aiyb9ed
	 sZ6Ngu+wsccNWEjgLSyr3gKlwyBC7iGH53gQlIklHYKU6vbCF5wbWWcrEy8Ytdpw47
	 z9Ts9/aYkkBGCwzijN9zDGQesgyTH7K1LNZcusj7vZLoEeJdsra4P/9dDHcDmSBGN5
	 ldwAfEFXKc/HcBU9jSCzdqVnSvxmaruoGuFmcvJQx6Xz31yB5CfkpusmzFyg0VJpSe
	 7Ih8wWA380r7LYfQSKJ8O7d/WuASEEALwNR/Dq6uhRNqUkMMgzr2AaFBnkfY3GmZT0
	 VinZrsKb5lYvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2DF160E60;
	Sun, 24 May 2026 11:42:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC6B5263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE42F411E4
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVl71NMMLrN0 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 11:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2808411E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2808411E2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2808411E2
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:42:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E3FD013F8C0;
 Sun, 24 May 2026 13:42:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 13:42:19 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 13:42:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Knight <james.knight@collins.com>
In-Reply-To: <20260523082455.38881-1-bernd@kuhls.net>
References: <20260523082455.38881-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <abd7cbe7c4d2aae0a28b7415d63eac7f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779622942;
 bh=CJ0kITNeh/3PeAPjzMddxYEQIy35cY75Fpf5DbYH8nk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FNzKLEWDoGgPxW4wFC+GbFLyAUqsfL13/06ygxHICOZZqh0ARbAnnayBcF6Ndcxmz
 BVdUlokRurwclXW9IkZAbWwa4Uw6Eg8mG9jKmXoP/Bnh3fb/zz/WH8EPYvxNC+SeAg
 +EJUg1+JDDmY8NEt9VUDvC2d21Psnp8CvVNsSozB04wDDl9fYu5iNXIKy0SIxRDwMa
 brqaw6E2IxhiRN89hkUTFqBWahKAxW3HBrLb2PEUmmoz9p4zecJ0zrRjQjTF3pfmfH
 RPfbM2XoyLJyfm31+427Od6Wrbxf8NqJZi5s5QDabv+R6SXRb2+58UYg5yZclLrHbU
 xJWX9jZ7lpXVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FNzKLEWD
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libpqxx: bump version to
 7.10.7
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

On 23/05/2026 10:24, Bernd Kuhls wrote:
> https://github.com/jtv/libpqxx/blob/7.10.7/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C945F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3913B42C86;
	Tue, 14 Apr 2026 17:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggjbiW3uCWmy; Tue, 14 Apr 2026 17:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D572E42B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189181;
	bh=Zv/BqlbdAcs3abTe2sy1kXLWRKYi8ab1FeyBWO/ljg0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WeOJHZxH3xNspYt+NTJrGJipuCKA97+HPiPFlGfVzZ3tfqwegh/hRy8d0xig6VewT
	 +GokD8t/0CuURPzHz6+DE46/z+Cc/nBMUSKvGEMFebqRdK7lyef4/NKMkdOFtqeWJZ
	 PBppoqJnTSs/hip3yEvcWx/GBon2QrtTwlMtJ4cRa8lFgP/iq1uO0wIrmJdwhsUYGQ
	 XmN5appOQU8BLFV18wJrBkE9Ij8hcYOFUoe6WhuzqYdzELExcFIQZknGau/0gmz92p
	 Fg84OHuvP3pplQYEhW3Mog/GB+CF7RJ4nos3OMj4WZZjBIl1JYmC5Cp27mZbeb0hbq
	 NhKnNYffR6amw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D572E42B2C;
	Tue, 14 Apr 2026 17:53:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A76D2283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D98984DCA
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AU65fGyTObSX for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6AD884DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6AD884DBF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6AD884DBF
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:52:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0D839B00548;
 Tue, 14 Apr 2026 19:52:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 19:52:55 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 19:52:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260413082703.3553408-1-bernd@kuhls.net>
References: <20260413082703.3553408-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <c3351102a0d58db102426a09e5aa1718@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776189177;
 bh=kKoFiDerSw9PTFa/BwYgPgttlapcszewyKoEnVAZ3WU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WvcL6JlkjDcyB4PEjyEhfsv7kq/8RZgGFYTH6ylRLgAaViG2+7rBII+Qs3v0n/y7y
 P/Eoj4qqSfABJJyazPlALvdCMMsLT76gvoRQ/V5RqCSqH3BdQOGUm5zZvVqhw0W4/k
 xegh4asZyRVbjae1VGBvBGKVInQw6PbD8sADut/MS5JxV7D8LN6oUuXhJGkwsdUSMG
 6UT3zGjvG5VmNqBDGz7MTThbin11f69ZMbPvyvPu1xhplSNBv+Iz4t+ucjqfAl95tt
 x4Gi/HE50siX8OuItbpEsfRGEZA17QtMtVI7RtwWdv5zH8YLwtkTno3++Hc+BEEWU9
 jMUzVSmPAVsHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WvcL6Jlk
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.0
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

On 13/04/2026 10:27, Bernd Kuhls wrote:
> https://sqlite.org/releaselog/3_53_0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

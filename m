Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37592E6B25B
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 22:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F582809B1;
	Mon, 22 Dec 2025 22:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voNDIZP0JhyT; Mon, 22 Dec 2025 22:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A418080D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766441452;
	bh=/lg7fBV7TmRDa8J73FRWMG3WKv8/ESmjAEqsNtRqAxU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Li8ni4Axv4QxlFHEDlMUiPT3Xp5D+cWsuFUcgdJdw1RAlDqBmJE2j5ToJMoLFBM4q
	 8ePY9vmKsBPFpl3iNXHz6NXWFAWtBbaQ8GN6rs5q0btSNv5WWmSuduajdJ+ofLxcbZ
	 Lga/gg1YuqPn91ZYD4qlI9rXR0fuWSkm0nqf/1/4t49sUyzNjBw1WZiBMqC81XSd8G
	 9BpjwzFy6uSnfWlZfn+UdsRrBgxpUJNhmnkd7NkZ14IBFNVn9XnJRlSVtQj2Zzaws9
	 lg9r3Hr0LQmd+7T94n+7kFOYGmB0zoqn42GVF1+pfdSqrnwsKnQl8kAkJuYqkQnteq
	 p/LilDzoxSY9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A418080D;
	Mon, 22 Dec 2025 22:10:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9931D255
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B1728080D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugGwl0X5lk7M for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 22:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF996807BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF996807BB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF996807BB
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:10:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 557F813F879;
 Mon, 22 Dec 2025 23:10:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Dec 2025 23:10:47 +0100
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 23:10:47 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251222212842.2307235-1-giulio.benetti@benettiengineering.com>
References: <20251222212842.2307235-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <a87549ef849548be35f02b70cdef4f29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766441448;
 bh=+rzK22PGneoyqA4UPVJuirMLZo8LOSbKfEZBC7zQeaM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dW/zXaTaVxbtGBdtISVFm5GybPfbREfIQvYBAlw3oF2+7tzfafM1D2II2sowcbxdi
 9YDeua4tFhHIjwylLCUHJZU8sqTS6rSghY6dA9G+QL9KDXlR1LJIvSWePbPYRhlw/E
 TPiNNM9LdySdxbyjrbnwGnIcTVGTCcw8cpEdBvIgwZZwWaIer8+6TJCX0QXrgXjSUg
 FIoh26VLhv1aQtsF9yLX7VzR/gluf0cMagd/IglmMs/osJOrGgmR3ObUKDD2dSpfVD
 4D8+H/PLVW35uDCzDrVlplpiFnwTTmSH5zfmkIp0jOyQHKSRBjGiSmtM+cpR9ti2xz
 Ir5z+kPGYj0iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dW/zXaTa
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to libtirpc
 and rpcbind
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

On 22/12/2025 22:28, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

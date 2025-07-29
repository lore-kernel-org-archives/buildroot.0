Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE80AC83F17
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 00:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C00405BB;
	Tue, 29 Jul 2025 00:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iYE6MnFXQ5U; Tue, 29 Jul 2025 00:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF74441155
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF74441155;
	Tue, 29 Jul 2025 00:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50267DA
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 00:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35E4C4021D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 00:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5qILOAtFmGK for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 00:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C66040B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C66040B2F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C66040B2F
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 00:10:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C68F313F879;
 Tue, 29 Jul 2025 02:10:51 +0200 (CEST)
Received: from [192.214.236.6:52570] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 02:10:51 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 02:10:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250728191029.3903749-1-bernd@kuhls.net>
References: <20250728191029.3903749-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <bae852636a1d7cb327d7408bc50d02eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753747856;
 bh=eQLa3v6h2n39Rr+WxS1SPxeKHl6IuU/VqVBGxbJ21/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t047Q+mEq+UjNB9YkxZ0vQGDtCtSxQ1zZ8w5ppyO2kwaOwHYyiRnaQlbALdJIrKVP
 IawT0dqu/S+3Axt5tMLGE/51WjFBA/vlkH4N1uGwRbv9XXTWqNio2I/bte9ytbBT+L
 uKkLJuay1qN8V2BcpP1h9kqwlBtjsnkHwjs5qQxFXXH3l9hH7rGfdeThBhQi5mkNUw
 +gkn+Ws7lWVzW3zlv4owVSBUS0j79IhJ8DB8J20LOJptgBzRC2uV8dRGV449kK+xiC
 yTceLh7K4ak6DWKfcM5qKElQLw5XbuMF/O7PuNKaaKDm7/2tNv22Lngx1pDhR48JOQ
 AWjgvUDhYlfyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t047Q+mE
Subject: Re: [Buildroot] [PATCH 1/2] {toolchain,
 linux-headers}: add support for 6.16 headers
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

On 28/07/2025 21:10, Bernd Kuhls wrote:
> And add (and default to) 6.16 to linux-headers.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

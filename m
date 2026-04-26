Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C0EFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 18:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0012E405D3;
	Sun, 26 Apr 2026 18:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkwWj6yW83yB; Sun, 26 Apr 2026 18:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E466405B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777229117;
	bh=2B5Pv5PKdsLQU1YBOa3GO5kov1jt+EOOB+vzKlz3o+w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k9CJHf+Bj3rghsL4fzaD+7K7egx4IKvJzG5PLIATXxTE1XvY52xWl3YOClMWW6eTn
	 Co+dd5sjIowY1QBaMNLQ3KYlCyPCvhVYkBxYDCIHqnE07CMd+lcQLH7UrTxW1iAK/E
	 AqdbBK/JKZIozYNAnW9Hjd9uSeCoC/C9dcrkIoV/cdh5GCpUDcfrVVc5QggwMpfFZ4
	 8p+XJTCemvwnE6uAov9Cca6nV439n7uC+IQOFcLRq0ZV3C/NCS0TbGXK6BhQUHa7Gj
	 i0rEVYySmOVIQy/mEgy5GZBWhWGkD1v5CzxzqBXTasSInJ6YZYO6q+aYp2wlZeaFHc
	 A5V67VBrls/fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E466405B3;
	Sun, 26 Apr 2026 18:45:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6611B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD67C42344
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-60zguN3cK8 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 18:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF9934031D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9934031D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF9934031D
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:45:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B8ADC5FF95;
 Sun, 26 Apr 2026 20:45:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 20:45:10 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 20:45:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260426143818.1517033-1-bernd@kuhls.net>
References: <20260426143818.1517033-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9768089ba132f49407f6ad7fb7f1b189@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777229112;
 bh=MXkRWGt6VIs6LJWoV6PdUK9nZbZvbGo0ATpXvG4MVbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LdiDNk7HnTl68H5yZr5bn00sCnNg9hsDoxhrY+nvUfSwyh1OmKAw0dC6qtT5DV8En
 /zKRkXylpYwv5Li3ftmnlyOt3zbHqseCMvbiQ88Fh6PL9DkDRPQ52ZVmZPJQ7HCr8H
 b6aeBZYkzuO5Ubji18Wse17oFSuh695EDw5z63Nhni78Z1c0LJkLX+UYvQNtcx0Ov9
 yGJIqCXnJK85+kxWSxcavkW2d5QUK5piEs/OXzRGDSBwkRZmzKqqi2XIMQ4XcuWf1w
 DtTblwCY3yT+++CURPOPUXIynkn18lGQCdGpeiyDa/Ch5bKXwYzIXYhIZ0od5EkSbB
 qtV/5iIh91Qmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LdiDNk7H
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: bump version to 5.78
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

On 26/04/2026 16:38, Bernd Kuhls wrote:
> https://github.com/mtrojnar/stunnel/blob/stunnel-5.78/NEWS.md
> 
> Removed patch which is included in this commit:
> https://github.com/mtrojnar/stunnel/commit/1c06022093a4eb60aa1754fecbc68b37610d4b4d#diff-0134ab37004b3e923ee2e697976e032c32b114839ca0a697b01111d1381e8d08
> 
> Updated license hash due to copyright year bump:
> https://github.com/mtrojnar/stunnel/commit/4c8a77e374ae3326a52d2f90c1e5248079aee008
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Maybe we could update STUNNEL_SITE to use the primary
download URL https://www.stunnel.org/downloads rather than
using this usenix http mirror. What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

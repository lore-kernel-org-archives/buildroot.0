Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A971FC55174
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CADD80880;
	Sun,  2 Aug 2026 20:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kswuDvk9qIYO; Sun,  2 Aug 2026 20:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438168083F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702580;
	bh=WudW/bUoUz+2o4BbpSontyC8cdS+JWuDC6cyUkjmJqc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=clDgCYvZn096DlnUr+5tZfUlvf2//uW8dkA9JBW5TP1JEgxN7DksETevvEomNg1qD
	 ExxL3b0hQAitA61R7RVQ4FE7H40a32urc5lxsOUEiDsuQTdFlObTQVzMP1NwGROb4k
	 B/xWDBcerx7Z8RH2Ouk4Tmo0dJaw/Q/+EwwLSIVD62LVZcTR8S7WJznJmvXgYL5SPh
	 Too4lNdEayFfG0xzwl3naZcOyveDQ5S83XUJe/ct1gQJxqduwiUTr+J6WA8JNq1AOJ
	 tn5kSWGiY90iZx4p/mIsZUqGd4TSPl8d4ErDE4yvnd0/zRTfx/zd9ez7/uW1k85b7j
	 0/Cu54EjgV3VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 438168083F;
	Sun,  2 Aug 2026 20:29:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C105D3A6
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B27C88083F
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N6BUvXD5gfO for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B07B98083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B07B98083D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B07B98083D
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:29:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 82EB6B0054E;
 Sun,  2 Aug 2026 22:29:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 22:29:35 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 22:29:35 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260621165336.2426158-1-romain.naour@smile.fr>
References: <20260621165336.2426158-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <2befcd39d4be0600b3ad013a73371a3e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785702576;
 bh=3n8SG6lhhXZwVMGe5/aU/EcKtDnpDxxovoLuMO0EnCA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pj+xbrydJE5+Fa/LZIH6abvLmkMOCat+E8cmmCHo+sdTityq2pNNCO+JjGZYlHYSK
 eMnfgmrGkVAmJpAZJGhnAxKJyNH/VBoWicVqW0uTZDqtJIKzSOV2N/C3zQ7+iiGGOY
 ZIJd393T8YPjrvbqdmNYgYt/uW9VNtFiWsUm54op8IqXm7I4oBASjgmS86eEANybBd
 BYxxHCMs0HkXYblcm0NhIWAeiCkAeJMK/KTqlcPWD5/lUdjBcMZPtB9B5Tao8og9de
 CNDk6UHxj1jnov32g3wylka0ZSHk+qi/W7F4dhe38J4k/L5d76nrqJJcp5mdC0D1k8
 RzmkR7wjnJETw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Pj+xbryd
Subject: Re: [Buildroot] [PATCH] support/testing: TestUsbIp: wait for the
 keyboard be detected
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

On 21/06/2026 18:53, Romain Naour via buildroot wrote:
> Running TestUsbIp may fail when checking if two QEMU USB Keyboards are
> reported by lsusb. On fast host, the second QEMU USB keyboard may not
> aleady detected when lsusb is executed. So wait a bit, to let the new
> keyboard be detected.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

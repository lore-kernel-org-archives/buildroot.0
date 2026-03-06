Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752EDFCC05D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419A1613C2;
	Fri,  6 Mar 2026 19:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkBfYn7U8fAY; Fri,  6 Mar 2026 19:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309466119F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772824083;
	bh=1VA6KyFZYPKpedXVmqmw/heAw3R0LqezMV/v744ppIo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aKtyeiXIoIhes0Jlcbo8CWpm908q7je0Orva6NfnVW3R9cwH/DimV0JDNxQ5XkJCW
	 D0N4D8vMS5cmGQTh9PmJs73dTHkE8Qea7cNHn+M5MloC2co5JYdkhMVMCrw9Xwk7TM
	 MGBZwHb8pO0+pGqmUla0u0Pa2Z3btXStQSWQMJCsCTTVwRnhHDkSWMZy0fpVzVZGi3
	 HUCRlB2bT+SSYPj25bZ5YQKxEE58BWeHLDjyDyi98XORzT7V8BJX8l2e3t68GhpXpg
	 2ad1zy4YmH6eeGKusVZfxW3BOB1lvChUP/PbgRdTGNeWpnXIezQvLZNCm7iY5eGXiQ
	 xxZ3msLdYofnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309466119F;
	Fri,  6 Mar 2026 19:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F3B223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AFD941E2B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AQtQx3MGmfQ for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:08:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3BA041E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3BA041E24
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3BA041E24
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:08:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EB790B0054E;
 Fri,  6 Mar 2026 20:07:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 20:07:56 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 20:07:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304193452.3499452-1-bernd@kuhls.net>
References: <20260304193452.3499452-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <79bc4c1fc506aeffe663c4c4511bd69c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772824078;
 bh=2T0l6jokyAos6GLrlJ1kIGLITwUzl9Q7zmb+EJTeTmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PRikWPyF/uuse3LCaLF8+T1c9KCQHbXrPQ3sHEF3/Gc/0EMWog+IO8f1XTL2yXk5k
 6IS8Sj4PULjGaW1aBzil2+797b/Tn1wIvYK/aAqWs1VhopwrQbd9dEkI8ZtD4H9rvp
 mdRhoLGAcnpfMoId+UDh+AjlDtct59NyZsT/ghe6W/xgfxZ2F62xOxBKrBVXCUnZwB
 SC2zCob9S/kNy3y6LuVri9yE978VbBLlLK9ixznKHawiQ77VYK/Awg3YK4uFu3a5hr
 BZTuuqi5NQAhDMPk8/ESK1pYMZO/PXnHKzmc65KgKTiCoyjnnTfRlgskHmBTDn3tn0
 ID8sqUFXBm0VA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PRikWPyF
Subject: Re: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to
 7.360.0
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

On 04/03/2026 20:34, Bernd Kuhls wrote:
> https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.0
> 
> Removed patch 0003 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Appled to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

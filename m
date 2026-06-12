Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846ACCD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF0B83A05;
	Fri, 12 Jun 2026 16:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rz91Eq6et5Ao; Fri, 12 Jun 2026 16:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D9E83A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282222;
	bh=PjctyNXTF6N6w8JN6Yt118NG2YIlZddXHmNDKck2psc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I+Q836v3BeEhUYZ+dhYlVAvfdxFe2baMbEn/2FbfKCNBbsr+SYgR6uZmZluyFwTPv
	 lJeV2aXgrph29GUQX7a2qVmqCciVVZjesQsPjJ8t/j1bejp+t2HtTDgbWRIQrC7kF6
	 aez/aBI4FtrGQbmCLS1HMQjCKMBTd0JMW4aSentgMjFSNWP8oc3CkVjQMCBRGp3p4f
	 R91ow/cvOdWsc9Gm2/qLpo8fmuU5Dnz1iHbf9ZoB2Vo3Hv7PZVDatg9Y0XbPvGFsdW
	 0tNH3/myaNFoSq+TucgXRPbD2OVIqv54Xe4t2OlFd6/F4vnN6sNzH+dmIDvjNRS2zg
	 CeS1yCqdQPqZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D9E83A47;
	Fri, 12 Jun 2026 16:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C5BBF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1293B6108C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YN6yKMlCUwsL for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21B1F6107F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B1F6107F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21B1F6107F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:36:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D23DF2003AE;
 Fri, 12 Jun 2026 18:36:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:36:56 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:36:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260604174558.2140973-1-bernd@kuhls.net>
References: <20260604174558.2140973-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <d9d06ee1f449f8f0cd793aa86cf8935f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781282218;
 bh=u50Qq4MhQ0L6tBuTLGcU5g5/uFONUdzlzd0Ka8+NejM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=doYQyjG3sZDAwk39qalLGTnqFu+QND0SJbxsS65JvXOHRxp73NuhE3J8csJQvEeo3
 pI22V+i2Ej1YGZflzPFhZxK2oXKyJc5NsstlbkVqZLT9z1Q33G4hTCqT/539l4X68S
 GXyPwfN7wEJLedslVy6ld/VzCCSbXPgjngRqhmROo9HiLMiO0n9ImWUZ4drq0AHzHk
 QXpXqcV4zuTshq/uXz3V/HvgcLFcl4BVwFymq5eojZJhPXTKwCCNu968lWh5vXZ/s0
 7IIovAL6xoFdCDOra4mOSYh6X7YSvUZIfpSDULCO64lyaEnyvm/FI1AVusaFzUm6IQ
 /wZ/VBCZA75Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=doYQyjG3
Subject: Re: [Buildroot] [PATCH/next 1/1] package/dnsmasq: bump version to
 2.93
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

On 04/06/2026 19:45, Bernd Kuhls wrote:
> https://thekelleys.org.uk/dnsmasq/CHANGELOG
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

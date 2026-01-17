Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70396C98338
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C2F641620;
	Sat, 17 Jan 2026 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKZfFXpdXBuM; Sat, 17 Jan 2026 19:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC0741453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768679867;
	bh=SL0GJ4hEN7OPfHGIORRBZwPgBQwZhjDgvkAuIpqr7F4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hSIXGkae2Z7vhTHnViv/0rcSlFg5MIpiV5SFmf4p71Q+/GlzOx4/PDWK0X9KcmLaz
	 HAfjQB+b49Y3Rkzh/eo2jPZF+LtG+rznc3yp4e4+dS1vMeXEeBcX3K1NNjC+CwIS6H
	 JMK/6C2lvyuiNqFINcoGKBseeZ2OB0gfsMOocw6lbmuiHkVb+kGRnKW3LBqBXVuPjI
	 6OwPh9OHLADjPmqyVZ4vc0JgQwWV3NVfLOWL06aYZWS3A7hd3Ugm1m+qAa4hrzxTIB
	 44OJE9DBu/11fLkTt7b/gbTx/Ot439KuqmR+7oeHxV4wsbCw5WI1uL/83dTOKz2S44
	 mUL8llWIm/hAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC0741453;
	Sat, 17 Jan 2026 19:57:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A8B1347
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 19:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 052BA84606
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 19:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INdBEQWl8Kk3 for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 19:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 206EE845F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206EE845F7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206EE845F7
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 19:57:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0D2C513F899;
 Sat, 17 Jan 2026 20:57:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 Jan 2026 20:57:40 +0100
MIME-Version: 1.0
Date: Sat, 17 Jan 2026 20:57:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260117190656.3000294-1-bernd@kuhls.net>
References: <20260117190656.3000294-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <73ef7795b2f2f698f743e89f4815d618@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768679862;
 bh=PMQfKOU0uCIr1SlcLEMsf1CdgVIINLrfL9m+viyRODc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QQQGhx16gsZvX97+x0aEKxXnlGZ2D9ln5T1nW5qg/JvMeC1TZEkCd0sOfNw2cAB27
 lnc8T4CyLnBzRXMbq/ARaCy/VAL1meJGtC4aO27MqMxSIW4bLyHttq2dg58cM9cmBC
 uolQnwORCqd73XjLwD/2uRcNmJ5b8d+Vf5aPDXI7WV5JiTeF/4ZcN0nXJI5XeVbi9U
 KHMnjfD4TAhFUr80srwpxSVp7iL1VYCKXRnrn6bIQt0Z8BtvTOO+MgJSoAjwO2llSs
 3Iil02lY4EV5gqwxnDifv2f/9gLvh99ix3gzn6VJeE06xrrL1o/JEWoX9QkeVEPB42
 n1EOwgkclcU6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QQQGhx16
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12,
 18}.x series
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

On 17/01/2026 20:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

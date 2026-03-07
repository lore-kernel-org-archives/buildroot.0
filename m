Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6968CF55105
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF18983D2C;
	Sat,  7 Mar 2026 20:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXy-oV0pZ0Jm; Sat,  7 Mar 2026 20:13:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABDA83CC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772914380;
	bh=0u/O4wPv3a6mueZoacAgGAQOMU3D3XKyUp5lNKTh/dA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mp0D0owyF9gvjQCu4d5TsoHZUHxL94PyiwypoZM5nwcGFPECeFGXs0hSu+WJvlgMf
	 QhhDgxq4wkVvvNjFYXFWK9a2A4By+v/CBL0t2z7MQAUjyDy6C9ofnNCGPaA+eh4o17
	 bfWKYSPh6CZV+k3R/TIWJQPC2Agat0R0dacH2bJ5fyL22A2fdRotfXPZGBmLAM8/4l
	 8JPRBo3BFrSIV68N2O/Kebl+vPBrVU/ILLMg1R0IOU4qrgVRa3Oobfksj7O/1pBEtv
	 x/razy+75S27E/D+hKW9xqtGeNQs6BjMYsTp0HYjuCAXwxCGv1MPykurlbh1YlorvZ
	 sw9fFARAPzmZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ABDA83CC5;
	Sat,  7 Mar 2026 20:13:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86BC1158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 786D383CC5
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_mHyQffa5c2 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 991D983C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 991D983C92
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 991D983C92
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:12:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AADEC19F57E;
 Sat,  7 Mar 2026 21:12:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 21:12:52 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 21:12:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pieter De Gendt <pieter.degendt@gmail.com>
In-Reply-To: <20260307190851.853162-1-bernd@kuhls.net>
References: <20260307190851.853162-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <00db81c707ad218b21ed75ec1b4e9395@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772914374;
 bh=r7DFTmc8Eh8h8PWQxm7BpPq1JMmqFt0NDkeDcJeyMH0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RxvgR44bzMW4B5Q8yQfoWimipVAdgWpYbVnbPSbQ36pogqvv9Xro0CFWVQa0cQ8K0
 aC9wRu5Ww0CA7bDGI31tsL4PoIYwwIhX8vm3kWmG+weYAaIi8ZA51ZI310xuYKv2ia
 mXnmLqlVsOYjSK10wMchSFj0ZD6XHjtHfs5pPdvRvw+aqUym4HMzy0tvNhqjg2NT+N
 C0zDDEVRglcVNJePmYIRF5PNBk8hyROOfsUxb30LpnZ7sCZdgEk6qmCkhXPauQIUu2
 81O/GWIwnNgzO+fJXgV9hZKaf6BDw4CNlwq+K6gS2llnEmIaLGuPqd2DlItY871kHo
 90wEtyT/0ZLDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RxvgR44b
Subject: Re: [Buildroot] [PATCH 1/2] package/libvips: fix static build
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

On 07/03/2026 20:08, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

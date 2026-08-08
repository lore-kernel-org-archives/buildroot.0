Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A9C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 09:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7411460699;
	Sat,  8 Aug 2026 09:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90FXS5ddWV4u; Sat,  8 Aug 2026 09:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EA4C605F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786182054;
	bh=Kg4QSzoDIR0tQbKH3Ce9i7GFNe5oPOoEPOzb+CG91DU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UCV5KV9IP/f2YkykN15znKoFLVFDrIVs+1ZaBqD45JLxyI4G0AzdFArNDc5k/Hw4Q
	 i+imgAXOitTTpTvVlJSWghMHMzbmSPO7214kSX9T9bEYj0JYtVapUaX3XLaeUE0LAC
	 ZeCGLicSgohh6GOXZOsOW3Fm/w9UHSc16AANeKrdB6V9DweRd70pcaGBMRPWWgWX17
	 FU6OoO0gItsVAVuJnozurUiykN8otptVlyTtKuINTHCPwgMHN0CwRJDXrRdeHbfQnf
	 /QuhXiufyeg2CCIG4vV3AwsaNREHRXpc/sY2USbU5GKXibU4ZtqDeW9CRxlAAYiSv1
	 Tv+f0L4lfY89A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA4C605F4;
	Sat,  8 Aug 2026 09:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8505B144
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 767D280898
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZvtAMKLgq-D for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 09:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63CBB80897
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CBB80897
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63CBB80897
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 09:40:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7783A2003CA;
 Sat,  8 Aug 2026 11:40:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 11:40:46 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 11:40:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260808082554.69837-1-bernd@kuhls.net>
References: <20260808082554.69837-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <8ead91b74516f224155908b866405a95@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786182049;
 bh=aFKqZqWVFWR6cK6M+A7oF71YofVGVdvMWCSgEd/kEn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dUvd8MggIX1GYUIJjXMA3PXuDXpaSU9xtaa3Jh0tFWPrimXF3DS6cwl/tKFSbY58s
 Zx6cHqbgklg8fYZTMy/zHXDusNtIae7fWRcQynT1CSARAdHCf/15RLypSHQgWJsLyp
 dUV7jSM+GGioaCtJHGKjGqtmNLTWl13VJZDzf5MZq+h8xf6y5n7uvzjxLqtlxrJoWs
 4Nb9a5pqPZGMHgOzPQNxetZ8njjGKCjsEVzxuG6x3ft8W4ZBVtg7izM2iGYK0pZUh5
 mE20gy10CoNimyI67lbIFkFWnW0tS2cOmzG371vfWDl+uEpEANUuIaPY2I0yKtqeHx
 pNJAiXr5QioZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dUvd8Mgg
Subject: Re: [Buildroot] [PATCH 1/2] package/{glibc,
 localedef}: move to Github mirror repo
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

Hi Bernd,

Thanks for the patch.

On 08/08/2026 10:25, Bernd Kuhls wrote:
> Downloading from sourceware.org/git/glibc.git causes many 429 errors
> these days so we switch to a maintained Github mirror repo.

Any specific reason why you picked this Github mirror,
while upstream points to a Gitlab one?

See:
https://sourceware.org/glibc/wiki/GlibcGit#Fetching_The_Repository
which links to:
https://gitlab.com/gnutools/glibc

If not, I'd prefer we simply follow the upstream recommendations.

> Fixes:
> https://autobuild.buildroot.net/results/09e/09e760063607b1cbf4ef687bf9bbe17b12d648b2/
> https://autobuild.buildroot.net/results/22a/22afc952e0c05648d538d13ea593e5ad8c4c03c7/
> https://autobuild.buildroot.net/results/281/28159f29e38b0475ae33fe73a9cab04ea3a8835f/
> https://autobuild.buildroot.net/results/961/9616d46c46bd2a10a6e719d76ed6e1d8e3b3d0d2/
> https://autobuild.buildroot.net/results/fd4/fd48fb96639871889fb2238dba360d1740d7962c/
> https://autobuild.buildroot.net/results/91a/91a0b7ccad116911f84281b4cbcb080309ad952e/
> https://autobuild.buildroot.net/results/17f/17ff61f0eac946b3c027a540147b2573e224dcdb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

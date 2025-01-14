Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF088E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4DD841365;
	Tue, 14 Jan 2025 20:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kertidV_0A1; Tue, 14 Jan 2025 20:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8EF4134F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D8EF4134F;
	Tue, 14 Jan 2025 20:54:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 691EFB89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63F9760ECF
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMnuofq6Zogt for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EBAD60BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EBAD60BB7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EBAD60BB7
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:54:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9D69F780692;
 Tue, 14 Jan 2025 21:54:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51996])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:54:26 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:54:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250113183502.3012040-1-james.hilliard1@gmail.com>
References: <20250113183502.3012040-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d60a39917a8607b667c4629d01d0850c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888067;
 bh=nujMBjcTe4vwgRO0RevmZ91aZ0iwBNl6k1giMAmpN70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jV/q29OwukbfbK5g8fET4e5l31u8N4lpLvFIRAzvc+wgJek2uvSs9rGs1aIEOazzr
 ahy75QzeYhpC66aiQnrbnm59KT6oSQtYsCJM5Wr625lDozLF1PDEpAwmRFwaBH+G9T
 fon8Jaxij/GTYlip1E0y/Q3NeIRf3dtPhZHRDg0578knPaj/SvjhKuqzMJVyqnxe33
 Rvz4xTMGSr5HVXQ6D6zBobWSbLZE5MT13hOd+Cgtgv5TmN9UEWMd18E1pw3PCLbZhY
 P9ozrT6tEQwMDuN56zBg6R/0f708bo215Rrw7o0Va3a+ZMtPFqwRd4M4cM6kAtPsW9
 hCLjlG2SYWYjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jV/q29Ow
Subject: Re: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to
 version 2.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/01/2025 19:35, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

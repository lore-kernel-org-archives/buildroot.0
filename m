Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1BEE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5715B80415;
	Tue, 31 Dec 2024 17:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypCb5_vAKnFU; Tue, 31 Dec 2024 17:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B1E8041A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78B1E8041A;
	Tue, 31 Dec 2024 17:32:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF33F968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DDCF4023A
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CB71jALQ49HL for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA48B400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA48B400EF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA48B400EF
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:32:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BCEBB5FFAA;
 Tue, 31 Dec 2024 18:32:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53580])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:32:18 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:32:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241231160736.142068-1-b.bilas@grinn-global.com>
References: <20241231160736.142068-1-b.bilas@grinn-global.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b497eb0f4066257713b2568fac044285@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735666339;
 bh=ZEGQx+6DibWzpPnn6Xd6sV0nwkm+28sOO3yIaMq7diU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bNFFfV8zFae8IrnKdnfh42Syo/UAcudn1jxkGIgGdAZokOyah4GMZ8IHzvL4fFtSm
 dLtCoMRFXKffGpFmjeIuHGEdW0GdeKLNU1/dQ7HAwrYGjLprCzHwsfg1d1MzkHVH3C
 dg0JWLmW1ID7D8s9AwESibsHvG2R0H/u+qtbCtuxrTODOknh8xKGmfRWzPOsJtACHh
 E1kGkuxriQr/bRnZTgb+4NMrI7KcMXrC4cAWyvQdjBGsMsieZc7skS99rSbFw2Oq7W
 PONnTBDU6OgCze8hdQSGz+z50ATT1Eoamv/cVAzV/CEjk90B2TRKU26VJW1Ld8OIdi
 tGt13MQH+GQgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bNFFfV8z
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Bartosz Bilas from cegui
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

On 31/12/2024 17:07, Bartosz Bilas wrote:
> I no longer use this package.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B6DFF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146A16127B;
	Sun,  3 May 2026 16:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiocViGjxfV0; Sun,  3 May 2026 16:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2376125B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777824818;
	bh=Bx30zrHQx+NaTaZmGU04vRisLuAc6Q9ACJ8qiEVMv8s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q/kxWBY4KGIuyglrvbfE3gGrWN1J1RNUovafDHU2c5u+Jku9+6B6VGGA/9s5S72wz
	 HuJrvFQj0jjtj1yoNNfndi+4wJnpIAOuX6fnbyz5DQ7+68zEhCQ5VFoYZTI0yFsAmT
	 sVel7Pkhunymyq+II+u61HafXPZMKABwyuWrtcr4hQiUilAS1Dg/fDH7DkdaBAlm4y
	 LYOY3TTzEZGSdGfKQ3KjETsFdjxmbeOTEfC0Yq/BD6h0ZvoqaTii6f7VnB5F7NMdHU
	 gKyDVHJ6dyW1wHAXiOJmvFSL0WJ8EEdkwfLgxiVrAVUY1d7H4aP4all0IoAJLPZF9o
	 lqwXS35z2ZUbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2376125B;
	Sun,  3 May 2026 16:13:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D22D25D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EC95405C2
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DDj_KVazr3R for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89473403D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89473403D7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89473403D7
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:13:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BC55660137;
 Sun,  3 May 2026 18:13:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 18:13:32 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 18:13:32 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <afb15Mavy9Eo776E@waldemar-brodkorb.de>
References: <afb15Mavy9Eo776E@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <1189ac937407bda9e84dd80b744f9762@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777824813;
 bh=gubNfCLdcRGVJ7UsnkeMfpLMyuE6tRd0+btC5TlDqBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pwJpyqUX+yLlc0ZvYo7oaumRWcsQXiwTIAFj638u3hK9cpkl9NL9VVsvvPgebvfCi
 tyUzETaS9O/qgaJQC0jzOBosaT1UX2GCkkPi1Bol81wvgwawrL67ncshXxwGEZ7W5g
 xDHLbYTTLqpVqn2zkMcpnTE8Zg5Dhzjt85YxkI07MrkD5pQBI1a4HynnUmT77FufR7
 JMmwnHJr+vcWARnT8txPIwf4si2j39yPtoQEqFKsOIZ30KW6JPct4VgvMq6PUkB2lV
 6vzxBXfK0bcEMfVOJSVxv+QYZxGeOSNTuwlOjsUX0dYpFeB9mbLcsdghpZPnP/c4Uk
 nk5zsLnWnS+tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pwJpyqUX
Subject: Re: [Buildroot] [PATCH] package/dillo: bump to 3.3.0
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

On 03/05/2026 09:14, Waldemar Brodkorb wrote:
> Update to 3.3.0, see here for a changelog:
> https://dillo-browser.org/release/3.3.0/
> 
> Update to use new homepage. Project is moving to their own
> infrastructure.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
For info, I removed DILLO_SOURCE to fix a check-package error.  See:
https://gitlab.com/buildroot.org/buildroot/-/commit/5657229086de7977533aec298922f0ce1b7a1745

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

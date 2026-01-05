Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B52CD0400
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234504045F;
	Mon,  5 Jan 2026 20:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdK7akVJJgUz; Mon,  5 Jan 2026 20:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA8E403B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646415;
	bh=12kGeSg33iALfHjDRiZlwwkhOEIqKMD6d2dPa5cs3O4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EWFqM+7SrryiJW1P26Au/AbBDBo3X8WJ19aJsfzs4n05803Vkcyrt/IZ1eNDlKXVl
	 Su3bc2z1+1/xY0nmL18rfNzPM+67q5ugUBZuRxJa2q/57ZJNrdU3jm1IaPytu4T/mc
	 ri390LNx68pwOWDZcoKKE6Z3D/ri9Qkn+OnTzRCWiizpHyBMPk2B7r2FJ78m7y9/+N
	 pUAr7dBhqhp+1dpJUyHIRjLMCbJhZ89BNtWDeOuUZAabXR5k4JYDRJHPiVKB9LtZDg
	 idjK94rr1PSJhDYEuBwv5OaFbAH3yY8qlKsdTwSKa84iwhbjE9q6RcKk9MFkib1unk
	 R5uxApMii27JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA8E403B9;
	Mon,  5 Jan 2026 20:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5BA249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 184764007D
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL13jOENImgZ for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:53:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5E494005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5E494005C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5E494005C
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:53:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BB2545FFC0;
 Mon,  5 Jan 2026 21:53:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Jan 2026 21:53:26 +0100
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 21:53:26 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260103175533.1988160-1-james.hilliard1@gmail.com>
References: <20260103175533.1988160-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e12db60a5711ec2423eeb815dca7a939@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767646410;
 bh=xmF5DxvKmX0cOLpDGaMfAYpUpnOz2y3v+Vd6uScZCzk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ozmsLe+qYy6WAf2DpD4ab3VllSnBAoYsCSj25kfh7YHbZm9+FHf6vK4CPf6CSfIng
 Sxde5eeUWoXnPHhGyfwM2b9PiJodw6YjWykclrZ7oS5nLUP3Y8ndwCuhixPHjJZeGt
 0oZOpwtZAyNfdP10maGWVXi/nTJ9VAXOIZKDyvZ3pveRCacVyEL4iQMM6+NNTmbu5R
 Er99RGndbBdITAt0Von1sG+ByerBwxgHDssDvpajWk8JyY4/YqgsFggiaMp4dx1sQS
 UEgzncT2RtqRBCc16efMR+szn8rV0TlO319f25tvvoOHtkquKNDK4BDlTh+CI0U5s/
 RgKlNwtSUGLkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ozmsLe+q
Subject: Re: [Buildroot] [PATCH 1/2] package/python-mdit-py-plugins: new
 package
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

On 03/01/2026 18:55, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Since the python-rich issue was fixed in
https://gitlab.com/buildroot.org/buildroot/-/commit/8d78978a0d0cc12b79364faee2c17585047f87ca
thanks to Fiona, I applied this series to master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

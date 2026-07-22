Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E81C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 19:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E4E80F91;
	Wed, 22 Jul 2026 19:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mngd7mKaj9s1; Wed, 22 Jul 2026 19:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40DCF80D34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784748887;
	bh=cOirLac0Pi2rDO0b8kaMbt16SAlJ5m7aSN4BIkVjWB8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D/YfQF3l8pca6B1GdVZJ5yatrb8yeZXCZk44DBI16TMtJhyrWZBqEP4zNZKVONH2v
	 qMMo+b/MBBnoj8LD3A2f178jVDTxuQLA2S+maBLGlX//VEIAhriHXLDkY+Jw2YOjFW
	 Gt/YtvpwTFbKMeFE7NZ55jei/sGwHY7DJxLos70SHnBszreZ3NivqPmnaZjCbyKCD3
	 WvtLSEKA41M+Kyxhgf09b+m/YQCA/a2LKYXSJs7e1M0NWBIKSfEjK3+Lx+RYEs1Hic
	 KZdYehNeQ3DIqnvEKOAbOn8dyp2GSsYiudYjCn8DY2InHPqK6t8fei59IoZHrKeoXf
	 rxCk0Mo4GKkSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DCF80D34;
	Wed, 22 Jul 2026 19:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B2D390
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8516C80D34
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ke12_aiX4hN6 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 19:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A914580C8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A914580C8A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A914580C8A
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:34:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 960FD13F879;
 Wed, 22 Jul 2026 21:34:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 21:34:40 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 21:34:40 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260722174148.3910808-1-dario.binacchi@amarulasolutions.com>
References: <20260722174148.3910808-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <9805a17b85de41bdd69c836d40e4b467@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784748883;
 bh=1tatBEIRU6DKVj9iPWIe5tu7X0bmBz62V7AuXRhc/aA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kg/i/WeJgcMU+nl6huAzYUaFLdBbwp0OY4e2uAa1i//dVbWtqzgaMskJYrHs8Ydfi
 SfYm5KI3Gbgw6+hEc6sWHGEYrOe4dCPj1TFaJ6V82k9npnvmvpPjvihYxSXi/iPLUT
 xbxF+IWO/Uagx0uFhTyBvvEYOuYovlOBLfCPOxTBo0TfOK6jarQNIL2Re4uCgAtOnb
 91eR+wskPEwdR9um+xDWwFTeQ9KbYT9VrwB7aDSBoO6fQ3PQam42gWlTtJwdUcxFX+
 oLIMIHoFcFOB5uSsTOuTk3xMqiE+/LX0lqYSgoxd9TaDx0PmcHCBMtKGWDcwLQEdQM
 OhAol/H4flJqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kg/i/WeJ
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.96 and U-Boot to 2026.07
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

On 22/07/2026 19:41, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.96 and U-Boot to
> version 2026.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider switching the defconfig to use a Bootlin
external glibc stable toolchain, please? See:
https://gitlab.com/buildroot.org/buildroot/-/commit/47f4e3810c981e8cee19d8a411b38c771ebd2381

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

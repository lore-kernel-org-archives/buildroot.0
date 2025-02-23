Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700ECC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1675081570;
	Sun, 23 Feb 2025 12:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfp4DhfTYaIZ; Sun, 23 Feb 2025 12:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2806581583
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2806581583;
	Sun, 23 Feb 2025 12:10:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7C3920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F8C660C03
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hMndoI6Qtds for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9ADE760BF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ADE760BF1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ADE760BF1
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:10:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8550819F5AF;
 Sun, 23 Feb 2025 13:10:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 13:10:44 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 13:10:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org, gilles.talis@gmail.com
In-Reply-To: <20250222212824.3745939-1-festevam@gmail.com>
References: <20250222212824.3745939-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <01be2c7c0b4226dd7578f6640e1c2055@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740312646;
 bh=x6nrDVLD8mh/fZjsqFOMRDv5XiS+aLR+Vy8RJPtYHX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GLpV4DZWU44kzRAK3f8GkW7/qpI2vjTBeLApN27Ks7ypECC/XpnU1M1lxDe8PQHLG
 s/GedkeZn2Df30czNAJnUl57QZMylbbmlXiLiI5ZsNrZvdN/cvoh7MtX3tV+D3t2oH
 iigJDCR8H6stv+ESDJQUA2C8xg8KCXce95TBXLI2xvcmQ59yDMsG7BizDN07uadGvu
 VfOCpMgIyjgZARVeSGcRubi7/xA16JN4KX3e6hZfI/0cRK0lQbpUKXk77rh/y+uJFl
 hytMvja82xAi1z7zDGVz2/bE14nlvYkUTyno/U3rHhsL/iM/ApwHpE10LWX+G7PlG9
 hjBnQMqN3VP3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GLpV4DZW
Subject: Re: [Buildroot] [PATCH] configs/imx8mp-evk_defconfig: new defconfig
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

On 22/02/2025 22:28, Fabio Estevam wrote:
> Add a new defconfig for the imx8mp-evk board that uses upstream
> components, such as:
> 
> - Linux Kernel: Upstream version 6.12.16
> - U-boot: Upstream version 2025.01
> - ATF: Upstream version 2.12
> 
> Based on bcc799328334 ("configs/polyhex_debix_model_a_defconfig: new
> defconfig") from Gilles Talis.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.

I did two minor fixups (converted back linux-headers.hash to a symlink,
and fixed linux.hash to the correct version). See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9d544ef3bd8e96cafc68b98ad8d06e32ab546ea4

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

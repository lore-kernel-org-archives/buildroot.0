Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA2BE63CA4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2B082207;
	Sun, 25 Jan 2026 20:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAh0fx5LojDl; Sun, 25 Jan 2026 20:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D87A5821C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769374615;
	bh=QMfTQD93ClDBHiIB63NXMz8C/J8/DuDaN+LkXoS/a84=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hbTUFruT7f4V3FHZZI5Ed5z9tqqJElXdLJG0y8TVcjh/4QatGWDRUvq/xbxDsFVCz
	 y11cOAsOl8ukrlvTO0+0l1cLf2dDctVd1a/oPnTIlHRIv1FlAQ+Q1hwmNO54x8R1X2
	 566J6ATj2GQvGodzdeXLTOlMX3JpDcniqO7BV5kHkInb7mkLN3Wgv0ZefZ9vq78O4U
	 No33wLEhca6B8rZ3fqRnn58faPEfRk/KjJ+cPE9bpz2ZPg3BXg+6l62V2J7PkuulYZ
	 HQvhjCGD2fSo4ja+4pe8wz6zTnQMpXdZjIH/jpJ5BVgWHIblM5aVASvyLE/Cf2S8Hg
	 b3EaUftwhbUAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D87A5821C3;
	Sun, 25 Jan 2026 20:56:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B769E35C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E09C60880
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWhJoORnK6a5 for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 20:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB1D460712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1D460712
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB1D460712
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:56:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 20452B00548;
 Sun, 25 Jan 2026 21:56:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 21:56:48 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 21:56:48 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260122183550.475600-1-dario.binacchi@amarulasolutions.com>
References: <20260122183550.475600-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <006fa77cccc484e252ab757dcb09e2d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769374611;
 bh=5n9h9Xm1c53XGhlVp4o1Cq3DAFHXDfuGGEJZDA3YPUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iEnJRUb/8gEMjDMraMP0secFs8VWXucZiX0AlA/hd8EW6SRMU66wZ4HEq+Gmq6EkJ
 kGQgplAY6osouzMy0EVr3e03NfAm8aZYjksVYPFGd/RgaBKfQ9LlLchJvR24dzfY+7
 gEKWxbZz+sc5gSwSPRBPL7qYTsrmEPKhK0/e5pxFYtwJa00I3ZZgejakJotEds17OB
 teqdXigLqlQIXtiahUu6tas0I86ztA9luqod3wD0WRKqiK8knHzmCEJP/qAoVw0sGD
 VrV1QssI7plJ9sE9yAlbKWWtTemmbB+hky7q8RUt5dgetM/PHL7zfM7ODXFH+uE0Oz
 FccFC3RMGeXMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iEnJRUb/
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f469-disco: fix typo in readme.txt
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

On 22/01/2026 19:35, Dario Binacchi wrote:
> Add a missing space in the "Creating SD card" section of the
> documentation.
> 
> Fixes: 04a0094f0ef0778d1f3c4056ac0005218126147e 
> ("configs/stm32f469_disco: fix kernel bootup")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

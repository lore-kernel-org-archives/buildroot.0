Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA154CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881B984329;
	Fri, 29 May 2026 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrhrFvtZdhpD; Fri, 29 May 2026 16:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFDD84321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780073041;
	bh=NUORf3j6fG2s+E8IDu5wa2hnZK6WiPMIVm+Lz57XIiQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=F9OdVibkrYAd8ZQJocoRvjbuRu1BBmXG/oeUNECQWt2pHfpYdHcFsNki8XiBc9ymL
	 twioOfL/XYTeIzB8pb+zdONj27yw3iNE1taSDyfM3Hc21EUYcVxv2nxTF77ulH/kho
	 s7470jdUmeZiM6kHSz4XMNL5D9Y3gGz+krsosT6s6sFRfMD9/5sMwi4hgxFf9ZTUt4
	 FeKOIPgBbXSrpwx+z9P+mdX03RRGKzx+AIk5onhvyo1lra/HbYpRrSdzEtIm6XOsqQ
	 Pn05lK+LS4A8CeA3E2ca9dyIsGfYPDYfJKQWGkQ1vAHABdj/6XszZr4II2xqLWuMgb
	 gP+qJn2e8yzIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECFDD84321;
	Fri, 29 May 2026 16:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A013288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE98A6130A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2jRUr69ffSS for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D668661166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D668661166
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D668661166
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:43:58 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 88AC82C84123;
 Fri, 29 May 2026 18:43:56 +0200 (CEST)
Message-ID: <43b65e0b-f516-484b-b84f-86c4a9da88a1@bubu1.eu>
Date: Fri, 29 May 2026 18:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20260526195716.371653-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260526195716.371653-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780073036; bh=zU8Xhmd+fXhASmCKV88AC1j1nxUOK5VikjL1pqsK30c=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=cmjRxuvYM+/RDdmI+UKc3mdu7mQUYUEr+LoT8+zSXYwohYsCpyFqPcKMYvVMNPsym
 20NxBNMtPDstRzW0OZ0/WMCcFD9B4W63Iq3JOb1N70tX150PeSv9gB6Ff9fJNQ1sfO
 22sW5STbN+u/RllsaMJJweq+tr0+IstYTEAjhUp7D57fabq7lISZRjXlfRPIooLC2v
 e7mjkJRMM/7zj/EKXTAq4y6FpoXUfoTeGVbWUumEvN7n1eKtpTm4CfQI3P/bYCjN1K
 A34w4nT51gPGrZUnUusWTpLdhKnDsq0264X7lXp/LRKwQmGjxS8KsEXy4HkTWv86U0
 RtIo8NQhm1vIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cmjRxuvY
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 48.0.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/26/26 21:57, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
Added the changelog link, applied to next with that changed, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

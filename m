Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26885FF885D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 08:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD49940A9D;
	Tue, 28 Apr 2026 08:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh8shPfgOy2M; Tue, 28 Apr 2026 08:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5085D40A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777365939;
	bh=/vFpuDhRr2CaMBqFBOreGb0OpRoaF/YtuxDv2v63ImM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RhT+euO20w3IqSdDH97hKPyKSYdXNV8ws3WWjccjfikiFezwcW4lMGFGLzFjGXs04
	 LD3cMUe/Y9SqLbTFrwWqFxtKg4HqpkVSO9ooBC3+whCgbChxrM81SXxXyklK8rJ5M0
	 f/EHWzrwAVQPnNBAwhdU+TshVj1BUEUlourbOE1NXV3FQfiMeJKNR3Y1DtLnxzoWAV
	 G5HzSHODzRy+9XfQuFeEr8aZMVBziW5M3DQSvoFbZl2i9GKLQojShlMF2KgPsLeDCm
	 X0UuVaRSdg6eP+tBKB7Iuk5VZezuYuwHnNbw1/DShGxSQRyQZ+loIVkMcMsnJIWSwV
	 4r4ddCTnSbuCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5085D40A61;
	Tue, 28 Apr 2026 08:45:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF3C23D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9133560671
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGus3ozPswKU for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 08:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7833B6065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7833B6065D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7833B6065D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 08:45:37 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1A8D82C84162;
 Tue, 28 Apr 2026 10:45:35 +0200 (CEST)
Message-ID: <ec706dce-7c73-4322-8423-7cbf34998405@bubu1.eu>
Date: Tue, 28 Apr 2026 10:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
References: <20260427191951.571150-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260427191951.571150-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777365935; bh=YtVb4p1kCf+1yB49xvDOnsMqPSqjqz+OEnRl+hNzfZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=pXsszDY/jIkfcvCW5PVsEdqElnSWQ5o8PEFap6S7vFEP4Q2gVNt+3EkzCYTGk/wKX
 7aV4l+TIJLbyDrAP8pkI6r2yP/qnvG2McXvpUdG/T2p5VZ/qRDPnqTk5WuJT4f45uR
 5VuAjBjxt2NJ7ns3PjkgPEjlKhPjeLcQtsGR0OOQypYCZquwPymuQasyqbqeg+dJG1
 0FnfxQ0n3UlqEjHW+wcifhuHqLXeEmDhHrR9fSgWaqrNLTKqb8PqZTJJVCMKfnNhIC
 eINkfto82UeMR6zVRoL4Fb5wjReJD+FzJl4FqoSFDQGsIvO8ptId0NF4u0HMgr4G28
 uczu1I4BOxt4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=pXsszDY/
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.5
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

Hi Bernd,

On 4/27/26 21:19, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_13_5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

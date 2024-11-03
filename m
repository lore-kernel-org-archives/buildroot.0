Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558A1D11182
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 17:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0347A81230;
	Sun,  3 Nov 2024 17:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpuycYm5-DMW; Sun,  3 Nov 2024 17:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 187EF8123E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187EF8123E;
	Sun,  3 Nov 2024 17:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF48AB8
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD440606A8
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1qQYgSbybHl for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 17:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 498AB606A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 498AB606A0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 498AB606A0
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:40:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D7F6878032A;
 Sun,  3 Nov 2024 18:40:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57536])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Nov 2024 18:40:29 +0100
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 18:40:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241102230644.20556-1-vjardin@free.fr>
References: <8a19a60a3bc7fd38df4859c55ffdb7f9@free.fr>
 <20241102230644.20556-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <3917fb97608297fc4374a17b231f7cec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730655631;
 bh=NFHGcIR90/5RyfctX5KXUXK+6A31o1xJueTUbPXVnrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t78WyVHRCy3Xg/VA4GZgeMp61eZCzP8b0wMtvkzqk65wtj1QJZ2RbOku/Crr0tRJK
 F9RPXLP/2SIrPUInMWNC7KqNSvwibkrPvBj/5xUnzK1e5w0W7SyP7RTr7L9pbilG5C
 oCTEVulMZ6EH9M1aSF8TG1n4D/gCDA/lUaTTZgYZ6O3vrg5VoL5V9fR+d5IT70eEkC
 gQRXRiSTIb17KBuL3jOCcJMHxmGqexYrKCVb0RTHpXQF1creX4iPNig9wpMBkYO3ra
 l8JASNa1/fVHSCkA6ATzCu0Vp2en7ylx5fhYuCMyUkgvD77ktziUT/OH9kLhVf2Onu
 EJ5jA9sy74Dsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t78WyVHR
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/nvidia_bf3_defconfig: new
 defconfig
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

Hi Vincent,

On 03/11/2024 00:06, Vincent Jardin wrote:
> This patch adds a basic support for the Bluefied3 board from
> Mellanox/NVIDIA:
>   - 
> https://www.nvidia.com/en-us/networking/products/data-processing-unit/
> 
>   Brief summary of the board features:
>   - multicore ARM
>       - 16 Core ARM Processor
>   - DDR4: 16GB/32GB
>   - 2x embedded CX7
> 
> The linux-headers and linux hashes are synchronized thanks to:
>   make nvidia_bf3_defconfig && \
>   utils/add-custom-hashes
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Reviewed-by: Julien Olivain <ju.o@free.fr>

Thanks for the quick update!

Applied to master.

I did few minor changes. See the commit log:
https://gitlab.com/buildroot.org/buildroot/-/commit/771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

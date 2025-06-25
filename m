Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89094C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 14:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26DED8409D;
	Wed, 25 Jun 2025 14:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZBL7VC5PAI8; Wed, 25 Jun 2025 14:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E5EC840A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E5EC840A7;
	Wed, 25 Jun 2025 14:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9084A154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 14:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 816F860FBF
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 14:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt1A06PJR8cm for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 14:55:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32F16613FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F16613FD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32F16613FD
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 14:55:43 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 72A1D2C84A5D;
 Wed, 25 Jun 2025 16:55:41 +0200 (CEST)
Message-ID: <cf2e6459-e6da-46eb-9fbd-64b72dae2ac4@bubu1.eu>
Date: Wed, 25 Jun 2025 16:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: thomas.devoogdt@barco.com, thomas.petazzoni@bootlin.com
References: <20250422095528.0006b78b@windsurf>
 <20250422075932.2345-1-thomas@devoogdt.com>
Content-Language: en-US
In-Reply-To: <20250422075932.2345-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1750863341; bh=SBtuG0tRQLMKrpRyKS3nbpUtu8gBEOnZS8KP4jgwpco=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Q4yg0EiX5iEbwaD5bOev6G+fqfQouSSclW/NdZD2UomqkDYK+F1t5mlyn0PpGUM8v
 DoWF1YCz7qeqrv5fRHZYSu36pXMtyrG6fPs/1AeQSDGk3gfT6Kily4UUQynrvEYZhF
 YnAZvcyiucvNTUps6YWAgb4rGUU36Vg3B5fMMnjRZ7M6tCVItNZSHOdCbUFIY8IvMm
 1BVctn4f0kDv3x4RBsHxO9cGSpLBmTenePHvH0qmB1sochta5f49CwoJi/JC8xHdoE
 ixTNulPslVBM4NoFTk3O1dA1reAsubPs0u4hBcyg4t6j9iSsWpSAJF8lxRgwJjyANu
 1tFWO8JdY8cSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Q4yg0EiX
Subject: Re: [Buildroot] [PATCH v3] package/util-linux: bump to 2.41
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

Hi, Thomas, Thomas, :)

On 22.04.25 09:59, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News: https://lore.kernel.org/util-linux/2cifsg7vkdiivfsmmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/
> 
> Dropped patches which are all upstream.
> - https://github.com/util-linux/util-linux/pull/3049
> - https://github.com/util-linux/util-linux/pull/3383
> 
> Added some new patches. (which are also upstream)
> - https://github.com/util-linux/util-linux/pull/3471
> - https://github.com/util-linux/util-linux/pull/3484
> - https://github.com/util-linux/util-linux/pull/3506
> 
> Synced all license files.
> 
> Dropped the AUTORECONF call, since
> 0001-libmount-ifdef-statx-call.patch is upstream.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
> v2:
>   - dropped AUTORECONF
>   - added two compile patches
>     - 0001-misc-never-include-wchar.h.patch
>     - 0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
> v3:
>   - added 0003-namespace.h-fix-compilation-on-Linux-4.10.patch
> ---

I just wanted to note that 2.41.1 has been released yesterday:
https://lore.kernel.org/util-linux/wnfaquaapqknjnu2bdvddkp2xbleowfcr2g3cqiewpl54oclmi@mrseflcu5nyk/T/#u

A new iteration of this could drop all patches now. But that still 
doesn't solve the uclibc bootlin toolchain issue.

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

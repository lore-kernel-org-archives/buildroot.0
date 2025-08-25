Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEC9C8303F
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 19:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA0C4299B;
	Mon, 25 Aug 2025 19:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCxNJohqVr84; Mon, 25 Aug 2025 19:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBCFB42996
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBCFB42996;
	Mon, 25 Aug 2025 19:21:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F13DCD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 500AA84B0D
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejdBCUZmbDIE for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 19:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27D4984B0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D4984B0B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27D4984B0B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:21:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DA93913F8A2;
 Mon, 25 Aug 2025 21:21:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 Aug 2025 21:21:17 +0200
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 21:21:17 +0200
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250824203903.988923-2-dalang@gmx.at>
References: <20250824203903.988923-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.11
Message-ID: <a4ecef19d366472c430b4b6dbc94de33@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756149679;
 bh=Gteg0nyXqm4FQahDwttpOdtM0LoD3tqUIMq9WQfxzLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lB3n7D9x+4iLCYbE5Q46d4jFphf34Wwe4rp8DwBl/qxv2aPcUy8JH99WmqEdKTC05
 hgxV2iPNhc1z0e+YZJmqYciD9r2BMPnnGl02erBPXAJkX0vYEsABzwYf0FaRgQDL95
 6+enFS+mz7NxLrVn5Jfjkns9VCBI8m0bUdnkjLZTKywXg6AgaXDrdbiJe9iZwv8MCn
 vWgFF/5IzNHckaPCfzizA5h99bJp3t16qPmVFnj1KJibhzD5dpOhkZEbuOWgzQY4Wb
 B3DErFVbgkOUtZxQ+p/i+DsGe9R0ouikS3bkeRG6O8VXORYyt3WaoDxUCCSQk8OXmp
 m7UJoNZLncCeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lB3n7D9x
Subject: Re: [Buildroot] [PATCH v3] package/vim: security bump to version
 9.1.1684
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

On 24/08/2025 22:39, Daniel Lang via buildroot wrote:
> Fixes the following CVEs:
> - CVE-2024-41957
> - CVE-2024-41965
> - CVE-2024-45306
> - CVE-2024-47814
> - CVE-2025-1215
> - CVE-2025-22134
> - CVE-2025-24014
> - CVE-2025-26603
> - CVE-2025-29768
> - CVE-2025-53905
> - CVE-2025-53906
> 
> README.txt got updated three times since the last bump:
> - [0] updated some wording regarding who the developers are.
> - [1] updated the link to the release archives
> - [2] updated the goals of the project
> 
> netrw (the builtin file explorer of vim) changed maintainer and was
> subsequently restructured [3]. Therefore we need to run installpack,
> otherwise we run into this on startup (reported by Julien, thanks!):
> 
> Error detected while processing
> /usr/share/vim/vim91/plugin/netrwPlugin.vim:
> line    7:
> E919: Directory not found in 'packpath': "pack/*/opt/netrw"
> Press ENTER or type command to continue
> 
> [0]: 
> https://github.com/vim/vim/commit/b75825f749cf87feb9ae8e7e5327bd2efe707c86
> [1]: 
> https://github.com/vim/vim/commit/4225f28855c5d3023662b3a90a70b22caf9b6ade
> [2]: 
> https://github.com/vim/vim/commit/2bfd1ee161e26ece8e5a72cdca4fff22d11728a2
> [3]: 
> https://github.com/vim/vim/commit/9cfdabb074feefc9848e9f7a4538f201e28c7f06
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Since this security bump is fixing a set of 11 CVEs, I applied on 
master.
Thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

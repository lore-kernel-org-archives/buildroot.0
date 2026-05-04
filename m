Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E51FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 12:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 249A541AB2;
	Mon,  4 May 2026 12:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flqjvdIFvtOx; Mon,  4 May 2026 12:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5161E41AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777898075;
	bh=XLdjAg9Ld9aa2d4ZG4hT/j2pTaozIA9cQcTDXR9PwAA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QICEc9C4Mf4WIl3S06CIqOnEm0m+962+8zpRebNmfu6Kozg2dtlzAT29zg+HPhxdG
	 is/7zS6L7/RIkuJmWkl1WdwNev6UqGzI4mY0RSLByF9Kcb+HoocCJVhm2d4ip7TvJP
	 lD1MxIE/JDXeslGsAjtePxNHc/GzilqrIkcBlEr+TXaFqtYpm9Xbgm7K6ycEtUxPqd
	 eqQm6EDbTN958ULT8uo1HXvi31REWdj0A04gBQ6r3Ue3c4eDJXpe7kubzCLXgJ6lUr
	 NajSbBPjWnboqjVjkHE/arSdO8BNcCIVzIbzuE3iEHDMQGl0goz+JXsN1FQtIeRRxe
	 N0yrd02V+8ZNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5161E41AB4;
	Mon,  4 May 2026 12:34:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6155190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 12:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A799641AB4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 12:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyhu3IvNwCk6 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 12:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBB0C41AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB0C41AB2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBB0C41AB2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 12:34:32 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DB70B2C833E6;
 Mon, 04 May 2026 14:34:29 +0200 (CEST)
Message-ID: <f8a85faa-8626-4f5e-9555-00eb794b23df@bubu1.eu>
Date: Mon, 4 May 2026 14:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260503232504.3712616-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260503232504.3712616-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777898069; bh=yxqlx/xZKLBZpNDaLcPLTMsr1kbRJ3bvNxLdNnOUtGc=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ugQIfkd8jFHMB0dwy+ap1hmIyMt7PeM+U0/txvgUC3iqfE2MaS3niKwEnNOQOkop8
 JV+MHS6GxeqSe4P8Mx6PzekMIssBD/Qumy7BtnLtNJ5b8Qzhl05bAaqdIb7pgL9mly
 M6cLPfiUmn8pBlFOs0RP7dCXjRd8FX5l9mKa0fa2QyhvOJQyre8EecYnViFRdyvVUL
 edc5BZWmhk6T2jeqUFf5Y++OCEPC+tnJR7ovfFWsG1qGMLC4yBdx6L+yPHEPfACvF4
 TYiAsyfxaroMv5h5MTFO4cA8+LYMy8KUtFpibZZImzjQoA1cnVVjoyyX/XS3gdbJmk
 PGJSvqS8MtbbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ugQIfkd8
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: explicitly configure
 PID file directory
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

Hi Fiona,

this looks sensible, but ideally I'd like a bit more clarity of what is 
going on in the commit message.

On 5/4/26 01:25, Fiona Klute via buildroot wrote:
> OpenSSH checks during ./configure if the default location /var/run
> exists on the build host, and defaults to ${sysconfdir} if not
> (/etc/ssh in Buildroot), leading to confusing errors. 

The errors are at build time or at runtime?

(I'm generally a fan of including the relevant error message sequence 
that's fixed by a commit in the commit message; if anyone else 
encounters this later, they can google/grep for the error.)

> This can break
> e.g. in a sandbox with its own mount namespace where there is no
> reason to create a /var.

This is would be on the build host in this case, I assume?

> Explicitly setting --with-pid-dir=/var/run overrides either default,
> and only logs a warning if /var/run does not exist.

If it does not exist on the build machine or in the target?

> 
> [1] https://github.com/openssh/openssh-portable/blob/5fa60ae0d2ed3fc441f54c9349afbd63b6301929/configure.ac#L5568-L5576
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

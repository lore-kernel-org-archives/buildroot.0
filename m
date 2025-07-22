Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC44C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 12:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF6C60FD6;
	Tue, 22 Jul 2025 12:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Epg83-uVffke; Tue, 22 Jul 2025 12:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 615DE60AE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 615DE60AE1;
	Tue, 22 Jul 2025 12:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D6B127
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F24D860AE1
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDGe-FvHoj9q for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 12:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D35B4608F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35B4608F5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35B4608F5
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:31:18 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7F3702C8318B
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 14:31:15 +0200 (CEST)
Message-ID: <ba34cfb3-c1a1-48cf-a5e3-0c434ec2580e@bubu1.eu>
Date: Tue, 22 Jul 2025 14:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250722111000.88565-1-titouan.christophe@mind.be>
Content-Language: en-US
In-Reply-To: <20250722111000.88565-1-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1753187475; bh=uZ3d8I4hTKqgWvxBOo7Ke4D0sq6ls3XU9pgiI+j2UXg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=iw2y3WvMGgeKb7pJULlm5kSZKfksCbQn3qJeRvDN+MiC2Z98+/9LSPFBQVXeFAPO0
 fPmrIgTBXajqsazu7D1krllj1nUoIEzyPKD+EW10v1aPgoFegpWu6J525GfU40lYhu
 nWNRLH1cg46qkyGc9HkHsfOXCJ+DTDsqvmTpec6L0GoswjM21fgJ/JkFt+Uou1iFCy
 reOoPn3/VPLmt+tFMVga9/W6I9q2RmScmwZ4ax0JyOpODCiXDenUjD7IcpRlfnsoXn
 VLnN4U/ArgWgzxra3RQBWiUW1zzKSyZ771Pb9iSCcHCcgumSb/SVemg3B28bKywyPc
 GoT99FBUTyViA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=iw2y3WvM
Subject: Re: [Buildroot] [PATCH] package/python-starlette: security bump to
 v0.47.2
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

Hi!

On 22.07.25 13:10, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2025-54121:
>      Starlette is a lightweight ASGI (Asynchronous Server Gateway
>      Interface) framework/toolkit, designed for building async web services
>      in Python. In versions 0.47.1 and below, when parsing a multi-part
>      form with large files (greater than the default max spool size)
>      starlette will block the main thread to roll the file over to disk.
>      This blocks the event thread which means the application can't accept
>      new connections. The UploadFile code has a minor bug where instead of
>      just checking for self._in_memory, the logic should also check if the
>      additional bytes will cause a rollover. The vulnerability is fixed in
>      version 0.47.2.
>      https://www.cve.org/CVERecord?id=CVE-2025-54121
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---

[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

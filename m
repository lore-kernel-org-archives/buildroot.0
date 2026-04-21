Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9919F94CB3
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 23:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9290883FC2;
	Tue, 21 Apr 2026 23:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1aqauwVe3xM; Tue, 21 Apr 2026 23:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B896683FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776813367;
	bh=H5bp8CgWay2Uj8ixPAh/0oblwydw8etloVC3L3drNrI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kYfC1U8tOfSbW3wEvsHUlFZHctccYps8Gzpci8SvsbVOPRVb351PXMARCoyonvEe4
	 O0rWtqZ41EyjTGB9HaX8ZWjv4dCNwH9CNMqcz1vv3vKXyfdb0GOF1ntd/GEDX6cMDo
	 HIj9PXtNI5SCjV9rtw4ufGZjzK9fRCUK95uIDyRAJ+g2K3CD5zKGXeH/k+/U34KSNx
	 6ns2fAA2KzBnlBkzRKE0l0S4dz77tg7cH7zrtIES6Q9XnxOyZSlc9WmQtzdj8OpU+Q
	 ktczStyFualpSdTe1g2/+EQ30vrN4+ZIL6+AMdt+4gaJquEs8Syc2Fukq0eRcfpkj8
	 zm9VTcYtTBgMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B896683FED;
	Tue, 21 Apr 2026 23:16:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C317183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BBA983FED
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4dE7v-Sn5Yy for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 23:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2ADF583FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ADF583FC2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ADF583FC2
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:16:05 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E14362C80786;
 Wed, 22 Apr 2026 01:16:03 +0200 (CEST)
Message-ID: <bb36a59b-4a83-4f73-b791-b73c9edf1719@bubu1.eu>
Date: Wed, 22 Apr 2026 01:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260421172625.735873-1-ju.o@free.fr>
 <20260421172625.735873-3-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260421172625.735873-3-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776813364; bh=WsaYHYLgGXSmgq0OYIYv9ZjEOOHkXzJC+rwrogHg3tg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=U+u+bn4lZuKHsj5R+lN0LtHBI6Eyne+CjAXTmVXT2RyVNvV0Lq2A7luScr0yXT+rq
 0zTsdBQxK5+RVKm5Hd0eJ4Pwezftlc6sssmjtS4jW0vIu1hcD4rx2eSwX0n4B1jqKh
 MyF37hT4Y/It0Dokl5mLyOLYipZq4GcIavQJsWPcBbReMCNXll90lJvnbI+T77RaWe
 psVqjrUjJxYqxJKm5U+xaLl7FT39SChnwJPIUE1WBKXtIvJ0F30Qw4lgAE0Xh38uy9
 AF8zWh25RnTrfl1fgZAZT+FoUKKhab1sXjPEzfZ1FCcANZ9/QqxwJ//EmQ6odsk+hZ
 4aXTuugrpnkow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=U+u+bn4l
Subject: Re: [Buildroot] [PATCH 3/4]
 package/python-magic-wormhole-mailbox-server: bump to version 0.6.0
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

Hi Julien

On 4/21/26 19:26, Julien Olivain via buildroot wrote:
> See NEWS:
> https://github.com/magic-wormhole/magic-wormhole-mailbox-server/blob/0.6.0/NEWS.md
> 
> The upstream source archive name changed (dash '-' changed to
> underscore '_'). This commit updates _SOURCE to reflect that change.
> 
> This commit also updates _SITE to use a stable URL which will redirect
> to the package archive, to reduce future maintenance.
> 
> This package has been broken at runtime since Buildroot commit [1]
> "package/python-setuptools: bump to version 82.0.0", which removed
> the python module 'pkg_resources' which was deprecated. This new
> version removes those usage and fixes this issue.

There was still a select BR2_PACKAGE_PYTHON_SETUPTOOLS in Config.in 
here, which is no longer needed. I removed that and added a note to the 
commit message that it's still present in upstream setup.py, but no 
longer used at runtime.

 > [...]

Best.
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

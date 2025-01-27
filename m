Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C758C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 20:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14156070C;
	Mon, 27 Jan 2025 20:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaDr5OlXHvN5; Mon, 27 Jan 2025 20:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A18606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A18606A7;
	Mon, 27 Jan 2025 20:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C336AF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 599FD80F2A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uq3nlGw8VzF4 for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 20:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70DEB80F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DEB80F08
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70DEB80F08
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:59:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A17E6B00565;
 Mon, 27 Jan 2025 21:59:10 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45270])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Jan 2025 21:59:10 +0100
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 21:59:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250127203256.10523-1-peter@korsgaard.com>
References: <20250127203256.10523-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e50226f466952b3f62de85ccebfdbfb3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738011553;
 bh=dRArhEXp+qJcLsuCclxpwwMHn+kZnkAgu3vCdUjVsLM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tx+0q03ECrAcFk2t+tCJwm/E0nck9mKuwawYBupi984kc0TIOSlpRuETmMr03ZLt8
 3XwsP0579Bez9JgMTv+kU4zAb4Y5WnBKRKhQ0P4t7gHRmAe85avhzPDHg7Qxj6Pdxw
 /DGViQteibcf8D4tddrEmIzl6GCi3Pgec5dLQ75XrPLzFmm+IsA4mvtrShQ91kVz0b
 kdnxyntfaNHdVrnQZ2qvpVvZ2YvaQSvmYEXUl/UreAcn4uw9j0RbCWfYwrY5qB9wcO
 mUCA8bk52cgjApUw3qWNFUr5+SE/HUODQHko31V00ESnfrPw6UXoFfHTkSCNKQO5bs
 8TQE+Z8csVVqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tx+0q03E
Subject: Re: [Buildroot] [PATCH] package/openjpeg: security bump to version
 2.5.3
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

On 27/01/2025 21:32, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2024-56826: A flaw was found in the OpenJPEG project.  A heap 
> buffer
>   overflow condition may be triggered when certain options are 
> specified
>   while using the opj_decompress utility.  This can lead to an 
> application
>   crash or other undefined behavior.
> 
>   https://access.redhat.com/security/cve/CVE-2024-56826
> 
> - CVE-2024-56827: A flaw was found in the OpenJPEG project.  A heap 
> buffer
>   overflow condition may be triggered when certain options are 
> specified
>   while using the opj_decompress utility.  This can lead to an 
> application
>   crash or other undefined behavior.
> 
>   https://access.redhat.com/security/cve/CVE-2024-56827
> 
> Release notes: 
> https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

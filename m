Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE1FC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 23:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596B041105;
	Mon, 28 Jul 2025 23:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3WuZ8t4RdiN; Mon, 28 Jul 2025 23:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F60A410F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F60A410F8;
	Mon, 28 Jul 2025 23:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 745C6D96
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65FD840B00
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bQ6ZV2eviht for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 23:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CDC540AFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CDC540AFF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CDC540AFF
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:12:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C6B1C13F880;
 Tue, 29 Jul 2025 01:12:55 +0200 (CEST)
Received: from [192.214.236.6:59014] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 01:12:55 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 01:12:55 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20250727110031.1126248-1-thomas.perale@mind.be>
References: <20250727110031.1126248-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <3c80fd880b2d7145b74858677296c803@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753744378;
 bh=gw0mc2kTnELGvOgBPli0F0JCOGNYx9Ib3J4QVSV3CIc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n7G7mdStgJ4QZ5o3BwKy87mmx2TppGtA16Uaas7SMgggFbo32bN7R2JI51bQ1L6pc
 x+LU5qJB7PyRElZop3es+j49ukJV2wU3PDWWAsm1Gt1sTn9pZnoVA8woOgQXq/4h2Y
 exHOTwWgVphBsShiXMHvYBgtWtQrCelU9nfchrit8dHsrG0eb6oFsL55uE8Vihbyjk
 YqUVJl1Tam2KpkJdfWzEUi3cxBKlFX+pXa7jEEWOUf504zzYyTB/jeaDld++OHzLPj
 ZkmVAXqiEYNzisFK1QTmX0C59xKQiJFaHRK5kSkc2U7AJpXXYFXtulPaAcAeLtjRQd
 DXFyGi4Pwl8hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n7G7mdSt
Subject: Re: [Buildroot] [PATCH] package/micropython: add patch for
 CVE-2024-8947
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

On 27/07/2025 13:00, Thomas Perale via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2024-8947
> 
>  A vulnerability was found in MicroPython 1.22.2. It has been declared
>  as critical. Affected by this vulnerability is an unknown 
> functionality
>  of the file py/objarray.c. The manipulation leads to use after free.
>  The attack can be launched remotely. The complexity of an attack is
>  rather high. The exploitation appears to be difficult. Upgrading to
>  version 1.23.0 is able to address this issue. It is recommended to
>  upgrade the affected component. In micropython objarray component, 
> when
>  a bytes object is resized and copied into itself, it may reference
>  memory that has already been freed.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2024-8947
>   - 
> https://github.com/micropython/micropython/commit/4bed614e707c0644c06e117f848fa12605c711cd
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

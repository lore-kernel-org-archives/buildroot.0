Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D75E94108
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB0C60791;
	Tue, 30 Dec 2025 10:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HvW6jQGbiPJ; Tue, 30 Dec 2025 10:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C37607C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767090846;
	bh=K3Ssj6vK/MTo3BMqS4R7HoFv7VwsiZdnqty4Vh7zRAI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gZihLweSXLILm1nW+zo9Ul7gHn9qrp6eoNyR3NTK4w30VI5SNDOLXz7bQEkH8U3VE
	 bgpHifSHIojgIPbkZW6nauopYlh06LqCJcRCcXsyFmKFC0UqpKoMzTr+x+BIpMvO0R
	 KUQkmjE2XbpwqOdOv80uxaC/Gr2leRxzwKEWVhf6XXcwou+xz43fhpUMxTz0Mg5A44
	 alhAKHf6xCnIhzL5j0A5/OF8r+CglevSGysPtM1PoVBu9UU/eHec8yHWLE6EdVBpcI
	 6YzbbTXvl0pIC2xD/QMzHRL8msHbNIkcq+d0KJVg+hNfrZ5p1OTAjGX0QdaIs6BfLd
	 9C2/ft8+g0uFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C37607C3;
	Tue, 30 Dec 2025 10:34:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6547235B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B36E817A7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krVH3-_bMpXJ for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2036E8179B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2036E8179B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2036E8179B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:34:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 86CEF60140;
 Tue, 30 Dec 2025 11:34:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 11:34:00 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 11:34:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251229081435.620201-1-bernd@kuhls.net>
References: <20251229081435.620201-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <17a471e7c717e118088a0935e1507be3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767090841;
 bh=TOI7LbM2fO8UrgLP/k2NRfhJK8/D8bJ9SaMRpCZJbkE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ODVX6gvl6KkHMb1xI6L0J0dT8H8HQFzEN8OzmxJMTwgUiudMQfxGyDPSDevSTxYrG
 byJvThUjE4HudX8eATtRnK+ZRxfwIS83itpWFHkTqC5V/DHZOQ/HhLKJTbQh/JTLfF
 zn9r5bpJ9vn1lcUpQiwSnfi1C09PDsb8KVP1ygTMa9nigVMdDXv/FHSq9TfUExbN2G
 jCdzEYQCuWDZ0pfzBKRCuDK2XDdHRJis9hbozbc0OTSrb+jSqq6YrXYz9BsjZ5kGyy
 LhBgBbvhsFeL7okGq/OkCqYJMWPLqKBMQINYPDYfdvDOtT/S96yx0+5micyUGLcgsL
 Dzo43YQ9ePhqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ODVX6gvl
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump
 version to 1.0.0
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

On 29/12/2025 09:14, Bernd Kuhls wrote:
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.0/ChangeLog
> 
> Added sha256 hash provided by upstream.
> 
> Fixes CVE-2025-67899.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

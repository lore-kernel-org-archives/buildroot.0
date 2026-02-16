Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB30E83836
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 21:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84F060E3B;
	Mon, 16 Feb 2026 21:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldTz6Cvf1dyS; Mon, 16 Feb 2026 21:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C31DF60E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771278328;
	bh=T6a+mKV3CPGJ1EZpHPvORFP5ROWH9d02LUJwpYegci4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JFHZbqphXh82ADUICoLgieDLettKVVy1KRTHrRb6E8ZJgs8qSBzWJTE/SeDKpOqHu
	 hU95STbRqxzwx75vW2YBnJKutGHJI/ghLU9AVX/ok8d7peAfbFA+DsRolcP87goHmg
	 257YV6HdopeD7NSIgiWTC0Be+bumuXL1Cv+K3SFcZCQgEceKXTRRYZ9DAXNgRj9gIM
	 MjzRXuFaWaUgQAi9njIYukoLePIqdWqOSO3ncD8VgHEiCjUiQ7j+289gSM4wXf+wc0
	 oTpyZNvAfAtRyQ4PvG68djF+DKaRyDQuqIlWoW8/bRdJYb+ZcjMMo3AElRsMw6Xo3D
	 /fgIq26YllzLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31DF60E1B;
	Mon, 16 Feb 2026 21:45:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2B1270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 692E160E1B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fjxvqjneznzk for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 21:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BD0B60E15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD0B60E15
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BD0B60E15
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:45:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7171219F57B;
 Mon, 16 Feb 2026 22:45:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 22:45:22 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 22:45:22 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260216191333.2170402-1-giulio.benetti@benettiengineering.com>
References: <20260216191333.2170402-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <47254290ba3ad71e292f9f03049db2eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771278324;
 bh=H3PnXFbRcIpvpaW3ExKZX2irpqRNdTW81CzT67rjBgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SNlaaT3o2BTR4bqb/YBB0/3mzaKwqP2bjhuWVHAEKWcA3nCo2HsYvHR/piuWES79l
 nJ9bRgoCUROHnm35jvlUX1sdE6d2CZSHmLeFgpnuQhmWPVKTlFHmdLot0iS9+7rX69
 CNSNzXcHzzE9lOkeQOOw3tZB4KKyUvq4CxnlJgxuwwMYIjGytw9LoQkfOx/ajX1Y0i
 Wlp0X8xV++DbGORPI3uDCxZ4E6eXonoq1iUrSg+I5wn02dIZOSwDp1cCPxwr1EUbkd
 VzGIhz010ieWrznzO2L3ycCrFeJYue9go0zY3qoCmllGq+5Ytw1NQZG4e/DsC2qJuE
 l3BQofZ76Ct7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SNlaaT3o
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.120.1
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

On 16/02/2026 20:13, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_120_1.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

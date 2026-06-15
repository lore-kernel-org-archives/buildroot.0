Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DB3CD98E6
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10F18454A;
	Mon, 15 Jun 2026 20:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6obDFiO-3Z-s; Mon, 15 Jun 2026 20:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F88F84545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555793;
	bh=YkYpjT4jDJ4ItEUzlzeAXXb1Y9QWHOEA/h+uZOBITFw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XDyZMyH53jRTLvOgGQvWkvzUMFX+9V6SBgFwkZEO1ShnYp0BigdUApSeDzCSFWr6A
	 AVI7obcKT/1qXz84d+AlDmaVBWtunriBsD/W8uqH9CpHsHf9IU/7xtwih3vT2JOmZu
	 gJIhf02yIJjJvXGXZvbqVb4g2E/1CIuUPKYk+czKWhBgoqT96D/Xi6luuuwNKHK1e5
	 6ed2hBXGWAAdme1EEdB++xSrccJaaUT6mzE+QRhOS0TuETg5EkzqkOtNR9kN2cGITN
	 Dj/9CdXkVeqaAJdjiG4RNTmSSO/zplVGGtDiJA5FhJembxJSlLuwACa4qVW6kAEGgU
	 P5tqaLW2L4f+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F88F84545;
	Mon, 15 Jun 2026 20:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CBAE2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ABB984547
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqZw8pQzF_82 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6350684545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6350684545
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6350684545
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:36:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 043582003C1;
 Mon, 15 Jun 2026 22:36:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 22:36:27 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 22:36:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260615053555.1112644-1-bernd@kuhls.net>
References: <20260615053555.1112644-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <bc86095db7cb48d6ca150f5b1f621008@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781555789;
 bh=J3jtGuCtodTRMi8UNdCTfsskNNhYRJEBgJstaSWvwRs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j5SYXijcp/XuyEkgrP2QzSG1wOeU4fO1zfwJlWCBvC0HInJHiwr5F+grOqQBAFW6h
 jt+/PEp9rP6llrAC/010+GAFlYWrMEkW6Zy+/GAUZ0lPtqw8TlGg4CLDmEcdXGIv3M
 4mTVT8xD4WpIH6fF5UsfeCNvotIQfm9xJvseNypp8QwnEhYzGmuCWmyTQPt3ZQSYTb
 LSoob3GjcbHRkeVskDCTaZqxXvkStafjTX8Loeq/MbkHjoR+XpT0oD3iRL3yKvTdoU
 juuTFUPo3HXC6dynBoNemfDxyXm0LtY7xauHtNgzGtebTi2wdXvyAeKSIOUaI5SoX4
 IGg8gWUBMfu8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j5SYXijc
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.2.2
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

On 15/06/2026 07:35, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.2.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1938E85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F336112C;
	Fri,  3 Apr 2026 17:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK9gAlDlR-ZH; Fri,  3 Apr 2026 17:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9316060E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238275;
	bh=VtbUW3mSWafRu3GXkFkh0EjY+721aTGrEbi6gWfi8o4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gyu0rgzufBjTwCIRsQjs6LusGGyi6PgQHls6uYaMtpenOe0Y9wNS9uU/5PZJ8CU1K
	 gaYdj3dzZHHGNdgUWo8i/AF6BfyFZ8bfnFnuwp3Jc8CaNr3vr/MXlYkyx4YLln0+HO
	 Ivq3QxVN1Ds1FGAkrD5NsdgP8ZvtUVA8EiygJJ8C5vSmIHC7jpChhny9uqVzjDip5O
	 0WBKjBEtAmLNJ2h2kwvu0v2yX2XHwYKIUL0OHp0fTkV5w5wPL4YjAyPA9I078kAraB
	 85AQnNrtSny0U2JPst6Ue1FcQ8fPEcBkwarQrcBPfbTNvn5PgCa2RopvC67J8XOOT5
	 7rt7KPM2rCVuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9316060E9C;
	Fri,  3 Apr 2026 17:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4A0D1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A7EA411A2
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwnK7FrFNFX7 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89DA741195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DA741195
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89DA741195
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:44:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9C3B76014D;
 Fri,  3 Apr 2026 19:44:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:44:29 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:44:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402180434.2780058-1-bernd@kuhls.net>
References: <20260402180434.2780058-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5767fe088f79b0143a0a0fabda62f352@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775238270;
 bh=xVNB0mTiXfe8yXS8Osilcs5dOgPJ2CXA3nJlhJAEwB0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p4Y4XwvSj7W6+ouI68xowKUk9N1MKdboWeSxFHFuIRhPC3XCCbPFwUZwsIsN8mSHa
 GCzQ/AmJervn8+gXtSPJUeb2W3CMJiYrmfuW94P/hadmX4BenHD4kBtV+8QL1LvWD8
 RwfI5k6DsqedCqQibxJfk/nuLUlFyukWSgVaqIqtM12qSGIeB0G226eRgy7fHO4Xc8
 u8k6+vKXuXyzz+EqJ+HFP+vCDXFEjvp4CuB2T3YhQs5N+2unMTZvKHWozP72Lzry1M
 qLdcW2NQHkuA4f8tonbKDlikMyjg29J8WAYKjSsw45KRT5iIoU6fj1rBlc95hqUApL
 oRJX/9zNK29BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p4Y4XwvS
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.406
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

On 02/04/2026 20:04, Bernd Kuhls wrote:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.406
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

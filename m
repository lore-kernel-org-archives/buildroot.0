Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FB5C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639BB40CF3;
	Fri, 18 Sep 2026 21:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sql-whsn6gHp; Fri, 18 Sep 2026 21:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 99E3540CE9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789768337;
	b=prbM/8Wg7skqcX3USmsn1NELU7u/HWSG9tl4RBbz31fNL/b8xY3ITT+jHHtMS4RRvNoc
	 Na/EzUmzU8Syz/BSgGG6pTq7QbYOC38uN7xRThnSBjGxAUQwqrb1GL6ZyrkVIzKmlY5Cl
	 vNjBHmoGiHj/LRiPqbqtm0LZFKZr1t5METHp1b4cHd1QKuC/WBfFTJQp9xBo+KVZMufp+
	 WRaw4hYnBhW5WJwoXVKOv0CLm7smuD/jTmDCXp5ZhlTctDVz6ivSYYlUjp3xcLmqrZn17
	 fPOARdMMj/sJSCmbM9heUZ2tkTzKVOfqC0nKvwl1rAOkIG9yNSjimpL5gAiqSK5xNug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789768337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZIGDNCtDehLCXzyygf06YifMrVnzHLEjcigEG4+eilA=;
	b=okdYrCnB5KIJltRPw2CLeyBHqP/q9+AXGvGebEg+2nf4TFOHpYHeOb7HLd9K+htdSsGD
	 RPiKoxfP6CJCrO52qmhn0ZABQwTN8iz3qdx0KU20xXNUeUFYfslLOxaw1XAHa/+4MfZrX
	 XLefxUzFFMW3b2BAjnpCSFUehR2WJCBwnq7T53WK1NVG4OOcR00/fkBGkMvfV+MDTl4Zm
	 RI2aK1TIYBuFQfB4EO1543pxiOB4j4HLOXhDLZmCflQTQLsIqcDUCfSLEmmlbokHXFXOA
	 6pXoDd1dAwyBBAWUhu9zffv5djiX7SOL9yPXTXwuQVh5TlHw1DoHjfp4XkwvWJfFC+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789768337;
	bh=ZIGDNCtDehLCXzyygf06YifMrVnzHLEjcigEG4+eilA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lagjWm7PQA1noSCYuph55dOvbv2n7FbD6wpFVLVFOAshEuf2MVFkOSpd6PMOGWJZb
	 maxxgZa+wvPKOj0xq4163W3OlHHk3RKxT+1D7lBd1HwAadQWS0Xy1ohoVjGAyTCiOe
	 MsGDALk0Q+dHt1XqgqQWfGopfwSpSR8FVeB/KUxxRALeVy1dVpU9hh09a6GtN9o9KS
	 RM/tMiKitdM7/ypUT7Rk2yBjW1+DgV+kEi4iVDRN6Eque1ZO9Kbg+DLahZ2MwvmoEa
	 ij4U7Fz3iNDzKKK2/KPXs04UFvgtXJf6ZqBFw3wKGKgSxSsYYXD+Gfb/j8Dv6IwXOs
	 PzKNWdZWIHaaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E3540CE9;
	Fri, 18 Sep 2026 21:52:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2403B1E9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A21740CE9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2cZio1Obngd for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A30D740CE5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789768334;
 b=S78WU1jU9nnFuowyio8xml3AQPr4UdF/G7/h+riyQozN45iyx2hrSTLSEmd3TeAQWCfB
 LYV/BFQpq52/jqq1/EekVtfiALE9Cl9xmA3CYlE/c1XR8OxuLpm0lKPhyiyk6H0wOznHz
 i8o1TEfbLEp9HzgMcBhHFOZl8zt9WSDUhtancEHwULwe/gIUHh7UIG6Vx1JSffVrvp7w/
 j7Dyf0j+xf4PTnrz8cxwpMOlPYUVEx1oTimD5XlmVwJWY/CTRSdvcUaG1WH1xOcTOJn5N
 b9rFOTzl79P7BLRYhlBkQ0rwQXZmnCR2XYJynlGP7rDKrKaMOs3J4u0T8NMEdwtujrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789768334;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=eZJ1lzlt+YFsepY0FCBTQ7f8v3gapDGyT5cFlIVB1a0=;
 b=IOB5EoL1Ao2P00BxSXJwfaDhz2JILX/sunfhOrMq3bm/F97HP33zWiriiLU89BaufRgU
 jJ3xVjmVkAfxa7iYUlcGJUx4lPYNsSVKUV9QURtz+FcEQcavx/Diw+mQ+i80nWX2XclVw
 bI/bSA2I7DdgxNHKCAubQx9wBFsUSNRft7on1OhG8XU3w62jFcCHnv5h+M+C7w9fOGpN+
 oFoKlqys+tiPzIUfDx+N0jDYqYk/Y8aJPBAPLsMj2YDE3wqgW3oFmE0GXK2vr7jkqOXwm
 6bnpYjZ5XdVQpSQ0RomYfEtXQO0IGNyjf3zBWWNHopwLB+7V01tJhilduqyeFwGzd/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GyFdsorV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A30D740CE5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:52:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 83F8A1A09A1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 574CF60649;
 Fri, 18 Sep 2026 21:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9C5910328ADB; 
 Fri, 18 Sep 2026 23:52:06 +0200 (CEST)
Date: Fri, 18 Sep 2026 23:52:06 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aq2ygVn1UeCXys6a@windsurf>
References: <20260906215252.499931-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906215252.499931-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_squid: new
 runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 06, 2026 at 11:52:52PM +0200, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

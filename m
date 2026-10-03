Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACF9CA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0D8412A3;
	Sat,  3 Oct 2026 12:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHM_UhV3dJ1x; Sat,  3 Oct 2026 12:34:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7386C40FA5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030891;
	b=ZRW/zmrEnUEThHWYr4rSNiRGOyMP9yxfFrZ/v29paxfBrWZcJDU3ZE9SDhkEESKDuVM+
	 o6+HMV4mscuBCO1aQxLRstjZUHuEHJB8yRkhu5b4UAQ/tOWIgFX2LCYVN9rjml3LSev4+
	 6czySixc5eOw6Sz3vpHka11r1YpA6S6RiBZ9UfY1DhFLCudxeIXo4qaGGqZ6jQ9dZZ/VO
	 2OHH+GoSONbn6a2qdJAnzpWAi0h2ceat+gQ7Y/axCVV9aa8ZTjqJx9uun/RAFUd0Jopre
	 fiEN83EY3Hip7C5PqSVpktvQagCvBvxGYDt7NC2+SS3MrkvoI30lPPInmNuVz/77A+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ASKNck5uoX+kwpONezDUKcx3qxXBHW0JIrZgWnIB3Nw=;
	b=geqot13eBLbeHHku3BO28p/sgOQ7iBADSwLceDQR6oefD0rhUC6rWyvM2PN+sOG+WIrH
	 BWDGlxLv73d6hzEZJs3NdjRtk+P0y+3GZlh+2gan5hA+mSyiy1f8yAwNCruXX5YHnP8++
	 k4+UG4QjD9PT4+kI7WaAIVAIOxhgrmAexzh2ggSiBWRDMCCvzF/7QMfPjTTLS9HGkSQs8
	 MuZCTjiUz7Ul1SLG3H2qpt/TfmA/peUrecSblOokYwTyuFUDvGWoO07JErLRUW2cHpusx
	 6XwOGNU2thjLlhJNqOrqAxFcvPuVLenQg+g4D337YKbEKHLnj5fqpH1MKpx/Hzt6iQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030891;
	bh=ASKNck5uoX+kwpONezDUKcx3qxXBHW0JIrZgWnIB3Nw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HQGW23AsAOCJk0UzsvhGQ7gy3MSiyWFpka0kcXPjqHHIh18HaPQmpeOWzR0iV8BDl
	 QhhgXcHNRHylOg2HdCrFPnnxVEPEtC7RAm6OL6nvBLA5QvFit84F1YGrnMjFqhYPim
	 NHJK9+cfR37W/Ti8tNlStrlW/+vDC7O0bl7DgvcbOc4utbPZV7QwtTE+9z1jWGwj4g
	 WN9OI6nWeppaDCI5wWYglm54HiEfas7uaG1t237wk5kGr2qnJuFVgq7i3yLFY2T8Wh
	 gI7f6rNIrYXnVo1lOlserUVPtSLkLoW1Qz4BVaNTMqACyikHXakHB5J62TwlQ4gezu
	 ydnqsKe9qV6Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7386C40FA5;
	Sat,  3 Oct 2026 12:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF0412E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC81040F9B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtqo-JYCFmBT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:34:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6EBAD40F91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030888;
 b=Mf7Poj+Rtd3A2DQFGJqewd6XAAwq3oyyxv433cnkBQOEEiuG9WiIuerB5PTmNb7eF3t5
 Y8WWd4++i8BPh5xAgqjBW47McIZeFTSMO1EXzLyABcmoDXQDOrPYHLzvw+d8pZmEDmj3y
 YoSgxAzUrMRAAwIlHNVUG6urLa1BA8wuUeGKW6eNftAxAmNURbJS7roAGNLpmhKoEEUn5
 7uyWXQxQhQL8eoDZhWC38zvu+WKXeLtR6iEaqRS4KwMZVPUgfyeMLxWX74ka3oTuaQ5BH
 +6HB/8egHDl6jhVratvVdP42MaY5pMOQtUPU5PH6vNhKDjjsSNL0Ec+zChkccXC4cTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030888;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/Ojgi5u27z3Fnm38wLDeu0G4/Hfd7uy87rBUpZrB8B4=;
 b=UF6ip0iOQzEEumLdFD7CP+GnpzU+KbSOhDtnbStdnvghZ5Kf5jLkPrkFA/N7KZzUNyxx
 uNGAqj1RFG57VdYLGHaXly/ApP5KXzqD3Ttm5VZdCH2OHT0ol73IV711FL/npJrENr099
 /fmNi/nuSs4xFmwuCf/lGk3wovanNJUisi/6ITiSUs7U21OGQhvhkHXHeuzXB6eBK9KAo
 b9cetTTLfZqOM2qyHdtJA3dC9yV7XEoyCuwB0iFVzNRhEs2hB6ldxT2mff/Y1FoW3aO35
 4xpIWTQH4tYcXCQEwvq/dtv/0IVJweXuxQfuGL5nwrhRIoVClRaNyBa4LzKjDQ0PYEA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JN2H8rIf; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EBAD40F91
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:34:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D912C1A10F4;
 Sat,  3 Oct 2026 12:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66BE4604FF;
 Sat,  3 Oct 2026 12:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA68E10328318; 
 Sat,  3 Oct 2026 14:34:42 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:34:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <asD2Xd55xNCm75M2@windsurf>
References: <20261003084453.545653-5-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-5-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-crontab: bump to version
 3.4.0
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

On Sat, Oct 03, 2026 at 02:43:50AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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

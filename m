Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FDAC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2644605E8;
	Thu, 17 Sep 2026 07:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvhaukeNKjOT; Thu, 17 Sep 2026 07:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CEFEB60604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631113;
	b=oI4Yi0N+DTd4XZqQDZ6zLfas2PjBcb6eZWcE8/wCk7X/qGzR+OVULviWcenzt0vmGfdm
	 wrAtpPc/ysz+XCuTmd1r11TgBiLMXtuCNX4J9/j3SVHd6xkqMTUUDKoTMqdSQkDRkBOHB
	 MOblCe/qUE05p1hA3H6R1ysBqXAnBcGKx5eP6N8oobuxAzOVYbHvJ4FgGZbBi5pUdvyNo
	 NBUOznZ+hTMCb5RIaT0bwY22uZ1RjurrGb2ptmq2vr5hX0NrRp0EiXE+BZ6/6C7V6wbJ/
	 nTdmcHSVyjhKX2a8YNulo8kpJrYN67FNjmAmhzMpWTxZDGZ0M9rsE7y9hj6O/ENhctQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GLd6Hv2lucsQYn9tXp26r/scY4RhobcAwC1gh4ExVKI=;
	b=Ro2ahOY46cKYfd/PPIylfSzC2bMLXnkze+cxMZnpC6sYWzZngJX0+0lSf/S+HU6MbDdM
	 Ln3JWSdgb+YDm5Rp1IFHyhbQnQZJTMQnZi9pzSKriL/KkvHuBBh1iDrHq/DEf43QZArK3
	 iv88RJCEMzNLjs7tkoKujEfdObl3zSr2GDI4dX9LeRjAUg8qqAyzAkz+1EIIvLxlWECxA
	 GIAt1KnwiK86iel9ZX8PDIa0jTHLzV0RFozyh4EJN9vqi8xrGkG+KQrmAx8Ph2YWyVdw0
	 pZ7EvVMW15T1TZ0aIDjCL6M+cOZ8kqC0pTBhOGfBpGo0FQkP6NQcqIjhU6P6GX2MFbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631113;
	bh=GLd6Hv2lucsQYn9tXp26r/scY4RhobcAwC1gh4ExVKI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bYSlOhSkBIOnIFrmyWR4tUJopuSqTwKk22ZBD9Udn7hX5ge4VXZc3rXJ4jP6rMupr
	 r6rbaKjl8vgNH4ruhm520GSuJGU1DcNCYIcDrBjhCzdOPqzbuDoEsCe4TInXmdkxj2
	 lVsjRcu/vXcLN5dvwWHTuPPIibtQ0DPg2rXHKTkH23T17UoZZaUVQcmNGzQ7xX7K+B
	 LR5i9yAcntCl0Ym8ARShAXQLdbK714yaHmOQYJlwUpO9xtD/9GaWM1L913pQkc7CJo
	 JVvbu+giDHslv3lyenmbWKpTY+Hcm4lvZyR1eugMiVuHSdftlBJZ7gtJJgpZjHsuZH
	 mMeZu60wUvvcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFEB60604;
	Thu, 17 Sep 2026 07:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 806E124D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6690C407A1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9kt4YhAmeUt for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 01E234079D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631111;
 b=lf3pM0jN1KFtaZXDFI8eEnuB1SrFeys1XVx6DwPLp5L31aAln05vMpcGnimxTVWUyzps
 R4Hg2VDK8uo9Pi9fP7puaEPRN8RQOCAO1PHL8ducIHDRdIIpRULV0CUQN+7oR73QQUtia
 Rrhqm5DzC8rs57NZyL3srgG2crKzc90T4lKJGnIg2p7ckaCOb+1n1EkhtemIHAwtarzhS
 qgAdpE+FrtOSgQq+X19AmnQX5nn7XIKxs7iU40a/YCCrnbwgygNDAy5SpTmWosQmF0aky
 m5n+YOqhPCKeOYYafBWVVvLYnaW5N6wntCoov60Qoxgt/VBK1qD+0SSfub3S9YIat5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631111;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OVcnbsMugTfo3PLRivHUkX4eKNlkUUMgdNZOdujQA5U=;
 b=GkXNM1NmRxQvS90edQ58PIMlCVLlrnL9hsD9Z1b5R/k6UZm7SftKnINz3GewqglZ0CQj
 QmMENV/PMYEu3b9Adk+j2jfDki+Hz4LvRVk8U5v2NPvv8MbLoL59j4XE++kT2WmFp8tl7
 PwaQWqF85OgpmYmvGH14VwN3cyxvd9vL+a0e7ana2tWpcH43ZYNwNbCf4cMqLLJmwRCna
 mpR/xhCD+l4dhMS05wsnwQziD7gZ1DF443X94gSzaRMfiKBfb4X9GnyauAr6fhSZ98ii8
 dMZCVVbH5vGS6VvQvimHJdZ5XPCdcNmcIivnsHDW3yLNJpWmw2RGGL3hykmjkmwu4kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LBi7om2H; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01E234079D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D90544E40786
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A37AF5FAA3;
 Thu, 17 Sep 2026 07:45:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0F3D11C7B05F; 
 Thu, 17 Sep 2026 09:45:06 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:45:05 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aquafj2EWB9rUyPm@windsurf>
References: <20260914083802.3268655-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914083802.3268655-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mg: bump to version 4.1
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

On Mon, Sep 14, 2026 at 10:38:02AM +0200, Joachim Wiberg wrote:
> Adds double-width UTF-8 rendering with Unicode 17 character widths,
> a new line-wrap-mode, shift-PgUp/PgDn selection, and yaml, text,
> git-commit, diff, conf and makefile modes with syntax highlighting.
> Fixes shifted-key selection in VTE terminals built --without-curses
> and several ~/.mg startup file bugs.
> 
> Release notes: https://github.com/troglobit/mg/releases/tag/v4.1
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

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

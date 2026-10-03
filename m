Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77520CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D48860652;
	Sat,  3 Oct 2026 17:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pug0WTGh3adt; Sat,  3 Oct 2026 17:34:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1C3F960DEF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048888;
	b=cvTLqcfd8VoZ57HVv+bmdNBjuQKthJ5aPaoeGuNznHT4SJsrz1S1XceqwguoY5205Ew8
	 6HS6zRUzRxvCOQz3mW5LLL8WTWEjQPJsF5JyD208MQuEtIeWUBaTwpBV2e0/nnkHSqB6j
	 RZE6z3CAj84ucE+6uYvm4JDwJ36Xw3A9tlmXiqyk00drAe44Sy4pmz/zvbGitMWXDvEcL
	 B4P8duOSk0iV1HiKg9DKqL8mwFlboV+Nb+WbmCYSYMtjtNltt79SS5BRDvAnFO57Ky9eV
	 JugmWrkoTWzQyx6z7F7OLdLicIfV5CI6RG1ArVl5CfkeWOaCMM9Zm0b/U+VQTknf8Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pe7KAtp4rDWvDtAO9s9wBzxw3yS4LFc9tCd+PoXoOoQ=;
	b=XtKhBCKC+oSbV/ngDML8lFWiNCemeq4MHREOHsZjErjjeNILwKCUPLP9LZxjz9DBlrXa
	 rLy2libXkJRXVL5ONptkdJ3c0J0pF+QGXzzqT7R6byUrkV+Em8DCiGiCYJVCNnlPrEESU
	 iRUUZygDs9/eGT4uVb9DBwGNseskm+ubvakH9TlfJfxgBi617zKvajZWDCVns0t8snjqi
	 VNH+pF1kFV1xnkqQgv0c4fCC4ZMKr7iESm4BRwpza/rKwY9ZjQPH7sYV/CaDyrbGDxuVf
	 EWpGlIz7N7oNAV9vkJVFzJAamq9SL/KIo1X7IXHVQ+C0YBnevaWXFR2pzs6LS9s1CLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048888;
	bh=pe7KAtp4rDWvDtAO9s9wBzxw3yS4LFc9tCd+PoXoOoQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TDtrwTKkwjDASjhLzzEwV/guylw6lHXs/qUYk5lFv0PXOtYJNfVrVwDD3i5GN8J7I
	 YuhFKknNJ4KycfVLJ3K7N+BODN/k79wmh9S5QrSoxWRE465PU9R89WeME//jOXgj/C
	 pIUBa6qhFJQgYbHFpsQNSeGjQ5g4XPIMi8c0TPDPw8ZEAzIkGCZ0KQ7oPU48X+aTOz
	 Q7vp/L1sOUfz+uwAD9gyqtxKal43N+RHiISmjovH5FD+FI7hSXgcmPJiXo4AARVTed
	 tjTDDhg8JoDNm6ZfUDJZUeeQCEPPxtewPbuON/bfrRsci//tyTR/KyIbSsQsEVu34f
	 e89/+KkHCEUZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3F960DEF;
	Sat,  3 Oct 2026 17:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9234435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ECAE40859
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3eqVy4JOsft for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2D1B04083D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048885;
 b=fuQ+e++9gz2U7+T3yBsCpEOhgTXqkr0X9NvIbPCOv/pgRib6/Ffey7ctU02HX2FVT0zf
 6cObUJ1enFoG2ve1CCyaHu/htfnQRqHTvWuLVKmLPrfh052+AuJCnJDNEIatcQhExB+VA
 u/JgnzsRp0huqxxaIMYfC/I2inXH+hjJu2nzOayXpm1BaZuSOE5QhqEpvDpimdBNKIQdF
 YE180FmCp44kuSsDqg0KYCtV/0gleu1KiN04wVbs1EhnT88k5jrqGIngPk6vrsZnOm+0G
 lcZYcIsbmo4uSgttHl5d4A9dT9zfLErAgyHBgWroLB0Z+tWTh+TWm2fqkxhYy/BKICA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048885;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Em13cexxmg05OkJaojKZNFuaQk9Uj48sDUl08vQBVp4=;
 b=lBAJv/l21dfBP/dQVDqK5/tUQF6wmfBF/iNp5DN18046/chrS9lw5EZpiKG/3eltJW+p
 L+lUiV2rLQVJnTHU/7+NaQW97C+QVjRXcp5VTmjw62C6pMtkqPuXhznf09dy9AvIQ/Tui
 U9c1ncgv5PrpkGImJYUUwmKKTUwGZUK3FL4N2ZVF1Kb3W44AoVU/oFm/T/G7XhJ8VcEqb
 0H6QmjeTLW2+brc5gIpu9H17q48GJzjFYXg1EmZMaAxWNga+J7EJjPsi/8EWz+QNC4L3B
 wcNYfoA14UBCP7RZmaZ3oq4ehz0zMT+xL7jjn5F6vrEJq6kyOkC1zK8wYro8eWyfVAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qA4Tfjyu; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D1B04083D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:34:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E45C81A1108;
 Sat,  3 Oct 2026 17:34:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A7D68604FF;
 Sat,  3 Oct 2026 17:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECE0F10328170; 
 Sat,  3 Oct 2026 19:34:39 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:34:38 +0200
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asE8q5kBUDi7_TGf@windsurf>
References: <20260907060812.31176-1-sebastian.michel@oss.othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907060812.31176-1-sebastian.michel@oss.othermo.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-servestatic: new package
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

On Mon, Sep 07, 2026 at 08:08:10AM +0200, Sebastian Michel wrote:
> Added package for ServeStatic, version 4.3.2.
> https://github.com/Archmonger/ServeStatic
> 
> Added a runtime test that verifies static-file responses through both
> the WSGI and ASGI interfaces. Also verified that the installed
> servestatic command-line entry point starts successfully.
> 
> Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>

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

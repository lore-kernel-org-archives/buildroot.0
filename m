Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A02C9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABCC80D7A;
	Mon, 28 Sep 2026 11:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DnP4H2iWsyx; Mon, 28 Sep 2026 11:59:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A8D880D97
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790596767;
	b=h9QuUU6KvVqdLzAkxn1nMGb4qXi+JOzp+lHI2Dyc+HkwfxyxkL8XM1pqfElgESl3P6cm
	 AXJ2M2xzzorV/FjbxEgMWJUhlATghQFJ/gL3+G2Hi1Ru0D+0Pneqew36OPDa+P86cDkV3
	 SXBGLQuZGa+tzrRWek4x9fD5Ze/AjJXlKsPllVuISeESPTLsFUlWx+p1BGww6LmIWF9Mo
	 pHcd6I338rn8lKZX3X76DMg6QxRyqEcaysr3rbFQIUwpZ+PQWEY50mjdkMa+1SbVnLREP
	 waWEtvkrblV1yaqz2KjirMJjnpliEd4ooRsvDTV5oNMsWLGpVQhvEnC+uSJ+9PDAGlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UxcELkUK8g/ng5UgT0StYubykImaV8rlc1ITsHlKcz8=;
	b=ViQ7vdunjJqj1gpZkL+nI1De4W+lIhRfhjoiDnmBG1gMBqbEmND9jyUF3bFENG/fSgWX
	 QCFTwQCZiindANxlQGHI+I42IVxNsftdGigF1sfOZFORuieHF0iBTz6czmbkTTbF/8Vgv
	 VL49hrpUXCCxHqq2uIHS5UhYeXXwzDE3bbwesC6MuvNJuRqi7DSd12U3Z/SQ++spVyp9i
	 5BZjOgx/egsyG42hEQGS2sIGArPbk8d3Sw9cmMnb+zANZIZeAMN7LjZJEvgdpbDzlzfMp
	 j+sOWJ+vx4yZTguj6pyMWwX51CI8b0ZO+YfChLCbr2+oAGN0mnd5EQamB1qnu3EltoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790596767;
	bh=UxcELkUK8g/ng5UgT0StYubykImaV8rlc1ITsHlKcz8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B9EZkGbFzIPCeBcrnDgAu4zCvZtopCAAARHf540QTEckDwrE+1+78yJ4PYUnrEN34
	 Qnx1EPpoyVlUVGA36LNlhPwk54TBtQnfugKE3YIy01Z6vZ28oOwCG0uyz9jAaXteQh
	 2ruVN5+K9A9mBB45Lui+X1HHdn1SerE3+87RqbrG+oGmuWEXnNt3FN7YPB6wUJU6cb
	 2U8kcfzIfBl17VE8g40FDUunMDb/bCI1KtvvN6SeXizY4E6Nfodx7v8wanGi5rpqyr
	 WB077mX+dmdpscz14cVIc9L2XoBV5APNL3TpRNTI9T4jZPYTZkZYlwVZinLkK6yHdW
	 b3Zt9/jrF2Nww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A8D880D97;
	Mon, 28 Sep 2026 11:59:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7217732F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C4E405EE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZONry8Vc06P for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CF960405ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790596764;
 b=IRCsHR29MqQ8Yq8NKxhMFXO5XZT2MtqoctGoxwLUJaX4KAkKRmt/COvTYmmM8pZuEHwy
 /5mBemc0W5yF+MDBGzUumwwuowOXGc9pY4El9cqg+ntWAWzRsfAYQbAJHn6jwY7f0hgcy
 8/bMY2Y0DwfVINjUnGYRqrLRX1HqcDjbPIDji5yryrdkkaBxUJdcJErf2bTWFt1ldr9Sk
 FFxvpLIruCKVtGOtZlH7RgYi5mgtnueS6KYyCB9+Bbo2Kob6N9U3td4RKRaE4vWY+Y8AI
 F2Ly6+fVxgkLlLyhbdSBKd5BVWNT+EQ31MZPGKqZlCAX8VFiVwG99YxDubrxpz8myUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790596764;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Js97OiSL9EwFoXGiKIcwZ5uL7mGqNYfzrqNTGOFDga0=;
 b=jl9TVYjZLhBSxe1IHQUtjG8Ylx9aU/vWmXZGtpCsGGaLOymEosfQCek6swwHBn3TM/sH
 lfBMxMcR3Vf8s6FTQPmyBEWsJ/LMxs6vzzN5GzpCND32TC8LynXNp9u9SI7xGeg1ujhf7
 +cdx56fsCPL5PYwXx6RgWiFs8E4UfuPbIFzeslrhpSdAFasFaenvWHePBRrBVvU9UQfJz
 Di31l/NZj8Yx6jY/rrCo6KabmLmL5t3kdRNkvROx679xuaWTvCCQVhNT/7me528GVy+hW
 oT9tK9cVX4TbJ/yEgFcAWSPR+A9ShI6PDpz+D2uSrRcLbX6nbCFunQYUk1ZPQDbKasQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pqcHISmm; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF960405ED
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D40214E410A2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:59:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 971A5601BD;
 Mon, 28 Sep 2026 11:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A46C2102F21B7; 
 Mon, 28 Sep 2026 13:59:14 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:59:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <arpWje9DWQNggXGl@windsurf>
References: <20260927114203.2631563-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927114203.2631563-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: remove patch 0002
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

On Sun, Sep 27, 2026 at 01:42:02PM +0200, Bernd Kuhls wrote:
> Patch was committed upstream in a slightly different version
> https://github.com/openssl/openssl/commit/098404128383ded87ba390dd74ecd9e2ffa6f530
> and was first released in version 3.0 which was added to buildroot with
> commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5.
> 
> Added Upstream: tag to patch 0001.
> 
> Renumbered patch 0003 and updated Upstream: tag.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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

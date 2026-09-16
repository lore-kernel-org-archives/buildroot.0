Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA5C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6366B6068D;
	Wed, 16 Sep 2026 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tNAYWXAWXUR; Wed, 16 Sep 2026 20:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5261860756
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589942;
	b=a+wyq6Sg3WsbKxKAh0/iqzCsZdO7HeaB03QLdoFgwR6vltw/4FjaNeSwtKr6oGjEZpJX
	 85BimzVtOy2Sa16wg1RyTgczUWAxSmOHK11UwO8VEv49np3zET8PKj+B2FXW3yLdMxbpg
	 L/i5/lb9UPFouOX+iPtdaWcdpM6ZQdVelkTN8cPHmX0/fwz9IUtqqlCg9xgsUejg49Pbu
	 wOqYe2fDOm3drw0w3pJNJ8JKc8gMc6bp6ZjD7NcNtNRS1ToSoXb99mkVyVEIOECUGVulr
	 8rJXXXe3aYZ1p7lNQ5iw9GOrFEqEFgSlSJDRQzMLxUceQcLTMlnuNT+KJBZ72pEeUhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zjowx4AlWaKDPxc3Dj8g4L7obpmYyF+in1wuNsAJk18=;
	b=m63AAsahWY37wecmbe7fhhE7W9amVdI49+WLUYTHo/wEvI+xmJQxwsyqMTwHhVXYv11s
	 dlHCbMGNrbAX2PQZ0FJOWu1Uk4Ttff0UH1Bn/eLE/Jrwr8znjz3Cn2q4yhCWM4/P88efj
	 tVgvGRbwVgXI6RME4zrxOEz6USgj86X0wNoJDYucHsnh9LOR0SqTp5jyQaSin2v1fKnKU
	 FkrnOMJ58LHlQYKzkCG+jgjJwwPeFj4E/Ho9IIGrhe9cOlEn+ecRZRAJHuIoUbqOeMyb1
	 zirnf0jzj9xzcC6P1oYSMoFomqWAegMul2bmV1OmBjhyHPss84Ysx70+WjDKOmiqx2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589942;
	bh=Zjowx4AlWaKDPxc3Dj8g4L7obpmYyF+in1wuNsAJk18=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pzHa/4Bls3vFKEjrl1yg0x0VJiWYiEp6/9L+BxlQ6u1pL7wOK547hfAiuFcByTNEg
	 I3LiQWh+HI1+ph4HFIGqvrnj4JRApOAVsTsX83lQ4hjAftP+1AdqM5tVKSmgTABlKR
	 1N/vS6+CdEHP8alCgF0AWB6wHAypb34601ZykGfAghUQ+3eaSNjGjcu5qZyJsZdttU
	 sYfq0hcLrPUbz9/WKfNoDP5bLWkjEJis+8khgY5c+1hu0cszkCzwfHUu0Q+ZQKvXxj
	 LA4IqUhm0r/mhsMP8Ay1guZgOxeq+5P6OcnV1fazKzrtFIlARiYzzqkSNNQg181pjF
	 gtI1Wm4cq4KBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5261860756;
	Wed, 16 Sep 2026 20:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E12524D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B53980E60
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tS6Mw2ZYM7w for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:19:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ACA7B80E4B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589940;
 b=rablzXwLaIV8KgVNPy08xcOgM9DdR2ACrwY8rRss77Qxs3jXb1pqh+1rz1apCpf9mpdX
 zMMLGccW3xWBy+2BksNiE7VmBJBbjG4OwNrqgWxW1YWKEFGOMr3lk1BgGokGwD7L+nTBC
 oze680ug71JDPD8iPBqLDKeJueJ6GrP8doXVKgsiJRgv7eD+IrreF3zGSOtttoNiIFjlV
 3q40KaoEIHhNaNwR+JsA8d8sS++nnHgQxDFvZqxX/safCjasq9IWoCTLcMUHq+hnUazlE
 JIPeZh/JQ6RI1aF90rf6bJVJOSsdhsJiDj+M4LxSRXSgIy8+khIiErIzTpX41rARKFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589940;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ndjA+FsieCk2zHzCQ+Nayo+F5COJa33e8G+z1ksCUsg=;
 b=c4XpSnEp48EPQwKgERwaIAifBTH0BH1AptSF7r2SdUxOocDpGvBrbT8Z6CECWdq4PUFo
 clGkg8az+dhG2YS5jrHzbuqov8CB3rh1AZBXJkfp0nHwFR0gEpIoUpgrq+NauqTvTNGTg
 iE5ZBlO3WSwYd4t3W8L+d0LlPkYqzLgy3rhbqAMfMcQeu4Hj2sWdMu4rX+7qa02AaEH2B
 u44u8gpvFT9xmO1REZXWRGm165FohOZfaJojVXqHwLp32BdIkahg4/nGfVb02KO3dlV1Z
 uidSei7dyopb1aJ6QZmpYA5OPlA7EEPuJoA9I4tKYcWFiiFUF7QR46K10OzPMQhgg9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=o7f+nPht; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA7B80E4B
 for <buildroot@busybox.net>; Wed, 16 Sep 2026 20:18:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 97C691A08EE
 for <buildroot@busybox.net>; Wed, 16 Sep 2026 20:18:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5ECB860337;
 Wed, 16 Sep 2026 20:18:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F61B11C7B05F; 
 Wed, 16 Sep 2026 22:18:50 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:18:49 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <aqr5pj7zrSpDIRHR@windsurf>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911080611.55857-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/luasyslog: bump to version 2.2.2
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

On Fri, Sep 11, 2026 at 10:06:08AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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

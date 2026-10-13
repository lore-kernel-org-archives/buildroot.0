Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677E5CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327AA403AA;
	Tue, 13 Oct 2026 08:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wv22brEPKI7S; Tue, 13 Oct 2026 08:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4793B40435
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878845;
	b=l3Qh2eDregyq7X00srarKAEIQIRHPlNDFHvlYbjKT3U8Dx7JpeeA6QZ2EfkXHRjlP/tG
	 hNfZlEk4mKwv3sjmTOnwQRNNDSW29QdfHWQPL7Srwja1fuuAkL8pgW7XNtcDHvot7Csy+
	 flPCpwyTocq/gI4J3EdGDwjHysoAvCGPcctl55pGtKrvjRKdrxR1hP/npWgc0+LbFX4te
	 vMJWy+wZi/Ba5RcsQyp+qtdmcvlF4SxwP+w6kz3eGJ9LCC8vGzZDl5Tp1T4ennmIxrmU5
	 PW0qWbgpoBcMFyVR8a4dUUugQUzKx6FAB2jyHmTlRBzGDc6fGHCdlqXhVP0pa38DKuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=F03JUfD5gpB+J5aKedAbgQ7C9beXBNVdUpMJcIWYSbI=;
	b=qnBaA7X2MShpApxnDX/4QuTRrMUdMqkXUHMqepPytjoYDnIztDZqznvHmNVr11i1LVoh
	 95qSiWuVWN34w+t3US9rusYBv3k1+ftmdLs1vz43knWjeezsAFwE9dSPGvx0yf0FKgnha
	 0fs64IugUwgfWj5zIapCf3uETndGL3zL6Irhys6Pld3MxBfaow+y2OjqaLvqZ/cm99oVf
	 +SsZuzecvschJHRyAmNIUvHQ8QwPUGFVnt1ksFJvZgLIIvZood2TX1qaweiQylC0sr0xp
	 p36uxmqyag/A/Se7bjLRBjV45KRFOHle7Z2ptbecI2s9bAyC7vzzJrWjXT0ne2TeNcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878845;
	bh=F03JUfD5gpB+J5aKedAbgQ7C9beXBNVdUpMJcIWYSbI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cNxXVFQPdQ8PyPJBoXRU06OvLc2wU/wNcfeOUH+HDisN8arSyvw+M921JE+ZU9aCz
	 ATmLFv5BxOE/JYvSoApgOXjblE2K/9YgzR0AmyME9hoCUTYu+YzQaF+WTeDmOloY7O
	 /iLixbh5yNlOXGjxz5BBEV3pkTnacSWPlRyrSJKEWDyd4GKCpB2Q4ZRXohO/QQNjp0
	 2vKimjooO86v3/XgsJ7WsnbGo3DGJ823dv4FwahoKhW09DEsSF4umHg8FJ+evHP+sq
	 YYPrFrEcG96e9xDXZYldOUK2LaZocqQQ7sNP0o9YqPfNEnvYHCORoHB1tZRHusHsEy
	 CvBXW8x/mjuMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4793B40435;
	Tue, 13 Oct 2026 08:07:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C981F788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAEA26075F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acxBFDWPtnlh for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAE0160755
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878843;
 b=qKRzjaNhppLa5HSzeRbDtKFzUF1LZspaVmL0B2HIeI9aDYZLCg+HLKcLt7TMAud7smx4
 oyQxqav6KfvXoNt8f+qwF5HT73yCMNm+iFDO6gmDUvcrWDQQj9ZJbYq53ObOGGDEzmO4R
 Ilc6DE1dP7ZJW3U3T8uua1wWqufsEPB4/kSCpXSylN8+l+pi63IaZOyDepct8Q8MZsPWQ
 ayBBjC9/LGZmbR8C+dpkEkpINXLhVJVzbgSq0JJTr4s0RgVHeXN3dgdEbU+mRWyum7JGI
 0afdeGGHIwK97f6TUyU12KF8HJB+5kmiE2oJDoOOiyy/OHmf8lq+NTyrETpevYSgNfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878843;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QZrME+xR230dOXb0ZQoymv7EK/69Hw5uRpHpuxPlLuo=;
 b=o52LmAJAz7oqWiOQeQ/LGJrKg+w40fttC5pcuYBO6YUyyN7Tg06ybJaD27rILfhgPV4o
 fwVlfqkV53g9rUljBqRNYSRrXgGF4hhDvXNHhA5PwGpb6orCGMJ801xeeMEFH61EexIyY
 ukpxHGR1w4GmZIGo+O4bDNDhmtHrzXsGBG+Wnfy5jk4HDftmKbAM57vp0RWAYWs4G2C5Z
 02z5xGemBCCRw7Kz3vY9s4bQAoAq5DqUrqBcstEqxtDLb29bqSPfSYTznRDmY8UJfq5UV
 mgsZezI9k5i3NmHRGfpmvxa+/F5K/lEgBALm5o76vNkHyeghucQTLlUDayenJAXuyYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=00rXjIl7; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAE0160755
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D4E811A11FF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:07:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A9B7660362;
 Tue, 13 Oct 2026 08:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 008AE11D70160; 
 Tue, 13 Oct 2026 10:07:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:07:17 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <as3msWBsGW2dIrrT@windsurf>
References: <20261012182345.2187315-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012182345.2187315-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: do not enable
 CONFIG_CRYPTO_MD4 for kernel
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

On Mon, Oct 12, 2026 at 08:23:45PM +0200, Fiona Klute via buildroot wrote:
> This was added in 8c12a6bf51bc4b166948b4392e96344259a64778
> "package/iwd: enable required kernel dependencies". The iwd code
> referenced there did not check for MD4 then (iwd version 1.20), nor
> does it now (3.12), so remove the Kconfig fixup. It did and does check
> for MD5, which remains enabled.
> 
> Fixes: 8c12a6bf51bc4b166948b4392e96344259a64778
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

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

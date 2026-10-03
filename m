Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5DECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9936B81010;
	Sat,  3 Oct 2026 16:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icOJO-_y58M2; Sat,  3 Oct 2026 16:32:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C821B80FAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045156;
	b=cDcjzbOYZMRPvnrcGi4P/+YdK5gDfNnQsyX/Y1vO3cukLdEskcMJf1dYTbNymdJo15Nq
	 sNAeiCPBDZnWiBv99TOHu/5Uvo+wXRwGmlzWhmK9+nPzN13tyWXcOiKMKSrFwXv2uGmtY
	 49loG1HS1OgHnlhNNFJv/wo5kMyXdBw5zGtQhqxXyDYnM7ZXVNQ8DcX00BUUKtX2ZYQxk
	 IrzBmafGn1203bBzccvpZF/oRYqLZoieSlHIe31Zw4hLuq4+adpa/oW21Fo6CMYIPn2gj
	 2oTV2h2SQ5I0THnlkIM4uIFw2zUaYBvplhva4gOy1oktBAc5xX8yDNJUnqquHtpRhdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ycxnYY9Zq1IrHnqp0xWLJAJTPA+NK3iD2+QwqKLO+D4=;
	b=r8ix7Q+NKnYXp83XLrDRiRzVRweRBL1EdA0e33JHoY+E9Hkj1uXwosA3WxyUAcoxWQE4
	 tgE31aLkgG4h4iz6r4t2nlgluOJw4V2KO7+f+akKPtvmO3OeL/2GD0wHPgxpey+LMH6ub
	 ThxWp3vAWK/FdSZvpOOIWcHYREvsW+vWOyQpeszas1hagnBhT3WZ+EDBQCcAflf0xcliC
	 hpTICrVl938Z65F4d/Md7yrTwcqshYh9vS7cbpQ1SthOMlMlpsFACWJZlDMKgI1acD1ZX
	 ZSBFNttmtZOX5B0LOtwM1A0lm7Jz8nX3oywoivMldANoZ3a2N0Vw5AerGH0Rz4b25lQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045156;
	bh=ycxnYY9Zq1IrHnqp0xWLJAJTPA+NK3iD2+QwqKLO+D4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=eYw4Qr41kh8I1s9pwUKdgMD3QxIpYiWSESZRbbLQEG2k1t2HxhbggR0/Cdxl9Aimz
	 GVG941qlNQ4Q7J2z+Ahp/IFcTDvgGV8chP26iZj6Kx6n0gR/+lbSlLvdIJtcXREOM0
	 324+CD9RYilfHACbxQ3eheyiZju9pXzJ9MdfXTz7g55Sjt8GyCAs2b5jLQDtZ91wxj
	 ZXYxLZgRwBJL0t87XzwbcvavDpF3K2TJsGUYGpavVZRXFXtz8iAdqx4tn0ixImRLBl
	 72M8mb832eUJfJJYVPyGniXjw1vh5Pmgk+xI3cu5K0GvShLzIPy3Yvsh/I3DECO/8M
	 Vibwd+Zd5LGNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C821B80FAB;
	Sat,  3 Oct 2026 16:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 631B5335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5475C606B3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XII8WNYj1L4E for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:32:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 64643606B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045154;
 b=oQsxO54wRcb7B9MqiUzP8bL8SkYZwWApvmJiqwRmV1J2jwx0QUF8NpgPBBD97O0B08Yo
 VGvBqzWRhyQvC8Iyxc6DzfKlNRQMLn+Nhj1lhDP9H6Lol8aZd6yaiuPO48frUm+KgMmzK
 dMC2mHeg9Fdz5Hshq0aRL5PwlommhIvzJjTNyKIz93uoj+DgAyPNGip8uk2r9iMkrTfj9
 DtCx/Ej1TYPAE9VjvQ2h8Jyb8rd+e5Iqog0BOasZ05ZSWA81Jb0Tp0BlbWsDBa16bG4h5
 P6hHb2GEUhnG+N5y6S46VVfaPVjUfrmxLY5vbFghruy35da4/fW4pCHFGL0vKYOacCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045154;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=G6S8zbBf0JOFKdjLfzvif1E2q0QBrPkb6Ri7udKAcSE=;
 b=lk2tIl4y6tfBk/GnfyBZa5YUjG3rAjbzr9DxHE8DXiWEFcREIjSJOrGtZVPHcARv6HNN
 Gb/F6hs+nlHLAu4HHWyIOs4gYVjqKxqJIs8ubiZvaFgaRT0xbAhX0QOMntv+cyuIsNx5E
 mWtPRRtd+BofAwH+T9kb1gfnKknAmA+bQGuCExLTrYHA4pFiWoAXbeyz70B3mmN6Sew04
 mTNWicL7Qwbf6obCGu2SN8xC9Xi//7j6h0kVkPPTlEHzVrhHILUXA+bJ2oHT65zcPiUg/
 qB86w0f3VstZLpwSyPzvOWQJqb68AUx48I7IPaH0jbOXgXFfUmlPSiBhy6QKHNhyunQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IMdTMja1; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64643606B1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:32:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4CC344E41134;
 Sat,  3 Oct 2026 16:32:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FA97604FF;
 Sat,  3 Oct 2026 16:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12DD210328170; 
 Sat,  3 Oct 2026 18:32:30 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:32:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <asEuERpDsHCtL4M8@windsurf>
References: <20260906165149.1035063-1-bernd@kuhls.net>
 <aqsJiM15FhYI3qt2@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqsJiM15FhYI3qt2@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/boinc: fix build error with
 uClibc-ng
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

On Wed, Sep 16, 2026 at 11:26:50PM +0200, Thomas Petazzoni via buildroot wrote:
> On Sun, Sep 06, 2026 at 06:51:48PM +0200, Bernd Kuhls wrote:
> > Fixes:
> > https://autobuild.buildroot.net/results/f10/f1015559e37d73403c396ee883d9a73fd167b9dd/
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> Thanks, but when was this issue introduced?

Gentle ping.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

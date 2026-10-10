Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E22CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFC0813E7;
	Sat, 10 Oct 2026 08:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPBSMSEoj06e; Sat, 10 Oct 2026 08:46:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8DEC780F47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621982;
	b=NQkIWw5St1dIcvf1GxXYALusZLy7WPeHi5jAe84hhOg0tdZbbZ9qJf7Kd8wkH7WCt7OJ
	 0QvJ4TG7dlVrI8W2q1lYQPvaSo7VKUAdMdg3eYGzfIV6LohlAo2jjUjx8IwfQwojOO/2C
	 DthgUZNj0PAYCCSZ4rauQ+iDqiL+AoV5X6PU5rmAVE9r6HNMjQSVVaURryTOd6G5tjUdn
	 3deybP2riRmpxUANQUlgEbSfBRYXDRN+M9PVshIdMA9VNhMMJ9pvCDPHjUxnYBGIEd1Pl
	 SYjl3aQXd41pSEN63grlzSgoMoUyQEQoqW2T/YCy88HfUDlvQBs3R0WbCTijtH3kiIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FM4XxzF75JfGIHs+jA+u7lFYjuvrIej/679ZHVChxUk=;
	b=I4XUB85Lv2avknWVy7DxVJuaxeK+AGBm8QvMIKtsMG7BKWXjxA8ORk5ZkaBccNUoUmK2
	 6QUoZ1t/6k9VFOC4sSiVdZquoe85gex6XkQChKwwoXSTZUBYGjX3iWQ1Mco7QrSkezavb
	 rEpnjytUY2+0oyOWs02/rk6Jh89pv3Nsx0oc8Z2VFWCERlhDykpvYbdPgbSSipsN3F89P
	 wiY/f+lXZvNP6s0duVzLf6A//q9s2/ip6HAipO+HS2Dp7y/PkMrSiQtM/Y4aWpRxEjX4c
	 kV5JkxRmQKgKrI9PCdpfz/ha+305HLLEED/IWc2clI4EA6H/mAR9LPQ1cVnlmM3qjgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621982;
	bh=FM4XxzF75JfGIHs+jA+u7lFYjuvrIej/679ZHVChxUk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qo336B9yVkkJxS2XMfGkuulqeFhCbDjFTfV2vJeg0A40tbacDRsHtB07tZXj5nuqy
	 1JEnpzKBcUmmU7mkXd/TKcJkIqauODSYEj7dWRdUIzN3FO7jJeHzN44akubbElM37/
	 qVeZEvGLTuKMfPkjyhhub8PQKvCqsxmMpF2XObX5NVtTBMAIzKEI9Q5Ouyolb9JABw
	 64r2gpt4DeJO6kLaEIbqApmy78XQ4ULnizbKz39B3JqpjalAcz20jGszYRtuUGKavt
	 R8w1b3B0aGdNX/+AezGjN03LdU/1Qj/zEiBxjqbf4MiRumA8cx1rsHp3otgh3cUv2V
	 lobHbqRUAHIxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DEC780F47;
	Sat, 10 Oct 2026 08:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE7D5111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0AAC40887
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEyx3xPt5i4b for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60754408D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621979;
 b=LTDnpjc2r+sjXIFy4BBYqBPdv9IAtzJBFYFmM5Y8TZYTORfD60OUg0gFc+hDYDfwS171
 KOI72G89mPdrLFHWgFK5BuinCaxu/U74yv8Lw4upfYDjdSiOmVYJ02Zx2C1zM+VDQssN+
 Zn/TrThBloGeXub/Z/8FCv+fGeL2f7lXEbeEoSWtohVfJH2ggyfhxxy1EkrwRbwl5s1Zk
 8wmsiYxCk0PWDNzFzHnyRzpZY6fkWzufCEioBDAba3YjSyDGGka1Yx2GzAf/5LXEsLfhE
 yVqIfF7Vmaa0Sl5qr62JzFG2ShPdC3A8mNvAazFv5f5kH+IpC2DNXsRRTEmK65lWOBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621979;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=OXbD9yLGDNmgHye2CtXSr0HRCzgCJhMT8XUR1Vx0qA4=;
 b=Si1VoZbYCaVwSbtToekmI1Y4ijY0chQB039SARPhDNfWfyZFDZDnr4RrnJLyHL0q+MAj
 og/5nNEMkmBP++Ih4NQcfIoKtoxlWhFYt4lJ6KS73F21tEo3m4T/btY+Ot6doxLDzj++R
 7ObiWinTqzxrGtRh7kejjCwFkTkjZa/YGCLGdvFfH+P7SzdHULsg1M3530aj5EqUxKU0i
 NZVVmkxoPmjtork7lLGF15JlCu1o974amJACg5icKMhUCa5HPSUd9eAFULbEEzpxr99zN
 A9DBmlYPy5bsG7pqqqV+McZ4on59eKHNRNAtxg+HMcZ5khNsba/AyYXq4Y3PnM9hIfA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lG1xBDJQ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60754408D3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:46:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 102D11A11A4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:46:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CFCB26075C;
 Sat, 10 Oct 2026 08:46:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19C8D11D700E6; 
 Sat, 10 Oct 2026 10:46:13 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:46:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <asn7UQCx-MMIHNSq@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-37-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-37-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 36/84] package/libkrb5: Add support for
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:17PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Andr=E9 Zwing <nerv@dawncrow.de>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941DBCC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FE4D60749;
	Tue, 13 Oct 2026 07:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Reu7I-_H5q1r; Tue, 13 Oct 2026 07:46:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1ED3E6074C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877596;
	b=DuaaS7vdUR1OXQBEDwzYYMG8laYV+eTFnNkkqBCljXFFVB/NY+Q8xQ0tkltYTYRxShk4
	 w3Ula34yqTzWV2q5v8vgHc2AUhrXKIBO+HNQDRe+8FAz1Ng4wozqCFP6/fIh+gDy/jvOB
	 GOz7GdesY6Wn1aC4L2qy94Kqj0akry+tzMOvOePoaQGzLgnpiBFbWuSIysuz7azYQ0fuk
	 UK13z16a00DbuJHU9DQ9kNDpp4xnbD0PjgWVSLj3yjqcLJpSNUFQrZSwt0I1+0rHnnTM4
	 YB0HMvmcR2zocuKcKjM3Evxk4HSsyjJ82/JTNhKDMA4MyUnaumpO/7iq/Dp/G1tgOKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=b2s+efRhkBoOJNGK7VfuvNGFktxXD3ogLt5w8D56Di8=;
	b=Nh+PSfUm7evUR6G73gD+2h/mC9jvF78kYcYKPq2uicArYw3C4ijD7xAAjnHltiVjOQeU
	 hyXkzZnOamelTCfpHRhGzacZb0x4PmJFRZYv6mD/dmz01laB1NL3Ya5ZVuLH8mg3UPTC7
	 VzplJlPwoG++w8uHbPnn6gHoM7CLEvH+rPcHpLgNPOMILx+NYOb6Gnpk8w+PoSJsbG1HD
	 NzHCJ1/aVon6T4GYZbvtcTIWeAbX5PTIxv/LoRwfIABci6yTQ271dlv0J7Hw1F1kza7+3
	 YaEkgxUj3O5FdegLh3CjwXCz6YD0+sptubroOO4kdFoOJGXzlDoGb+TpJ2LOPC3DjIQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877596;
	bh=b2s+efRhkBoOJNGK7VfuvNGFktxXD3ogLt5w8D56Di8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iaulTQXv/PdhSQVy+ebMnKCiVBgUHMLaBFs0X4PtHKwklUNcg2l0nxxts5PihLOmJ
	 7sxsIlDcFaXwU6D6wIqL9QEPzz7Vy1xn3GJ9UE3Bp7Kq5ol09nNR20VYcCRZRtE5fr
	 JHWXPaXgmhjNhgMS+QYG52GT4o+fX1PsSkqs60foTkH632ZKzDskIkPpvMgOJFyICr
	 woRm4rqallxUM8gYGTjfNj3BBrsTDGbVbpMIBSpB+Iwz+17X9Oug9ODiyiB3IgcZUL
	 fvbehKauXV5M6Q3CIMSfZKkU+FpmK5G0yuD9KBH0YqvtUdVubil7hiSPxIIUrTuP0G
	 4pfYuKnhmSRBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED3E6074C;
	Tue, 13 Oct 2026 07:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E04105
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFEE80C3D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRxdsGIXvqCu for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:46:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B931980BED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877593;
 b=n4nfvd+EZrXycPcYlZpH8KUh28p0CWd/U6ZJZQNIa5E1WQ+CO/OGXg7ygT/1Dsn4sbb2
 0ZvNbeX3AufSr4abAiv5oomhHyS4VjCTCstS0JHTmK6l01lQydE+Hb5j3XryYFoaS+orT
 9HbAxCk9OKEC5YtLBCxL3U8m/v1OUkLZvZbH9S4oAlBJ3mE+/Hc07JKtmRHCvN/dsOWv6
 aA75podkLvnPnDE+DcLBIoNtjiKM1wVZWv2M3/CAICggPMPdqs+6me4eSFz95unqwrNOU
 WOKX3RLbUI+NWouyt/rlBgxn/ahYhdBXLGbT3TOnXi9Ts8+BnQY6m0roTaWJHfIWaYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877593;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=fgsuRTH1wKigc+oYAa9uvfX7PXVNhkAvnla4uszlMkk=;
 b=Mimx7B7650zIvtC0fjpHBbzBQm1asR7NIWmW3eohoUlemKrTcyxIFbXBC5p9UdyD2CPk
 KM4IpVqhSydmxVewUl6tg39D6AD0FgiQMvu01qYLUqMiKmokTbK8BEVV5L4/Nz+OOQObU
 Wa6ZEpQlggy4bAKqL/GmVRPfRaMfmELeBfRjlzn1FvQNH0vRJVOA4K0YPnLcSeLcTVAsd
 qSJWlRu4945txX/IL2mzoxU7JQKmoRdjzThygemu7k/J4pXmYQ8G+a6FAppyPGZgpI82M
 G30W710fNxeGxJHzwf5hKtQYNYJOEg2Hflxf/1TT2YGlUP4jel2XIgJQJ/Xclqa8gxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jWSmNy3L; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B931980BED
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 07:46:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F0BF34E4120A
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 07:46:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE38A60362;
 Tue, 13 Oct 2026 07:46:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C907711D704D0; 
 Tue, 13 Oct 2026 09:46:27 +0200 (CEST)
Date: Tue, 13 Oct 2026 09:46:27 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <as3hzGAkM7YB0PXs@windsurf>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 01/10] package/perl-date-manip: bump to
 version 7.00
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

On Mon, Oct 12, 2026 at 08:25:26AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Series applied to master, thanks!

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

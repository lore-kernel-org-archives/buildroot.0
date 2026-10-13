Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2829DCC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6ED860831;
	Tue, 13 Oct 2026 20:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mR8kxhNYOFxc; Tue, 13 Oct 2026 20:57:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 53510606FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925021;
	b=YGQqdIJG+NIPBabi+HnLhhrs4eApfZk31dAD6iDyovwTb36PykVO3jKIn8DWPZ8R0Ioo
	 rpMuuNQRElsC8OYGYkZh+6UVXEUgUfGQvV4kZj4KfADcCnraGhhr75M2K79+Bo23l1DZK
	 O38K8lIb3PdSrR8a5tpsKK48Wv9+XmUqdxPkEOdaH9TbxxaXw56jbPG2H6zHtpbw1+Om+
	 6RFXO5tIpJ2sPWOFWbJ1TsmMXt0fZhDoAkQ7cKswqJ3bPd3XLYH5PKuDONFwyUUrussDg
	 LuPkdFF+MfBurFHIOF7Tpdy0xfRGra/jmm2hIkjuKmLtRzun7R7qtVB5N6FOAh0+l+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=n4W0QJ9OwJhPTt96Ep5/vr8rQe1oYTmNQOySg9bLv7k=;
	b=gKiwnIHS9IV1EJMzOcIWwnaoI+WXHN6vK5HimgnqnnJxBrWz0RPFNBCbd+q2aoIrRPGs
	 oBnFtzG7AUvA9MfN0U3HiROfQVIQe+Xpxys/PkTEgTc7LpeOreKOI4evKj8c/jh+bMjoW
	 u7iW+Abnz8dSkRxIZukRaqr+/9t9hnemM6ZL6VvbIdUR+eVPW77HGo5i/T1+LpbtE8ruq
	 37sKzSbwWh0awHNcCbg7l7f1icfuIGQdc1Hyq+XTU57Dda+dOGIXft0DHkyubt1Rb+6JR
	 1vq5tswQiVV+IBJLLdbfT6c/7HikVF13OeBsT3QziBnX2FDwYu2E4i7Q26FKZAETRAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925021;
	bh=n4W0QJ9OwJhPTt96Ep5/vr8rQe1oYTmNQOySg9bLv7k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V6y+cOEmbtmD7qoTsuUd36kKrYgT8Y51oXJqQMEe0aFS/cANDF9LsExmOd4Lc045o
	 0zO2F3uyJfXZ5ywifdugPk2jDZ8XgJIz2BnoORH5Pll0/+LdmCMAf6F3oq/uYH29CD
	 peKMHM2SVOgdByAnwm58PbENOJjvsV/AGulJX0wV/PuYTZus/noqTEOCkujEETIogY
	 l3wFkJZaOBLHZkSlHToHhcwRGOeH3NsUJfkYDEkHtaWaJRZEIacdplLRgAFJNJhMwl
	 qNwv/bSzniUpuqKY6xzCFQ+hh/Zoy3v931Whq7uQwU/e1EqnqKuxSnQcuLVmkQcDyk
	 qMLgdWBJlNFig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53510606FF;
	Tue, 13 Oct 2026 20:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4BEE2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAADA809CF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ivd2iKGDyPfl for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3747D809C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925018;
 b=EfqaiPEtUC/BJLu8h3QV5pEng87Q/CPTtG/0XZgBzqBuZAyWat6QXqIOJdB6N3wtZ3RX
 jKUmjDRtp4aqZsw1o1J2iSfqGWl2hjl7jiD/jj+2wgoIukT1lheKfg0vs6i/GsqeL3jyP
 60m5HA9C4E/m4YBOCZOFhROwg78gZzONr8GyK3iNV35K4xxV2FIvDQnFKOPor1fyGk2mZ
 uFSgOfkBehjwIEK55HmJTKz5e+jEN7WQ1ZCySIMV660xfPHvmC9oJcZIoXJ7SRGgO9awG
 rdfvDGAmuQC6umoGH1juKnyyZSmu2f55k7T6OMqjjMFR63XYZcTO/gHY94MqpOiU/Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925018;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=s4CuigTz+ptlL1lKnGAroh9Ald9PikMk2quQcKdPltQ=;
 b=S4xppNbLW3FkzlNd2uhipdCQlFWDd/JdSNYRPiXc5mkycePt8HVob6ATOavp2X55oQCt
 SEjY/T6D8vd2XxdZ7Cek6Fk0S0bTf8tcmQI66oJYFFENRzO30tCfTJrpi6FwEeRDz2z5E
 cabBZLSaD/d7xwsiYjPtdInvh7h6zDXE4uLMosSJYzggSeutxLH3lHBFyeltPFJqZwoWG
 3VQGi6hEMYuGvQdhRC6v3lS8afgtE68p7kuQ3DZ/+ELN0c83fmB1BvCBRbkQuduoLdb8G
 9kk7zvnK1JxNnJvDRJMOzH9LLR7lFvdvfiTalatSjjuDsQszx7H5KU8LxqZj2E2eSdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tA4l0IzG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3747D809C2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:56:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9BEFC4E41217
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F25860362;
 Tue, 13 Oct 2026 20:56:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24DC711D71999; 
 Tue, 13 Oct 2026 22:56:53 +0200 (CEST)
Date: Tue, 13 Oct 2026 22:56:51 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <as6bDC2mJeFglgMF@windsurf>
References: <20261012-bump_python_scp-v1-1-1cbf01f03cc3@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012-bump_python_scp-v1-1-1cbf01f03cc3@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-scp: bump version to 0.16.2
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

On Mon, Oct 12, 2026 at 09:46:21PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> Changelog available at
> https://github.com/jbardin/scp.py/commit/21308b89160c31164bfebc9b79aea710=
d4990769
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

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

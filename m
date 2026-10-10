Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A70CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB2566064C;
	Sat, 10 Oct 2026 08:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EFAb-9MhToO; Sat, 10 Oct 2026 08:25:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C41FB60650
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791620733;
	b=VnzHALTjP9cN9yqkp18I58ANjoDptj9cDS6NCzOMDlsG5qaBxX/G1CkZwNzxrsQ43JBu
	 4zrhU2qBO4/UmlEtEtAHx3eBeyJ8+N0SHFD6PsRgWv6W49p5ZRhNTrGskuEZvFvSOkfmO
	 wEWCDkwL2rU3HkG/TBQFw7db+w/wJRuODSwJ9zoU6pfPbcrkH1s3Lb9trkLiu39dmD5Sr
	 g+NbyiR6fEUOZ+dXFnTbsV0pwg4wenoAZxZBlWrDJ67KFrUG7B7qqWRQeNcDju5SkbZuA
	 KwdOqKKXXeu97RLqSHi2q0km7rFeaPVkiXMoHzyiXEDkKV+Zxw4s8VX76iwqoDYLI4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791620733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mN1hver7Sj7/FtpiDWxLfw2mzG7+Ow/Yg2P+WO5wskU=;
	b=AqvZ5v7h7dfZMu2sr4VR7ael9kss0siHUkXi/sUBX7L4hh/h2cqqgG9PohH8WVKuf4Gh
	 aI0P5wER5++9GlFlqxlhiI7zXVhUCx/PRyBz5c4jUGeGAPMSHwQj0CBjWUaHuewVSw/dp
	 20JWMCLICSXhzQsDyUAOnmEl5xk6jayz7sJTTYs3JW6v7J24A/5ZTbH2594m8F0aqu0+M
	 2kSYug58C8BDp0aSlLVjTL7wVoKdQ9OUO0PoXVgTO/ugRwW5XYxHx8xQE3tLIyLfRIQxU
	 wd0AmUSImIB4Kf7CVYLE5QlNxtYG4n6p7vCwLJUJKwGKt6xAJ5XZlxrHtxKZjWHwM4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791620733;
	bh=mN1hver7Sj7/FtpiDWxLfw2mzG7+Ow/Yg2P+WO5wskU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pVfwKXxO+beCeJeelIyOqww7zibx/61sMrPMCn8/98UBwbGOguLHyc6xTctnbIWUJ
	 1Z10cn6PiRRSPdgsAY8FoN2QWIjUOQmCc4If2QfeKss91Nj4fb+XGr4nhdDKpIcLNH
	 V2SeS6x/imjsJhkIxm623UHGkOonjsCsmXvs1OzXtd7xgQlzWj0K5nTdDgfVLwPSHh
	 iEgWJARjQwiXxPtaTTmx9F9raj6bXLo4vneswBj2ejpV8O5qS79GCvidrr6iu8I7Pv
	 xr8Uvhvwau0U8MW8ETJREILCrDW5ANFh8eLnzoyWX7M+A19oLEyOXDlY1CxWCXsCcf
	 BljWvua8d+N7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C41FB60650;
	Sat, 10 Oct 2026 08:25:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16D66380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0D514006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxTf3s4XcFGM for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:25:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9BD9B40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791620730;
 b=nF/HoniNhf4t/6v5nvBN/eUOwhmNp3YaxMJpjUzAotPVW6ihKBIDFL07oBL8comThHxl
 IMsuvOF8iz7X21uO1jHpgkvRUnD7TZakAaXuUWHCNb7QDb5ozTu1i+A67vxiLPS1BcBl5
 tyEFOaNvvtKHOqtmVTbFtOkQ3DBGiRJ1TDQRcScPHZIehkhlTxUZCsZ4CCl2qtBRDMT19
 IWZ0La88KqtSKHA9g6Nxm9W4qflFgXypFTRWFroS2VV2O8DX5/z+DlqlKdQlc5hdoROr1
 XExr0AABUwR/bCER2rM0NsZO6VVXS+1inDH+FWledLJEdKnWbPmLfPlXJcGudAfNCAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791620730;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MidFy0PjOP0/+UjbzSxAnltRXRCv7Utmuz2T/DDHklA=;
 b=XBlbvL+ea4gkxyjNFY+57knc5xHGO0s53w59I97nd7do/h8QOFOdaqkMLzV7N6gW7uay
 cSadydqD3oGOHk7THCQTreqJjMIZK9oRIzjRM9LJWrzSfLSutAYUvlkaOOu0+tub4Niuy
 SvHn7QD0MxKmlukIHnGl4oRsV1NlKTXyeqoJzS9ScCopAI/BywKNOKMIop/XmtT+4HMuH
 TGcyPw2prxqvkZmR450DHUuXJYMZoPJmHVX5VBoNuKNNNDGLhyWM1f6Gm/In5yT9kcX8v
 K82OPsvYjUIyK+MRg9YZG5iovNWYLzMSiyOf0t7u3ADNsaoGeUnxDyeeuDShpOx39fQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QkBBjN5G; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BD9B40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B5D1A4E411B0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7CA416075C;
 Sat, 10 Oct 2026 08:25:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1C1811D70089; 
 Sat, 10 Oct 2026 10:25:24 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:25:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Message-ID: <asn2bhRw_mbKiTKu@windsurf>
References: <20261004113746.1547816-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004113746.1547816-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sip: fix build with
 python-3.15
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

On Sun, Oct 04, 2026 at 01:37:46PM +0200, Bernd Kuhls wrote:
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

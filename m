Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE4CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5297F41329;
	Sat,  3 Oct 2026 12:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY7UCRBZpwIs; Sat,  3 Oct 2026 12:36:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9C4ED4132C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031017;
	b=fhPONXFBC/KT86VCX0Fw3LVZ4F/qQJOgpy7NB/OteqDITfAQTqNdrIYw+kU0yE4U6L5Y
	 9XVD0mAZIUtF01qe5jxopziUpx0osYKtay/e89GhVjj0GpxFC/+L3xTyvmkdgfgaXB0Hh
	 gG1d3qL/MEvdyOpdZb7NNkkvzgZFf71BejvmDI1/Xe7tZ9gwtceTlOF20VRwXI1aeqOnF
	 Pyfi7WWTt76NIirgMmZ0cL23Fu5FyM1ha1tKUVaKRHD9lQxjdJPBRt/1uSo0bSfLJ1wcV
	 Fv1y85vMSgh+T9tIWkA2rKrieN1ZDKxKfcL8ZJe2Ob5mu5ykEdUi9SjK3IpX+0aycTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dsVrnkLKQtOoGD+jrflEG8cRiYwk6XE++HykByyQlJo=;
	b=bMcSb8jPhtijjqwf6N0xGtWuRFYS4o3UVicJHRYxpVHATGoLmoe5HuiDeRLLHeFfPZRD
	 eSg2lRNk1PVGd7+gm/uB/9/SQHE7xLGIUkjul2tTwlHnnkWGXbZCsG5LHneM1osLy8odU
	 r1aH4yv5c3r5AsNeSvnDfpy8/ESMyQ2H5MtEiDGqFZDWv7JK7IcoFGxNRmArxBB/75+md
	 PERx7835ZlEkxs64eoM45N7mrAF+Wem1/KgO4FB/dhDPjPfxqVEBls1srPi9Cp1ebqG8x
	 sT0sUaue5n6y+2uT529Hd6+cUeTXB5bF9WRn/t2fEpUhBSQ2nmYVmwPpUTBnunThDAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031017;
	bh=dsVrnkLKQtOoGD+jrflEG8cRiYwk6XE++HykByyQlJo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oLnvr49SP0vfx5Pd7B8qJ+pI87GYkLviwk93vqjHIzKybiLnnDurahFnwlhqDqT/5
	 v/iC05H3n+2en96YELVgBoJ6m8m+aNnXb9Ntir8yJuQ1tiLfCPvE2wltA7zcZQvcPs
	 057xnmmCH29vCGmh6TBHJRKrxFjRIXpMkMa6LSgrW1hXnhIJeWJ3isj3VVYwcLPb3v
	 ESVo/xdFbm2GCTC3c2TBJOyqIneBGhbqrdVmmkeUFXKQ/jTO0E+j2QRtcW1Mmoe6ub
	 x6RytokJIfS706spa4o0jyJEdG4eY96XoJDkzodjq1Go3hA6NGqFNzA5DAhmrAljej
	 DB9P+xLn+zXzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4ED4132C;
	Sat,  3 Oct 2026 12:36:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 335042E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 257DC40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrpjkiY4zOAK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:36:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 532EF40063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031015;
 b=VmW9x/Mv3oTUv5W109zgs3+IoJOxnPINZfQ9IS8kWpker5ob8zSZhHGncgiQSIezEcSG
 paGdndKZfFCpCNASd5P69pGr2C4euZFbnuERRZmoah1rfD1isp0PLAJ2c/IZx4OCrr8oh
 vFlmWBZBpibPt0NEA9RKJzTmXa08DrEOzEXdDtzUpY1577TWOPVOCvGD3+hJbkINEeQQn
 lUkv7jii6v9nErOfQFejlMYx6yv9TtQyhIBNanxNBQwhAfhFTW+b9u6hZriiDvJRke3in
 /QKkG8JNhHLqfoRCgKfWsm5gpU2RKkMYhMutREm12vZMFTUpd2PExwflLBtULjJUziQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031015;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=wf4WeGOmYknpvg9nO9bPXD4GT+GjXJJ9cob5GfGoEtI=;
 b=AdcFAE2Y+KesvsiaMBsBLgRnI6LBnKH1A0OBsrhUegMCVLZFVSKihrBYDNR0zZ2bDCLv
 PbUp7+f6lOpPYGTcI3JfNAYG0u7gjHPRUu7UwS6fUFRtQBQ4XhpoTFYEz9bFDMaEfU6ia
 wlAaKSlbDGuj0qSoxkEeWz3y6DLvElGYDJDB5q7M+WznKdWTPDawrVgpGbHQsKM8j0SY3
 n7/Y8s1lm2CrJITiEBHc0F9GnTOgbtnW+CBlw+EH9GNAhVF28/Um2kWlpXuVmzlHJWdb7
 s97/lZAFm+i7PfbC0PdBAXMJ3/TMJCVySntfD2pCUvu7xhvbP8WDDnC3LJDjis32QMQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="bA/eYCVl"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 532EF40063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4F1861A10FC;
 Sat,  3 Oct 2026 12:36:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F8EF604FF;
 Sat,  3 Oct 2026 12:36:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5CD1710328318; 
 Sat,  3 Oct 2026 14:36:52 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:36:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD23-dexmVIt6oH@windsurf>
References: <20261003084453.545653-18-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-18-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to
 version 3.0.4
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

On Sat, Oct 03, 2026 at 02:44:03AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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

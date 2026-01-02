Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D804FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68D7380DEE;
	Fri,  2 Jan 2026 20:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPC2dKvtLR1J; Fri,  2 Jan 2026 20:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8700580E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387157;
	bh=7KB+1ngnIcx2uab1hlN05A8K5MKGFWqMytnj57rXlh4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Truvz4+goM0Vw7sA1FcsA3tDcjU8P+djWOeVEycN2FlQ56nAvOt+Z/3aYsI9Enxoi
	 EvTjgjjVCIu9/wjnz9egIgGO2LSrkOKFuceieWtEg8DFrrK+be73VRsV2NnUhIEerC
	 sXww6Ux+es9LXNlyhjjOfBzFSFIDKwqm6SB+nbE8sjbVImjbH67WPjgDoE3Qz2sUzr
	 P7TwahU7fBCRDoyHK4q+WRNfLnmzpe6o7RIjrWHCQysRPB0HEinEs4QjyaIRP/I5KZ
	 rtHbmpthyrUDUbV5/QDzF864RBxaZeX5d9aJ56uYuuoNHIz3iXX1z+sc9NjR/8ZLf+
	 t87rkwlyXm5ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8700580E08;
	Fri,  2 Jan 2026 20:52:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D23C19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157CE40083
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXrPuzMxgjBL for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10AEC40072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10AEC40072
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10AEC40072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:52:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1BA24C1C3BC;
 Fri,  2 Jan 2026 20:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E21D9606C7;
 Fri,  2 Jan 2026 20:52:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3426A113B023D; Fri,  2 Jan 2026 21:52:30 +0100 (CET)
Date: Fri, 2 Jan 2026 21:52:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <20260102215228.26b88159@windsurf>
In-Reply-To: <20260102201743.3421271-1-bernd@kuhls.net>
References: <20260102201743.3421271-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767387151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VUmHyAOgRhvwGmSETZZzxP8b2XyMoiuWDRmFs6Aw5Fs=;
 b=xUm3t/BGPGaT/UekJ6jH51VJXrHVLcwbv1kOISDN1WoYnk/BeLAx91Z3e9GOCO5Sxt7y/k
 Sk7J9OQeMKnqR46QcfFL2OaWKDTRLo+Pb90ZIAmogt6v6SJIOUxRZnllAuOfQ30okGvv/V
 /q7w2R8EU8WRuQU2PkD8FnBnE+5yun4qnkh1i88gl3BVl++ryZ6SI/4aHnXroVDec0ZkJB
 6glMRphBOyaUKN2s9oqycATNSsq6yGSUsT1aHDFYwc1uv1KORSObMp5ILh3TVo9C3x6c4v
 VLx0TrVt6D3J7POYQiWtA17IMs1RJpYZdLijvj8SBLx0IvyoNcqy3zbd8cjCEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xUm3t/BG
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: fix build
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

On Fri,  2 Jan 2026 21:17:43 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 215133c0fc2819f059fbb35071ab2e0987f5107d bumped fio from
> 3.38 to 3.41. Upstream commit
> https://github.com/axboe/fio/commit/4175f4dbec5d1d9e5e0490026e98b1806188e098
> was added to fio 3.40 including FALLOC_FL_ZERO_RANGE which causes build
> errors.
> 
> Added upstream commit which not only fixes musl builds but also uclibc.
> 
> Fixes:
> musl: https://autobuild.buildroot.net/results/8e9/8e946c7104be0295a9a2b946fe4a82bba0e28db8/
> uclibc: https://autobuild.buildroot.net/results/ece/ece6ff1b20fa3482a88ffb3a6167b2bba9b06101/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/fio/0001-fix-musl-builds.patch | 38 ++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/fio/0001-fix-musl-builds.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

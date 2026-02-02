Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4B9E73153
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E66B2408AF;
	Mon,  2 Feb 2026 10:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzbwlyV46bYX; Mon,  2 Feb 2026 10:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950B040872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027905;
	bh=tuFnikmFTTBJttauJ8yVu8jGkrkxwIjJeUyivVTKSEA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XQcnX6CvQtaQurcOMj98rwAvNuffh4RkBysSQ06FQ9SoE6G7aotpxlWCfbv7D1M/V
	 GovWid8ArFu4zEPRyXgzFy0qL2fE8gRkGN+6vxNJPODZx2woHdk7UVJ8Nm5IiN9nr/
	 r7JkepzcdfrzsHQAKuJ6MNUKr+2/8Fkz0/r8NECj/RxvUSslQu9cZkWCChrdTpAYPN
	 BtH2WM0DpBJr1ZzpF8bXkNxKYY+n6ijZy4S49Y5XcUTNt21wONyfNH/a1/iOknyNSn
	 tA9eLoDiwUjW7DrtBFG2i6gRwYVuCHxeoz7wl+N1rxk5wZQaMVV3Xahhbd7KPKAgeQ
	 lli2q0NWGWqJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950B040872;
	Mon,  2 Feb 2026 10:25:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 851B6149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7321140266
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exy4OJPIasuj for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F6CF401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F6CF401FE
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F6CF401FE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 34F8DC237ED;
 Mon,  2 Feb 2026 10:25:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A5D560767;
 Mon,  2 Feb 2026 10:25:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6247119A8891; Mon,  2 Feb 2026 11:24:59 +0100 (CET)
Date: Mon, 2 Feb 2026 11:24:59 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB7cDMWh3LwydCP@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-12-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-12-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=VM+CdzPb/ZoqmAXe85MUNGwspuKuqkoXBH6ZoEO8JTY=;
 b=NX4ygmzzlvlMo0CAiaXLmD5FlH8t9zogtutKOwlUoUpzn1XhdIwWZJrEmnBNq30rmkt1oZ
 7+UHzii659vHWhk7FbfnMvVMdVphGNhvBTmf4Qmpr3adPOWW+TPuiEZnRd09cK3jn1tUXN
 GCokApahW06vOjQSLzRpy5E1ggKSdKSRSe7kloIOeMNjaTRag3Y60IYMIYjZUrJUJdPzBz
 Is2rnoxIIgz+i9hraZSgPBOeYWU/J2pfce05zf2u0chEyGq2qfaN1Tgs48uVdBDrtYvGgh
 9GjPVWAYfbPXA5LWs4zv+9F03gzD7GyUlNBTMm8zbYQWq2WePh73jH3zreXJpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=NX4ygmzz
Subject: Re: [Buildroot] [PATCH 11/17] configs/olimex_a13_olinuxino: bump
 Linux to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:54:44PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux

Causes:

WARNING: configs/olimex_a13_olinuxino_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?
WARNING: .checkpackageignore:35: ignored file board/olimex/a13_olinuxino/post-build.sh is missing

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

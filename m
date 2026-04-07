Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB47FF512C
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82D0403FC;
	Tue,  7 Apr 2026 17:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpp575E64biD; Tue,  7 Apr 2026 17:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C22F402B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583301;
	bh=htNXil/yODSPAiSCX+xnuDVZ1Bh2UCVJuW8lBEVFits=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T2uPGQsQ1ZwIskkypWQA27DCLBxVg1fE91EHuxFLUfkH57sWC9cSyU4qHhbPV7Zze
	 zHPNAcFWBHNuJt5wFsusBeziTVN3NpvvJ2nKM0wrCafQC1IFj7ycCbbF6OwLC8/iKc
	 /fn4j2QOScZjBgNUt5QuveXC63cDsnOWgXcuwlPLUXyiSvyJJptIfJBB2lKCemdynA
	 5sxhIek5Itcl30o84tOueVao/enw7IhQc0Ge/pihcWN6bYNkTa+jA6yMxdTo8R2ydJ
	 ZXDz2XdjQsY5lDSpUoV+h40K8WawKNBdGFN4dIPFUiY87XntRfHKca6lzCQwlZlbui
	 XKvikJjyXN3dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C22F402B3;
	Tue,  7 Apr 2026 17:35:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9FEE2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE94808C5
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1gDMrLPyKVp for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B04C80893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B04C80893
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B04C80893
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:34:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4AB14B00535;
 Tue,  7 Apr 2026 19:34:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Apr 2026 19:34:50 +0200
MIME-Version: 1.0
Date: Tue, 07 Apr 2026 19:34:50 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260407114120.1588215-1-dario.binacchi@amarulasolutions.com>
References: <20260407114120.1588215-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <96267d2f265b702bceb2b0ccac43a4df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775583295;
 bh=MJfwifZdrDATP5KVk2Zfp3OKGYZiSHLG68LbSBojyI4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M1VK+inHmJEj4Oa81LFLbDKn5ZIV7MfQZEru4ADsvxO6kmF7zmh8egm7XURAODZEe
 tp3eSH2d8UdLQ/E2u/iQ4GKRZW1joMRHbbGsghxupbLj8AcLan2oIl5qndLC8H4ycJ
 8Fkmt//xuKwVhZXpXkDETgPpMLGPofa1K4wg0zgTDap6CbEKt+oDzLytO6IxdrRe1v
 F7WgPEKntrXS3sg1rF96N2y3bpNeJoG7Tr/9QPafiUV8NPxtECQeoa4b1iiaLtAZYz
 QcI1fo0t4/uRMMHqmx3nL3p54YeJzsJVSm7ws/DEgqHdfI6eqaSLgggirMLvtSsBq5
 0HRjsAjh5grgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M1VK+inH
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.80 and U-Boot to 2026.04
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/04/2026 13:41, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.80 and U-Boot to
> version 2026.04 for
> 
> - stm32mp135f_dk_defconfig
> - stm32mp157a_dk1_defconfig
> - stm32mp157c_dk2_defconfig
> 
> The removed patches are contained in the new U-Boot version.
> 
> Tested on STM32MP157C-DK2 Discovery Board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8F1E73152
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE67360AF6;
	Mon,  2 Feb 2026 10:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqaYEkp3q044; Mon,  2 Feb 2026 10:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1BF60714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027419;
	bh=2b2+DG/L6yd4gWU0cQjHcEdQR/EVvbBxLNsT5iuT2RU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zq3kC56OWF5IE/z78otTjCRiR52pxnOtabF80gf/R0x7XLfTJDKk03PTAkhVuKCmm
	 2hw+lAHixpiIWr3tvTEfA2myyb5xv/Td9TOGqf9BtpX0oT38nmmFGv3I8bI4Re+Fxm
	 R8IL6Sy+6rsLLf9mbZzUI0tpLGmVkNbdk5iUQvQt6PK6xmJoIl+rDfKQ1A5TVwYptw
	 UV/FJR2+qbR93fRHOD3iKQ6/qFBszf2knxvaNa/T+Zfgx+fJDH/ekCaWUX0qWuLpp4
	 TBLi9r+iIgD4dkLN8c0b69cQbxEOsy/vMyJUjLeYT7Dve/QnMymIvXHgQCfd8Aa48g
	 3ndbeGbzP/b+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1BF60714;
	Mon,  2 Feb 2026 10:16:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7DC01E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3B1140857
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e1VF775gwqj for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7419C40855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7419C40855
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7419C40855
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:16:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 752061A2B9D;
 Mon,  2 Feb 2026 10:16:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 401ED60767;
 Mon,  2 Feb 2026 10:16:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B714119A88EE; Mon,  2 Feb 2026 11:16:51 +0100 (CET)
Date: Mon, 2 Feb 2026 11:16:51 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB5IT-eqRgySeDQ@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-4-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=OV5/2vp+7G26MbuY4oiKY3sCLaZpaSLOJWGqgXhg7mM=;
 b=boZkK4woxmi3XTJvalFDNJUMG8vQJ0miu+XS+hQKpXlX0LtFk7HVXAkwKyE/AREr5da/0q
 6j4hbsopyX91ZOzMAbSD6L09vM3+dkMpCMKx9f98FP30LKToA8exRuOY8q2EPzZykC7LeI
 v6eALrOJ237ASYA5ritpFOLrTP7Pcj1euTzPG/p69v2jz/+prtknAQvC7k4D3cKouu5fgx
 tvaatuN4ndAW1Np3mjQB0g36NlnnoMBfynhGuks8O4eWsPZzZ2klOBZpVi+XzHWtxP2t25
 PBMjPSbZ5KZeSuA3oLa9n0Otq75vuOAavfM5Z3RlqZiyLaMJymPWUrZq0g4bRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=boZkK4wo
Subject: Re: [Buildroot] [PATCH 03/17] board/bananapi: simplify berry and
 ultra configurations
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

On Wed, Jan 14, 2026 at 08:54:36PM +0100, Giulio Benetti wrote:
> The genimage.cfg and post-build.sh files for Banana Pi Berry and
> Ultra are identical. Replace the files in the M2 Ultra directory
> with symbolic links pointing to the M2 Berry directory to reduce
> code duplication and ease maintenance.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I am not sure I'm a big fan of this. Indeed, anyone editing the
bananapi-m2-berry/ files will not necessarily realize that they are
shared with another machine. It would be OK if the files were at a
place where it is more obvious that they are "common".

Also, lots of Allwinner boards in fact could share that same genimage
configuration file.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

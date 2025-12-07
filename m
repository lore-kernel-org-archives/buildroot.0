Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD76FD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ECBE82323;
	Sun,  7 Dec 2025 14:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZRuDy-hL0hX; Sun,  7 Dec 2025 14:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A8882317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117705;
	bh=WNjWrpWLtqg1gYAahj1MbEiB/jx77jxi7dFwxWvAySM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ixnk3bXBr/6+tN+vfF0PRtcDr6p2rzqJSpdairJ4ax2B5WSu9tmNcrm1TJP1IwmTc
	 P6rphSSndlQYYXBMKm0thcc1RFjhYVRxoVui2wxBZgtO7L1yztUzT5nW8DgOuu2Cxi
	 fbdGfr6lFvn3GNbuyciNWkiIabZMTA9PAONzoxQQahquivy9wSPi0RL7gjHgUh0eIm
	 yNcdiirrForQFZDPZojoviXeEWQ1LWyKXWa5kzJwNuot8556tpWNUk9KGfCEQb0Xvv
	 kzADUmVhBb0kE4SEQ62NVfhCeDtn9m3iqJxCLECLlJbRT9FSHPgwTiPM1zDVORnMWv
	 GJHWce7L9Jf0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A8882317;
	Sun,  7 Dec 2025 14:28:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF182CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F05F4069D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTKi9vhaZwUn for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EB034066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB034066D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EB034066D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:28:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D3199C17B73
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B421606D3;
 Sun,  7 Dec 2025 14:28:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A6AB102F2478; Sun,  7 Dec 2025 15:28:19 +0100 (CET)
Date: Sun, 7 Dec 2025 15:28:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>
Message-ID: <20251207152818.562d609c@windsurf>
In-Reply-To: <20251203195640.2297610-4-bernd@kuhls.net>
References: <20251203195640.2297610-1-bernd@kuhls.net>
 <20251203195640.2297610-4-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765117700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7c/qA18Z4E1v/cKiiqdfxYhLuPB2PW6xvf1WNg4ScwM=;
 b=v+TmuIzgeR1FReIyK8rahVrFIHsxk8sHjlTHQCCagPYcTz++Wq0cPZ2TEsCru2DuYqM8EJ
 zxYn2OMLmgdU1ZaGFNHL64eULtwsWDR6JShkGpTZYBimFDtULynicTCnb6UFTxwlKEZ/4V
 Dc5kXkPD2YLT0WQiRKbDeM/qKgTSA/S3axUjkXAIkhH1ph1atho5V2PDyNDNk2pAKM19q1
 hO6J8VRcQndlc2qd0ZtTb1/P9NXIB/dRi6RK6BVNBBA773OT2Ztm3s3loEi20pp1K4ErBx
 g4ZNzNkCbDwpuXO+M+CmzywnnWoSJeGinEGgSqgkq78cIUyaDw7ZWfY97jCGaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=v+TmuIzg
Subject: Re: [Buildroot] [PATCH/next 4/4] package/libvncserver: fix cmake 4
 compatibility
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

Hello Bernd,

On Wed,  3 Dec 2025 20:56:40 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> New patch in the series to bump libvncserver.

Thanks for the patch. Please use the same patch prefix for all patches
in the series. I.e [PATCH/next v2 ...] for all patches, including this
one patch, even if it's new in v2. The version number of for the
*series* not for the individual patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

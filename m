Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EA9C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0438580E4A;
	Mon,  6 May 2024 19:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPj1UYt8iQI0; Mon,  6 May 2024 19:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B7D80E4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B7D80E4D;
	Mon,  6 May 2024 19:28:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8EDD1BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C51F64051B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BrGFgcBoo3m for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 767AB404F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767AB404F4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 767AB404F4
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:28:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85AEDE0003;
 Mon,  6 May 2024 19:28:54 +0000 (UTC)
Date: Mon, 6 May 2024 21:28:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506212853.0f36f8d2@windsurf>
In-Reply-To: <20240505155349.1149835-1-fontaine.fabrice@gmail.com>
References: <20240505155349.1149835-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715023734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3Yvb1+agcUtlms+qDhTBmI0xFERFPmL4kaCl/Z6dok=;
 b=ozend5LUWxvox4vBtVW7+ZPcrMfffXaAJWqh0ZQ0+K5F36cL3k/UIWO/X2reue2nuIPKAm
 azrX2OM7J9SYTIllpxiMo/68n4gplu0xfDXTiv6d97FlHwoT5VEEm+t1fWcwHRlG1yVuBp
 ZttkBN2HVGzxFQRiVBeFapcfteKDLYNFeKj8mTT17csgkP3VBrgvcThaRkLI2n/Cpn+p7i
 V6SVMFK60x2jlrw5Qxp49NAHgx9Ck+1re8lfQzrb+guPJca6PuieLQ3rSuSXml09JruMEn
 QDiF/X3O2hPoqKRPUxWn4s+rT+iTihQBGaRsfOXnCvpRAIbM2nngcLMd6gtj9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ozend5LU
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: fix build with kernel <
 4.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 May 2024 17:53:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with kernel < 4.7 raised since bump to
> version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b and
> https://github.com/ppp-project/ppp/commit/81ad945630120cc1c27c8bb00503be42b76ff202:
> 
> sys-linux.c: In function 'get_ppp_stats_rtnetlink':
> sys-linux.c:1783:29: error: field 'ifsm' has incomplete type
>  1783 |         struct if_stats_msg ifsm;
>       |                             ^~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/82392df447f650f241f23e59e65131fb4a930010
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pile-with-older-Linux-kernel-headers.patch | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch

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

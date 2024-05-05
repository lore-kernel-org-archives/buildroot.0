Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8093C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 14:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EBC82166;
	Sun,  5 May 2024 14:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14lKnqEl_Ph5; Sun,  5 May 2024 14:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D78E82178
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D78E82178;
	Sun,  5 May 2024 14:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 860D91BF616
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E7F5406FD
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfLgABiQlMkp for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 14:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28AD6406AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28AD6406AE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28AD6406AE
 for <buildroot@buildroot.org>; Sun,  5 May 2024 14:27:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D4661C000A;
 Sun,  5 May 2024 14:27:51 +0000 (UTC)
Date: Sun, 5 May 2024 16:27:50 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240505162750.0bc45878@windsurf>
In-Reply-To: <20240411174328.586338-1-fontaine.fabrice@gmail.com>
References: <20240411174328.586338-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714919271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Upht8XfLToK1+vgQaW2ItXBgSKSipCd6OLtDrE7a614=;
 b=ZMmysePpKwbB8OU3L9QA8keBm/4DCwVJ/uKMs7ycAB12qgKSoIfm62chBIoziVxvo+NArr
 vaggIvaxl/7ZGHNrGQtDXqtaYdK0yaS1RQC9f4YJCIZTy8/Vl1TREa+cGTE1XuCK0PYYsJ
 Q3Mf6GuaP0fywGI1c3c9CIxR9Zqwe9NKj/Z/97f0BXXisH5qJ53At02e7Pc+6o1u9TLrXD
 fcLv/Df/o1LEw8lmLurgp2EhcLmnhSk3RsLs8KiRXoMQ+KQvYUCQi30QwZKlrphQdTSbsO
 x8r3vQT8X67EIrtki5fKZIDN6AHfOse9k3qi1Tfrw1MKNIZWXQcitEhM8D4EHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZMmysePp
Subject: Re: [Buildroot] [PATCH 1/1] package/ti-sgx-km: needs BR2_ARM_EABIHF
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 19:43:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ti-sgx-km raises the following build failure without BR2_ARM_EABIHF:
> 
> eurasiacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/17e4da346d062570b9a84ab8eb1ce93c6d7384be
>  - http://autobuild.buildroot.org/results/04fd659472f1928c2621354bb0ea3b60c5dfadec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ti-sgx-km/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

In principle, for a package that's available in full source code, the
ABI shouldn't matter. But this package has some extremely convoluted
Makefile machinery that indeed will not work on ARM EABI, and only on
ARM EABIHF. So: patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

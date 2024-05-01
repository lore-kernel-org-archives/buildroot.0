Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981D5C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649C060BE9;
	Wed,  1 May 2024 19:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0aB6pWBXcZv; Wed,  1 May 2024 19:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E76060C11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E76060C11;
	Wed,  1 May 2024 19:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAE071BF578
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6DFF40582
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWlKXzqg6GDm for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 470F740811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 470F740811
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 470F740811
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:07:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C90F2FF805;
 Wed,  1 May 2024 19:07:28 +0000 (UTC)
Date: Wed, 1 May 2024 21:07:28 +0200
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Message-ID: <20240501210728.7fe0ab6a@windsurf>
In-Reply-To: <20240330212200.794927-1-aladyshev22@gmail.com>
References: <20240330212200.794927-1-aladyshev22@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714590448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+CK4FbHIvUPHDKx2kpA3PM80b80ZeoR/hB8brUpKpE=;
 b=cgKrpeUn2EWpamyYWBB9JKGHDjG9D26Nl9rE8RK5rNHsQeemTi9j+ZqcsE2J348XrpN8lx
 9CevDW4fs5nKCFfz/pjp8APE5Jj4AUy8UeoORen5FHd2/3TxdQ/40KeeFM+8wA/YljlTp4
 w29kncN8kDQAu97Ki5e5XknMDz/t02WnO0D6w0BGsJ3YPPuXQoYAfm+Nr3p1Yr2kpuuCDo
 8EA7KJohPop58ahgNn6sOUW4hwQcctE49rKz9WBS3wy8bUs8VPn/YXobsxqZXrsRCYNRf7
 wJ0mi2ihQxD0LcK1EdPz4rFGyG5hCSSIUNynwK9OSUsAqBc/OR9Itg6BwmT2Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cgKrpeUn
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: add wireless regdb
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Mar 2024 00:22:00 +0300
Konstantin Aladyshev <aladyshev22@gmail.com> wrote:

> Wireless regulatory database lists the allowed radio frequencies for
> each local jurisdiction. Since linux-4.15 the kernel supports loading
> the files regulatory.db/regulatory.db.p7s directly from the
> /lib/firmware directory. Currently this package is not enabled and
> kernel complains with the following message on every boot:
> """
> platform regulatory.0: Direct firmware load for regulatory.db failed
> with error -2
> cfg80211: failed to load regulatory.db
> """
> Add wireless regulatory database package to fix the issue.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  configs/pc_x86_64_bios_defconfig | 1 +
>  configs/pc_x86_64_efi_defconfig  | 1 +
>  2 files changed, 2 insertions(+)

Sorry for the long delay: patch applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

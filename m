Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C140C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E01401A4;
	Sun, 15 Sep 2024 10:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-6XgHaj8O-x; Sun, 15 Sep 2024 10:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F6740528
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F6740528;
	Sun, 15 Sep 2024 10:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B35041BF681
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFC0881C56
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4g7TXcSOePWm for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A482C81C38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A482C81C38
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A482C81C38
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:05:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9103240003;
 Sun, 15 Sep 2024 10:05:36 +0000 (UTC)
Date: Sun, 15 Sep 2024 12:05:35 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240915120535.4a11701c@windsurf>
In-Reply-To: <ZuEdJENuvG2TQCFg@waldemar-brodkorb.de>
References: <ZuEdJENuvG2TQCFg@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726394736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ex1YpmCoOj6FHXUIHdqnVGlHeGfUAtRefto5wtFPyo=;
 b=KRLCLh2vKg0rHbCNg4iqPLL7BLCdq/XT2gDbgzy5pNWrCtog2UO2ACfDbh0GJcEtlq0QFT
 WLp/v/yK8sOWRwM922Xj11LzF5PkY2c2SZ0JuXP3XPLY/41E8ZDdlXdVXWAk07PoLJ6ZFm
 vFHhL7+aP27a/ueJjMnACJg1YB8g+zAHVTD1CjfVHJDGsA0EaO/oh8gWjUGlarvkS7NMa0
 /Jo+m77zb+1utGedH2lzBDwlb7nnKTY2FarNBIzITSswinTaAHMFF3lrO2wbCiFQossj26
 kdawwFCMDqQDY3+sVmJ1I/HTNTJhFOmetZN6jHX6108qVfJpj+v5A2sl3eKiUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KRLCLh2v
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix mips64 n32 big endian
 issue
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

On Wed, 11 Sep 2024 06:31:32 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add a real fix for the time64 issue instead of disabling
> time64 for mips64 n32 big endian.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...r-n32-ABI-breaks-a-lot-of-tests-disa.patch | 28 ---------------
>  ...time64-Select-correct-_dl_fstat-impl.patch | 34 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 28 deletions(-)
>  delete mode 100644 package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
>  create mode 100644 package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch

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

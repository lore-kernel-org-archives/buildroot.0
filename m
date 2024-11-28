Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4730CD70DED
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD87E40824;
	Thu, 28 Nov 2024 20:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTTLI5sJkoDf; Thu, 28 Nov 2024 20:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A8FC407E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A8FC407E6;
	Thu, 28 Nov 2024 20:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62ECEA6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F91F407E5
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0WYhGnjvEtr for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65600407DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65600407DF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65600407DF
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:25:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B8C21BF203;
 Thu, 28 Nov 2024 20:25:56 +0000 (UTC)
Date: Thu, 28 Nov 2024 21:25:56 +0100
To: abelino <abelino.romo@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241128212556.3de4e671@windsurf>
In-Reply-To: <20241127052541.3689574-1-abelino.romo@gmail.com>
References: <20241125000233.2772592-2-abelino.romo@gmail.com>
 <20241127052541.3689574-1-abelino.romo@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732825557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTi/zJs85TmrEvwntomSCDuk1604P+h8D6JkL05VtUY=;
 b=ATxyf1IwJOJqqtEK0AythEuJmssDEtFb2DNHBa1BqvrIjsEV//UVgOKeOYhyEhOQT8T7yR
 BWJ1HxPL5SO7Ph0bb3BJjeO65E8hsD3lJ8iRl4C6K0Yh2Xgxpvt5wb+YLG08z8enR06Uca
 poyjlMTp4YMUvWkXzCCdv1I637gTgG2IBo9epsJ9/4Y203iKZoMFRrKDTWc8XYPWfYsCLv
 Tm8Z8kVK3n2sF1EwVKDoAifN40fffncXpKejNM9UYvZSkX7ejTSfTWxdroJXOJNEynIM+5
 KxeSHuK5Ojm99UtubckwaaKUA/JIIrKZcRdPYACJAVd3rWUcsmvc+AGlCo0bvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ATxyf1Iw
Subject: Re: [Buildroot] [PATCH v2 1/2] package/tpm2-tss: bump version to
 4.1.3
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

Hello,

Thanks for your patch! See some comments below.

On Tue, 26 Nov 2024 21:25:41 -0800
abelino <abelino.romo@gmail.com> wrote:

> On v3.2.2, testing with an Infineon SLB9673 resulted in the following
> error when attempting to read from a previously written NV index.
> Upgrading to the latest release, v4.1.3, resolves the issue:
> 
> ```shell
> ~# tpm2_nvread 0x1900001
> WARN: Reading full size of the NV index
> ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() Error: Esys handle does not exist (70018).
> ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource object is bad
> ERROR: Failed to get shandle
> ERROR: Failed to read NVRAM area at index 0x1900001
> ERROR: Unable to run tpm2_nvread
> ```
> 
> Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
> includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
> features. Bumping to v4.1.3 adds access to these improvements and
> addresses the NV index read issue.
> 
> [1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0
> 
> Signed-off-by: abelino <abelino.romo@gmail.com>

Could you please Signed-off-by with a real name, and proper
capitalization, i.e probably:

	Abelino Romo <abelino.romo@gmail.com>

 ?

> Changes v1 -> v2:
>   - Update `TPM2_TSS_SITE` to use `$(call github,...)` but required additional
>     changes to properly bootstrap `configure`. The previous URL downloaded
>     the release artifact which is bootstraped ahead of time, while the tagged
>     source archive does not contain a `VERSION` and `configure` file.
>     (suggested by Vincent Jardin)

In fact this suggestion from Vincent was not correct. This project
provides automatically generated tarballs *and* manually uploaded
tarballs, and the original package as well as your v1 was using the
manually uploaded tarball, which is good. We should keep doing that.


> diff --git a/package/tpm2-tss/0001-Prepare-bootstrap-file.patch b/package/tpm2-tss/0001-Prepare-bootstrap-file.patch
> new file mode 100644
> index 0000000000..81ee3b6266
> --- /dev/null
> +++ b/package/tpm2-tss/0001-Prepare-bootstrap-file.patch
> @@ -0,0 +1,44 @@
> +From a0a6c030edf233316b9acc56224bfc0d8f637308 Mon Sep 17 00:00:00 2001
> +From: abelino <abelino.romo@gmail.com>
> +Date: Tue, 26 Nov 2024 16:49:14 -0800
> +Subject: [PATCH] Prepare bootstrap file
> +
> +The bootstrap script uses git to create a VERSION file and we do not
> +have access to any git history when pulling the tarball from GitHub's
> +Archive. Therefore, we move the responsibility of generating the
> +VERSION file and autoreconf'ing from the bootstrap script and off to
> +this package's makefile.
> +
> +Signed-off-by: abelino <abelino.romo@gmail.com>

All patches should be submitted upstream (and have an Upstream: tag
pointing to the URL of the upstream submission). But I believe if you
use the release tarball this patch is no longer needed?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

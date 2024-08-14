Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90C2C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2900608E3;
	Wed, 14 Aug 2024 20:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJFBKHBalc_d; Wed, 14 Aug 2024 20:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB2C5608DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB2C5608DF;
	Wed, 14 Aug 2024 20:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABA21BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187E14038E
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wizkI7Bg6DLa for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D65B440342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65B440342
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D65B440342
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:07:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B69AFF802;
 Wed, 14 Aug 2024 20:07:55 +0000 (UTC)
Date: Wed, 14 Aug 2024 22:07:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240814220754.0590bb22@windsurf>
In-Reply-To: <20240813180425.274055-1-james.hilliard1@gmail.com>
References: <20240813180425.274055-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723666075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PiVRnxA5ecYed9GQ8ToS1qQZoOSLUu7YPMsnj4lTt58=;
 b=Cf5StiiBnPYajIMMv2ZMYcqwLlrtImTQxp10ebhlVC4BTYOQldfooKXdwV6shFUPvgst/O
 b9AVokuQVOpb788gC7SgiOxJ8E8wSYsEBMrPm8xiYbgh8rY+k01I+M8hm9CCAgD8qHMrHw
 PxEs/S/Yf41VfrgyWk/CRUW9vRXnaKqQDYocXDi35VfIpoOMNT0BNZZEWHdVrUA9rNe07x
 yJSKT0D+ORljCnD2cmrIp8/t3dWrTcVAwwU6hNcCAkzVKg2IT+pPOM/CbrWeWZuq7zW7nG
 WDSBO0v74MR6Tf6KydbobACAstVLpngIgua0FbyA3kDYJCIYe0c+a+fyJfSNyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cf5StiiB
Subject: Re: [Buildroot] [PATCH 1/1] package/vboot-utils: bump to version
 4b12d392e5b12de29c582df4e717b1228e9f1594
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

Hello James,

On Tue, 13 Aug 2024 12:04:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patches which are now upstream/not relevant.
> 
> Add a patch adding missing USE_FLASHROM guards.
> 
> Set USE_FLASHROM=0 make option to disable flashrom support.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/e55/e55af8335ef38e172e56544901510ae4dbdbff9b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...missing-definition-of-MTD_CHAR_MAJOR.patch |  10 +-
>  ...d-missing-header-include-for-ssize_t.patch |  27 --
>  ...m_csme-add-missing-USE_FLASHROM-guar.patch |  76 +++++
>  .../0003-Avoid-RSA-type-redefinition.patch    |  44 ---
>  .../0004-Disable-static-futility.patch        |  30 --
>  ...05-include-sys-sysmacros.h-for-major.patch |  53 ----
>  .../0006-Update-for-openssl-1.1.patch         | 268 ------------------
>  ...-Make-vboot_version-extern-in-header.patch |  50 ----
>  package/vboot-utils/vboot-utils.hash          |   2 +-
>  package/vboot-utils/vboot-utils.mk            |  11 +-
>  10 files changed, 89 insertions(+), 482 deletions(-)
>  delete mode 100644 package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
>  create mode 100644 package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
>  delete mode 100644 package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
>  delete mode 100644 package/vboot-utils/0004-Disable-static-futility.patch
>  delete mode 100644 package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
>  delete mode 100644 package/vboot-utils/0006-Update-for-openssl-1.1.patch
>  delete mode 100644 package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch

I don't like very much applying version bumps to master now, but this
fixes a build issue, and drops a lot of patches, so: applied to master,
thanks!

Please note that you had forgotten to update the .checkpackageignore
file, so I had to do it when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

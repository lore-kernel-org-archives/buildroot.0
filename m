Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D4C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9CC24097F;
	Thu, 18 Jul 2024 20:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtXr8ZhspZdQ; Thu, 18 Jul 2024 20:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6C640987
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6C640987;
	Thu, 18 Jul 2024 20:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 877471BF36D
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7331340987
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HM1qfS2tlVLD for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE5D14097F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5D14097F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE5D14097F
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:02:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05C161C0004;
 Thu, 18 Jul 2024 20:02:36 +0000 (UTC)
Date: Thu, 18 Jul 2024 22:02:35 +0200
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Message-ID: <20240718220235.6b684778@windsurf>
In-Reply-To: <20240718191355.34e1a05e@booty>
References: <20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com>
 <20240718191355.34e1a05e@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721332957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RuY6Ltrpj5nJ9A0RfQkv4bUSep4QAA7OaaKGu9BrqIc=;
 b=WN7pvX2rgoA9UgytvFTuIzG/H43be6Q/mCp6d0g14SdqSHb/aa5PEoZlHAFoFVs3nmbtmW
 aT7oQ9is4matRZiKaXItKfmlkzdRsV4YL1Nay7qQMwecCGAC694Fl/E5EmSX4vLqKyYxu8
 D+tJJGdEFLRmixzBz+pKQ53Xqfnic0ZH4IWOWudnYBKV2JSaw1y140ZtE5ulGlRO1QMMGc
 qfxkr2M+8MBgxqapZn47KQWXD4PeNovYIK5kLBaCAtWoRQ5vE4uotW45/RMk0drRVOMYhR
 1xt3c882lVD7cepW0vmpjhge5ZKCem37DNd6B9taLiHNCkDBCsJrOndLPSQPxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WN7pvX2r
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 18 Jul 2024 19:13:55 +0200
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> > Add a 'bool' config so we can enable dependencies.  
> 
> That's basically what I did in v1 [0], possibly for this same reason,
> but I'm afraid I don't remember exactly.
> 
> Then in his review Arnout suggested to have only a string option, and I
> did not recall any good reason to not do so, and so v2 came without the
> bool.
> 
> > In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
> > therefore we also need to depend on
> > BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.  
> 
> Arnout, do you think the issues reported by Brandon can be fixed while
> keeping a single string option?
> 
> If they can't, I think it's worth resurrecting the help text from the
> two options as I had written them initially in [0]. Otherwise one would
> have a bool without help text, and woudl have to enable it just to make
> the string option (with help text) visible. Kinda chicken-egg.

Here is something that seems to work:

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 57aac06e20..aff9f01ea4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -136,9 +136,13 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
          that will be merged to the main U-Boot configuration file.
 endif
 
+config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_HIDDEN
+       bool
+       default y if BR2_TARGET_UBOOT_DEFAULT_ENV_FILE != ""
+       select BR2_TARGET_UBOOT_NEEDS_XXD
+
 config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
        string "Text file with default environment"
-       select BR2_TARGET_UBOOT_NEEDS_XXD
        help
          Text file containing the variables to be used as the default
          environment in U-Boot.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

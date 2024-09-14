Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D9C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D125F84709;
	Sat, 14 Sep 2024 07:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SJWixRGXzQi; Sat, 14 Sep 2024 07:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD68D846DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD68D846DC;
	Sat, 14 Sep 2024 07:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 931A01BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E5BE4059F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqg60a77wQpk for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2601140598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2601140598
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2601140598
 for <buildroot@uclibc.org>; Sat, 14 Sep 2024 07:48:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 76FBFC1539
 for <buildroot@uclibc.org>; Sat, 14 Sep 2024 07:48:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F2881C0002;
 Sat, 14 Sep 2024 07:48:04 +0000 (UTC)
Date: Sat, 14 Sep 2024 09:48:02 +0200
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20240914094802.6ee528ae@windsurf>
In-Reply-To: <vc1gt7$8pe$1@ciao.gmane.io>
References: <vc1gt7$8pe$1@ciao.gmane.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726300084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ondogV9dhQRdn7mOAsverKjNxDgWJJykjEqF4JePKPA=;
 b=MFyTe1L7rsYo1Kl526c3kmgDzEx9i8GlBKGza31aP9zIOsHCj2KUNnkyQjgcwmcaVq+5d/
 hoIc0FwZvMo3sQAWI7qo9YkK13qAcEId80UwHItBC0ho+rug3UOWcCjWkhYl+FD646gjjk
 PM5IF5a7ABzWbOZ9XCPp/Ru+tT+fTdZ2qoYhehVk/pOmwFbaLSUTSk/miFgqtEByZYzxQc
 mtm2r27KMQOfjcMd/xW+RL5DJkt3rv4V+jOdz7JGADp7a8SPNeWDtGAyKSj9wgGD7EILSY
 +qKK+7fEuuG3/wotOMt/8ws0ceauudUVnbCUSwhyOYi4SIuoAajRS49WK84cUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MFyTe1L7
Subject: Re: [Buildroot] BR2_DEFCONFIG not being saved by "make
 savedefconfig"
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 13 Sep 2024 14:06:32 -0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> NB: I'm currently using 2020.02.7 as provided by a silicon
>     vendor. Once I get that all set up and working as desired, I do
>     plan on upgrading.
> 
> In my external default config file, I have BR2_DEFCONFIG set to point
> to the location in my external buildroot tree where the default
> configuration file is located. When I do "make savedefconfig", the
> current working configuration is saved to that location has expected.
> 
> However, the BR2_DEFCONFIG setting has vanished from that saved
> configuration.
> 
> Is that expected behavior?

It is, see the main Makefile:

savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
	@$(COMMON_CONFIG_ENV) $< \
		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
		$(CONFIG_CONFIG_IN)
	@$(SED) '/^BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)

it explicitly removes BR2_DEFCONFIG.

The reasoning is:

commit f71a621d91ec27f175fc84012962f88b1107305f
Author: Herve Codina <Herve.CODINA@celad.com>
Date:   Thu Jun 4 10:16:33 2015 +0200

    savedefconfig: Remove BR2_DEFCONFIG from saved defconfig file
    
    BR2_DEFCONFIG should not be present in saved defconfig file.
    
    The use case is:
    make qemu_arm_versatile
    make savedefconfig BR2_DEFCONFIG=my_custom_defconfig
    
    BR2_DEFCONFIG is set in my_custom_defconfig with an absolute path
    to qemu_arm_versatile (value present in .config) and set in
    my_custom_defconfig as it is different from default mentioned in
    config.in (default is BR2_DEFCONFIG from environment).
    
    On savedefconfig recipe, simply remove BR2_DEFCONFIG from generated file
    
    [Peter: fixup typos and use SED as noted by Arnout]
    Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
    Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Not sure I fully grasp the reasoning from back then.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D914C2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 09:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06B2241BFC;
	Fri, 28 Jun 2024 09:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lxbr9rJq7eO; Fri, 28 Jun 2024 09:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B5641B7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B5641B7E;
	Fri, 28 Jun 2024 09:36:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40B981BF3B5
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D6B41BD0
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uj70K5AYWA1 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 09:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7243C41B7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7243C41B7E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7243C41B7E
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:36:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DFD0CC68C7
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:32:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12E351BF20A;
 Fri, 28 Jun 2024 09:32:37 +0000 (UTC)
Date: Fri, 28 Jun 2024 11:32:36 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628113236.6a9d2448@booty>
In-Reply-To: <20240618074922.3555070-2-neal.frager@amd.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
 <20240618074922.3555070-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719567158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9sLHYbw/VUipcwTQEgNHzAj4dMnYqXsdIdPGA9ICVE=;
 b=GzH0bOd5RXWo836YzJML6nMTp4MxU5y3OB2ixDvyqwR/Rgiu3I8X3mGoanlVuPX7iwEHmI
 2w9PdKnowZe8tEFdmeEv/NFldDEMK5Nhi2YpTHS3fhZQJFLFMUzCVCvFayVF5S0fBw7QKB
 F9A7H4uIR0moJ5+CQzmFMnJAvi8kjvYk4S1Ec3NhCtzenVi/+8tUCbHajs06haOlIYXA+x
 q8knTHQib4amrJWo+a4fukBt3rjoavCkshnv3lOG/FJRwIEpjGIX/lNQqDxBq99qQB9Ypq
 dfxebbm4ae8HUc40eVl1KzWhLkk8IRnlMFfEUr3dt1/25E8n+TMN+TZJdE6TBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GzH0bOd5
Subject: Re: [Buildroot] [PATCH v3 2/4] boot/xilinx-prebuilt: wire up
 xilinx-source
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jun 2024 08:49:20 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch wires up the xilinx-prebuilt with xilinx-source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V3:
> - no changes
> ---
>  boot/xilinx-prebuilt/Config.in          |  3 +++
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 13 ++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
> index d3df1c06e7..34b89337fa 100644
> --- a/boot/xilinx-prebuilt/Config.in
> +++ b/boot/xilinx-prebuilt/Config.in
> @@ -22,12 +22,15 @@ choice
>  
>  config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
>  	bool "zynqmp"
> +	depends on !BR2_TARGET_XILINX_SOURCE
>  
>  config BR2_TARGET_XILINX_PREBUILT_KRIA
>  	bool "kria"
> +	depends on !BR2_TARGET_XILINX_SOURCE
>  
>  config BR2_TARGET_XILINX_PREBUILT_VERSAL
>  	bool "versal"
> +	depends on BR2_PACKAGE_HOST_BOOTGEN

Is this bootgen line unrelated to this series? It appears as something
that was needed before and it is being fixed now. If it is the case,
then it should be a separate patch.

Also, I don't like very much how the "family variant" will look like if
we apply this patch. Now if enabling both xilinx-prebuilt and
xilinx-source we will have one "family variant" choice for each. And if
host-bootgen is enabled, the one for xilinx-prebuilt has no selectable
options, which looks very weird.

I'm not sure what is the best thing to do here, but it seems wrong to
have two selectable variants where having different values does not
make sense. What about moving the "family variant" choice before the
two packages and use it for both?

> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index eb78ed10cd..4cb3e2a33e 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -18,8 +18,17 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
>  
>  ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
>  # We need the *.pdi glob, because the file has different names for the
> -# different boards, but htere is only one, and it has to be named
> +# different boards, but there is only one, and it has to be named
>  # vpl_gen_fixed.pdi when installed.
> +
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
> +# The plm.elf and psmfw.elf images will come from xilinx-source, so only
> +# the *.pdi needs to be installed.
> +define XILINX_PREBUILT_INSTALL_VERSAL
> +	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
> +		$(BINARIES_DIR)/vpl_gen_fixed.pdi

These two lines are a duplicate of...

> +endef
> +else # BR2_TARGET_XILINX_SOURCE_VERSAL
>  define XILINX_PREBUILT_INSTALL_VERSAL
>  	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
>  		$(BINARIES_DIR)/plm.elf
> @@ -28,6 +37,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL
>  	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
>  		$(BINARIES_DIR)/vpl_gen_fixed.pdi

...these two lines. It's not a big deal, but I'd consider defining once
the lines for the pdi and conditionally the other two lines:

# if BR2_TARGET_XILINX_SOURCE_VERSAL=y the plm.elf and psmfw.elf images
# will come from xilinx-source, so only the *.pdi needs to be installed.
ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),)
define XILINX_PREBUILT_INSTALL_VERSAL_PLM_PSMFW
        $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
                $(BINARIES_DIR)/plm.elf
        $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
                $(BINARIES_DIR)/psmfw.elf
endef
endif # !BR2_TARGET_XILINX_SOURCE_VERSAL

define XILINX_PREBUILT_INSTALL_VERSAL_PDI
        $(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
                $(BINARIES_DIR)/vpl_gen_fixed.pdi
#endef

...

define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
        $(XILINX_PREBUILT_INSTALL_VERSAL_PLM_PSMFW)
        $(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
        $(XILINX_PREBUILT_INSTALL_OTHERS)
endef

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

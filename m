Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF97C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAED461299;
	Fri, 16 May 2025 09:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Vdh0RyJ4q1s; Fri, 16 May 2025 09:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4CCC61263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4CCC61263;
	Fri, 16 May 2025 09:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 207A41AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0595640760
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdlB8zHpDKDA for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3B0840C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B0840C1D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3B0840C1D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:25:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 224F74316C;
 Fri, 16 May 2025 09:25:39 +0000 (UTC)
Date: Fri, 16 May 2025 11:25:39 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <20250516112539.7f808c68@windsurf>
In-Reply-To: <20250429101607.864604-2-adam.duskett@amarulasolutions.com>
References: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
 <20250429101607.864604-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsu
 hhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747387540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90y6mhghaRqsB0ECMDCAKbCFu+Rfaqu8xiTBLBDsfrk=;
 b=AJYbkd2XFBrrZKTw62mFRv7vNRMRY0ZMzdVbRfpewr8rg5P/QMnD+EbzoiXQNJglKcxnFC
 L5gQNwhIb80BQHjMOdm1g/WDhbJaJ1DhEE+lDv4jL+LQyQPlFuAZnI3/PdvAhxgZyeb+be
 wgVkoQ1jYGMonovFRWpcbx42uOW3rB/KSZw7MuQYWfHFSuAAF1TL9EVy/oC9kQ1AsNBZXg
 hzZ59Wia/DKXYPq9YjZuHjQ2rb36cH2mWqQCU4bqdzktLqa1geMJUrA9WiDHKZe8ZWXmnj
 0LIDl5/BYSiVjlFxIEt1QHnHXxQLK6zzoyT1V26arseoyHrsBO+3vwRn4Kd8og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AJYbkd2X
Subject: Re: [Buildroot] [PATCH v2 2/3] package/mender-update-modules: new
 package
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

Hello Adam,

On Tue, 29 Apr 2025 12:16:06 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Contains community supported Update Modules. An Update Module is an extension
> to the Mender client for supporting a new type of software update, such as a
> package manager, container, bootloader or even updates of nearby
> microcontrollers. An Update Module can be tailored to a specific device or
> environment (e.g. update a proprietary bootloader), or be more
> general-purpose (e.g. install a set of .rpm packages.).
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Thanks for this patch! I think it looks good overall, and I was almost
going to apply it, but I have a few questions/concerns, see below.


> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> new file mode 100644
> index 0000000000..b789a0a00c
> --- /dev/null
> +++ b/package/mender-update-modules/Config.in
> @@ -0,0 +1,190 @@
> +config BR2_PACKAGE_MENDER_UPDATE_MODULES
> +	bool "mender-update-modules"
> +	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-log
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-log
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2

I am confused about those dependencies due to libglib2 and boost-log.
Where do they come from? You don't select libglib2 or boost, and
neither BR2_PACKAGE_MENDER nor BR2_PACKAGE_HOST_MENDER_ARTIFACT use
libglib/boost as far as I can see. Could you clarify?

> +	select BR2_PACKAGE_HOST_MENDER_ARTIFACT
> +	select BR2_PACKAGE_MENDER

I think it would make more sense for this to be a:

	depends on BR2_PACKAGE_MENDER

indeed, this mender-update-modules is really an extension of Mender.
Surely if you want to use those extensions, you know that you want to
use Mender and therefore that you have to enable the Mender package
first.

> +config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
> +	bool "DFU"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
> +	select BR2_PACKAGE_DFU_UTIL
> +	help
> +	  The DFU Update Module is able to update peripheral devices
> +	  connected to the device running Mender.
> +	  Example use-cases:
> +	    - Deploy firmware updates to peripheral devices using the
> +	      USB Device Firmware Update (DFU) protocol
> +
> +	  https://github.com/mendersoftware/mender-update-modules/tree/master/dfu

Config.in comment for the gcc version dependency? I agree a bit
pedantic, but oh well, let's have it for completeness.


> +ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT),y)
> +MENDER_UPDATE_MODULES_MODULES += reboot
> +define MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
> +	$(INSTALL) -D -m 0755 $(@D)/reboot/reboot-gen \
> +		$(HOST_DIR)/bin/reboot-artifact-gen
> +endef

Too bad this one doesn't follow the pattern of
$(@D)/$(f)/module-artifact-gen like the other ones. But OK, fine that's
not your fault :-)

> +MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK),y)
> +MENDER_UPDATE_MODULES_DEPENDENCIES += python3
> +MENDER_UPDATE_MODULES_MODULES += rootfs-version-check
> +define MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
> +	$(INSTALL) -D -m 0755 $(@D)/rootfs-version-check/mender-compare-versions \
> +		$(TARGET_DIR)/usr/bin/mender-compare-versions
> +endef
> +MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU),y)
> +MENDER_UPDATE_MODULES_MODULES += swu
> +endif
> +
> +define MENDER_UPDATE_MODULES_INSTALL_TARGET_CMDS
> +	$(foreach f,$(MENDER_UPDATE_MODULES_MODULES), \
> +	$(INSTALL) -D -m 0775 $(@D)/$(f)/module/$(f) \
> +		$(TARGET_DIR)/usr/share/mender/modules/v3/$(f); \
> +	if [ -d $(@D)/$(f)/module-artifact-gen ]; then \
> +		$(INSTALL) -D -m 0775 $(@D)/$(f)/module-artifact-gen/$(f)-artifact-gen \
> +			$(HOST_DIR)/bin/$(f)-artifact-gen; \
> +	fi; \

Could you indent this by one more level inside the foreach loop?

So overall really it's the libglib/boost question that prevented me
from applying. Everything else is minor stuff, or stuff I could have
tweaked when applying.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

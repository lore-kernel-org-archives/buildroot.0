Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86DEC416E1;
	Mon, 25 Apr 2022 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CatiVwlp9yd; Mon, 25 Apr 2022 20:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F74B4161B;
	Mon, 25 Apr 2022 20:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 560E41BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41883812FC
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCBHLjeEvQ9c for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:16:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 646E780AC0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:16:47 +0000 (UTC)
Received: from 1nj58V-000AQ2-V6 by out3d.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1nj58X-000ATO-TO; Mon, 25 Apr 2022 13:16:45 -0700
Received: by emcmailer; Mon, 25 Apr 2022 13:16:45 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1nj58V-000AQ2-V6; Mon, 25 Apr 2022 13:16:43 -0700
Received: from tsdebian (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id E0FBA43074;
 Mon, 25 Apr 2022 13:16:42 -0700 (MST)
Message-ID: <1650917789.6000.2.camel@embeddedTS.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Mon, 25 Apr 2022 13:16:29 -0700
In-Reply-To: <9223c80f-61a0-985f-7aba-fa6128286fa9@mind.be>
References: <20220422223611.10443-1-kris@embeddedTS.com>
 <20220422223611.10443-2-kris@embeddedTS.com>
 <9223c80f-61a0-985f-7aba-fa6128286fa9@mind.be>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=y0/UfZtG0A1kMbq6KE8/qzdrqWNAGhvLhObTRoXbz3w=;
 b=aqr8loHB0uVBp0hGiSsdj9UPlQKFavk/i5SMdHo+FXt3ZXTeDYmhgwhTLZ++KIhUyxVTH405WUrKIC43cCBoHe7I9shhLnTpdlRFaXVll/JK6MpblF/RHtatd0iCBikAZPJILgrheBbn3lUwZrPgaLqmAg+gfKsBv5iMN1ngpVBuv+pEckdWyUsil8LM98fnePLPiLlXRr0y1mr8CrRlrtApepbfkO2UwZCHERd40OQLXvO/KuNDXIY+vBb4uRax7MAWScNIsjPfudEbpnL8lvCt/si0gHAjcyfnxIpZ8fIwpgGBbKrVZBVqTbn4vzFvzF2mSV0qFa5zyEKI53WxUQ==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: Re: [Buildroot] [PATCH v2 1/4] package/wilc1000-firmware: bump to
 15.6
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Featherston <mark@embeddedTS.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 2022-04-25 at 22:04 +0200, Arnout Vandecappelle wrote:

[snip]
>   Hash for the license file you added was missing.

[snip]
>   We actually use proprietary to mark any non-open-source license. The idea is 
> that SPDX is uses for the LICENSE variable (with an exception: adding + instead 
> of -or-later, and no -only). This is not done consistently, but I don't want to 
> go in the wrong direction :-). And maybe there's something to be said for using 
> a more descriptive license name than proprietary, but this shouldn't be snuck in 
> with a version bump.

I was not aware of either of these details. Thanks for the clarification, I'll
keep them in mind for the future!

-Kris

> 
> 
>   Regards,
>   Arnout
> 
> > +WILC1000_FIRMWARE_LICENSE_FILES = LICENSE.wilc_fw
> >   
> > -define WILC1000_FIRMWARE_EXTRACT_CMDS
> > -	$(UNZIP) -d $(BUILD_DIR) $(WILC1000_FIRMWARE_DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
> > -	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
> > -	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
> > +ifeq ($(BR2_PACKAGE_WILC1000_FIRMWARE),y)
> > +WILC1000_FIRMWARE_FILES += \
> > +	wilc1000_wifi_firmware.bin
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_WILC3000_FIRMWARE),y)
> > +WILC1000_FIRMWARE_FILES += \
> > +	wilc3000_ble_firmware.bin \
> > +	wilc3000_wifi_firmware.bin
> > +endif
> > +
> > +define WILC1000_FIRMWARE_INSTALL_FILES
> > +	cd $(@D) && \
> > +		$(TAR) cf install.tar $(sort $(WILC1000_FIRMWARE_FILES)) && \
> > +		$(TAR) xf install.tar -C $(TARGET_DIR)/lib/firmware/mchp
> >   endef
> >   
> >   define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
> > -	$(INSTALL) -D -m 0644 $(@D)/wilc1003_firmware.bin \
> > -		$(TARGET_DIR)/lib/firmware/atmel/wilc1003_firmware.bin
> > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/mchp/
> > +	$(WILC1000_FIRMWARE_INSTALL_FILES)
> >   endef
> >   
> >   $(eval $(generic-package))
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

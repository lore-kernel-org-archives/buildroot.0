Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C6FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C6360A82;
	Sat,  4 Dec 2021 20:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_r9LxklhN8M; Sat,  4 Dec 2021 20:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 339E560A75;
	Sat,  4 Dec 2021 20:28:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1488D1BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04129401FE
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2WWJN1E15D7 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:28:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA6D8401E7
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:28:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9FF56240006;
 Sat,  4 Dec 2021 20:28:04 +0000 (UTC)
Date: Sat, 4 Dec 2021 21:28:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211204212803.344ccdc5@windsurf>
In-Reply-To: <CADvTj4p6pRZj=iTihdDXAZf7_sT6h0i-=krpMW+OE3YX55a7rA@mail.gmail.com>
References: <20211201135103.2302297-1-james.hilliard1@gmail.com>
 <20211201183413.2a98291c@gmx.net>
 <CADvTj4p6pRZj=iTihdDXAZf7_sT6h0i-=krpMW+OE3YX55a7rA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: enable required kernel
 dependencies
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
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 1 Dec 2021 16:15:24 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> > > +define IWD_LINUX_CONFIG_FIXUPS
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_NI_INTEL)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_X86_64)  
> >
> > Not sure if it is good idea to add the x86_64 specific ones unconditionally
> > (they are marked in check_crypto() with ADD_OPTIONAL instead of ADD_MISSING)?  
> 
> Doesn't the infrastructure drop them automatically if they aren't selectable?

I think the point that Peter Seiderer was trying to make is that
CONFIG_CRYPTO_AES_NI_INTEL and CONFIG_CRYPTO_AES_X86_64 are not
mandatory for iwd, and therefore shouldn't be forced enabled here.

> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES3_EDE_X86_64)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1_SSSE3)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256_SSSE3)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512_SSSE3)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
> > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
> > > +endef

Does it strictly need *all* those options ? We don't want to be too
aggressive in forcing kernel options. We should only force enable the
ones that are absolutely mandatory for iwd to work. We should not force
enable the options that *may* be used by iwd but are not needed in all
cases.

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

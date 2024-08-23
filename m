Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B7EC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3856A840C1;
	Fri, 23 Aug 2024 16:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxjTQMj8QPU0; Fri, 23 Aug 2024 16:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786EA81EE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786EA81EE2;
	Fri, 23 Aug 2024 16:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 753F21BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F9A4064A
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gW5KgVWWyUJa for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:17:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2CBA4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CBA4056C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2CBA4056C
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:17:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF717240005;
 Fri, 23 Aug 2024 16:17:42 +0000 (UTC)
Date: Fri, 23 Aug 2024 18:17:41 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240823181741.499173f2@windsurf>
In-Reply-To: <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
 <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724429863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhXez5oLQbugRS+zNNepeByht+35uzps8EJHm68BACo=;
 b=nOJwNZRH8S52ZHo//DNB+uk+A+QJRSXG7o1ocZkLk7CO5rjWx4v6+wQn3N2eTS079oa3VT
 vkWKsgNF+fdlfSp1lic5hxa/QOXdaGwUamtQrbe43CS9ATUDI2xm5jKi5gw/Dz4k4X97p2
 yycxMUvn/w0dS9TaEiLHp4FjasxNq8UmCL19lh4WcUqLqmHqKf1C803azTvKQlGOyhV3eK
 EEEvrs5P1w8V760m8rJJNTequwQbw4/5kstg2vpjCUpMFlnsFVptjcXwSl+93TedvsY7Tz
 aKVZBsHi8nHKbSpxC6010f9CseLFz21IdKFdgfGa78S7VGllkVLG+M0n5v8AIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nOJwNZRH
Subject: Re: [Buildroot] [PATCH v3 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 20:37:40 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/tinyinit/Config.in   | 10 ++++++++++
>  package/tinyinit/init        | 32 ++++++++++++++++++++++++++++++++
>  package/tinyinit/tinyinit.mk | 12 ++++++++++++
>  5 files changed, 56 insertions(+)

We also need to change busybox.mk to ensure that tinyinit is built
before Busybox:

# Packages that provide commands that may also be busybox applets:
BUSYBOX_DEPENDENCIES = \
	...
	$(if $(BR2_PACKAGE_TINYINIT),tinyinit) \


> diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
> new file mode 100644
> index 000000000000..2ceb8e191e23
> --- /dev/null
> +++ b/package/tinyinit/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_TINYINIT
> +	bool "tinyinit"
> +	depends on BR2_INIT_NONE
> +	help
> +	  A Linux tiny initialization script suitable for resource
> +	  limited systems, which can be used as an alternative to the
> +	  one provided by Busybox.
> +
> +comment "tinyinit needs BR2_INIT_NONE, i. e. no init system installed"
> +	depends on !BR2_INIT_NONE

I find this a bit odd. In the end, shouldn't we simply promote tinyinit
as an init implementation, and have its own BR2_INIT_TINYINIT entry?

Also, should BR2_PACKAGE_TINYINIT select busybox? Or do we pretend that
it is possible to use it with some other implementations of mount and
other basic commands? Perhaps this is a good case to use "imply
BR2_PACKAGE_BUSYBOX", so that BR2_PACKAGE_TINYINIT enables busybox by
default, but still allows removing busybox if really the user knows
what (s)he is doing?

> +define TINYINIT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(TINYINIT_PKGDIR)/init $(TARGET_DIR)/sbin/init
> +	(cd $(TARGET_DIR); ln -sf /sbin/init init)

Hmm. I initially thought this symlink shouldn't be needed, as it's
created by fs/cpio/cpio.mk when you're building a cpio for initramfs:

ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)

define ROOTFS_CPIO_ADD_INIT
        if [ ! -e $(TARGET_DIR)/init ]; then \
                ln -sf sbin/init $(TARGET_DIR)/init; \
        fi
endef

else
# devtmpfs does not get automounted when initramfs is used.
# Add a pre-init script to mount it before running init
# We must have /dev/console very early, even before /init runs,
# for stdin/stdout/stderr
define ROOTFS_CPIO_ADD_INIT
        if [ ! -e $(TARGET_DIR)/init ]; then \
                $(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
        fi
        mkdir -p $(TARGET_DIR)/dev
        mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1
endef

But actually, in the case of a non-static /dev, it doesn't do a
symlink, but adds a pre-init script, and your tinyinit already does the
tasks of this pre-init provided by fs/cpio/init.

So I guess what you did is probably OK, but maybe a comment would be
useful. The only downside of your approach is that it leaves a /init
symlink that isn't used/needed for non-initramfs use-cases, but perhaps
that's OK.


Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

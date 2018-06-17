From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:13:45 +0200
Subject: [Buildroot] [PATCH v3] libusb: add an option to compile examples
In-Reply-To: <20180611134750.27627-1-gael.portay@savoirfairelinux.com>
References: <20180611134750.27627-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180617151345.3034ad05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jun 2018 09:47:50 -0400, Ga?l PORTAY wrote:

> +ifeq ($(BR2_PACKAGE_LIBUSB_EXAMPLES),y)
> +LIBUSB_CONF_OPTS += --enable-examples-build
> +define LIBUSB_INSTALL_TARGET_EXAMPLES
> +	for example in listdevs xusb fxload hotplugtest testlibusb dpfp dpfp_threaded sam3u_benchmark ; do \

As I said in a review of an earlier version, you should use a make loop
instead of a shell loop. One benefit of make loops is that they bail
out if one iteration of the loop fails. A shell loop doesn't, and
continues with the next iterations.

> +		cp -dpfr $(@D)/examples/$${example} $(TARGET_DIR)/usr/bin; \

This should have use $(INSTALL) -D -m 0755 and a full destination path.

I've fixed both issues and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

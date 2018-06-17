From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 17 Jun 2018 17:14:01 -0400
Subject: [Buildroot] [PATCH v3] libusb: add an option to compile examples
In-Reply-To: <20180617151345.3034ad05@windsurf>
References: <20180611134750.27627-1-gael.portay@savoirfairelinux.com>
 <20180617151345.3034ad05@windsurf>
Message-ID: <20180617211401.4zqcmsz544uuantc@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jun 17, 2018 at 03:13:45PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 11 Jun 2018 09:47:50 -0400, Ga?l PORTAY wrote:
> 
> > +ifeq ($(BR2_PACKAGE_LIBUSB_EXAMPLES),y)
> > +LIBUSB_CONF_OPTS += --enable-examples-build
> > +define LIBUSB_INSTALL_TARGET_EXAMPLES
> > +	for example in listdevs xusb fxload hotplugtest testlibusb dpfp dpfp_threaded sam3u_benchmark ; do \
> 
> As I said in a review of an earlier version, you should use a make loop
> instead of a shell loop. One benefit of make loops is that they bail
> out if one iteration of the loop fails. A shell loop doesn't, and
> continues with the next iterations.
>

Sorry to have missed your review.

Hum... the shell's for loop exits in error too when an iteration fails;
which causes make failure for TARGET_INSTALL (unless set +e is
specified)... or maybe I missed something :/

Whatever, I really do prefer your solution.

> > +		cp -dpfr $(@D)/examples/$${example} $(TARGET_DIR)/usr/bin; \
> 
> This should have use $(INSTALL) -D -m 0755 and a full destination path.
> 
> I've fixed both issues and applied.
> 

I pretty sure I picked up this part of code from another package in
buildroot. I can apply the same changes to keep package consistent.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 24 Sep 2013 17:47:00 +0100
Subject: [Buildroot] Fwd: Re: [PATCH] i2c-tools: Add i2c-dev.h to staging
 directory for userspace i2c drivers.
In-Reply-To: <20130924181804.1f76e012@skate>
References: <20130924181804.1f76e012@skate>
Message-ID: <5241C204.4010004@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I managed to drop mailing list from recipient list. Forwarding to 
list.


-------- Original Message --------
Subject: Re: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging 
directory for userspace i2c drivers.
Date: Tue, 24 Sep 2013 18:18:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Organisation: Free Electrons
To: Will Wagner <will_wagner@carallon.com>

Dear Will Wagner,

On Tue, 24 Sep 2013 16:32:10 +0100, Will Wagner wrote:
> On 24/09/2013 16:20, Thomas Petazzoni wrote:

> >> +define I2C_TOOLS_INSTALL_STAGING_CMDS
> >> +	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h
> >> $(STAGING_DIR)/usr/include/linux/ +endef
> >
> > This header is already part of the kernel headers, so it should
> > already be part of the toolchain. Do you have a specific case where
> > this header is missing?
> >
>
> The contents of the header are different, the one from i2c-tools
> contains more.
>
> We also carry a patch similar to this. Our patch has an addition
> which is a dependency on linux (assuming it is selected in the
> config). This ensures that the header from the kernel gets over
> ridden by the one from i2c-tools and not the other way around.

Ah, ok, makes sense. Well, I believe it's really a poor practice from
upstream to have an header with the same location provided by two
separate packages. i2c-tools should really be providing another header,
which includes the kernel one, and adds more stuff.

But, well, this it's not the case, let's support this. Jouko, can you
resend your patch after adding something like:

# make sure we're built after linux so that we can override the kernel
# i2c-dev.h header file
I2C_TOOLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX),linux)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

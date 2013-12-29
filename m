From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:57:50 +0100
Subject: [Buildroot] [PATCH 1/1] lockdev: Fix TARGET_DIR link
In-Reply-To: <20131229174305.GI3567@free.fr>
References: <BLU0-SMTP1038BCF760A4FE2F4B22DA2D9CF0@phx.gbl>
 <20131229174305.GI3567@free.fr>
Message-ID: <20131229185750.074b41d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 29 Dec 2013 18:43:05 +0100, Yann E. MORIN wrote:

> >  define LOCKDEV_INSTALL_TARGET_CMDS
> >  	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
> > -	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
> > +	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
> 
> The .so symlink is not required at runtime, so we do not even have to
> install it in the first place. All we need is a library which filename
> is the same as its SONAME.
> 
> So, if the SONAME is liblockdev.so.1, just rename the library to .so.1.
> If the SONAME is liblockdev.so, just rename the library to .so. If the
> library is already installed with the correct filename, no need to
> rename it.

I've applied the patch, because nowhere in Buildroot we rename
libraries so that they have as filename their SONAME. Therefore, doing
this specifically for liblockdev would be inconsistent with what we do
all over Buildroot.

The SONAME of this library is indeed liblockdev.so.1, so this symbolic
link is needed.

Note that liblockdev.$(LOCKDEV_VERSION).so is *NOT* a symbolic link. It
is the library itself. liblockdev is a bit non-standard: instead of
having its real library binary named liblockdev.so.<version>, it is
named liblockdev.<version>.so. And the liblockdev.so.1 symbolic link is
needed to ensure that there is something matching the SONAME of the
library, as explained above.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

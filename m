From: Summers, Stuart <stuart.summers@intel.com>
Date: Mon, 8 Apr 2019 16:00:24 +0000
Subject: [Buildroot] [PATCH] linux: use host pkg-config when host libelf
 is set
In-Reply-To: <20190406203117.GD2659@scaer>
References: <20190404192413.10205-2-stuart.summers@intel.com>
 <20190405184712.5582-1-stuart.summers@intel.com>
 <20190406203117.GD2659@scaer>
Message-ID: <8a20aa305ce3318c3f07a7aec30ab56a1bbabcc9.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2019-04-06 at 22:31 +0200, Yann E. MORIN wrote:
> Stuart, All,
> 
> On 2019-04-05 11:47 -0700, Stuart Summers spake thusly:
> > A patch was added to the Linux kernel in 5.1.0-rc3 which
> > adds a requirement that the host build environment include
> > pkg-config. Add the correct host-pkgconf dependency and
> > environment variables to ensure Linux picks up the correct
> > libraries.
> > 
> > Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  linux/linux.mk | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 6bf2b88038..05bb5b9525 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -96,10 +96,6 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
> >  LINUX_DEPENDENCIES += host-openssl
> >  endif
> >  
> > -ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
> > -LINUX_DEPENDENCIES += host-elfutils
> > -endif
> 
> Why did you move that block around?

Moved this for a single conditional after the initial LINUX_MAKE_ENV =
...

I could have alternatively separated into two
LINUX_KERNEL_NEEDS_HOST_LIBELF conditions, but I opted to squash them
together.

> 
> >  # If host-uboot-tools is selected by the user, assume it is needed
> > to
> >  # create a custom image
> >  ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
> > @@ -125,6 +121,16 @@ LINUX_MAKE_ENV = \
> >  	$(TARGET_MAKE_ENV) \
> >  	BR_BINARIES_DIR=$(BINARIES_DIR)
> >  
> > +ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
> > +LINUX_DEPENDENCIES += host-elfutils host-pkgconf
> > +LINUX_MAKE_ENV += \
> > +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> > +	PKG_CONFIG_SYSROOT_DIR="/" \
> > +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> > +	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/
> > pkgconfig"
> 
> linux is a kconfig-package, so we should be able to run (for
> example):
>     make linux-menuconfig
> 
> However, this should use the real pkg-config from the host, not ours,
> so
> we explictly blacklist a set of PKG_CONFIG_* variables when calling
> the
> kconfig configurators:
>     
> https://git.buildroot.org/buildroot/tree/package/pkg-kconfig.mk#n174
> 
> If needed, please expand that blacklist with the two additional
> PKG_CONFIG_ALLOW_SYSTEM_{CFLAGS,LIBS} this patch introduces.

I apologize for my lack of understanding in this area. I'm happy to add
this to the blacklist you mentioned. At least local testing seems to
indicate that "make linux-menuconfig" works both with and without the
blacklist. I tried this with a default configuration (make distclean ->
make menuconfig -> enable Linux and use an architecture default config
file -> make linux-menuconfig), and this results in a full host
structure being set up in output/host. So it seems like the blacklist
of these two extra variables isn't strictly necessary. Or am I missing
something? That said, looking at the documentation, maybe this takes
away the ability for a user to have a custom pkg-config path - I'm
using the default installation. So in that sense, blacklisting does
seem like the right thing to do. I'll add this and post a quick update.

> 
> If that is not needed, please expand the commit log to explain it.
> 
> In the meantime, I've marked this patch as changes-requested in
> patchwork.
> 
> Thank! :-)

Thanks for the review!

-Stuart

> 
> Regards,
> Yann E. MORIN.
> 
> > +endif
> > +
> >  ifeq ($(BR2_REPRODUCIBLE),y)
> >  LINUX_MAKE_ENV += \
> >  	KBUILD_BUILD_VERSION=1 \
> > -- 
> > 2.20.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3270 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190408/f912c38f/attachment.bin>

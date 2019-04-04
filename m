From: Summers, Stuart <stuart.summers@intel.com>
Date: Thu, 4 Apr 2019 21:30:40 +0000
Subject: [Buildroot] [PATCH 1/1] package/pkgconf: add host link to
 pkg-config
In-Reply-To: <20190404214227.014dc818@windsurf>
References: <20190404192413.10205-1-stuart.summers@intel.com>
 <20190404192413.10205-2-stuart.summers@intel.com>
 <20190404214227.014dc818@windsurf>
Message-ID: <7d748514e9ab346528731c644c9ad7ff125684ec.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2019-04-04 at 21:42 +0200, Thomas Petazzoni wrote:
> Hello Stuart,
> 
> Thanks for the patch.
> 
> On Thu,  4 Apr 2019 12:24:13 -0700
> Stuart Summers <stuart.summers@intel.com> wrote:
> 
> > A patch was added to the Linux kernel in 5.1.0-rc3 which
> > adds a requirement that the host build environment include
> > pkg-config. Since pkg-config was deprecated in buildroot,
> > add a link in the host directory to /usr/bin/pkg-config.
> 
> pkg-config is definitely not deprecated at all, and Buildroot's 

This was maybe a poorly worded commit message. I just meant that we are
using pkgconf in place of pkg-config. I can remove this.

> pkgconf
> package is already installing it as $(HOST_DIR)/usr/bin/pkg-config:
> 
> define HOST_PKGCONF_INSTALL_WRAPPER
>         $(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
>                 $(HOST_DIR)/bin/pkg-config
> 
> However, the wrapper assumes by default we are building for the
> target,
> and therefore returns results valid for cross-compilation. To return
> results valid for native build, the following environment variables
> need to be passed:
> 
>         PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>         PKG_CONFIG_SYSROOT_DIR="/" \
>         PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>         PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>         PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/shar
> e/pkgconfig"

I apologize if I'm missing something obvious, but adding this to
packages/pkgconf/pkgconf.mk did not seem to make any difference. I also
tried adding this to linux/linux.mk. The latter I didn't do a full
"make clean", but did on the former.

> 
> > Also add a new config option to enforce building host-pkgconf
> > before building the Linux kernel.
> 
> Do we need a new option ? If pkg-config is only used by Linux to 

No need to add this, I agree.

> detect
> libelf, what about just adding host-pkgconf to LINUX_DEPENDENCIES 
> when
> BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF is enabled ?

At least without including the changes I had, I was seeing host-pkgconf 
show up in output/build even without adding this to LINUX_DEPENDENCIES,
although that seems like the right thing to add anyway.

> 
> > +define HOST_PKGCONF_LINK_PKGCONFIG
> > +	ln -sf pkgconf $(HOST_DIR)/usr/bin/pkg-config
> > +endef
> 
> This is definitely wrong and will break the wrapper we install.

Thanks for the feedback and makes sense. Just looking at the right way
to work around this.

Thanks,
Stuart

> 
> Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3270 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190404/894f8573/attachment.bin>

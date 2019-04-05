From: Summers, Stuart <stuart.summers@intel.com>
Date: Fri, 5 Apr 2019 18:50:35 +0000
Subject: [Buildroot] [PATCH 1/1] package/pkgconf: add host link to
 pkg-config
In-Reply-To: <20190405095307.0eb6da82@windsurf>
References: <20190404192413.10205-1-stuart.summers@intel.com>
 <20190404192413.10205-2-stuart.summers@intel.com>
 <20190404214227.014dc818@windsurf>
 <7d748514e9ab346528731c644c9ad7ff125684ec.camel@intel.com>
 <20190405095307.0eb6da82@windsurf>
Message-ID: <04b590d6e83cab222621a407f6662400b58943e0.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2019-04-05 at 09:53 +0200, Thomas Petazzoni wrote:
> Hello Stuart,
> 
> On Thu, 4 Apr 2019 21:30:40 +0000
> "Summers, Stuart" <stuart.summers@intel.com> wrote:
> 
> > > However, the wrapper assumes by default we are building for the
> > > target,
> > > and therefore returns results valid for cross-compilation. To
> > > return
> > > results valid for native build, the following environment
> > > variables
> > > need to be passed:
> > > 
> > >         PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> > >         PKG_CONFIG_SYSROOT_DIR="/" \
> > >         PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > >         PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> > >         PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/
> > > shar
> > > e/pkgconfig"  
> > 
> > I apologize if I'm missing something obvious, but adding this to
> > packages/pkgconf/pkgconf.mk did not seem to make any difference. I
> > also
> > tried adding this to linux/linux.mk. The latter I didn't do a full
> > "make clean", but did on the former.
> 
> Adding those lines to pkgconf.mk will indeed make no difference: they
> should be added to the package calling pkg-config, in cases where
> pkg-config should return results valid for building native code (i.e
> not cross-compiled). Did you try to put this in LINUX_MAKE_ENV for
> example ?

Pointing out my obvious misunderstanding here :). This does indeed fix
the issue.

> 
> > > detect
> > > libelf, what about just adding host-pkgconf to
> > > LINUX_DEPENDENCIES 
> > > when
> > > BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF is enabled ?  
> > 
> > At least without including the changes I had, I was seeing host-
> > pkgconf 
> > show up in output/build even without adding this to
> > LINUX_DEPENDENCIES,
> > although that seems like the right thing to add anyway.
> 
> linux depends on host-kmod, and host-kmod depends on host-pkgconf, so
> indeed, host-pkgconf will always be pulled in. However, since Linux
> is
> using it directly, I think it makes sense to add the host-pkgconf
> dependency to LINUX_DEPENDENCIES.

I agree.

> 
> > > This is definitely wrong and will break the wrapper we install.  
> > 
> > Thanks for the feedback and makes sense. Just looking at the right
> > way
> > to work around this.
> 
> The completely correct way would be:
> 
>  - To have pkg-config return results for native build
> 
>  - To have <tuple>-pkg-config return results for cross-compilation
> 
> But then, when cross-building, we need to convince the packages that
> they need to call <tuple>-pkg-config. The autotools
> PKG_CHECK_MODULES()
> macro does this by default, so a majority of packages would be OK.
> But
> there are also lots of packages that call "pkg-config" directly, and
> those would have to be fixed.

I did glance through the other packages. Enabling everything that
touches host-pkgconf resulted in a build failure in the python module,
which didn't appear to touch pkg-config. I decided to push something a
bit more targeted instead. If you have another suggestion, though, let
me know.

Thanks again for the feedback here!

-Stuart

> 
> Best regards,
> 
> Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3270 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190405/887008fb/attachment.bin>

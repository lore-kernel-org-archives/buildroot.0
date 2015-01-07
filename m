From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jan 2015 23:42:56 +0100
Subject: [Buildroot] [PATCH] package/openocd: disable on blackfin
In-Reply-To: <20150106092656.4bfe90ea@free-electrons.com>
References: <1420489989-21356-1-git-send-email-s.martin49@gmail.com>
 <20150106092656.4bfe90ea@free-electrons.com>
Message-ID: <20150107224256.GH4249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, Thomas, All,

On 2015-01-06 09:26 +0100, Thomas Petazzoni spake thusly:
> On Mon,  5 Jan 2015 21:33:09 +0100, Samuel Martin wrote:
> > The "_" symbol prefix added by the blackfin toolchain causes "undefined
> > symbol" failures during the configuration.
> > 
> > Fixes:
> >   http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> > 
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  package/openocd/Config.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> > index 7c140c7..9543c03 100644
> > --- a/package/openocd/Config.in
> > +++ b/package/openocd/Config.in
> > @@ -1,5 +1,9 @@
> >  config BR2_PACKAGE_OPENOCD
> >  	bool "openocd"
> > +	# disable openocd on blackfin because it triggers "undefined symbol" error
> > +	# becasue of the "_" prefix:
> > +	# http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> > +	depends on !BR2_bfin
> >  	help
> >  	  OpenOCD - Open On-Chip Debugger
> >  
> 
> This seems weird because the "_" prefix normally only causes issues
> when linking C code against assembly code. If you're only linking C
> code against C code, it *should* be fully transparent.

The real culprit seems to be libusb-compat. See config.log:

configure:14893: [...]/bfin-uclinux-gcc -o conftest [...] -static [...] -lftdi -lusb
/home/ymorin/dev/buildroot/O/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o):
In function `_usb_detach_kernel_driver_np':
core.c:(.text+0x96): undefined reference to `_libusb_detach_kernel_driver'

So, it means libusb.a as an undefined reference to _libusb_detach_kernel_driver
which is in fact defined in libus-1.0.a.

If I add -lusb-1.0 -pthread to the link command, it all works great! :-)

So, it looks like 'just' a missing dependency in a static case.

So, marking this patch as Rejected in Patchwork: the real fix is to link
with the appropriate libraries.

Hint: the .pc files seem to be correct. But line 1060 in configure.ac is
where the error originates from. It is the last clause in an AC_RUN_IFELSE
block starting on line 1042... And the rest is left as an exercise. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

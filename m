From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 17:07:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-03
In-Reply-To: <CAAXf6LXtNZD6gaLprTS5XbfZAd_10jcEeXL-yLik9ami0QRmmw@mail.gmail.com>
References: <20131204073002.8453B101504@stock.ovh.net>
 <CAAXf6LXtNZD6gaLprTS5XbfZAd_10jcEeXL-yLik9ami0QRmmw@mail.gmail.com>
Message-ID: <20131205170715.7214aff4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 5 Dec 2013 16:59:31 +0100, Thomas De Schampheleire wrote:

> >       bfin |              xlib_libX11-1.5.0 | NOK | http://autobuild.buildroot.net/results/a47c5d96f880af04b85bb6773e87d04f9d7c2864/
> 
> The problem here is that xlib_libX11 needs dlfcn.h and dlopen, thus
> !BR2_PREFER_STATIC_LIB.
> Adding this 'depends on !BR2_PREFER_STATIC_LIB' to
> package/x11r7/xlib_libX11 is the solution here. However, this requires
> propagating this dependency to all packages that 'select' the
> xlib_libX11 package, which is a very large amount of packages (105),
> most of which are other X packages.
> 
> Is this the way to go or is there a special handling of X packages
> that I'm not aware of?
> For example, should we simply add this dependency to the entire set of
> X11 packages at package/x11r7/Config.in?
> This would greatly reduce the amount of 'depends on
> !BR2_PREFER_STATIC_LIB' additions, but may be too coarse-grained as
> not every X11 library necessarily needs shared libraries (unless of
> course xlib_libX11 is a dependency on all these libraries, I did not
> check that).

If xlib_libX11 needs shared library, then I believe there is no point
in trying to use X.org on systems that don't support shared libraries,
since xlib_libX11 is the fundamental library for X clients.

Therefore, I would also suggest to simply disable all x11r7 packages
when BR2_PREFER_STATIC_LIB is set.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

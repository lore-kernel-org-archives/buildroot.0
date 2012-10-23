From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Oct 2012 09:28:20 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <50863D0A.40809@6wind.com>
References: <508118F0.3030202@6wind.com> <20121019093805.GA2382@mail.sceen.net>
 <50812162.7090809@6wind.com> <20121019095730.GA6397@mail.sceen.net>
 <20121019100213.GA7355@mail.sceen.net> <50813429.3010107@6wind.com>
 <20121021114154.3d23d89b@skate> <50863D0A.40809@6wind.com>
Message-ID: <20121023092820.638aedd0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Mickael,

On Tue, 23 Oct 2012 08:45:30 +0200, Jean-Mickael Guerin wrote:

> > If you have problems with external toolchain support, don't hesitate to
> > point me to the toolchain you're using, and how to reproduce your
> > problem. I am fairly sure it is not related to the fact that we're
> > copying the sysroot.
> 
> Well, the issue *is* this large copy.

Which toolchain are you using that is causing such a large copy?

Here, using the CodeSourcery 2012.03 toolchain, it copies 63 MB into
host/usr/<tuple>/sysroot, and it takes a second when the toolchain
tarball has just been uncompressed before, due to the page cache
already having the contents of the toolchain.

With an already installed toolchain, and therefore no tarball
uncompression, causing the page cache to be cold with regard to
toolchain files, it takes 4 seconds here to copy the sysroot of a CS
2010.09 toolchain, which weights 59 MB.

How big is your sysroot?

> We can improve the share of toolchains among multiple builds, and 
> simplify this code for ext toolchain support (btw there is hack to avoid 
> too big usr/locale..).
> 
> I can propose the patch, but which are the options to get confident?
> Do we have ext-toolchain in the serie of daily auto-build?

Yes, many external toolchains configuration are tested by the
auto-builders. Since I was originally the primary person interested in
external toolchain support, I added a lot of external toolchain
configurations to the autobuilders.

> I could find in archive some discussion about Qtopia, DirectFB, but 
> nothing explicitly related to sysroot or library path.
> Someone else may remember other problem? a specific toolchain?

I remember having horrible problem with libtool, and also many
hand-craft build system not properly passing -I/-L arguments.

Also, I believe that the current mechanism is cleaner: what we are
actually doing is building a second sysroot for the toolchain, that we
extend with our own libraries.

Unless proven otherwise, I believe that the stability we have achieved
in external toolchain support using this solution is well worth the ~60
MB copy at the beginning of a build. It takes less than 5 seconds, with
is in the statistical noise even compared to a simple Busybox-only
build.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

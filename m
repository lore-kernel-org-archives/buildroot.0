From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 17:04:46 +0200
Subject: [Buildroot] About remote debugging and library stripping
In-Reply-To: <20121022144411.GA10398@mail.sceen.net>
References: <20121019091857.GA24434@mail.sceen.net>
 <20121021202719.6c7e0a5d@skate>
 <20121022144411.GA10398@mail.sceen.net>
Message-ID: <20121022170446.53af0468@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 22 Oct 2012 16:44:11 +0200, Richard Braun wrote:
> On Sun, Oct 21, 2012 at 08:27:19PM +0200, Thomas Petazzoni wrote:
> > Can you conclude with what you think are the steps needed to get these
> > things right?
> 
> First, fix the crosstool-ng backend so that libthread_db gets installed.
> The minimal Linux support in gdbserver can lead to serious headaches, so
> it's really better to have this library present in the rootfs.

Ok.

> An option could be added that would govern the installation of
> libthread_db for people who are looking for a truely minimalist rootfs
> and don't intend to debug.

I am not sure what happens with the Crosstool-NG when one enables
BR2_PACKAGE_GDB_SERVER and/or BR2_PACKAGE_GDB_HOST. But I guess we
should copy libthread_db to the target only if BR2_PACKAGE_GDB_SERVER
is enabled, i.e if gdbserver is actually installed on the target.

*But*, to keep things consistent, we should also do the same with the
external toolchain backend, i.e only install libthread_db if
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is enabled. At the moment, the
ext-tool.mk is installing libthread_db on the target only if
BR2_PACKAGE_GDB_SERVER is enabled, which is silly because this option
is not visible in the external toolchain backend case (we assume that
both cross-gdb and gdbserver are provided by the external toolchain).

> Next, strip libpthread using --strip-debug, and *not* --strip-unneeded,
> although this is purely to make sure debugging will work, as the
> requirement to keep some local symbols also depends on the libc and the
> target, and there are sufficiently few such symbols to consider the
> overhead completely negligible (although it could also depend on the
> aforementioned option).
> 
> If noone works on this, I'll submit a patch when I can make some time
> for it.

Ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

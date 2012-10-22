From: Richard Braun <rbraun@sceen.net>
Date: Mon, 22 Oct 2012 16:44:11 +0200
Subject: [Buildroot] About remote debugging and library stripping
In-Reply-To: <20121021202719.6c7e0a5d@skate>
References: <20121019091857.GA24434@mail.sceen.net>
 <20121021202719.6c7e0a5d@skate>
Message-ID: <20121022144411.GA10398@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 21, 2012 at 08:27:19PM +0200, Thomas Petazzoni wrote:
> Can you conclude with what you think are the steps needed to get these
> things right?

First, fix the crosstool-ng backend so that libthread_db gets installed.
The minimal Linux support in gdbserver can lead to serious headaches, so
it's really better to have this library present in the rootfs.

An option could be added that would govern the installation of
libthread_db for people who are looking for a truely minimalist rootfs
and don't intend to debug.

Next, strip libpthread using --strip-debug, and *not* --strip-unneeded,
although this is purely to make sure debugging will work, as the
requirement to keep some local symbols also depends on the libc and the
target, and there are sufficiently few such symbols to consider the
overhead completely negligible (although it could also depend on the
aforementioned option).

If noone works on this, I'll submit a patch when I can make some time
for it.

-- 
Richard Braun

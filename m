From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Oct 2012 20:27:19 +0200
Subject: [Buildroot] About remote debugging and library stripping
In-Reply-To: <20121019091857.GA24434@mail.sceen.net>
References: <20121019091857.GA24434@mail.sceen.net>
Message-ID: <20121021202719.6c7e0a5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Richard,

Thanks a lot for this status.

On Fri, 19 Oct 2012 11:18:57 +0200, Richard Braun wrote:

> There seems to be some confusion about what has to be done to get
> remote debugging actually working with stripped libraries. It seems
> buildroot avoids stripping libthread_db entirely, which was
> introduced by Mike Frysinger (hello Mike) with
> c98bc88e3296222a20e59cfb7b9f3ec5aee3be1c. If you're absolutely
> certain of this change, then please explain it. In my experience (and
> some in-depth search in the sources), libthread_db and libpthread can
> both be stripped.
> 
> To understand why this is possible, the big picture must get clearer.
> First, for those who aren't aware of its existence, libthread_db is
> part of the C library. Its purpose is to hide the implementation
> details of the threading implementation through a well defined
> interface that GDB and gdbserver can use. When gdbserver loads this
> library, it doesn't need the debugging or local symbols. The
> libthread_db library can be stripped as much as any other library.
> 
> This isn't the case for libpthread. As stated in the GDB FAQ [1],
> libthread_db actually needs a few local symbols to work with its
> libpthread counterpart. The libpthread library should only be stripped
> from its debugging symbols (--strip-debug), not its local ones.
> 
> To make things even more complicated, gdbserver (and apparently only
> gdbserver) has support for Linux threads since before 2008 [2], but
> it's limited (you may get weird SIGTRAPs without understanding why).
> This is important because currently, libthread_db isn't installed when
> using the crosstool-ng backend.

Can you conclude with what you think are the steps needed to get these
things right?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

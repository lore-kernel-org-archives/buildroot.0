From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 15:42:28 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAM+bi4s-yu6kSZgRAjRene3h-C5cVuWGUJYnYNzRxYh7T7910w@mail.gmail.com>
References: <20140305073008.3DAFE101B04@stock.ovh.net>
 <20140305112729.47a9a631@skate>
 <CAM+bi4t8Toj7ERf3DR=854xhwAS7-Ubtrr2xTGsfKjk5kRoZHw@mail.gmail.com>
 <CAM+bi4s-yu6kSZgRAjRene3h-C5cVuWGUJYnYNzRxYh7T7910w@mail.gmail.com>
Message-ID: <20140305154228.76f34797@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro Gamez,

On Wed, 5 Mar 2014 15:37:09 +0100, Alvaro Gamez wrote:

> I've discovered there is a race condition on libxmlrpc Makefile set.
> When I sent this patch I tested it on a single core machine, but when
> running on a multicore machine, buildroot has set my jobs level to 4, the
> same as in the build failure above.
> 
> So, when invoking make -j 1, libxmlrpc builds fine, but with -j 4 it fails.
> 
> Upstream tries to support parallel builds, but it still fails due to this
> reason.
> 
>  I face two options here: should I repair upstream's set of Makefile's or
> should I patch buildroots' libxmlrpc.mk in order to force linear build? Is
> this even possible, or a good practice, to change BR2_JLEVEL inside
> libxmlrpc.mk to avoid this?

No, but the good way is:

LIBXMLRPC_MAKE = $(MAKE1)

This disables the parallel build specifically for libxmlrpc.

> Anyway, I think I'm going to try and fix libxmlrpc makefiles, for it seems
> to be, although not the fastest approach, the best way for all users of
> libxmlrpc, but I am open to modify buildroots' libxmlrpc.mk in order to fix
> this by changing JLEVEL as soon as possible.

Usually, we do one or the other solution depending on whether the patch
to fix the parallel build problem is complicated or not. If it's not,
and there is a chance to get it merged by upstream, then it's usually
the preferred solution I would say.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

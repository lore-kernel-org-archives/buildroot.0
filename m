From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Sun, 17 Jul 2016 21:36:44 -0300
Subject: [Buildroot] [PATCH 1/2] build: add support for as-needed linking
In-Reply-To: <20160717210154.GU3614@free.fr>
References: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160717210154.GU3614@free.fr>
Message-ID: <578C249C.9040700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/07/16 18:01, Yann E. MORIN wrote:

> OK, I read both of the above, and I do understand the technicalities
> behind --as-needed.
>
> However, I fail to see what it would bring to Buidlroot.
>
> One key point of --as-needed is to not pull in an unneeded library into
> an executable, in case it does not need it, especially in the case that
> this library is a second-order depedency by way of another library,
> e.g.:
>
>      foo:
>        NEEDED: libbar.so
>        NEEDED: libbuz.so
>
>      libbar.so:
>        NEEDED: libbuz.so
>
> but where foo does not use any symbol from libbuz.so. This purportedly
> allows to update second-order libraries (libbuz, above) when there is
> an ABI change in those libs, and only have to rebuild first-order libs
> (libbar, above) without to rebuild the executable itself.

Hi Yann.
Indeed this is not the point of the new option.

> Another key point is that the dynamic loader will not have to load
> unncessary libraries,thus reducing startup time.

But this is.

> However, I fail to see how that can be any usefull in the context of
> Buildroot.
>
> First, we do not support partial updates, and only catter to full-system
> updates. Thus the first point is moot IMHO.

Agreed.

> Second, the default behaviour of the dynamic linker is to do lazy
> binding, i.e. to only resolve sumbols at the time they are first needed,
> and thus only loading libraries to resolve a missing symbol (unless I'm
> mistaken...)
>
>
> So, what would that bring to us?

Yes, that's what lazy binding does... but it's still based on DT_NEEDED 
entries, hence instead of scanning 10 libraries at required time in my 
example it will only need to scan 8 to resolve required symbols.
For more complex applications that use many nested libraries the savings 
can be bigger.
Example diff between non-as-needed gst-launch-1.0 and as-needed version:

libgstreamer-1.0.so.0
libgobject-2.0.so.0
-libgmodule-2.0.so.0
libglib-2.0.so.0
-librt.so.1
-libdl.so.2
libgcc_s.so.1
libpthread.so.0
libc.so.6

Most of the time even with lazy bindings any given binary will need to 
resolve symbols unless we are building statically.

Regards.

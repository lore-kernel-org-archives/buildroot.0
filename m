From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 3 May 2018 23:47:17 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: fix build with static libcap and
 shared gnutls
In-Reply-To: <20180503214024.71d04136@windsurf>
References: <20180407162234.12848-1-fontaine.fabrice@gmail.com>
 <20180503214024.71d04136@windsurf>
Message-ID: <CAPi7W80B9u5MkAaha=Lu6O6J1-4FAKbkN-+bgwgnrGxa5a4Dvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-05-03 21:40 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Fabrice,
>
> Sorry for the slow feedback on this one.
>
> On Sat,  7 Apr 2018 18:22:34 +0200, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.net/results/b655d6853c25a195df28d91512b3ff
> b6c654fc90
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> So, this happens because when BR2_SHARED_LIBS=y, gnutls installs only a
> shared library, while libcap installs both a static library and a
> shared library.
>
> But really, the crux of the problem is that LXC shouldn't try to build
> a statically linked program when BR2_SHARED_LIBS=y. It doesn't make
> sense, because we don't guarantee to provide static libraries when
> BR2_SHARED_LIBS=y: some packages do build static libraries
> unconditionally, but for examples the autotools packages that obey to
> --disable-static will not build/install static libraries when
> BR2_SHARED_LIBS=y.
>
> And in fact, I'm wondering how your patch resolves that really. I guess
> it disables GnuTLS support in such a situation, but that isn't really
> the right fix IMO. I would rather disable the build of the static
> version of the LXC program.
>
> Do you think you could have a look into this ?
>
The issue was more subtle, init_lxc is a simple binary that LXC wants to be
statically linked if it founds a static version of the only library that it
needs: libcap. Indeed, this binary doesn't need gnutls or any other
dependencies such as selinux or seccomp that are needed for liblxc.
However, because AC_CHECK_LIB was added with its default behavior of adding
gnutls to the global LIBS variable, linking of init_lxc was failing because
gnutls was not static.
So, I think my patch is the right fix and it has been merged upstream:
https://github.com/lxc/lxc/commit/49bc916b1daa79cffe38fae32059bcdd985c8c8e.
Moreover, the issue was raised because when BR2_SHARED_LIBS is set, the
libcap package installs the static and the shared version of the library, I
made a patch to change this behavior but I've not send it as it didn't fix
the root cause of the issue.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180503/f133527d/attachment.html>

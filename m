From: Pawel Sikora <sikor6@gmail.com>
Date: Tue, 11 Apr 2017 11:42:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/xenomai: disable obstack support
In-Reply-To: <c9b79a55-badc-2638-09e3-de5d8471efe1@gmail.com>
References: <20170331202604.18153-1-romain.naour@gmail.com>
 <20170331202604.18153-2-romain.naour@gmail.com>
 <20170401144417.08a84fd7@free-electrons.com>
 <c9b79a55-badc-2638-09e3-de5d8471efe1@gmail.com>
Message-ID: <CAKfV1CYhuGGqWO=OvvmRRhKA1AzycP8xopSapptZGrXD_qKVfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


2017-04-01 23:44 GMT+02:00 Romain Naour <romain.naour@gmail.com>:

> Hi Thomas, All,
>
> Le 01/04/2017 ? 14:44, Thomas Petazzoni a ?crit :
> > Hello,
> >
> > On Fri, 31 Mar 2017 22:26:04 +0200, Romain Naour wrote:
> >> Obstack support in Xenomai is broken when the libc doesn't support
> >> obstack support itself. Make sure we disable obstack support for all
> >> libc since it was removed in uClibc-ng since 1.0.21 release and it's
> >> always disabled with Glibc.
> >
> > What makes you say it's always disabled in glibc?
>
> From lib/boilerplate/obstack.c in Xenomai code:
>
> #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
> # include <gnu-versions.h>
> # if _GNU_OBSTACK_INTERFACE_VERSION == OBSTACK_INTERFACE_VERSION
> #  define ELIDE_CODE
> # endif
> #endif
>
> While glibc is used, _GNU_OBSTACK_INTERFACE_VERSION is equal to
> OBSTACK_INTERFACE_VERSION so ELIDE_CODE is defined and the Xenomai Obstack
> support (the replacement code) is disabled.
>
> While uClibc-ng >= 1.0.21 is used, _GNU_OBSTACK_INTERFACE_VERSION is not
> defined
> so the Xenomai Obstack support is used but break the build.
>
> >
> > What's the status with musl?
>
> Xenomai is disabled with musl toolchains
>
> >
> > Also, Xenomai seems to have some replacement code when obstack support
> > is not available from the C library. How does that interfact with
> > ELIDE_CODE ?
>
> This is precisely the replacement code that is broken...
> It try to use "exitfail.h" and define obstack_exit_failure with
> exit_failure
> which is not defined.
>
> The proposed fix define ELIDE_CODE to disable the Xenomai Obstack support
> completely.
>
> Otherwise, we have to add a dependency on glibc toolchain only since
> Obstack
> support is missing in uClibc-ng... (maybe it's safer to do that?).
>

That's a good question, but I also think that we should add dependency from
glibc,
at least until someone could say (Romain?) what would be the impact on
uClibc-ng without
obstack support... and will test it, right?

..but until then, Thomas/All, what do you think?

Regards,
Pawel


>
> Best regards,
> Romain
>
> >
> > Thanks,
> >
> > Thomas
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170411/0ead8b36/attachment.html>

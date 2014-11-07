From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Nov 2014 08:57:53 +0100
Subject: [Buildroot] CMake building in a subdirectory
In-Reply-To: <CA+TH9VmvRtq9KmXKsxfWDWgUsixg9yL6SMkDEmWNWz18vxuEnw@mail.gmail.com>
References: <CA+TH9VmvRtq9KmXKsxfWDWgUsixg9yL6SMkDEmWNWz18vxuEnw@mail.gmail.com>
Message-ID: <CAHXCMMK9ddV-KdeieCN4AuDVMMx6QHnxoSQLm0qOwPiz_-bpYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Thu, Nov 6, 2014 at 10:15 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Hello list,
>
> I encountered a problem making a new package based on CMake. For this
> package, it's mandatory to build in a subdirectory inside src folder.
> To compile it you have to do something like this:
>
> cd src
> mkdir build
> cd build
> cmake ..
> make
> make install
>
> Honestly, it's a fairly common way to build with cmake, but it's
> unsupported in buildroot. To make it work I changed this in
> pkg-cmake.mk:
>
> -$(2)_BUILDDIR                  = $$($(2)_SRCDIR)
> +$(2)_BUILDDIR                  ?= $$($(2)_SRCDIR)
>
> So, when you define LIBFOO_BUILDDIR in your .mk, cmake automatically
> build in that subdirectory. This works like a charm!
> Obviously, you have to mkdir that dir in LIBFOO_PRE_CONFIGURE_HOOKS.
>
> I can submit a patch, but I would really like to know others opinions.
>

AFAI remember, only eigen needs this but since it it a header only
libs, we choose to install stuff manually using the generic-package
infra.

IIRC, similar propositions were already done.
Among these, the Thomas P. 's RFC [1] about per-package out-of-tree is
certainly the most advanced one trying to generalize this feature to
all infras.

But no work has been merged so far because:
- we managed to workaround the corner cases (e.g.: eigen);
- Thomas' RFC raised some questions/concerns [2] whose status are
unclear (maybe the v3 of the RFC solved them, Thomas?)

For the particular package, you could get inspired by the RFC.

Also, maybe it's time to reconsider/revive this RFC?


Regards,

[1] http://lists.busybox.net/pipermail/buildroot/2013-May/072611.html
[2] http://lists.busybox.net/pipermail/buildroot/2013-May/072556.html


-- 
Samuel

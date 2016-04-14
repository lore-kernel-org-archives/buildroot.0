From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Apr 2016 19:09:53 +0200
Subject: [Buildroot] [PATCH] package/racehound: fix comment
In-Reply-To: <570EAF22.3010800@mind.be>
References: <1460481650-19136-1-git-send-email-yann.morin.1998@free.fr>
 <570D6840.8080800@mind.be> <20160413201835.GA24782@free.fr>
 <570EAF22.3010800@mind.be>
Message-ID: <20160414170953.GA3556@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-04-13 22:42 +0200, Arnout Vandecappelle spake thusly:
> On 04/13/16 22:18, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2016-04-12 23:27 +0200, Arnout Vandecappelle spake thusly:
> >>On 04/12/16 19:20, Yann E. MORIN wrote:
> [snip]
> >>>this comment is shown:
> >>>     racehound needs an Linux kernel >= 3.14 to be built
> >>
> >>  But I would keep this comment if !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14, to
> >>make sure the user realizes that he needs a >= 3.14 kernel. He can still
> >>select the package if the headers ar < 3.14, so if he knows what he's doing
> >>it will be fine.
> >
> >I respectfully disagree. There is no corelation between the headers and
> >the running kernel (except running kernel mnust be more recent than
> >headers).
> 
>  Exactly: the running kernel must be more recent than the headers.

In fact, that's not true (I was wrong). The glibc code will by default
enable workaround for kernels older than the headers, and detect the
version of the kernel it is running on to decide whther to use those
wrokarounds or not.

By default, glibc is *very* conservative, and adds support for kernel
*much* older than the headers (dating back to at least 3.20-or-so IIRC.

This means that, even with headers >= 3.14, a glibc might be able to run
on kernels < 3.14.

In Buildroot, we do configure glibc to not enable those workarounds [0],
utb non-Buildroot toolchains may not do so, like crosstool-Ng which
alows to set an arbitrary value to the oldest supported kernel [1] [2].

So, in fine, we can *not* assume that a toolchain with the appropriate
headers is sufficient to guarantee that the running kernel will be
recent enough.

Note that there were patches (at least a request) floating on the list
that proposed to add such a feature to Buildroot, to be able to specify
the oldest kernel glibc would be able to run under [3].

[0] https://git.buildroot.org/buildroot/tree/package/glibc/glibc.mk#n99
[1] http://crosstool-ng.org/git/crosstool-ng/tree/config/libc/glibc.in.2#n174
[2] http://crosstool-ng.org/git/crosstool-ng/tree/scripts/build/libc/glibc.sh#n501
[3] http://lists.busybox.net/pipermail/buildroot/2016-January/150676.html
and http://lists.busybox.net/pipermail/buildroot/2016-February/thread.html#151640

> So if the
> headers are too old, there is a chance that the kernel is too old. So I
> think it's useful in that case to present a warning to the user, when he
> selects the package, that he must make sure his kernel is sufficiently
> recent. That's what the dependency I proposed would do.

And I don't think that:
 1- it is even correct to begin with, see above;
 2- we should even use the headers_at_least_XXX for that.

> >Besides, this would be misleading in the other way: if headers are 3.14+
> >but kernel is 3.13-, the comment wouild not be shown.
> 
>  Er, what did you just say about running kernel must be more recent than headers?

E.g. the user has a toolchain with 3.14+ headers, but selects a 3.13-
kernel. TRhere is nothing that prevents that in our Kconfig. Not that we
should do it, as it is perfectly possible to run such a kernel, as
explained above (but not with a Buildroot toolchain, however).

> >>>Since there is no way we can know the kernel version to be built, we can
> >>>not add such a condition; still, we leave the kernel message as-is.
> >>  It can be tested in a pre-configure hook. But the cmake rules already check
> >>for that, so there's no need to do it again in buildroot.
> >No, it does not check for it since we pass it -DKERNEL_VERSION_OK=YES
>  Why do we do that?

I guess because otherwise the CMakefile does a test on the host kernel?
It uses ${CMAKE_SYSTEM_VERSION} which is set by CMake to `uname -r`.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

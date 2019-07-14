From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 22:33:29 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: use TCP for msg passing
In-Reply-To: <20190711193654.2039-1-matthew.weber@rockwellcollins.com>
References: <20190711193654.2039-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190714203329.GJ29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2019-07-11 14:36 -0500, Matt Weber spake thusly:
> fakeroot can be built to either use SYSV IPC or TCP for message passing.
> 
> Cases for which the SYSV IPC version fails or causes problems but for
> which fakeroot-tcp has been observed to work well include the items
> listed below.
> 
>   * Multithreaded applications (using pthread)

I know you used the commit log from upstream, but that was written 12
year ago now. 12 years ago NPTL was still new-ish, and LinuxThreads were
still alive. Is it still true that fakeroot misbehaves when using
pthreads at all nowadays?

>   * Running under realtime-preempt kernel
>   * Microsoft Windows 10 Services for Linux
> 
> Link to readme capturing original upstream bug report #
> https://salsa.debian.org/clint/fakeroot/commit/113c6320244c4261f7f7a9ce07cf7b5465573dfe
> 
> Fixes
> https://bugs.busybox.net/show_bug.cgi?id=11366
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> I can't find a good reason to not make this the new default in the
> Buildroot host build of fakeroot.  vs auto detecting which to build
> depending on what the host env can support.

I have two questions:

  - can we run two unrelated fakeroot concurrently? E.g. if we have two
    buildsin parallel, which happen to each call their fakeroot at about
    the same time that the two fakeroot will run in parallel, won;t that
    clash? I think it boils down to how fakeroot chooses the port to
    listen on;

  - is there a performance issue? I wonder how it behaves for very big
    rootfs content, when compared to the sysv ipc.

Regards,
Yann E. MORIN.

> For good measure, in-addition to this change, I will submit an upstream
> patch for the suggested configure.as update (pending a little cleanup
> in that proposed patch). https://bugs.busybox.net/attachment.cgi?id=7791
> ---
>  package/fakeroot/fakeroot.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index 4aa27a1b0c..d8effc955e 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -16,6 +16,8 @@ HOST_FAKEROOT_CONF_ENV = \
>  	ac_cv_header_sys_capability_h=no \
>  	ac_cv_func_capset=no
>  
> +HOST_FAKEROOT_CONF_OPTS = --with-ipc=tcp
> +
>  FAKEROOT_LICENSE = GPL-3.0+
>  FAKEROOT_LICENSE_FILES = COPYING
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

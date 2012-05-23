From: Shawn Ferris <shawn.ferris@gmail.com>
Date: Wed, 23 May 2012 08:33:09 -0600
Subject: [Buildroot] Buildroot and linux-pam?
In-Reply-To: <CADiAo4K8TGbzt0Ea1uFXx5vLoSL_TbijL9fofbT33Nm8oHGutg@mail.gmail.com>
References: <CADiAo4+Co31-t+z_Ydraw_LW5Fwup3TtSJ+GQqYdqQSEtWpOzQ@mail.gmail.com>
 <CADiAo4K8TGbzt0Ea1uFXx5vLoSL_TbijL9fofbT33Nm8oHGutg@mail.gmail.com>
Message-ID: <CAC2kKA80TCptPv7gv+tGKw8hfhsaUH5_i+1doewQjGS_iUWf-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2012 at 6:55 AM, Dmitry Golubovsky <golubovsky@gmail.com> wrote:
> Hi,
>
> Thomas Petazzoni wrote:
>
> There are few functions (ruserok_af, innetgr) that uClibc is likely
> missing (or they are excluded per current configuration), and while
> calls to these functions ought to be disabled via configure, per
> existing code they are not. This might be a reportable bug*, but as my
> goal was to find a way to compile it in principle, I used such brute
> force replacing them with dummy macros just to get through. Another
> hack was overwriting makefiles in docs since Buildroot's toolchain may
> be missing some doc generation facilities, and I see little value in
> them anyway at least for Buildroot.

Hi Dmitry -- I was attempting to get systemd user sessions going when
I realized that pam was needed. I tried to work around it, but I'm
told it's futile. So, I saw this message and thought I'd give it a
shot. I added this package and updated my busybox and systemd packages
to reflect the addition. Upon compile I get this from linux-pam:

In file included from pam_access.c:45:0:
/root/build-root/panda-042012/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/netdb.h:425:12:
error: expected identifier or ?(? before numeric constant
/root/build-root/panda-042012/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/netdb.h:517:12:
error: expected identifier or ?(? before ?-? token

which of course is the definition of innetgr and ruserok_af
respectively. If I look at config.h, I see the additions:

#undef HAVE_RUSEROK
#define HAVE_RUSEROK_AF
#define ruserok_af(a, b, c, d, e) (-1)
#undef innetgr
#define innetgr(a, b, c, d) 0

What did I do wrong? do you have any updates to this?

Any help would be greatly appreciated!

Shawn

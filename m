From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Fri, 9 Dec 2011 10:44:24 +0800
Subject: [Buildroot] [PATCH] linux: support "local" as download method
In-Reply-To: <20111208223000.72d8e084@skate>
References: <1323255396-28263-1-git-send-email-tjlee@ambarella.com>
 <CAEvN+1j08xz+a+sz_3vmUa8tQ18xnv+9KR2MA9E_ub-SZeerEA@mail.gmail.com>
 <20111208223000.72d8e084@skate>
Message-ID: <CAEvN+1hUU4Xd+BuMn+5DmdHAYx2Oue8QeruW50FLH0+LJ3PB2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 9, 2011 at 5:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> What this patch does is already possible through the "override source
> directory" mechanism, which is available for every package.
>
> It's true that the Linux package is special in that it is very likely
> that many people will want to use a local source directory, but I'm
> fearing that we will end up adding many of those
> "<something>_CUSTOM_LOCAL" option that just duplicate what is possible
> thanks to the override source directory mechanism.

I tried both LINUX_OVERRIDE_SRCDIR and LINUX_CUSTOM_LOCAL, and sent the
patch for the latter in case someone else might end up doing the same thing.

But soon I realized that our team may need another METHOD to support
out use case.
Have we considered IN-PLACE build alternative or option?


For most of the packages, it is good enough for users/developers to
leverage the power of buildroot to

    fetch, ..., configure, build, mkimage

However for some packages, ex: linux kernel, that a team or company
actually works on,

   modify, configure, build, mkimage

has much higher frequency than the former case.

I tried to find a "OVERRIDE" ways to do this haven't worked out yet.
Any comments or suggestion will be appreciated.

Do I need to extend the following code for support IN-PLACE case?

ifeq ($$($(2)_OVERRIDE_SRCDIR),)
# In the normal case (no package override), the sequence of steps is
#  source, by downloading
#  depends
#  extract
#  patch
#  configure
#  build
else if <OVERRIDE CASE>
# In the package override case, the sequence of steps
#  source, by rsyncing
#  depends
#  configure
# build

else if <IN-PLACE CASE>
#  depends
#  configure
#  build

> See http://free-electrons.com/blog/buildroot-2011-11/ for more details
> on this source directory override mechanism.

Actually, it was this post that brought me to buildroot again :)

Thanks,
Roy

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Dec 2020 11:06:34 +0100
Subject: [Buildroot] [PATCH 0/3] package/ti-stgx: tentative bump (branch
 yem/ti-sgx-stuff)
In-Reply-To: <CAFSsvmrRihGW-iXKkYyTfyCKGU7Nhtt5bhUxES-pLmW8ngQ5Ew@mail.gmail.com>
References: <cover.1607633239.git.yann.morin.1998@free.fr>
 <CAFSsvmrRihGW-iXKkYyTfyCKGU7Nhtt5bhUxES-pLmW8ngQ5Ew@mail.gmail.com>
Message-ID: <20201212100634.GA3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-12-11 12:19 -0800, Adam Duskett spake thusly:
> I tested the series on an existing build I am using and everything
> compiled fine. However, I did not realize that

Thanks for the heads-up on this.

> I already have Markus Zehnder's patch from
> https://patchwork.ozlabs.org/project/buildroot/patch/20200702201125.3639873-1-aduskett at gmail.com/
> which allows QT5 to build fine.
> 
> As such, please disregard the aforementioned "tested-by's."

Well, do the first two patches still make sense on their own, without
the subsequent bump in this patch?

> Yann, you will have to either include Markus' patch or find a
> different solution.

Ah, right, I did not test that patch because it looked suspiciously like
the one from https://codereview.qt-project.org/c/qt/qtbase/+/248270 which
has not been applied upstream.

But when one look closer at Markus' patch, we can see indeed that there
is a very slight difference, which I believe makes it very incorrect.

For reference, here's the upstream PR patch snippet (without comments or
context):

    -        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
    +        quintptr nativeDisplayPtr = reinterpret_cast<quintptr>(nativeDisplay);
    +        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, reinterpret_cast<void *>(nativeDisplayPtr), nullptr);

and here's Markus patch snipppet:

    -        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
    +        qintptr nativeDisplayPtr = reinterpret_cast<qintptr>(nativeDisplay);
    +        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, reinterpret_cast<void *>(&nativeDisplayPtr), nullptr);

There is a very slight difference in there that I initially did not
spot.

Indeed, when one look closer, we can see that the original code would
use nativeDisplay, which is "something", which happens to match the
pointer expected by getPlatformDisplay(), the function to call the
eglGetPlatformDisplayEXT extension.

But with Markus' patch, we're basically mow passing a "pointer to
something that is interpreted as somestuff", so essentially, we're
passing a "pointer to something" instead of "something": note the '&' in
front of the re-interpreted nativeDisplayPtr, which is missing in the
patch from the upstream PR.

So yes, this makes the build succeed with ti-sgx, because we now pass a
pointer. And I suspect that also does not break at runtime either, because
that code path is never hit, as explained with a comment in the upstream
patch:

    // EGLNativeDisplayType may be int on some platforms but those
    // won't hit this path. Have to keep it compiling nonetheless.

So, for ti-sgx, this patch makes the stuff not break, indeed (at least
the build of beaglebone_qt5_defconfig does succeed, but I have no BBB,
so can't test).

However, I suspect this patch is very incorrect for anything else that
does have the eglGetPlatformDisplayEXT extension, like most other GL
implmentations such as mesa...

Of course, I am not a C++ expert, and I am no GL or Qt expert either, so
I may have missed some subtleties...

So, I still don't see how we would solve that issue, except maybe not
allow that combination to begin with, maybe...

Regards,
Yann E. MORIN.

> Adam
> 
> On Thu, Dec 10, 2020 at 12:47 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Hello All!
> >
> > This series is a respin based on the initial patch from Adam:
> >     https://patchwork.ozlabs.org/project/buildroot/patch/20200702201125.3639873-1-aduskett at gmail.com/
> >
> > That patch did help some people (see the replies), but unfortunately it
> > still has a few shortcomings that I have tried to address, mostly
> > unsuccessfully.
> >
> > The most prominent issue was that the removing of ti-sgx-libgbm was not
> > properly propagated to qt5base, and thus the build of qt5base would
> > succeed becasue it avoided a problematic code path. Fixing that causes
> > qt5base to no longer build, hitting the upstream issue:
> >     https://bugreports.qt.io/browse/QTBUG-72567
> >
> > That has not yet been fixed upstream, and of the proposed patches, or
> > various suggestions in various Qt-related forums, none do fix the issue
> > either:
> >   - patches in the PR itself
> >   - https://codereview.qt-project.org/c/qt/qtbase/+/248270
> >   - https://forum.qt.io/topic/88588/qtbase-compilation-error-with-device-linux-rasp-pi3-g-qeglfskmsgbmwindow-cpp/8
> >   - https://forum.qt.io/topic/91596/raspberry-pi-3-compiling-qt-5-11-0-problem/6
> >
> > So, I am at a loss at how to actually fix that further...
> >
> > Still, here is a repsin with at least the changes I deemed necessary to
> > reduce the problem-space. Any feedback or further guidance would be
> > highly appreciated.
> >
> > Regards,
> > Yann E. MORIN.
> >
> > Regards,
> > Yann E. MORIN.
> >
> >
> > ----------------------------------------------------------------
> > Adam Duskett (3):
> >       configs/beaglebone_qt5: switch to using KMS instead of wayland+weston
> >       package/ti-sgx-demos: use KMS-based demos
> >       package/ti-sgx-{km, um}: bump to SDK 06.01.00.08 versions
> >
> >  Config.in.legacy                                   |  7 +++++
> >  board/beaglebone/readme.txt                        | 12 +++++++-
> >  .../rootfs_overlay/etc/qt5/eglfs_kms_cfg.json      | 15 ++++++++++
> >  configs/beaglebone_qt5_defconfig                   |  5 +---
> >  package/Config.in                                  |  1 -
> >  package/qt5/qt5base/qt5base.mk                     |  4 +--
> >  package/ti-sgx-demos/ti-sgx-demos.mk               |  2 +-
> >  package/ti-sgx-km/ti-sgx-km.hash                   |  4 +--
> >  package/ti-sgx-km/ti-sgx-km.mk                     |  4 +--
> >  .../0001-Add-missing-sys-sysmacros.h-include.patch | 25 -----------------
> >  package/ti-sgx-libgbm/Config.in                    | 12 --------
> >  package/ti-sgx-libgbm/ti-sgx-libgbm.hash           |  3 --
> >  package/ti-sgx-libgbm/ti-sgx-libgbm.mk             | 32 ----------------------
> >  package/ti-sgx-um/Config.in                        |  1 -
> >  package/ti-sgx-um/ti-sgx-um.hash                   |  4 +--
> >  package/ti-sgx-um/ti-sgx-um.mk                     |  4 +--
> >  16 files changed, 45 insertions(+), 90 deletions(-)
> >  create mode 100644 board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
> >  delete mode 100644 package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
> >  delete mode 100644 package/ti-sgx-libgbm/Config.in
> >  delete mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
> >  delete mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
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

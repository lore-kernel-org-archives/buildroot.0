From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Jun 2017 20:01:31 +0300
Subject: [Buildroot] [PATCH 00/14] toolchain-external: remove support
 for glibc before 2.17
In-Reply-To: <02e9b62f-282c-ce57-a706-ccbbb33a5f0f@mind.be>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <02e9b62f-282c-ce57-a706-ccbbb33a5f0f@mind.be>
Message-ID: <20170622170131.7yvbkhrvute2movf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Peter, a question for you below.

On Thu, Jun 22, 2017 at 09:57:09AM +0200, Arnout Vandecappelle wrote:
> On 16-06-17 05:32, Baruch Siach wrote:
> > As discussed[1] recently on the list it is time to remove support for glibc 
> > older than 2.17. This does not mean that toolchains with old glibc will stop 
> > working. It only means that we stop fixing older glibc build issues. In 
> > particular, the need to link with librt for clock_* system calls.
> > 
> > The only significant user visible change in this series is the removal of 
> > CodeSourcery toolchains for x86 and sh.
> > 
> > Two patches update a comment section and the manual to take into account the 
> > removal of toolchain in this series and in previous commits. A few more 
> > per-package patches remove local patches for the glibc librt issue.
> > 
> > The first patch is an unrelated fix to the external toolchain section in the 
> > manual.
> > 
> > [1] http://patchwork.ozlabs.org/patch/773384/
> > 
> > Baruch Siach (14):
> >   docs/manual: update external toolchain advantages list
> >   toolchain: remove CodeSourcery x86 toolchain
> >   toolchain: remove CodeSourcery sh toolchain
> >   package: remove CodeSourcery sh dependencies
> >   toolchain-external: update list of toolchains
> >   docs/manual: drop mention of removed external toolchains
> >   swupdate: don't link with librt
> >   aiccu: don't link with librt
> >   libv4l: don't link with librt
> >   e2fsprogs: don't link with librt
> >   liboping: no need to check for clock_gettime
> >   openipmi: no need to check for clock_gettime
> >   lirc-tools: no need to check for clock_gettime
> 
>  After all of these have been applied, "git grep -e -lrt" still yields quite a
> few results that at first sight could also be removed. Was that intentional or
> did you just miss them? Perhaps also grep for clock_gettime.

Here is a summary of all files matching the '-lrt\|clock_gettime' RE pattern. 

package/blktrace/0001-iowatcher-link-with-lrt.patch

  Needed for posix_spawn*().

package/canfestival/0001-install-pkgconfig-module-for-canfestival.patch

  Small part of of the pkgconfig support patch.

package/eudev/eudev.mk

  Needed for mq_getattr()

package/faketime/0001-Disable-the-non-null-compare-warning-error.patch

  Patch context.

package/flac/0001-configure.ac-relax-linux-OS-detection.patch

  Patch description.

package/flashbench/flashbench.mk

  Replicate upstream -lrt.

package/gstreamer/gst-fsl-plugins/0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch

  Needed for shm_open().

package/haveged/haveged.mk

  configure option name.

package/iozone/0001-targets.patch

  Needed for AIO.

package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch

  Patch description.

package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch

  Patch context.

package/mariadb/0001-add-extra-check-for-librt.patch

  Patch context.

package/multicat/0001-Fix-missing-pthread.patch

  Patch context.

package/qemu/qemu.mk

  Needed for timer_gettime()

package/qt5/qt5base/qmake.conf

  Maybe redundant -lrt. I'm not too familiar with the Qt5 build system to know.
  Peter (Seiderer)?

package/softether/0006-librt.patch

  Host package.

package/squeezelite/0001-Makefile-allow-passing-CFLAGS-and-LDFLAGS.patch

  Replicate upstream libs of libraries.

package/squid/squid.mk

  Needed for shm_open().

package/syslog-ng/syslog-ng.mk

  Needed for mq_*().

package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch

  Needed for uClibc posix_spawnp().

package/wiringpi/0001-Adjust-for-buildroot-build.patch

  Patch context.

package/x11r7/xserver_xorg-server/1.19.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch

  Patch context.

All in all only the qt5 match might be removed. I would appreciate an advice 
from someone familiar with the Qt build system.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

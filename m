From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 4 Jan 2021 14:19:06 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/trace-cmd: bump to version
 2.9.1
In-Reply-To: <20210103110920.GM2997@scaer>
References: <20201203104841.152299-1-nolange79@gmail.com>
 <20210103110920.GM2997@scaer>
Message-ID: <CADYdroNCoM6CqOd+bEwLyFbZrmxzUS+r_B+pHkvQDiOYcdtTvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Yann E. MORIN <yann.morin.1998@free.fr> schrieb am So., 3. J?n. 2021, 12:09:

> Norbert, All,
>
> On 2020-12-03 11:48 +0100, Norbert Lange spake thusly:
> > Layout in upstream changed, trace-cmd is now moved into
> > a subdirectory as multiple other components are included.
> > This changes how a build should be done, CFLAGS are now
> > passed through the environment, as the build needs to add
> > stuff like include paths.
> >
> > Build now uses the trace-cmd target and Installation uses
> > the install_cmd target.
> > This ensures all related components(bash-completion,
> > plugins) are built and installed, and nothing else.
> >
> > For while, its possible to download a tar archive, which
> > is simpler than doing a git checkout and packaging.
> >
> > Drop upstreamed patch.
> >
> > Remove now unneeded option -fcommon.
> > (dont know if the _LARGEFILE64_SOURCE filter is still needed)
> >
> > Change to 2-spaces in trace-cmd.hash file.
> >
> > Recalculate hash for COPYING, this changes as referenced
> > license files were moved to a LICENSE subdirectory.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> I had to do quite a few changes to make that eventually work:
>
>   - keep using a git clone


>
Why is a git checkout necessary/preferable ?

  - unbreak the build:
>     - use the default make target rule, or the plugins and python
>       bindings be built at install time, with the host compiler
>     - use the default install target rule
>

ACK, did not catch this

Norbert


>   - expand commit log:
>     - detail buildsystem issues
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> > v1->v2
> > *   specify prefix to /usr
> > v2->v3
> > *   also specify etcdir, used for bash_completion
> > v3->v4
> > *   Fix COPYING hash
> > *   use official git repo (according to README)
> > *   Improve commit message
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  ...0001-trace-listen-add-missing-header.patch | 38 -------------------
> >  package/trace-cmd/trace-cmd.hash              |  6 +--
> >  package/trace-cmd/trace-cmd.mk                | 26 ++++++-------
> >  3 files changed, 16 insertions(+), 54 deletions(-)
> >  delete mode 100644
> package/trace-cmd/0001-trace-listen-add-missing-header.patch
> >
> > diff --git
> a/package/trace-cmd/0001-trace-listen-add-missing-header.patch
> b/package/trace-cmd/0001-trace-listen-add-missing-header.patch
> > deleted file mode 100644
> > index 350e523025..0000000000
> > --- a/package/trace-cmd/0001-trace-listen-add-missing-header.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From c68c868b573acc73e144312326750be2ed96632f Mon Sep 17 00:00:00 2001
> > -From: Baruch Siach <baruch@tkos.co.il>
> > -Date: Thu, 29 Jun 2017 14:43:19 +0300
> > -Subject: [PATCH] trace-listen: add missing header
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=UTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -The PATH_MAX macro requires the limits.h header. This fixes build with
> musl
> > -libc:
> > -
> > -.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c: In function
> ?make_pid_name?:
> > -.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c:167:16: error: ?PATH_MAX?
> undeclared (first use in this function)
> > -  snprintf(buf, PATH_MAX, VAR_RUN_DIR "/trace-cmd-net.pid");
> > -                ^~~~~~~~
> > -
> > -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ----
> > -Upstream status: https://lkml.org/lkml/2017/6/29/286
> > -
> > - trace-listen.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/trace-listen.c b/trace-listen.c
> > -index 17ff9d8c160c..838d6bcf3649 100644
> > ---- a/trace-listen.c
> > -+++ b/trace-listen.c
> > -@@ -31,6 +31,7 @@
> > - #include <fcntl.h>
> > - #include <signal.h>
> > - #include <errno.h>
> > -+#include <limits.h>
> > -
> > - #include "trace-local.h"
> > - #include "trace-msg.h"
> > ---
> > -2.11.0
> > -
> > diff --git a/package/trace-cmd/trace-cmd.hash
> b/package/trace-cmd/trace-cmd.hash
> > index c6447f34d4..56d3766910 100644
> > --- a/package/trace-cmd/trace-cmd.hash
> > +++ b/package/trace-cmd/trace-cmd.hash
> > @@ -1,4 +1,4 @@
> >  # Locally computed
> > -sha256
> 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0
> trace-cmd-trace-cmd-v2.7.tar.gz
> > -sha256
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> > -sha256
> 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9
> COPYING.LIB
> > +sha256
> 9404fc3cf540ea795304608068c9db6cdb38b90584c7f3c43249785913d54b38
> trace-cmd-v2.9.1.tar.gz
> > +sha256
> b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
> > +sha256
> 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9
> COPYING.LIB
> > diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/
> trace-cmd.mk
> > index dfca6a170d..bc901c5631 100644
> > --- a/package/trace-cmd/trace-cmd.mk
> > +++ b/package/trace-cmd/trace-cmd.mk
> > @@ -4,9 +4,9 @@
> >  #
> >
> ################################################################################
> >
> > -TRACE_CMD_VERSION = trace-cmd-v2.7
> > -TRACE_CMD_SITE =
> https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
> > -TRACE_CMD_SITE_METHOD = git
> > +TRACE_CMD_VERSION = 2.9.1
> > +TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
> > +TRACE_CMD_SITE =
> https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
> >  TRACE_CMD_INSTALL_STAGING = YES
> >  TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
> >  TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
> > @@ -17,12 +17,14 @@ ifeq ($(BR2_PACKAGE_AUDIT),y)
> >  TRACE_CMD_DEPENDENCIES += audit
> >  endif
> >
> > +TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
> > +
> >  ifeq ($(BR2_PACKAGE_PYTHON),y)
> >  TRACE_CMD_DEPENDENCIES += python host-swig
> > -TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python
> > +TRACE_CMD_MAKE_OPTS += PYTHON_VERS=python
> >  else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> >  TRACE_CMD_DEPENDENCIES += python3 host-swig
> > -TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python3
> > +TRACE_CMD_MAKE_OPTS += PYTHON_VERS=python3
> >  else
> >  TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
> >  endif
> > @@ -37,17 +39,15 @@ TRACE_CMD_CFLAGS = $(filter-out
> -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
> >  TRACE_CMD_CPPFLAGS = $(filter-out
> -D_LARGEFILE64_SOURCE,$(TARGET_CPPFLAGS))
> >
> >  define TRACE_CMD_BUILD_CMDS
> > -     $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > -             CFLAGS="$(TRACE_CMD_CFLAGS)" \
> > -             CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
> > -             $(TRACE_CMD_MAKE_OPTS) \
> > -             -C $(@D) all
> > +     $(TARGET_CONFIGURE_OPTS) \
> > +     CFLAGS="$(TRACE_CMD_CFLAGS)" \
> > +     CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
> > +             $(MAKE) $(TRACE_CMD_MAKE_OPTS) \
> > +                     -C $(@D) trace-cmd
> >  endef
> >
> >  define TRACE_CMD_INSTALL_TARGET_CMDS
> > -     $(INSTALL) -D -m 0755 $(@D)/trace-cmd
> $(TARGET_DIR)/usr/bin/trace-cmd
> > -     $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
> > -     $(INSTALL) -D -m 0755 $(@D)/plugin_*.so
> $(TARGET_DIR)/usr/lib/trace-cmd/plugins
> > +     DESTDIR=$(TARGET_DIR) $(MAKE) $(TRACE_CMD_MAKE_OPTS) -C $(@D)
> install_cmd
> >  endef
> >
> >  $(eval $(generic-package))
> > --
> > 2.29.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210104/64e9280e/attachment.html>

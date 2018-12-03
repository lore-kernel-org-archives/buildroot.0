From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Dec 2018 12:39:39 +0100
Subject: [Buildroot] [PATCH] [RFC] package/dbus-glib: fix build with
 newer libglib2
In-Reply-To: <20181202174600.7772-1-yann.morin.1998@free.fr>
References: <20181202174600.7772-1-yann.morin.1998@free.fr>
Message-ID: <20181203113939.GA2548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-12-02 18:46 +0100, Yann E. MORIN spake thusly:
> Fix dbus-glib to use the AC_SUBSTituted variable that contains the path
> to glib-gen-marshal, so that we can override it from the command line.

I may have to withdraw that patch, now:

  - the libglib2 bump was reverted, so this fix is no longer needed, and

  - the pending pkgconf bump solves this issue.

So I've marked this patch as N/A in patchwork.

Regards,
Yann E. MORIN.

> Fixes:
>     http://autobuild.buildroot.org/results/2e4/2e4285d47f6295e1b9f9c05abe34df443cad7f9e/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...buildsys-use-variable-for-glib-genmarshal.patch | 60 ++++++++++++++++++++++
>  package/dbus-glib/dbus-glib.mk                     |  9 ++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 package/dbus-glib/0001-buildsys-use-variable-for-glib-genmarshal.patch
> 
> diff --git a/package/dbus-glib/0001-buildsys-use-variable-for-glib-genmarshal.patch b/package/dbus-glib/0001-buildsys-use-variable-for-glib-genmarshal.patch
> new file mode 100644
> index 0000000000..a6acb5edaf
> --- /dev/null
> +++ b/package/dbus-glib/0001-buildsys-use-variable-for-glib-genmarshal.patch
> @@ -0,0 +1,60 @@
> +From 259ee2897f7c9560e7df4451af59efd73be0951f Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sun, 2 Dec 2018 16:26:07 +0100
> +Subject: [PATCH] buildsys: use variable for glib-genmarshal
> +
> +When doing cross-compilation, the path returned by pkg-config for
> +glib-genmarshal can be incorrect (because it is the runtime path,
> +not the build-time path).
> +
> +Rather than hard-code calls to @GLIB_GENMARSHAL@, let's use the variable
> +$(GLIB_GENMARSHAL) instead, as it is substituted with autoconf's
> +AC_SUBST(GLIB_GENMARSHAL).
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> +Upstream status: pending
> +    https://gitlab.freedesktop.org/dbus/dbus-glib/merge_requests/2
> +---
> + dbus/Makefile.am                       | 4 ++--
> + dbus/examples/statemachine/Makefile.am | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/dbus/Makefile.am b/dbus/Makefile.am
> +index 37c6334..2e8cb27 100644
> +--- a/dbus/Makefile.am
> ++++ b/dbus/Makefile.am
> +@@ -87,10 +87,10 @@ dbus_binding_tool_LDADD= $(builddir)/libdbus-gtool.la $(builddir)/libdbus-glib-1
> + ## we just rebuilt these manually and check them into cvs; easier than
> + ## convincing automake/make to do this properly
> + regenerate-built-sources:
> +-	@GLIB_GENMARSHAL@ --prefix=_dbus_g_marshal dbus-gmarshal.list --header > dbus-gmarshal.h && \
> ++	$(GLIB_GENMARSHAL) --prefix=_dbus_g_marshal dbus-gmarshal.list --header > dbus-gmarshal.h && \
> + 	echo '#include <config.h>' > dbus-gmarshal.c &&						    \
> + 	echo '#include "dbus-gmarshal.h"' >> dbus-gmarshal.c &&					    \
> +-        @GLIB_GENMARSHAL@ --prefix=_dbus_g_marshal dbus-gmarshal.list --body >> dbus-gmarshal.c
> ++        $(GLIB_GENMARSHAL) --prefix=_dbus_g_marshal dbus-gmarshal.list --body >> dbus-gmarshal.c
> + 
> + 
> + completiondir = $(sysconfdir)/bash_completion.d
> +diff --git a/dbus/examples/statemachine/Makefile.am b/dbus/examples/statemachine/Makefile.am
> +index 187b044..c8fe029 100644
> +--- a/dbus/examples/statemachine/Makefile.am
> ++++ b/dbus/examples/statemachine/Makefile.am
> +@@ -35,11 +35,11 @@ statemachine-glue.h: statemachine.xml
> + 
> + sm-marshal.c: Makefile sm-marshal.list
> + 	echo "#include <config.h>" > $@.tmp
> +-	@GLIB_GENMARSHAL@ --prefix=sm_marshal $(srcdir)/sm-marshal.list --header --body >> $@.tmp
> ++	$(GLIB_GENMARSHAL) --prefix=sm_marshal $(srcdir)/sm-marshal.list --header --body >> $@.tmp
> + 	mv $@.tmp $@
> + 
> + sm-marshal.h: Makefile sm-marshal.list
> +-	@GLIB_GENMARSHAL@ --prefix=sm_marshal $(srcdir)/sm-marshal.list --header > $@.tmp && mv $@.tmp $@
> ++	$(GLIB_GENMARSHAL) --prefix=sm_marshal $(srcdir)/sm-marshal.list --header > $@.tmp && mv $@.tmp $@
> + 
> + BUILT_SOURCES += sm-marshal.c sm-marshal.h
> + 
> +-- 
> +2.14.1
> +
> diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
> index 372942e1c3..611f194b81 100644
> --- a/package/dbus-glib/dbus-glib.mk
> +++ b/package/dbus-glib/dbus-glib.mk
> @@ -10,6 +10,9 @@ DBUS_GLIB_INSTALL_STAGING = YES
>  DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
>  DBUS_GLIB_LICENSE_FILES = COPYING
>  
> +# 0001-buildsys-use-variable-for-glib-genmarshal.patch
> +DBUS_GLIB_AUTORECONF = YES
> +
>  DBUS_GLIB_CONF_ENV = \
>  	ac_cv_have_abstract_sockets=yes \
>  	ac_cv_func_posix_getpwnam_r=yes \
> @@ -24,6 +27,9 @@ DBUS_GLIB_CONF_OPTS = \
>  	--disable-doxygen-docs \
>  	--enable-asserts=yes
>  
> +DBUS_GLIB_MAKE_OPTS = \
> +	GLIB_GENMARSHAL=$(STAGING_DIR)/usr/bin/glib-genmarshal
> +
>  DBUS_GLIB_DEPENDENCIES = host-pkgconf dbus host-dbus host-dbus-glib libglib2 expat
>  
>  HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-expat host-libglib2
> @@ -35,6 +41,9 @@ HOST_DBUS_GLIB_CONF_OPTS = \
>  	--disable-doxygen-docs \
>  	--enable-asserts=yes
>  
> +HOST_DBUS_GLIB_MAKE_OPTS = \
> +	GLIB_GENMARSHAL=$(HOST_DIR)/bin/glib-genmarshal
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
>  
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Mar 2019 15:58:46 -0700
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix static build
 without lua
In-Reply-To: <20190304214720.13703-1-fontaine.fabrice@gmail.com>
References: <20190304214720.13703-1-fontaine.fabrice@gmail.com>
Message-ID: <CADvTj4oAisk59GNQUAy3op0jgQiao77C12cO0C5Tavf0ABr0cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 4, 2019 at 2:51 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fixes:
>  - http://autobuild.buildroot.org/results/c11c4d26983e0347d96f3dda62e6d72b031967bb
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../swupdate/0001-Makefile-fix-static-build.patch  | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/swupdate/0001-Makefile-fix-static-build.patch
>
> diff --git a/package/swupdate/0001-Makefile-fix-static-build.patch b/package/swupdate/0001-Makefile-fix-static-build.patch
> new file mode 100644
> index 0000000000..56901f9871
> --- /dev/null
> +++ b/package/swupdate/0001-Makefile-fix-static-build.patch
> @@ -0,0 +1,62 @@
> +From 15a324f8c67548f219256a5a75ba8123cc5bdac6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 4 Mar 2019 21:51:36 +0100
> +Subject: [PATCH] Makefile: fix static build
> +
> +Don't build and install lua_swupdate.so if HAVE_LUA isn't set to y
> +otherwise build will fail if the toolchain only suports building static
> +libraries
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/c11c4d26983e0347d96f3dda62e6d72b031967bb
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/sbabic/swupdate/pull/49]
The swupdate project doesn't accept patches via github pull requests,
you should send this to the mailing list swupdate at googlegroups.com.
http://sbabic.github.io/swupdate/contributing.html
> +---
> + Makefile | 12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index cfeb9a6..cac99b5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -369,11 +369,15 @@ tools-bins       := $(patsubst $(tools-y)/%.c,$(tools-y)/%,$(wildcard $(tools-y)/*.c))
> + tools-bins-unstr:= $(patsubst %,%_unstripped,$(tools-bins))
> + tools-all     := $(tools-objs)
> +
> ++ifeq ($(HAVE_LUA),y)
> ++lua_swupdate  := lua_swupdate.so
> ++endif
> ++
> + shared-dirs   := $(shareds-y)
> + shared-libs   := $(patsubst %,%/built-in.o, $(shareds-y))
> + shared-all    := $(shared-libs)
> +
> +-all: swupdate ${tools-bins} lua_swupdate.so
> ++all: swupdate ${tools-bins} ${lua_swupdate}
> +
> + # Do modpost on a prelinked vmlinux. The finally linked vmlinux has
> + # relevant sections renamed as per the linker script.
> +@@ -434,7 +438,6 @@ install: all
> +       install -d ${DESTDIR}/usr/bin
> +       install -d ${DESTDIR}/usr/include
> +       install -d ${DESTDIR}/usr/lib
> +-      install -d ${DESTDIR}/usr/lib/lua/$(LUAVER)
> +       install -m 755 swupdate ${DESTDIR}/usr/bin
> +       for i in ${tools-bins};do \
> +               install -m 755 $$i ${DESTDIR}/usr/bin; \
> +@@ -443,7 +446,10 @@ install: all
> +       install -m 0644 include/swupdate_status.h ${DESTDIR}/usr/include
> +       install -m 0644 include/progress_ipc.h ${DESTDIR}/usr/include
> +       install -m 0755 ipc/lib.a ${DESTDIR}/usr/lib/libswupdate.a
> +-      install -m 0755 lua_swupdate.so $(DESTDIR)/usr/lib/lua/$(LUAVER)
> ++      if [ $(HAVE_LUA) = y ]; then \
> ++              install -d ${DESTDIR}/usr/lib/lua/$(LUAVER); \
> ++              install -m 0755 ${lua_swupdate} $(DESTDIR)/usr/lib/lua/$(LUAVER); \
> ++      fi
> +
> + PHONY += run-tests
> + tests: \
> +--
> +2.14.1
> +
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

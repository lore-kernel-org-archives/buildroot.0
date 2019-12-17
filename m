From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Dec 2019 08:58:23 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/mariadb: prefix sysroot in
 mariadb_config
In-Reply-To: <87d71abd-122d-1c11-f3e5-291761c19428@gmail.com>
References: <20191215213326.10863-1-bluemrp9@gmail.com>
 <20191215213326.10863-3-bluemrp9@gmail.com>
 <87d71abd-122d-1c11-f3e5-291761c19428@gmail.com>
Message-ID: <20191217085823.09e09fe3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Mon, 16 Dec 2019 16:38:36 -0800
Ryan Coe <bluemrp9@gmail.com> wrote:

> > diff --git a/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
> > new file mode 100644
> > index 0000000000..5eca8ec402
> > --- /dev/null
> > +++ b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
> > @@ -0,0 +1,28 @@
> > +From 7e1b6aafeb9fe6558da7506b304c0efb5ea82281 Mon Sep 17 00:00:00 2001
> > +From: Ryan Coe <bluemrp9@gmail.com>
> > +Date: Fri, 13 Dec 2019 17:13:26 -0800
> > +Subject: [PATCH 1/1] add sysroot path to mariadb_config
> > +
> > +Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> > +---
> > + libmariadb/mariadb_config/mariadb_config.c.in | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libmariadb/mariadb_config/mariadb_config.c.in b/libmariadb/mariadb_config/mariadb_config.c.in
> > +index 703c9466a1d9214a85f3638d2e3b4ecfef0c7bd6..f5513333e670373f060a3c2574d1d42facfd0337 100644
> > +--- a/libmariadb/mariadb_config/mariadb_config.c.in
> > ++++ b/libmariadb/mariadb_config/mariadb_config.c.in
> > +@@ -5,8 +5,8 @@
> > +
> > + static char *mariadb_progname;
> > +
> > +-#define INCLUDE "-I at CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
> > +-#define LIBS    "-L at CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
> > ++#define INCLUDE "-I at CMAKE_SYSROOT@/@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_SYSROOT@/@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
> > ++#define LIBS    "-L at CMAKE_SYSROOT@/@CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
> > + #define LIBS_SYS "@extra_dynamic_LDFLAGS@"
> > + #define CFLAGS  INCLUDE
> > + #define VERSION "@MARIADB_CLIENT_VERSION@"
> > +--  
> Since this is a bug fix, should this patch occur before the version bump?

If it is a bug that affects the current version of mariadb in use by
Buildroot, then yes it should be a separate patch, and a patch that
occurs before the version bump.

> > -# We don't need mysql_config on the target as it's only useful in staging
> > -# We also don't need the test suite on the target
> > +# We don't need mysql_config or mariadb_config on the target as it's
> > +# only useful in staging. We also don't need the test suite on the target.
> >   define MARIADB_POST_INSTALL
> >   	mkdir -p $(TARGET_DIR)/var/lib/mysql
> >   	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
> > +	$(RM) $(TARGET_DIR)/usr/bin/mariadb_config  
> Should this change be a separate change?

I'd say yes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

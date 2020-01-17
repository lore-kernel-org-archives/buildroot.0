From: Michael Walle <michael@walle.cc>
Date: Fri, 17 Jan 2020 15:41:10 +0100
Subject: [Buildroot] [PATCH] autotools: do not overwrite first include path
Message-ID: <20200117144110.11506-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first include path is special in aclocal. For example it is the path
for the --install option. Also, the first include is treated in a
special way if it doesn't exists. This might be the case if there is the
following construct:

  configure.ac: AC_CONFIG_MACRO_DIR([m4])
  Makefile.am: ACLOCAL_AMFLAGS="-I m4"

If the package doesn't have local macros, the m4/ directory might not
exist. aclocal will then just issue a warning instead of aborting the
execution with a fatal error. See discussion here:
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565663

Don't use the "-I" option in aclocal. Instead use ACLOCAL_PATH to pass
the system-wide include dirs.

As a side effect this should fix the use of $(ACLOCAL) alone. Up until
now, $(ACLOCAL) didn't include the ACLOCAL_HOST_DIR system include path.

autoreconf will pass the "-I" options to every tool it runs. So move the
argument to each individual tool except aclocal.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/autoconf/autoconf.mk | 6 +++---
 package/automake/automake.mk | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index e5f474c72d..336ac59b42 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -21,6 +21,6 @@ HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-AUTOCONF = $(HOST_DIR)/bin/autoconf
-AUTOHEADER = $(HOST_DIR)/bin/autoheader
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 270337712e..89dcaa1293 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -32,4 +32,6 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
-ACLOCAL = $(HOST_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
+ACLOCAL = $(HOST_DIR)/bin/aclocal
+ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
+export ACLOCAL_PATH
-- 
2.20.1

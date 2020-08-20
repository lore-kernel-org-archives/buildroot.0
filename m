From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:10:22 +0200
Subject: [Buildroot] [git commit] package/efl: fix build without NLS
Message-ID: <20200820220341.CB0EC81F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=344af15d0147add3eacce07ea21450480de7c978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nls is enabled by default in meson_options.txt (which is available since
version 1.22.0). NLS was explicitly disabled for host-efl in commit
6deaa3d50de166ce187e8b15c70394a8eb844c03 but nothing was done for the
target resulting in the following build failure:

../src/lib/elementary/elm_priv.h:189:25: warning: implicit declaration of function '_elm_dgettext'; did you mean 'dgettext'? [-Wimplicit-function-declaration]
 #  define E_(string)    _elm_dgettext(string)
                         ^~~~~~~~~~~~~

/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: src/lib/elementary/libelementary.so.1.24.3.p/elc_hoversel.c.o: in function `_access_state_cb':
elc_hoversel.c:(.text+0x1210): undefined reference to `_elm_dgettext'

So enable nls dependening on BR2_SYSTEM_ENABLE_NLS and add
TARGET_NLS_DEPENDENCIES to EFL_DEPENDENCIES

Fixes:
 - http://autobuild.buildroot.org/results/5985b39b87c5c392b4f9b65c12008ec7b3a143fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/efl.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index b8c4a506ad..f824f065ef 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -23,7 +23,7 @@ EFL_LICENSE_FILES = \
 EFL_INSTALL_STAGING = YES
 
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
-	giflib jpeg libpng luajit lz4 zlib
+	giflib jpeg libpng luajit lz4 zlib $(TARGET_NLS_DEPENDENCIES)
 
 # Configure options:
 # elua=true: build elua for the target.
@@ -46,6 +46,12 @@ EFL_CONF_OPTS = \
 	-Dsdl=false \
 	-Dvnc-server=false
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+EFL_CONF_OPTS += -Dnls=true
+else
+EFL_CONF_OPTS += -Dnls=false
+endif
+
 EFL_BINDINGS = luajit
 
 ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)

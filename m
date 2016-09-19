From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:17:12 +0200
Subject: [Buildroot] [git commit] util-linux: add -lcurses to LIBS when
	static linking
Message-ID: <20160919172617.223CE8188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eddb1bde5f7ec8a6b5650b43dcbc85d5aa1f917d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking statically with -lreadline we also need to specify
-lcurses. We were already passing LIBS=-intl to fix gettext related
issues, so we refactor how LIBS is passed so that several values can be
passed.

It is worth mentioning that:

 1. Passing LIBS= at configure time is not sufficient, because the
    configure script does LIBS="" at its end. So in order for the LIBS
    value to also be effective during the build, it needs to be passed
    in MAKE_OPTS as well.

 2. LIBS=-lintl was only passed at build time (it was not needed for any
    of the configure tests). However, LIBS=-lncurses is needed both at
    configure time (for configure tests) and at build time. Therefore,
    the new variable UTIL_LINUX_LIBS gets passed as the LIBS value at
    both configure time and build time.

Fixes:
  http://autobuild.buildroot.net/results/70e0a273e699c73c6b2ab2a19c8f7ebb1ddee6cde
  http://autobuild.buildroot.net/results/6a7faf8adbffd9437c0117b9f0e89684c24dad23

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 82230bc..82a726e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -49,13 +49,20 @@ endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 UTIL_LINUX_DEPENDENCIES += gettext
-UTIL_LINUX_MAKE_OPTS += LIBS=-lintl
+UTIL_LINUX_LIBS += -lintl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 UTIL_LINUX_DEPENDENCIES += libcap-ng
 endif
 
+# Unfortunately, the util-linux does LIBS="" at the end of its
+# configure script. So we have to pass the proper LIBS value when
+# calling the configure script to make configure tests pass properly,
+# and then pass it again at build time.
+UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
+UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
@@ -148,6 +155,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 UTIL_LINUX_CONF_OPTS += --with-readline
+UTIL_LINUX_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
 UTIL_LINUX_DEPENDENCIES += readline
 else
 UTIL_LINUX_CONF_OPTS += --without-readline

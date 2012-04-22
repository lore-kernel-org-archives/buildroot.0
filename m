From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 22 Apr 2012 16:21:54 +0300
Subject: [Buildroot] Buildroot SKIPS PATCHES ???
Message-ID: <4F9405F2.1090306@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day


I have tried adding two new packages to my local copy of buildroot,
first one is xplc-package (version 0.3.13) and the second one is
wvstreams (version 4.2.2) which needs xplc.

The first one, xplc, builds nicely.


But for some reason, for wvstreams package the Buildroot does not apply
the patches at all.

Buildroot just skips all the nine wvstreams patch-files and continues
configuring ...
:-(

I have included all files (Config.in, .mk-files and patches) for both
packages here.

I would be very gratefull if somebody could help to solve this mystery.

Please, if you have suggestion how to fix this then please contact me at:
stefan.froberg at petroprogram.com

Very Sincerely Yours:
Stefan Fr?berg

First the xplc:
#####################################
# xplc Config.in
####################################
config BR2_PACKAGE_XPLC
    bool "xplc"
    help
      xplc

      http://xplc.sourceforge.net

#############################################################
#
# xplc - xplc.mk
#
#############################################################

XPLC_VERSION = 0.3.13
XPLC_SOURCE = xplc-$(XPLC_VERSION).tar.gz
XPLC_SITE = http://downloads.sourceforge.net/project/xplc/xplc/0.3.13
XPLC_MAKE = $(MAKE1)

$(eval $(call AUTOTARGETS))

#############################################################
# xplc-0.3.13-as-needed.patch
#############################################################
diff -Naur xplc-0.3.13.org/config/rules.mk xplc-0.3.13/config/rules.mk
--- xplc-0.3.13.org/config/rules.mk    2012-04-21 23:26:12.908682280 +0300
+++ xplc-0.3.13/config/rules.mk    2012-04-21 23:27:24.243748600 +0300
@@ -44,7 +44,7 @@
     $(RANLIB) $@
 
 %.so:
-    $(LINK.cc) $(SHARED) $^ -o $@
+    $(LINK.cc) $(SHARED) $^ $(LDLIBS) -o $@
 
 %.dll:
     $(LINK.cc) $(SHARED) $^ -o $@
diff -Naur xplc-0.3.13.org/xplc/vars.mk xplc-0.3.13/xplc/vars.mk
--- xplc-0.3.13.org/xplc/vars.mk    2012-04-21 23:26:12.903681645 +0300
+++ xplc-0.3.13/xplc/vars.mk    2012-04-21 23:27:24.245748855 +0300
@@ -32,7 +32,7 @@
 
 ifneq ("$(enable_loader)", "no")
 ifneq ("$(with_dlopen)", "no")
-libxplc.so: LDFLAGS+=$(with_dlopen)
+libxplc.so: LDLIBS+=$(with_dlopen)
 endif
 endif

And then wvstreams:

#############################################################
#
# wvstreams - Config.in
#
#############################################################
config BR2_PACKAGE_WVSTREAMS
    bool "wvstreams"
    select BR2_PACKAGE_OPENSSL
    select BR2_PACKAGE_ZLIB
    select BR2_PACKAGE_XPLC
    help
      wvstreams

      http://wvstreams.googlecode.com/files/

#############################################################
#
# wvstreams - wvstreams.mk
#
#############################################################

WVSTREAMS_VERSION = 4.2.2
WVSTREAMS_SOURCE = wvstreams-$(WVSTREAMS_VERSION).tar.gz
WVSTREAMS_SITE = http://wvstreams.googlecode.com/files/
WVSTREAMS_CONF_OPT = --disable-optimization --with-openssl
--without-tcl--without-qt --with-zlib --without-valgrind
WVSTREAMS_AUTORECONF = YES
WVSTREAMS_DEPENDENCIES = openssl zlib xplc
WVSTREAMS_MAKE = $(MAKE1)

$(eval $(call AUTOTARGETS))


And then the problematic 9 wvstreams package patches. All these patches
were taken from old gentoo Linux build so they work.

It just that buildroot does not *apply* them.

#############################################################
#
# wvstreams-4.2.2-as-needed.patch
#
#############################################################
diff -Naur wvstreams-4.2.2.org/configure.ac wvstreams-4.2.2/configure.ac
--- wvstreams-4.2.2.org/configure.ac    2012-04-22 01:18:54.757022406 +0300
+++ wvstreams-4.2.2/configure.ac    2012-04-22 01:20:23.211458391 +0300
@@ -517,16 +517,19 @@
         wv_cv_with_qt=no
         CPPFLAGS_save="$CPPFLAGS"
         LDFLAGS_save="$LDFLAGS"
+        LIBS_save="$LIBS"
         for wv_qtdir in $with_qt $QTDIR $QT_SEARCH_PATH; do
             eval wv_qtdir="$wv_qtdir"
             CPPFLAGS="$CPPFLAGS_save -I$wv_qtdir/include
-I$wv_qtdir/include/qt3"
-            LDFLAGS="$LDFLAGS_save -L$wv_qtdir/lib -lqt-mt"
+            LDFLAGS="$LDFLAGS_save -L$wv_qtdir/lib"
+            LIBS="$LIBS_save -lqt-mt"
             AC_TRY_LINK([#include <qstring.h>],
                         [QString x("hello"); return 0; ],
                         [wv_cv_with_qt=$wv_qtdir; break])
         done
         CPPFLAGS="$CPPFLAGS_save"
         LDFLAGS="$LDFLAGS_save"
+        LIBS="$LIBS_save"
     ])
     with_qt=$wv_cv_with_qt
     if test "$with_qt" != no; then
diff -Naur wvstreams-4.2.2.org/wvrules.mk wvstreams-4.2.2/wvrules.mk
--- wvstreams-4.2.2.org/wvrules.mk    2012-04-22 01:18:54.727003592 +0300
+++ wvstreams-4.2.2/wvrules.mk    2012-04-22 01:20:23.215460901 +0300
@@ -272,7 +272,7 @@
 %.so: SONAME=$@$(if $(SO_VERSION),.$(SO_VERSION))
 wvsoname=$(if $($1-SONAME),$($1-SONAME),$(if $(SONAME),$(SONAME),$1))
 define wvlink_so
-    $(LINK_MSG)$(WVLINK_CC) $(LDFLAGS) $($1-LDFLAGS) -Wl,-soname,$(call
wvsoname,$1) -shared -o $1 $(filter %.o %.a %.so,$2) $($1-LIBS) $(LIBS)
$(XX_LIBS)
+    $(LINK_MSG)$(WVLINK_CC) $(LDFLAGS) $($1-LDFLAGS) -Wl,-soname,$(call
wvsoname,$1) -shared -o $1 $(filter %.o %.a,$2) $(filter %.so,$2)
$($1-LIBS) $(LIBS) $(XX_LIBS)
     $(if $(filter-out $(call wvsoname,$1),$1),$(call wvlns,$1,$(call
wvsoname,$1)))
 endef

#############################################################
#
# wvstreams-4.2.2-external-xplc.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/configure.ac wvstreams-4.2.2/configure.ac
--- wvstreams-4.2.2.org/configure.ac    2012-04-22 01:18:54.757022406 +0300
+++ wvstreams-4.2.2/configure.ac    2012-04-22 01:27:24.736635806 +0300
@@ -542,7 +542,6 @@
 
 # xplc
 if test "$with_xplc" != "no"; then
-    if test "$with_xplc" = ""; then
     if pkg-config --modversion xplc-${xplc_version}; then
             WV_APPEND(CPPFLAGS, [`pkg-config --cflags
xplc-${xplc_version}`])
         WV_APPEND(LDFLAGS, [`pkg-config --libs xplc-${xplc_version}`])
@@ -554,15 +553,6 @@
     else
         with_xplc='no'
     fi
-    else
-        WV_APPEND(CPPFLAGS, [-I$with_xplc/include])
-    WV_APPEND(LDFLAGS, [-L$with_xplc])
-    AC_CHECK_HEADERS(xplc/core.h,, [with_xplc=no], [#define UNSTABLE])
-    LIBS_save="$LIBS"
-    AC_CHECK_LIB(xplc, XPLC_getServiceManager,, [with_xplc=no])
-    LIBS="$LIBS_save"
-    xplc_pc="xplc-${xplc_version}"
-    fi
     # What if we can't find it?
     if test "$with_xplc" = "no" && test -d xplc; then
         WV_APPEND(CPPFLAGS, [-I\$(WVSTREAMS)/xplc/include])
@@ -570,7 +560,7 @@
         AC_CONFIG_SUBDIRS(xplc)
         build_xplc=yes
         with_xplc='$(WVSTREAMS)/xplc'
-    xplc_pc='wvxplc'
+        xplc_pc='wvxplc'
     fi
 fi
 
#############################################################
#
# wvstreams-4.2.2-gcc41.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/include/uniconfkey.h
wvstreams-4.2.2/include/uniconfkey.h
--- wvstreams-4.2.2.org/include/uniconfkey.h    2012-04-22
01:18:54.794045609 +0300
+++ wvstreams-4.2.2/include/uniconfkey.h    2012-04-22
01:30:22.574089737 +0300
@@ -113,7 +113,7 @@
     bool iswild() const;
 
     /** Returns true if the key has a trailing slash. */
-    bool UniConfKey::hastrailingslash() const;
+    bool hastrailingslash() const;
 
     /**
      * Returns the number of segments in this path.
diff -Naur wvstreams-4.2.2.org/include/wvhttppool.h
wvstreams-4.2.2/include/wvhttppool.h
--- wvstreams-4.2.2.org/include/wvhttppool.h    2012-04-22
01:18:54.794045609 +0300
+++ wvstreams-4.2.2/include/wvhttppool.h    2012-04-22
01:30:22.575090364 +0300
@@ -57,7 +57,7 @@
     WvString linkname;
     WvUrl url;
 
-    WvUrlLink::WvUrlLink(WvStringParm _linkname, WvStringParm _url)
+    WvUrlLink(WvStringParm _linkname, WvStringParm _url)
     : linkname(_linkname), url(_url)
     {}
 };
diff -Naur wvstreams-4.2.2.org/include/wvstring.h
wvstreams-4.2.2/include/wvstring.h
--- wvstreams-4.2.2.org/include/wvstring.h    2012-04-22
01:18:54.795046236 +0300
+++ wvstreams-4.2.2/include/wvstring.h    2012-04-22 01:30:22.578092245
+0300
@@ -393,7 +393,7 @@
    
 protected:
     void copy_constructor(const WvFastString &s);
-    inline void WvString::construct(const char *_str)
+    inline void construct(const char *_str)
         {
             link(&nullbuf, _str);
    
diff -Naur wvstreams-4.2.2.org/include/wvx509.h
wvstreams-4.2.2/include/wvx509.h
--- wvstreams-4.2.2.org/include/wvx509.h    2012-04-22
01:18:54.794045609 +0300
+++ wvstreams-4.2.2/include/wvx509.h    2012-04-22 01:30:22.581094126 +0300
@@ -349,19 +349,19 @@
      * Set the Certificate to use X509v3, since that's all modern
      * PKI uses anyways
      */
-    void WvX509Mgr::set_version();
+    void set_version();
 
     /**
      * Get and set the keyUsage field.
      */
-    WvString WvX509Mgr::get_key_usage();
-    void WvX509Mgr::set_key_usage(WvStringParm values);
+    WvString get_key_usage();
+    void set_key_usage(WvStringParm values);
 
     /**
      * Get and set the extendedKeyUsage field.
      */
-    WvString WvX509Mgr::get_ext_key_usage();
-    void WvX509Mgr::set_ext_key_usage(WvStringParm values);
+    WvString get_ext_key_usage();
+    void set_ext_key_usage(WvStringParm values);
    
     /**
      * Return the Subject alt name if it exists, and WvString::null if

#############################################################
#
# wvstreams-4.2.2-linux-serial.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/streams/wvmodem.cc
wvstreams-4.2.2/streams/wvmodem.cc
--- wvstreams-4.2.2.org/streams/wvmodem.cc    2012-04-22
01:18:54.772031811 +0300
+++ wvstreams-4.2.2/streams/wvmodem.cc    2012-04-22 01:31:22.310527636
+0300
@@ -192,22 +192,22 @@
     drain();
    
 #if HAVE_LINUX_SERIAL_H
-    struct serial_struct old_sinfo, sinfo;
-    sinfo.reserved_char[0] = 0;
-    if (ioctl(getrfd(), TIOCGSERIAL, &old_sinfo) < 0)
-    log("Cannot get information for serial port.");
-    else
-    {
-    sinfo = old_sinfo;
-    // Why there are two closing wait timeouts, is beyond me
-    // but there are... apparently the second one is deprecated
-    // but why take a chance...
-    sinfo.closing_wait = ASYNC_CLOSING_WAIT_NONE;
-    sinfo.closing_wait2 = ASYNC_CLOSING_WAIT_NONE;
-
-    if (ioctl(getrfd(), TIOCSSERIAL, &sinfo) < 0)
-        log("Cannot set information for serial port.");
-    }
+     if (getuid() == 0)
+     {
+         struct serial_struct sinfo;
+         if (ioctl(getrfd(), TIOCGSERIAL, &sinfo) >= 0) //Ignore errors
because some modems (at least slmodem) do not support this
+         {
+             // Why there are two closing wait timeouts, is beyond me
+             // but there are... apparently the second one is deprecated
+             // but why take a chance...
+             sinfo.closing_wait = ASYNC_CLOSING_WAIT_NONE;
+             sinfo.closing_wait2 = ASYNC_CLOSING_WAIT_NONE;
+
+             //Ignore errors because ltmodem module implement
TIOCGSERIAL but do not implement TIOCSSERIAL (go figure...)
+            //see http://bugs.gentoo.org/show_bug.cgi?id=85754
+            ioctl(getrfd(), TIOCSSERIAL, &sinfo);
+         }
+     }
 #endif
 
     // set up the terminal characteristics.

#############################################################
#
# wvstreams-4.2.2-MOC-fix.patch
#
#############################################################
diff -Naur wvstreams-4.2.2.org/wvrules.mk wvstreams-4.2.2/wvrules.mk
--- wvstreams-4.2.2.org/wvrules.mk    2012-04-22 01:18:54.727003592 +0300
+++ wvstreams-4.2.2/wvrules.mk    2012-04-22 01:32:26.713890383 +0300
@@ -296,7 +296,7 @@
 %.E: %.cc;    $(call wvcxx,$@,$<,$*,,-E)
 %.E: %.cpp;    $(call wvcxx,$@,$<,$*,,-E)
 
-%.moc: %.h;    moc -o $@ $<
+%.moc: %.h;    $(MOC) -o $@ $<
 
 %: %.o;        $(call wvlink,$@,$^)
 %.t: %.t.o;    $(call wvlink,$@,$(call reverse,$(filter %.o,$^))
$(filter-out %.o,$^) $(LIBWVTEST))

#############################################################
#
# wvstreams-4.2.2-sane-cflags.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/vars.mk wvstreams-4.2.2/vars.mk
--- wvstreams-4.2.2.org/vars.mk    2012-04-22 01:18:54.797047490 +0300
+++ wvstreams-4.2.2/vars.mk    2012-04-22 01:33:11.898208209 +0300
@@ -66,10 +66,10 @@
 CXXFLAGS+=-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
 CFLAGS+=-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
 
-ifeq ($(DEBUG),)
-CXXFLAGS+=-g
-CFLAGS+=-g
-endif
+#ifeq ($(DEBUG),)
+#CXXFLAGS+=-g
+#CFLAGS+=-g
+#endif
 
 ifneq ($(DEBUG),)
 CXXFLAGS+=-ggdb -DDEBUG$(if $(filter-out yes,$(DEBUG)), -DDEBUG_$(DEBUG))
@@ -91,9 +91,9 @@
 endif
 
 ifneq ("$(enable_optimization)", "no")
-CXXFLAGS+=-O2
+#CXXFLAGS+=-O2
 #CXXFLAGS+=-felide-constructors
-CFLAGS+=-O2
+#CFLAGS+=-O2
 endif
 
 ifneq ("$(enable_warnings)", "no")
diff -Naur wvstreams-4.2.2.org/wvrules.mk wvstreams-4.2.2/wvrules.mk
--- wvstreams-4.2.2.org/wvrules.mk    2012-04-22 01:18:54.727003592 +0300
+++ wvstreams-4.2.2/wvrules.mk    2012-04-22 01:33:11.899208836 +0300
@@ -82,9 +82,9 @@
 endif
 
 ifneq ("$(enable_optimization)", "no")
-  CXXFLAGS+=-O2
+  #CXXFLAGS+=-O2
   #CXXFLAGS+=-felide-constructors
-  CFLAGS+=-O2
+  #CFLAGS+=-O2
 endif
 
 ifneq ("$(enable_warnings)", "no")
@@ -177,11 +177,11 @@
   C_AND_CXX_FLAGS += -ggdb -DDEBUG=1
   LDFLAGS += -ggdb
 else
-  C_AND_CXX_FLAGS += -g -DDEBUG=0
+  C_AND_CXX_FLAGS += -DDEBUG=0
   #CFLAGS += -DNDEBUG    # I don't like disabling assertions...
   #CFLAGS += -fomit-frame-pointer  # really evil
   #CXXFLAGS += -fno-implement-inlines  # causes trouble with egcs 1.0
-  LDFLAGS += -g
+  #LDFLAGS += -g
 endif
 
 ifeq ($(PROFILE),1)

#############################################################
#
# wvstreams-4.2.2-tcl_8_4.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/configure.ac wvstreams-4.2.2/configure.ac
--- wvstreams-4.2.2.org/configure.ac    2012-04-22 01:18:54.757022406 +0300
+++ wvstreams-4.2.2/configure.ac    2012-04-22 01:33:53.496278467 +0300
@@ -483,9 +483,9 @@
 # tcl
 if test "$with_tcl" != "no"; then
     CPPFLAGS_save="$CPPFLAGS"
-    WV_APPEND(CPPFLAGS, -I/usr/include/tcl8.3)
+    WV_APPEND(CPPFLAGS, -I/usr/include)
     AC_CHECK_HEADERS(tcl.h,, [with_tcl=no])
-    AC_CHECK_LIB(tcl8.3, TclInterpInit,, [with_tcl=no])
+    AC_CHECK_LIB(tcl8.4, TclInterpInit,, [with_tcl=no])
     if test "$with_tcl" != "no"; then
         CPPFLAGS="$CPPFLAGS_save"
     fi
diff -Naur wvstreams-4.2.2.org/vars.mk wvstreams-4.2.2/vars.mk
--- wvstreams-4.2.2.org/vars.mk    2012-04-22 01:18:54.797047490 +0300
+++ wvstreams-4.2.2/vars.mk    2012-04-22 01:33:53.498279721 +0300
@@ -234,3 +234,5 @@
 
 libwvgtk.a libwvgtk.so: $(call objects,gtk)
 libwvgtk.so: -lgtk -lgdk libwvstreams.so libwvutils.so
+
+libuniconf_tcl.so: bindings/uniconf_tcl.o -ltcl8.4 -luniconf

#############################################################
#
# wvstreams-4.2.2-uniconfd-ini.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/Makefile wvstreams-4.2.2/Makefile
--- wvstreams-4.2.2.org/Makefile    2012-04-22 01:18:54.759023660 +0300
+++ wvstreams-4.2.2/Makefile    2012-04-22 01:34:39.038820799 +0300
@@ -182,8 +182,8 @@
     $(INSTALL_PROGRAM) uniconf/tests/uni $(DESTDIR)$(bindir)/
     $(INSTALL) -d $(DESTDIR)$(sbindir)
     $(INSTALL_PROGRAM) uniconf/daemon/uniconfd $(DESTDIR)$(sbindir)/
-    $(INSTALL) -d $(DESTDIR)$(localstatedir)/lib/uniconf
-    touch $(DESTDIR)$(localstatedir)/lib/uniconf/uniconfd.ini
+    $(INSTALL) -d $(DESTDIR)$(localstatedir)/uniconf
+    $(INSTALL_DATA) uniconf/daemon/uniconfd.ini
$(DESTDIR)$(localstatedir)/uniconf
     $(INSTALL) -d $(DESTDIR)$(mandir)/man8
     $(INSTALL_DATA) uniconf/daemon/uniconfd.8 $(DESTDIR)$(mandir)/man8
     $(INSTALL_DATA) uniconf/tests/uni.8 $(DESTDIR)$(mandir)/man8
 
#############################################################
#
# wvstreams-4.2.2-wireless-user.patch
#
#############################################################

diff -Naur wvstreams-4.2.2.org/linuxstreams/wvinterface.cc
wvstreams-4.2.2/linuxstreams/wvinterface.cc
--- wvstreams-4.2.2.org/linuxstreams/wvinterface.cc    2012-04-22
01:18:54.728004220 +0300
+++ wvstreams-4.2.2/linuxstreams/wvinterface.cc    2012-04-22
01:36:12.254240578 +0300
@@ -21,6 +21,7 @@
 #include <errno.h>
 #include <linux/sockios.h>
 
+#include <sys/sysctl.h>
 #define _LINUX_IF_H /* Hack to prevent loading linux/if.h */
 #include <linux/wireless.h>

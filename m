From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:21:44 +0200
Subject: [Buildroot] [PATCH] util-linux: add -lcurses to LDFLAGS when
 static linking
In-Reply-To: <20160918101141.20574-1-judge.packham@gmail.com>
References: <20160918101141.20574-1-judge.packham@gmail.com>
Message-ID: <20160919192144.73a7492d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Sep 2016 22:11:41 +1200, Chris Packham wrote:

> I'm not sure that this is the "right" fix but it seems to do the trick. I also
> tried using LIBS instead of LDFLAGS which got the configure step to pass but
> didn't propagate to the final link.

The reason why LIBS is not taken into account during the build is
because the configure does LIBS="" at the end. This is also why we're
already passing LIBS=-lintl at build time.

So at the end, I've committed the following fix:

diff --git a/package/util-linux/util-linux.mk
b/package/util-linux/util-linux.mk
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

It is worth mentioning that a much better fix would be for readline to
provide a pkg-config file, and have util-linux use it. The latest
version of readline (7.0) has a pkg-config file, but does not install
it. So for the time being, the above patch will hopefully do the trick.

Thanks for your initial investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

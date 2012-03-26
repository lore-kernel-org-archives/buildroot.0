From: Will Newton <will.newton@gmail.com>
Date: Mon, 26 Mar 2012 17:35:29 +0100
Subject: [Buildroot] Host libxml-parser-perl build issue
Message-ID: <CAFbHwiSJuD+cJRiiLRWM9siAmuCvSBH+25DTS_0CPgN3WxSbLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a build failure building avahi on a CentOS 5 system (old, but
not ancient) which is caused by the configure script failing to load
the XML::Parser perl module. buildroot has built a host version of
libxml-parser-perl and also a host version of expat, but the configure
for avahi is still failing. The reason for this appears to be that
perl cannot find libexpat.so, presumably because it is not in the
shared library search path. The attached patch fixes it but seems like
quite a far-reaching change, does anybody have any opinions on it?

Thanks,

diff --git a/package/Makefile.in b/package/Makefile.in
index dc8d038..3ac7505 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -193,10 +193,12 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"

 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"

 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
-------------- next part --------------
diff --git a/package/Makefile.in b/package/Makefile.in
index dc8d038..3ac7505 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -193,10 +193,12 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \

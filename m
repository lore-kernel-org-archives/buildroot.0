From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 09:16:22 +0200
Subject: [Buildroot] [git commit] snort: avoid detecting the host pcre
Message-ID: <20180402071628.5895F838E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6d28852ab36ddcacfd37368f6b2c07d437cbc6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pcre configure script does this:

if test "x$with_libpcre_libraries" != "xno"; then
    LDFLAGS="${LDFLAGS}  -L${with_libpcre_libraries}"
else
    LDFLAGS="${LDFLAGS} `pcre-config --libs`"
fi

So if you don't pass --with-libpcre-libraries, it calls pcre-config as
available in the PATH. So it picks up pcre-config from $(HOST_DIR) or
the system, which return results inappropriate for cross-compilation.

So, let's explicitly pass --with-libpcre-includes and
--with-libpcre-libraries to avoid those issues.

Fixes:

  http://autobuild.buildroot.net/results/3df11c48c8e2f795f478d1ee666dda9de19133d0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/snort.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 13f16b3b0f..568393468b 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -15,6 +15,8 @@ SNORT_DEPENDENCIES = libpcap libdnet daq pcre
 SNORT_AUTORECONF = YES
 
 SNORT_CONF_OPTS = \
+	--with-libpcre-includes=$(STAGING_DIR)/usr/include \
+	--with-libpcre-libraries=$(STAGING_DIR)/usr/lib \
 	--with-libpcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--disable-static-daq
 

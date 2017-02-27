From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 27 Feb 2017 07:07:25 +0100
Subject: [Buildroot] [PATCH] vlc: workaround microblaze gcc internal
	compiler error
Message-ID: <20170227060725.GA27933@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Override gcc optimization flags with -O0.

The workaround is not required for gcc6 anymore, but
gcc6 is disabled for microblaze, because it breaks startup 
of the system somehow. So the bug is not reported upstream.

Fixes:
 http://autobuild.buildroot.net/results/a318f0838a6a602046e719103ac81965c0084d52

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/vlc/vlc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 666b8d4..a523f8f 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -15,6 +15,12 @@ VLC_AUTORECONF = YES
 # Install vlc libraries in staging.
 VLC_INSTALL_STAGING = YES
 
+# gcc bug internal compiler error: in merge_overlapping_regs, at regrename.c:304
+ifeq ($(BR2_microblaze),y)
+VLC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+VLC_CONF_OPTS += --disable-optimizations
+endif
+
 # VLC defines two autoconf functions which are also defined by our own pkg.m4
 # from pkgconf. Unfortunately, they are defined in a different way: VLC adds
 # --enable- options, but pkg.m4 adds --with- options. To make sure we use
-- 
2.1.4

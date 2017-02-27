From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:35:46 +0100
Subject: [Buildroot] [git commit] vlc: workaround microblaze gcc internal
	compiler error
Message-ID: <20170227203649.D6E07821E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba1dd18a4963cb0e63fbc93bb5e108c4d1f137b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Override gcc optimization flags with -O0. The workaround is not required
for gcc6 anymore, so we take this into account into our condition.

Fixes:

  http://autobuild.buildroot.net/results/a318f0838a6a602046e719103ac81965c0084d52

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: add gcc 6.x condition.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 666b8d4..583edf3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -15,6 +15,13 @@ VLC_AUTORECONF = YES
 # Install vlc libraries in staging.
 VLC_INSTALL_STAGING = YES
 
+# gcc bug internal compiler error: in merge_overlapping_regs, at
+# regrename.c:304. This bug is fixed since gcc 6.
+ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
+VLC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+VLC_CONF_OPTS += --disable-optimizations
+endif
+
 # VLC defines two autoconf functions which are also defined by our own pkg.m4
 # from pkgconf. Unfortunately, they are defined in a different way: VLC adds
 # --enable- options, but pkg.m4 adds --with- options. To make sure we use

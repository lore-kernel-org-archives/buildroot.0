From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:29:49 +0100
Subject: [Buildroot] [git commit] package/patch: add optional support for
	attr
Message-ID: <20160221112953.B93BA8180E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d266356e5ba1e7a1dd515e23d8f45ac8ff8020e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When attr was compiled before, patch will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/patch | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libattr.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/patch/patch.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 765dfa9..3a94252 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -10,4 +10,11 @@ PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
 PATCH_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_ATTR),y)
+PATCH_CONF_OPTS += --enable-attr
+PATCH_DEPENDENCIES += attr
+else
+PATCH_CONF_OPTS += --disable-attr
+endif
+
 $(eval $(autotools-package))

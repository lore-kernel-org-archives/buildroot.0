From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 14:30:59 +0100
Subject: [Buildroot] [git commit] wavpack: fix broken link on newer binutils
Message-ID: <20121229133118.557E79A4E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c5b4ddc1932e7dedec1e412a5c5465f4fbe6f8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of binutils (2.22+) default to --no-copy-dt-needed hence
all the used libraries must be explicitly named.
This is accounted for in the source configure script but not in the
compiled form so we just need to autoreconf it.

[Peter: add comment why autoconf is needed]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/wavpack/wavpack.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 4b1c59e..cd9b4f7 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -8,9 +8,10 @@ WAVPACK_VERSION = 4.60.1
 WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
-
-ifneq ($(BR2_ENABLE_LOCALE),y)
-WAVPACK_DEPENDENCIES += libiconv
-endif
+# configure not up to date
+WAVPACK_AUTORECONF = YES
+WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),libiconv)
+WAVPACK_LICENSE = BSD-3c
+WAVPACK_LICENSE_FILES = license.txt
 
 $(eval $(autotools-package))

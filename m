From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Dec 2012 10:06:11 -0300
Subject: [Buildroot] [PATCHv2] wavpack: fix broken link on newer binutils
Message-ID: <1356786371-12126-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer versions of binutils (2.22+) default to --no-copy-dt-needed hence
all the used libraries must be explicitly named.
This is accounted for in the source configure script but not in the
compiled form so we just need to autoreconf it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/wavpack/wavpack.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 4b1c59e..ad1ce1b 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -8,9 +8,9 @@ WAVPACK_VERSION = 4.60.1
 WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
-
-ifneq ($(BR2_ENABLE_LOCALE),y)
-WAVPACK_DEPENDENCIES += libiconv
-endif
+WAVPACK_AUTORECONF = YES
+WAVPACK_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),libiconv)
+WAVPACK_LICENSE = BSD-3c
+WAVPACK_LICENSE_FILES = license.txt
 
 $(eval $(autotools-package))
-- 
1.7.8.6

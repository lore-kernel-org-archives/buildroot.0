From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Dec 2015 16:59:49 +0000
Subject: [Buildroot] [PATCH] flite: disable ALSA support
Message-ID: <1449248389-33123-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream says that ALSA support in flite is broken for earlier versions:

"Seems the alsa code I have breaks on earlier versions I'm not sure what
the threshold version is, but made this depend on the one I know -- you
can still specific --with-audio=alsa"

So let's disable it. It will prevent failures like this one:

/br/output/host/usr/bin/mipsel-linux-gcc -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -Wall -o
../bin/find_sts find_sts_main.o -L../build/mipsel-linux-uclibc/lib
-lflite -lm
../build/mipsel-linux-uclibc/lib/libflite.a(audio.o): In function
`audio_open':
audio.c:(.text+0x1c): undefined reference to `audio_open_oss'

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/flite/flite.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index 611e334..c5d7828 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -36,11 +36,6 @@ FLITE_DEPENDENCIES = host-pkgconf
 # shared libraries.
 FLITE_MAKE = $(MAKE1)
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-FLITE_DEPENDENCIES += alsa-lib
-FLITE_CONF_OPTS += --with-audio=alsa
-else
-FLITE_CONF_OPTS += --with-audio=oss
-endif
+FLITE_CONF_OPTS = --with-audio=oss
 
 $(eval $(autotools-package))
-- 
2.4.10

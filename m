From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 20:54:43 +0200
Subject: [Buildroot] [git commit] package/gettext-tiny: fix build of
 libintl.a
Message-ID: <20190331185220.8DCD07FAE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01e0fec161ed4aa94fc1c594283200e2eb0b07fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since libintl.a can be pulled in during the build of other shared libs,
it must be compiled with -fPIC, which is what gettext-tiny's Makefile
would do.

Since we provide our own CFLAGS, they override those in the Makefile.

Fix that by ensuring that -fPIC is used when building the static
library.

Fixes:
    http://autobuild.buildroot.org/results/a38/a3800fd4ef2536cc2b82d38ea752baa2b227bc64/

Also, since GETTEXT_TINY_OPTS is used only once and contains a single
definition, get rid of it altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 3fe2de30b6..c9052d0d7c 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -9,7 +9,6 @@ GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VER
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
 GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
-GETTEXT_TINY_OPTS = LIBINTL=NOOP
 
 GETTEXT_TINY_PROVIDES = gettext
 
@@ -56,7 +55,8 @@ endif
 define HOST_GETTEXT_TINY_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
-		$(GETTEXT_TINY_OPTS)
+		CFLAGS="$(HOST_CFLAGS) -fPIC" \
+		LIBINTL=NOOP
 
 	cp $(@D)/extra/gettextize.in $(@D)/gettextize
 

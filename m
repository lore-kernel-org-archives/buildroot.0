From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 10:24:37 +0100
Subject: [Buildroot] [git commit] infozip: fix $(AS) behavior
Message-ID: <20140202093331.1E8DE9C734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08cd1208e5e8cef7d65cbb26f6145a3fa149636f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

infozip's Makefile expect $(AS) to output by default to <basename>.o
but when called from Buildroot, the value for $(AS) is set
to to invoke the toolchain's $(AS) directly, and the output of it
goes to a.out.

So, define $(AS) with $(CC -c)

Reported-by: ???????????? ?????????????? <lucenko_kirill@mail.ru>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/infozip/infozip.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index d73edd4..cc2bd34 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -11,7 +11,7 @@ INFOZIP_LICENSE = Info-ZIP
 INFOZIP_LICENSE_FILES = LICENSE
 
 define INFOZIP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile generic
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) AS="$(TARGET_CC) -c" -f unix/Makefile generic
 endef
 
 define INFOZIP_INSTALL_TARGET_CMDS

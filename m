From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 17:47:09 +0100
Subject: [Buildroot] [git commit] lightning: add -lintl only when needed
Message-ID: <20150125164755.19C0D80457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b90fa707f3a3d43d54944e7b80ad6423f2f93667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding -lintl to LIBS causes a failure in the configure phase when using
a toolchain which already has locale support because the intl library is
not present in the staging area. We fix this by adding -lintl only when
is needed.

This is the configure error:

checking whether the C compiler works... no
configure: error: in
`/br/output/build/lightning-2.0.5':
configure: error: C compiler cannot create executables
See `config.log' for more details

This is the message in the config.log:

configure:3351: /br/output/host/usr/bin/mips-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
conftest.c -lintl >&5
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.9.1/../../../../mips-linux-gnu/bin/ld:
cannot find -lintl
collect2: error: ld returned 1 exit status

Fixes:
  http://autobuild.buildroot.net/results/280/28006ab35379a9b7f380d40b99a760bec1b69e84/

[Thomas:
 - Adjust the fix to not add a dependency on gettext: lightning
   doesn't depend on gettext. It is just that binutils libraries are
   linked against libintl when available, and we need to add -lintl
   explicitly in such cases.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lightning/lightning.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 00fed73..594ba0c 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -17,7 +17,7 @@ ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
 # binutils libraries are not explicitly linked against gettext
-LIGHTNING_CONF_ENV += $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
+LIGHTNING_CONF_ENV += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 endif
 
 $(eval $(autotools-package))

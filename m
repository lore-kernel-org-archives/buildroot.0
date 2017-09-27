From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:56:32 +0200
Subject: [Buildroot] [git commit] package/flex: disable reallocarray
Message-ID: <20170927205504.8012280E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffbd8dfb8a1fcbc0cb209f8ede4841c543524525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This doesn't compile with glibc 2.26 where reallocarray() as been introduced.

It's a nasty issue, when reallocarray() is available for the target, flex will
build a small tool called stage1flex for the host (using _FOR_BUILD) but with
the config.h generated for the target.

When the host doesn't have a glibc >= 2.26, reallocarray() is never defined
while building stage1flex:

misc.c:147:8: warning : implicit declaration of function ?? reallocarray ??
[-Wimplicit-function-declaration]
  mem = reallocarray(NULL, (size_t) size, element_size);
        ^~~~~~~~~~~~
misc.c:147:6: warning : assignment makes pointer from integer without a cast
[-Wint-conversion]
  mem = reallocarray(NULL, (size_t) size, element_size);
      ^

Disable reallocarray for now, reallocarray() support may be
enabled in a followup patch.

Fixes:
stage1flex-misc.o: In function `allocate_array':
misc.c:(.text+0x38f): undefined reference to `reallocarray'
stage1flex-misc.o: In function `reallocate_array':
misc.c:(.text+0xc8a): undefined reference to `reallocarray'
collect2: error: ld returned 1 exit status

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/flex/flex.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index b782699..0196624 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,7 +10,8 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
-FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
+FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4 \
+	ac_cv_func_reallocarray=no
 HOST_FLEX_DEPENDENCIES = host-m4
 
 define FLEX_DISABLE_PROGRAM

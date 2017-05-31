From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:36:15 +0200
Subject: [Buildroot] [git commit] bash: disable bash malloc by default
Message-ID: <20170531203632.1E8C2826F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43552504c8aacda2a163c933203a3b77146409c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bash's malloc relies on sbrk which is implemented as a fail-only stub in
musl. Presently, it is disabled when configured for static
libs. Instead, default to using libc malloc.

Fixes:

  # bash
  bash: xmalloc: locale.c:81: cannot allocate 18 bytes (0 bytes allocated)

Signed-off-by: Daniel Sabogal <dsabogalcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/bash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 639f012..32c87a6 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -9,7 +9,7 @@ BASH_SITE = $(BR2_GNU_MIRROR)/bash
 # Build after since bash is better than busybox shells
 BASH_DEPENDENCIES = ncurses readline host-bison \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
-BASH_CONF_OPTS = --with-installed-readline
+BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
 BASH_LICENSE = GPL-3.0+
 BASH_LICENSE_FILES = COPYING
 
@@ -24,7 +24,7 @@ BASH_CONF_ENV += \
 
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
-BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
+BASH_CONF_OPTS += --enable-static-link
 # bash wants to redefine the getenv() function. To check whether this is
 # possible, AC_TRY_RUN is used which is not possible in
 # cross-compilation.

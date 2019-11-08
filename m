From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 21:57:58 +0100
Subject: [Buildroot] [git commit] package/dtc: needs host-pkgconf
 unconditionally
Message-ID: <20191108205121.553398EB45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78b77a5c4a5eef1ad5b4af51879758d38a8cc98d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits 495e757d2 (package/dtc: add optional libyaml dependency) and
e43d9072a (package/dtc: fix build without libyaml), added a conditional
dependency to host-pkgconf, when libyaml is enabled, while commit
56d6dd453 (package/dtc: disable valgrind) explicitly disabled support of
valgrind.

However, presence of libyaml, as well as that of valgrind, *is* detected
by calling pkg-config:

    NO_VALGRIND := $(shell $(PKG_CONFIG) --exists valgrind; echo $$?)
    NO_YAML := $(shell $(PKG_CONFIG) --exists yaml-0.1; echo $$?)

Passing NO_YAML=1 or NO_VALGRIND=1 do not prevent the tests from being
executed, which would yield messages like:

    /bin/sh: 1: /home/ymorin/dev/buildroot/O/host/bin/pkg-config: not found

(note however that, even if the test is executed, the value we pass on
the command line still takes precedence, and the support for either is
properly disabled.)

So, move the dependency on host-pkgconfig out of the condition. Ditto
for the host package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Titouan Christophe <titouan.christophe@railnova.eu>
Cc: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtc/dtc.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index a0fffa5b80..96a64b70e4 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -10,8 +10,8 @@ DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-DTC_DEPENDENCIES = host-bison host-flex
-HOST_DTC_DEPENDENCIES = host-bison host-flex
+DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
+HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
 
 DTC_MAKE_OPTS = \
 	PREFIX=/usr \
@@ -25,7 +25,7 @@ HOST_DTC_MAKE_OPTS = \
 	NO_YAML=1
 
 ifeq ($(BR2_PACKAGE_LIBYAML),y)
-DTC_DEPENDENCIES += host-pkgconf libyaml
+DTC_DEPENDENCIES += libyaml
 else
 DTC_MAKE_OPTS += NO_YAML=1
 endif

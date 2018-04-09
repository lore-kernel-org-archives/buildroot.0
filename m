From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 20:59:49 +0200
Subject: [Buildroot] [git commit] Makefile: avoid executing 'git log' each
 time SOURCE_DATE_EPOCH is used
Message-ID: <20180409185958.3FCC8881D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b47146eb2c33bd83d494a76b1186c3948e0d3ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If SOURCE_DATE_EPOCH is not defined it was given a definition that
caused 'git log' to be executed each time the variable is referenced,
which is not very efficient given that the answer cannot change.

This commit moves the definition of BR2_VERSION_GIT_EPOCH after the
inclusion of Makefile.in (so that GIT is defined) and makes it a
simply expanded variable so that it is only evaluated once.

Signed-off-by: James Byrne <james.byrne@origamienergy.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0724f28f45..cd533624ec 100644
--- a/Makefile
+++ b/Makefile
@@ -247,8 +247,6 @@ export TZ = UTC
 export LANG = C
 export LC_ALL = C
 export GZIP = -n
-BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
-export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
 endif
 
 # To put more focus on warnings, be less verbose as default
@@ -504,6 +502,14 @@ include support/dependencies/dependencies.mk
 include $(sort $(wildcard toolchain/*.mk))
 include $(sort $(wildcard toolchain/*/*.mk))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+# If SOURCE_DATE_EPOCH has not been set then use the commit date, or the last
+# release date if the source tree is not within a Git repository.
+# See: https://reproducible-builds.org/specs/source-date-epoch/
+BR2_VERSION_GIT_EPOCH := $(shell $(GIT) --git-dir=$(TOPDIR)/.git log -1 --format=%at 2> /dev/null)
+export SOURCE_DATE_EPOCH ?= $(or $(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
+endif
+
 # Include the package override file if one has been provided in the
 # configuration.
 PACKAGE_OVERRIDE_FILE = $(call qstrip,$(BR2_PACKAGE_OVERRIDE_FILE))

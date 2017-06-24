From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:26:15 +0200
Subject: [Buildroot] [git commit] core: allow having a list of "cmake"
	candidates
Message-ID: <20170624193647.A7E57817B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=914f75f156ad54cbccd41fb25ee1ce656e2b7cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the BR2_CMAKE_CANDIDATES variable, containing a list of candidates
to check and use as BR2_CMAKE, if possible.

This allows using "cmake3" on CentOS 7, whose default cmake corresponds
to version 2.8.12. Example:

    $ make BR2_CMAKE_CANDIDATES="cmake cmake3"

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/check-host-cmake.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 914327f..ef080ff 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -10,9 +10,10 @@
 #
 BR2_CMAKE_VERSION_MIN = 3.1
 
-BR2_CMAKE ?= cmake
-ifeq ($(call suitable-host-package,cmake,\
-	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE)),)
+BR2_CMAKE_CANDIDATES ?= cmake
+BR2_CMAKE ?= $(call suitable-host-package,cmake,\
+	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
+ifeq ($(BR2_CMAKE),)
 BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif

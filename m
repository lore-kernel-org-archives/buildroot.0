From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  5 May 2017 17:30:30 -0300
Subject: [Buildroot] [PATCH 2/3] core: allow having a list of "cmake"
	candidates
In-Reply-To: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1494016231-50639-3-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the BR2_CMAKE_CANDIDATES variable, containing a list of candidates
to check and use as BR2_CMAKE, if possible.

This allows using "cmake3" on CentOS 7, whose default cmake corresponds
to version 2.8.12. Example:

    $ make BR2_CMAKE_CANDIDATES="cmake cmake3"

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 support/dependencies/check-host-cmake.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 8002278..42aaee4 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -10,9 +10,10 @@
 #
 BR2_CMAKE_VERSION_MIN = 3.1
 
-BR2_CMAKE ?= cmake
-ifeq ($(call suitable-host-package,cmake,\
-	$(BR2_CMAKE) $(BR2_CMAKE_VERSION_MIN)),)
+BR2_CMAKE_CANDIDATES ?= cmake
+BR2_CMAKE ?= $(call suitable-host-package,cmake,\
+	$(BR2_CMAKE_CANDIDATES) $(BR2_CMAKE_VERSION_MIN))
+ifeq ($(BR2_CMAKE),)
 BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif
-- 
1.8.3.1

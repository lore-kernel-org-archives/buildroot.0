From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Dec 2013 11:36:40 +0100
Subject: [Buildroot] [PATCH v10 1/8] package: add base dependency to every
	package
In-Reply-To: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1387363007-19846-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move "dependencies" "dirs" "prepare" dependencies from "toolchain" to
every package.
This way we can build correctly every package right after the clean
stage.
As example with this commit we can build successfully the glibc right
after the clean stage:
	make clean glibc

This is also a step forward supporting top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk           | 5 +++++
 toolchain/toolchain/toolchain.mk | 3 +--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 45b808a..668c7da 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -426,6 +426,11 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
+$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
+ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
+$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
+endif
+
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
 #  source, by downloading
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 44ed629..8559ac9 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -14,5 +14,4 @@ endif
 
 $(eval $(generic-package))
 
-toolchain-source: prepare dirs dependencies $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-
+toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-- 
1.8.5

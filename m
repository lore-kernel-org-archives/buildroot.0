From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 14 Feb 2014 10:55:03 +0100
Subject: [Buildroot] [PATCH v13 1/7] package: add base dependency to every
	package
In-Reply-To: <1392371709-26662-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392371709-26662-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1392371709-26662-2-git-send-email-fabio.porcedda@gmail.com>
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
 toolchain/toolchain/toolchain.mk | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 555c3c2..e5b04ff 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -427,6 +427,11 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
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
index 1152e25..8559ac9 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -14,4 +14,4 @@ endif
 
 $(eval $(generic-package))
 
-toolchain-source: prepare dirs dependencies $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-- 
1.8.5.2

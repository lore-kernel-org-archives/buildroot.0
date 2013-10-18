From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 18 Oct 2013 11:27:09 +0200
Subject: [Buildroot] [PATCH v8 1/8] package: add base dependency to every
	package
In-Reply-To: <1382088437-30393-1-git-send-email-fabio.porcedda@gmail.com>
References: <1382088437-30393-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1382088437-30393-2-git-send-email-fabio.porcedda@gmail.com>
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
---
 package/pkg-generic.mk           | 2 ++
 toolchain/toolchain/toolchain.mk | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4bba4b5..1e7154e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -385,6 +385,8 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
+$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies dirs prepare
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
1.8.4

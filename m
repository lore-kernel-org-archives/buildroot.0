From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 15:00:35 +0100
Subject: [Buildroot] [git commit] gcc-final: hard link TARGET-cc ->
	TARGET-gcc
Message-ID: <20151108140055.26C9E7FF6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70dffaa1322accf8718643650908da30037a02c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doing a symlink results in incorrect behavior:

    $ x86_64-buildroot-linux-gnux32-cc
    --version
    ccache: error: execv of [...]/x86_64-buildroot-linux-gnux32-cc.br_real.br_real failed: No such file or directory

    $ x86_64-buildroot-linux-gnux32-gcc --version
    x86_64-buildroot-linux-gnux32-gcc.br_real (Buildroot 2015.11-git-00965-g8d89653-dirty) 5.2.0
    Copyright (C) 2015 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Note the double .br_real on the invocation by toolchain-wrapper.

[Thomas: use 'ln -f' instead of 'cp -l', as suggested by Arnout.]

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 0467ac2..7802855 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -91,7 +91,7 @@ HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
 # Make sure we have 'cc'
 define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
-		ln -snf $(GNU_TARGET_NAME)-gcc \
+		ln -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc \
 			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
 	fi
 endef

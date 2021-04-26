From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:46:27 +0200
Subject: [Buildroot] [PATCH 2/3] package/mkpaswd: define extract step to
 allow patching
In-Reply-To: <20210426214628.20941-1-peter@korsgaard.com>
References: <20210426214628.20941-1-peter@korsgaard.com>
Message-ID: <20210426214628.20941-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As recently discussed on the list:
http://lists.busybox.net/pipermail/buildroot/2021-April/308373.html

Packages like mkpasswd where the source code is included in the Buildroot
tree, currently doesn't use an extract step (which also skips the patch
step), so they cannot be patched by a patch in BR2_GLOBAL_PATCH_DIR (or the
pkgdir), which is a bit confusing.

As a fix, add a simple extract step that copies the source files to the
build directory, so the patch step gets run as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mkpasswd/mkpasswd.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index b013390572..c1117ef65c 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -9,9 +9,13 @@
 # at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
 HOST_MKPASSWD_LICENSE = GPL-2.0+
 
+define HOST_MKPASSWD_EXTRACT_CMDS
+	cp $(HOST_MKPASSWD_PKGDIR)/*.c $(HOST_MKPASSWD_PKGDIR)/*.h $(@D)
+endef
+
 define HOST_MKPASSWD_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-		package/mkpasswd/mkpasswd.c package/mkpasswd/utils.c \
+		$(@D)/mkpasswd.c $(@D)/utils.c \
 		-o $(@D)/mkpasswd -lcrypt
 endef
 
-- 
2.20.1

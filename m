From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:04:29 +0200
Subject: [Buildroot] [git commit] binutils: fix build of 2.26 when makeinfo
	is not available
Message-ID: <20160705130554.341848222D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de4b45d5e70dd5d2431b0f44aeda60b033ecff11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2.26 binutils tarball has incorrect timestamps for the .info files,
so binutils build system tries to regenerate them with makeinfo. In
order to avoid depending on host-texinfo, we simply touch the .info
files so that their timestamp is newer than the corresponding source
files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 33aaf85..50a3531 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -33,6 +33,17 @@ BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
 HOST_BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
 endif
 
+# The .info files in the 2.26 tarball have an incorrect timestamp, so
+# binutils tries to re-generate them. In order to avoid the dependency
+# on host-texinfo, we simply update the timestamps.
+ifeq ($(BR2_BINUTILS_VERSION_2_26_X),y)
+define BINUTILS_FIXUP_INFO_TIMESTAMPS
+	find $(@D) -name '*.info' -exec touch {} \;
+endef
+BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
+HOST_BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
+endif
+
 # When binutils sources are fetched from the binutils-gdb repository,
 # they also contain the gdb sources, but gdb shouldn't be built, so we
 # disable it.

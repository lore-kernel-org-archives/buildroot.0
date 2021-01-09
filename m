From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jan 2021 16:00:28 +0100
Subject: [Buildroot] [git commit] package/multipath-tools: disable -Werror
Message-ID: <20210109145345.C981D86669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe4b4e9dc339da13bbb7583e44c7ed2177018a1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the new WARNFLAGS to "" which has been added since version 0.8.5 and
https://github.com/opensvc/multipath-tools/commit/82f1b164cb21c9632b3c73f865d97777c7a61e0d

Otherwise, -Werror will raise the following build failure:

/srv/storage/autobuild/run/instance-3/output-1/host/bin/mipsel-linux-gcc --std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2  -D_FORTIFY_SOURCE=1  -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int -Werror=implicit-function-declaration -Werror=format-security -Wno-clobbered -Wno-error=clobbered -Werror=cast-qual -Werror=discarded-qualifiers -pipe -DBIN_DIR=\"/sbin\" -DLIB_STRING=\"lib\" -DRUN_DIR=\"run\" -MMD -MP -fPIC -I.. -I../../libmultipath/nvme -Wp,-D_FORTIFY_SOURCE=2  -c -o nvme.o nvme.c
<command-line>: error: "_FORTIFY_SOURCE" redefined [-Werror]

Fixes:
 - http://autobuild.buildroot.org/results/71f7661e7d26ca8608e902eee9f2a92376b00601

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/multipath-tools/multipath-tools.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index d5cca7ba57..7fe9033a15 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -9,7 +9,12 @@ MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_V
 MULTIPATH_TOOLS_LICENSE = LGPL-2.0
 MULTIPATH_TOOLS_LICENSE_FILES = COPYING
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
-MULTIPATH_TOOLS_MAKE_OPTS = LIB="lib" RUN="run" OPTFLAGS="" STACKPROT=""
+MULTIPATH_TOOLS_MAKE_OPTS = \
+	LIB="lib" \
+	RUN="run" \
+	OPTFLAGS="" \
+	STACKPROT="" \
+	WARNFLAGS=""
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MULTIPATH_TOOLS_DEPENDENCIES += systemd

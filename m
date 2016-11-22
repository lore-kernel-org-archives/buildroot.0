From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:34:26 +0100
Subject: [Buildroot] [git commit] package/e2fsprogs: disable use of magic.h
Message-ID: <20161122093801.C3F6581823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47329fb4cff4f482d7b9a03a54cbd314e817bf32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RHEL 5.x does have magic.h, but it does not define all expected symbols.
In particular, the NO_CHECK symbols were only added in file 4.20 and RHEL
5.x is using 4.17. Don't use magic.h and libmagic when building host
package.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 022ba52..b6e79d2 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -51,6 +51,12 @@ endif
 # for util/subst.c to build properly.
 E2FSPROGS_CONF_ENV += BUILD_CFLAGS="-DHAVE_SYS_STAT_H"
 
+# Disable use of the host magic.h, as on older hosts (e.g. RHEL 5)
+# it doesn't provide definitions expected by e2fsprogs support lib.
+HOST_E2FSPROGS_CONF_ENV += \
+	ac_cv_header_magic_h=no \
+	ac_cv_lib_magic_magic_file=no
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 # util-linux libuuid pulls in libintl if needed, so ensure we also
 # link against it, otherwise static linking fails

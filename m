From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 12:08:48 +0100
Subject: [Buildroot] [git commit] package/meson: fix shebang in deep build
 trees
Message-ID: <20200203105752.84852886FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62df914ced5adab3869c2ce6f9a41203802e6358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson script includes the full path to the python interpreter. In
deep build trees, this path can be more than 128 characters long, which
is the limit for how long a shebang may be.

Notice that this has been bumped to 256 since kerel 5.1, but the issue still
persists:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eb3c3d0a52dca337e327ae8868ca1f44a712e02

In older kernels, this limit was silently ignored, leading to potential
bugs, but newer kernels enforce that limit, and refuse to execve() the
script, returning with NOEXEC.  Since the script is +x, the shell (any
bourne shell, as well as the C shell) will conclude from that situation that
they should interpret it as a shell script, which it obviously is not.

Fix the problem by replacing the shebang with a call to /usr/bin/env
which will redirect to the correct python3 interpreter found in the
PATH.

Note however that this means our meson installation can no longer be
called from outside of the meson-package infrastructure anymore (not
that we ever supported it before, but who knows what people may have
done in their br2-external), unless one does set the PATH to include
$(HOST_DIR)/bin/ earlier than a system-provided python3 would be found.

Fixes: #12331 #12461

Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
Reported-by: Matthias Wei??er <m.weisser.m@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d799dd1fac..e51e76d1c0 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -49,4 +49,10 @@ HOST_MESON_SED_CFLAGS = $(if $(strip $(TARGET_CFLAGS)),`printf '"%s"$(comma) ' $
 HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
 HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
 
+# Avoid interpreter shebang longer than 128 chars
+define HOST_MESON_SET_INTERPRETER
+	$(SED) '1s:.*:#!/usr/bin/env python3:' $(HOST_DIR)/bin/meson
+endef
+HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_SET_INTERPRETER
+
 $(eval $(host-python-package))

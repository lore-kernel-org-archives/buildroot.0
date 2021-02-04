From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 17:52:02 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/pkg-meson.mk: fix
 ccache auto-detection avoidance
Message-ID: <20210204164015.59302802AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7a6b6be72b7e637f8b1fa64066ed7eaa9597f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit f4a61d1ae23e (package/pkg-meson.mk avoid host ccache detection)
forced the host C and C++ compilers so that meson does not try to
autodetect ccache, and instead relies on what we provide.

However, this incorrectly used single-expansion of variables in a
package infra.

For traditional builds, this is OK, because the value does not change
across packages.

However, for builds with per-package directories, this value only refers
to the generic path, which ill not exist until the end of the build when
all packages are aggregated in the host-finalize step.

Fix that by postponing the variable evaluation like all the others.

Reported-by: Xogium on IRC
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 548b8c541285cedc390c4c95bd9d80dbad7d2a73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-meson.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index e49aca055f..5c4598eb00 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -81,8 +81,8 @@ define $(2)_CONFIGURE_CMDS
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
-	CC_FOR_BUILD="$(HOSTCC)" \
-	CXX_FOR_BUILD="$(HOSTCC)" \
+	CC_FOR_BUILD="$$(HOSTCC)" \
+	CXX_FOR_BUILD="$$(HOSTCC)" \
 	$$($$(PKG)_CONF_ENV) \
 	$$(MESON) \
 		--prefix=/usr \

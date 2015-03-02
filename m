From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:22 -0000
Subject: [Buildroot] [git commit] kconfig infra: support built-in config
	files
Message-ID: <20150302222717.AA1C9807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23fd6e0e6ac5520391fb2e8f6c1e92eca91d865e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the configuration file of a package is located inside of the
package sources, a make dependency can only be expressed after the
package has been extracted (and patched).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ec58d69..ef724e5 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -41,9 +41,13 @@ ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
+# The config file could be in-tree, so before depending on it the package should
+# be extracted (and patched) first
+$$($(2)_KCONFIG_FILE): | $(1)-patch
+
 # The .config file is obtained by copying it from the specified source
 # configuration file, after the package has been patched.
-$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
+$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE)
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
 
 # In order to get a usable, consistent configuration, some fixup may be needed.

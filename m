From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Mar 2020 18:22:05 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: fix special cases
 of symlinks
Message-ID: <20200309140908.D272C81532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f24e92751448a0aa715aca9746fcacc106b07a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some symlinks were not created correctly when installing the
Linux-firmware package. This patch fixes the support for all symlinks of
the form:

  a/foo -> bar
  a/foo -> b/bar
  a/foo -> ../b/bar

With this patch all forms of symlinks described in the WHENCE file
should be supported, whether they are in nested directories, or in
non-existing ones.

As some symlinks could be in directories that do not exist, we must
maje sure to canonicalize the path before testing the linked-to file.

We compared the symlinks installed pre-20200122 to what we have now, and
it seems we're handling all of them with this patch.

Fixes: 55df4059d24b ("package/linux-firmware: fix symlink support")
Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
[yann.morin.1998 at free.fr:
  - use readlink in canonicalize-missing mode, to avoid
    creating-then-removing directories
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Antoine Tenart <antoine.tenart@bootlin.com>
Reviewed-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 009202d604..6d3cec1a48 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -609,12 +609,18 @@ endif
 # automatically by its copy-firmware.sh script during the installation, which
 # parses the WHENCE file where symlinks are described. We follow the same logic
 # here, adding symlink only for firmwares installed in the target directory.
-# The grep/sed parsing is taken from the script mentioned before.
+#
+# For testing the presence of firmwares in the target directory we first make
+# sure we canonicalize the pointed-to file, to cover the symlinks of the form
+# a/foo -> ../b/foo  where a/ (the directory where to put the symlink) does
+# not yet exist.
 define LINUX_FIRMWARE_CREATE_SYMLINKS
+	cd $(TARGET_DIR)/lib/firmware/ ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
-		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
-			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f || exit 1; \
+		if test -f $$(readlink -m $$(dirname $$f)/$$d); then \
+			mkdir -p $$(dirname $$f) || exit 1; \
+			ln -sf $$d $$f || exit 1; \
 		fi ; \
 	done
 endef

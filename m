From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:30:15 +0100
Subject: [Buildroot] [git commit] package/pseudo: provide better legacy
	handling for fakeroot
Message-ID: <20161109223122.61D8580E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=499f28fc7ce6184c8017ccd229ffc973a520adde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now have a wrapper that makes pseudo behaves like the fakeroot of the
good ol' days. So the symlink will just magically keep old scripts
working as they did before the switch to pseudo.

However, using fakeroot is deprecated, and we want people to stop using
it altogether and switch to pseudo.

So, make the wrapper recognise how it's called, and if called as
fakeroot, print a warning message.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pseudo/pseudo-wrapper | 9 ++++++++-
 package/pseudo/pseudo.mk      | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
index feaa7fc..9c8dbdb 100644
--- a/package/pseudo/pseudo-wrapper
+++ b/package/pseudo/pseudo-wrapper
@@ -1,5 +1,12 @@
 #!/bin/sh
 
+if [ "${0##*/}" = "fakeroot" ]; then
+    cat >&2 <<-_EOF_
+	WARNING: fakeroot has been replaced with pseudo.
+	WARNING: Update your script(s) to use pseudo or pseudo-wrapper instead.
+	_EOF_
+fi
+
 export PSEUDO_PREFIX="$(dirname "${0%/*}")"
 export PSEUDO_OPTS="-t0"
 if [ -n "${TARGET_DIR}" ]; then
@@ -9,4 +16,4 @@ if [ -n "${BASE_DIR}" ]; then
     export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
 fi
 
-exec "${0%-wrapper}" "${@}"
+exec "${0%/*}/pseudo" "${@}"
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 7701825..aa2a9c7 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -33,7 +33,7 @@ endef
 HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_INSTALL_WRAPPER
 
 define HOST_PSEUDO_FAKEROOT_SYMLINK
-	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
+	ln -sf pseudo-wrapper $(HOST_DIR)/usr/bin/fakeroot
 endef
 HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:29:59 +0100
Subject: [Buildroot] [git commit] package/pseudo: wrap the real pseudo with
	a wrapper
Message-ID: <20161109223122.4EC2180E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d602a74d53f5610852c1763014632de145bf8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running pseudo is more involved than running fakeroot. In the transition
from using fakeroot, we just did not account for the extra requirements.

First, we explicitly tell pseudo where it is, otherwise it tries to
guess. Its guess is correct, but it prints a warning, which is not nice.

Second, we tell it where to find the passwd and group files in case it
has to emulate access to them. We currently do not use that feature, but
better safe than sorry.

Third, pseudo spawns a background daemon, and talks to it (when fakeroot
would emulate the state all in the current process' state, pseudo uses
the daemon to coordinate the state across multiple processes). We are
not much interested in the daemon lingering around, so we just tell it
to terminate as soon as the last clients quits (this can take up to one
second).

Fourth and last, pseudo always stores its internal database when
exiting, and reloads it when spawned. The database is by default stored
in a sub-directory of the prefix it was installed in, but this is
impractical for us. We want the database to be specific to the one
config dir we are building, so we store the database in a (hidden)
sub-dir of the build dir, thus ensuring it is never shared with another
build. That directory is hidden (starts with a dot) because we consider
that to be our internal state that we do not want to expose to the user.

The wrapper has to be relocatable, so we avoid using hard-coded paths
in there: we derive those paths fom the runtime path of pseudo. However,
the build directory $(BUILD_DIR) is not available in the environment
(we do not export it because it conflicts with some buildsystems).
Instead, we use $(BASE_DIR) which is exported.

Finally, when relocated, the wrapper would not be used in the Buildroot
environment, so may not have access to TARGET_DIR or BASE_DIR, unless
the user sets them. If he does not, we still want the wrapper to be
working (to avoid the warning about the prefix, and to exit the daemon
asap); thus we leave the passwd and localstatedir variable alone if we
don't have what it needs to set them, rather than set them to incorrect
values.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pseudo/pseudo-wrapper | 12 ++++++++++++
 package/pseudo/pseudo.mk      |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
new file mode 100644
index 0000000..feaa7fc
--- /dev/null
+++ b/package/pseudo/pseudo-wrapper
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+export PSEUDO_PREFIX="$(dirname "${0%/*}")"
+export PSEUDO_OPTS="-t0"
+if [ -n "${TARGET_DIR}" ]; then
+    export PSEUDO_PASSWD="${TARGET_DIR}"
+fi
+if [ -n "${BASE_DIR}" ]; then
+    export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
+fi
+
+exec "${0%-wrapper}" "${@}"
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index a924e10..7701825 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -26,6 +26,12 @@ HOST_PSEUDO_CONF_OPTS = \
 	--libdir=$(HOST_DIR)/usr/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
+define HOST_PSEUDO_INSTALL_WRAPPER
+	$(INSTALL) -D -m 0755 $(HOST_PSEUDO_PKGDIR)/pseudo-wrapper \
+		$(HOST_DIR)/usr/bin/pseudo-wrapper
+endef
+HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_INSTALL_WRAPPER
+
 define HOST_PSEUDO_FAKEROOT_SYMLINK
 	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
 endef

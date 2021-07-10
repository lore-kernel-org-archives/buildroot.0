From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Jul 2021 19:21:53 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/gawk: create awk
 symlink for host-gawk
Message-ID: <20210710165209.B229695433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4368ab465c3561b864c63bfed001610b3b04d9eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

This is to make sure that host packages that depend on `host-gawk` and that use
`awk` end up using `gawk`, instead of the `awk` symlink installed on the host
system.

On recent Debian-based distributions, `awk` is still symlinked to `mawk` [1].

[1] https://bugs.launchpad.net/ubuntu/+source/mawk/+bug/1841654

Signed-off-by: Hubert Lacote <hubert.lacote@youview.com>
Co-authored-by: Hubert Lacote <hubert.lacote@youview.com>
Co-authored-by: Vicente Olivert Riera <vincent.olivert.riera@youview.com>
[yann.morin.1998 at free.fr: move after the target symlink hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 150038166fafae5c596e1e8ca7572bf8b6793a6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/gawk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 16906f6f93..ae2bbe5422 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -39,5 +39,11 @@ endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
+define HOST_GAWK_CREATE_SYMLINK
+	ln -sf gawk $(HOST_DIR)/usr/bin/awk
+endef
+
+HOST_GAWK_POST_INSTALL_HOOKS += HOST_GAWK_CREATE_SYMLINK
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

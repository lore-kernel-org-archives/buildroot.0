From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:29:10 +0100
Subject: [Buildroot] [git commit] package/pseudo: add a legacy symlink to
	emulate fakeroot
Message-ID: <20161103223211.3B7B77FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7158403805f650e8e34de6c0ac0dcd9b565c679b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case some post-image script want to call fakeroot, add a symlink to
use pseudo instead.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pseudo/pseudo.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 2137a37..e2c56ff 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -20,4 +20,9 @@ HOST_PSEUDO_CONF_OPTS = \
 	--libdir=$(HOST_DIR)/usr/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
+define HOST_PSEUDO_FAKEROOT_SYMLINK
+	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
+endef
+HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
+
 $(eval $(host-autotools-package))

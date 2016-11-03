From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Nov 2016 23:21:07 +0100
Subject: [Buildroot] [PATCH 3/4] package/pseudo: add a legacy symlink to
	emulate fakeroot
In-Reply-To: <cover.1478211656.git.yann.morin.1998@free.fr>
References: <cover.1478211656.git.yann.morin.1998@free.fr>
Message-ID: <52f872897022915168b1df835622d5fba57e1780.1478211656.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In cae some post-image script want to call fakeroot, add a symlink to
use pseudo instead.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pseudo/pseudo.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index ffa6e58..b4f2df3 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -17,4 +17,9 @@ HOST_PSEUDO_CONF_OPTS = \
 	--libdir=$(HOST_DIR)/usr/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
+define HOST_PSEUDO_FAKEROOT_SYMLINK
+	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
+endef
+HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
+
 $(eval $(host-autotools-package))
-- 
2.7.4

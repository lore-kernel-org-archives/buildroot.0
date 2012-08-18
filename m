From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Aug 2012 14:48:33 +0200
Subject: [Buildroot] [PATCH] package/autotool infra: create missing m4 dir
Message-ID: <1345294113-11303-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package needs to be auto-reconfigured, it may be missing the m4/
sub-dir, especially when we use the package from its VCS.

Grep configure.{ac,in} tp find the location of the m4/ sub-dir (defaulting
to the root of the package), and create it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---

This is a tentative patch for RFC.
---
 package/pkg-autotools.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 785daab..f199ac6 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -173,6 +173,7 @@ endif
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
+	M4_DIR=$$$$(sed -r -e '/.*AC_CONFIG_MACRO_DIR\(\[(.*)\]\).*/!d; s//\1/g;' $$($$(PKG)_SRCDIR)configure.*) && mkdir -p "$$($$(PKG)_SRCDIR)$$$${M4_DIR:-m4}"
 	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-- 
1.7.2.5

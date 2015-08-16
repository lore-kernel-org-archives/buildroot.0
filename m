From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 16:53:27 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/oprofile: fix static
	linking
Message-ID: <1439736807-29324-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oprofile links with popt, which links with -lintl and specifies it in
its popt.pc, and has done so for the past 6+ years, but oprofile does
not use pkconfig to find popt, so we need to tell it to link with -lintl
for a static build.

Fixes:
    http://autobuild.buildroot.org/results/a48/a485f2171a3fcbfa2e0e5aec8e653cf88512615d/
    http://autobuild.buildroot.org/results/b37/b374874f1915ab1d7aa6262604ccc8db102bb0b0/
    http://autobuild.buildroot.org/results/261/2616a63081ed8c55c7ca1a6879b1a6a14e19f918/
    http://autobuild.buildroot.org/results/73f/73f34ab59d54ded68ff60608a0212a6e5a5190e5/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - use PKG_CONFIG_HOST_BINARY to find popt libs  (Baruch)
---
 package/oprofile/oprofile.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 5876307..8815da7 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -41,6 +41,13 @@ ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
+# popt links with -lintl and specifies it in its popt.pc, and has done
+# so for the past 6+ years, but oprofile does not use pkconfig to find
+# popt, so we need to tell it to link with -lintl for a static build.
+ifeq ($(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yy)
+OPROFILE_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
+endif
+
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
-- 
1.9.1

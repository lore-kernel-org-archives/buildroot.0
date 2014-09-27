From: zooey at hirschkaefer.de <zooey@hirschkaefer.de>
Date: Sat, 27 Sep 2014 15:12:20 +0200
Subject: [Buildroot] [RFC 2/3] samba4: add hacky patch that avoids manpage
	creation
In-Reply-To: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
References: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
Message-ID: <1411823541-4953-3-git-send-email-zooey@hirschkaefer.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Oliver Tappe <zooey@hirschkaefer.de>

Otherwise, installation of smbclient fails.
---
 ...0011-build-avoid-installation-of-manpages.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/samba4/samba4-0011-build-avoid-installation-of-manpages.patch

diff --git a/package/samba4/samba4-0011-build-avoid-installation-of-manpages.patch b/package/samba4/samba4-0011-build-avoid-installation-of-manpages.patch
new file mode 100644
index 0000000..9a3f012
--- /dev/null
+++ b/package/samba4/samba4-0011-build-avoid-installation-of-manpages.patch
@@ -0,0 +1,40 @@
+From d39b348c3b8c210ba460f27ce50bc87f867f5705 Mon Sep 17 00:00:00 2001
+From: Oliver Tappe <zooey@hirschkaefer.de>
+Date: Fri, 26 Sep 2014 19:16:38 +0200
+Subject: [PATCH] build: avoid installation of manpages
+
+Somehow, telling waf to install the 'smbclient' target will also
+try to install manpages which have not been generated when during
+the build stage of 'smbclient'. Deactivate the installation of
+man pages as a (grossly hackish) workaround.
+---
+ buildtools/wafsamba/wafsamba.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/buildtools/wafsamba/wafsamba.py b/buildtools/wafsamba/wafsamba.py
+index aaa0939..a5a476d 100644
+--- a/buildtools/wafsamba/wafsamba.py
++++ b/buildtools/wafsamba/wafsamba.py
+@@ -800,8 +800,8 @@ def MANPAGES(bld, manpages, install):
+                             group='final',
+                             rule='${XSLTPROC} --xinclude -o ${TGT} --nonet ${MAN_XSL} ${SRC}'
+                             )
+-        if install:
+-            bld.INSTALL_FILES('${MANDIR}/man%s' % m[-1], m, flat=True)
++        #if install:
++        #    bld.INSTALL_FILES('${MANDIR}/man%s' % m[-1], m, flat=True)
+ Build.BuildContext.MANPAGES = MANPAGES
+ 
+ def SAMBAMANPAGES(bld, manpages):
+@@ -821,7 +821,7 @@ def SAMBAMANPAGES(bld, manpages):
+                                     ${XSLTPROC} --xinclude --stringparam noreference 0 -o ${TGT}.xml --nonet ${SAMBA_EXPAND_XSL} ${SRC}
+                                     ${XSLTPROC} --nonet -o ${TGT} ${SAMBA_MAN_XSL} ${TGT}.xml'''
+                             )
+-        bld.INSTALL_FILES('${MANDIR}/man%s' % m[-1], m, flat=True)
++        #bld.INSTALL_FILES('${MANDIR}/man%s' % m[-1], m, flat=True)
+ Build.BuildContext.SAMBAMANPAGES = SAMBAMANPAGES
+ 
+ #############################################################
+-- 
+1.8.4.5
+
-- 
1.8.4.5

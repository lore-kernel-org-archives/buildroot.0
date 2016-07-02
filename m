From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 10:37:41 +0200
Subject: [Buildroot] [git commit] package/{libsepol,
	libselinux}: fix build on ancient distros
Message-ID: <20160702083809.3143480AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e2d1e43cf0dea2a20076566db30188cf0283599
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ancient distros (especially enterprise-grade still in use) do not accept
ln --relative.

Revert the upstream commit, since the problem it was trying to fix is
not applicable in the context of Buildroot (even with a merged /usr).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <Aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libselinux/0003-revert-ln-relative.patch | 24 ++++++++++++++++++++++++
 package/libsepol/0004-revert-ln-relative.patch   | 24 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/libselinux/0003-revert-ln-relative.patch b/package/libselinux/0003-revert-ln-relative.patch
new file mode 100644
index 0000000..b8ad070
--- /dev/null
+++ b/package/libselinux/0003-revert-ln-relative.patch
@@ -0,0 +1,24 @@
+Makefile: revert libselinux: use ln --relative to create .so symlinks
+
+This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
+
+ln --relative is too recent to be available in all distributions,
+especially enterprise-grade distros that can stick around as long as
+they are maintained (up to 10 years in some cases?).
+
+For the sake of Buildroot, revert the upstream patch.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/src/Makefile b/src/Makefile
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -151,7 +151,7 @@
+ 	install -m 755 $(LIBSO) $(SHLIBDIR)
+ 	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
+ 	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
+-	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
++	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
+ 
+ install-pywrap: pywrap
+ 	test -d $(PYLIBDIR)/site-packages/selinux || install -m 755 -d $(PYLIBDIR)/site-packages/selinux
diff --git a/package/libsepol/0004-revert-ln-relative.patch b/package/libsepol/0004-revert-ln-relative.patch
new file mode 100644
index 0000000..0902d8d
--- /dev/null
+++ b/package/libsepol/0004-revert-ln-relative.patch
@@ -0,0 +1,24 @@
+Makefile: revert libsepol: use ln --relative to create .so symlinks
+
+This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
+
+ln --relative is too recent to be available in all distributions,
+especially enterprise-grade distros that can stick around as long as
+they are maintained (up to 10 years in some cases?).
+
+For the sake of Buildroot, revert the upstream patch.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/src/Makefile b/src/Makefile
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -77,7 +77,7 @@
+ ifeq ($(STATIC),)
+ 	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
+ 	install -m 755 $(LIBSO) $(SHLIBDIR)
+-	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
++	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
+ endif
+ 
+ relabel:

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:40:37 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/opkg-utils:
 install only utility scripts
Message-ID: <20210320162644.F3CB587955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=935e22e3ce1943ee2da0b1dbb3f4a54b30306ac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When `make install` is run to install the opkg-utils scripts, it also
invokes building of the man page for opkg-build. The generation of the
man page requires `pod2man` executable which is a part of perl.

Since buildroot does not support man pages in the host directory,
patch the opkg-utils Makefile to separate the installation of man
pages and utility scripts.

With the options to install man pages and utils separately, only
install the opkg-utils scripts.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0424eee0ee63e6ad85f3ce8ec24d1bb23088fd02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...efile-seperate-manpages-and-utils-install.patch | 50 ++++++++++++++++++++++
 package/opkg-utils/opkg-utils.mk                   |  2 +-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch b/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
new file mode 100644
index 0000000000..140187ca3a
--- /dev/null
+++ b/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
@@ -0,0 +1,50 @@
+From 74ccbee0f798822041dba5c6564df62a0c60d86b Mon Sep 17 00:00:00 2001
+From: Ryan Barnett <ryanbarnett3@gmail.com>
+Date: Mon, 22 Feb 2021 07:09:34 -0600
+Subject: Makefile: separate manpages and utils install
+
+The installation of opkg-build man page introduces a host dependency
+on perl for the pod2man package to generate the man page.
+
+To allow the opkg-utils scripts to be installed separately from the
+manpages, break apart the install step into two install steps:
+install-utils and install-docs
+
+Backported from: 74ccbee0f798822041dba5c6564df62a0c60d86b
+
+CC: Christian Hermann <mail@hermannch.dev>
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
+---
+ Makefile | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4049654..fe96d5a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,9 +27,11 @@ mandir ?= $(PREFIX)/man
+ 
+ all: $(UTILS) $(MANPAGES)
+ 
+-install: all
++install-utils: $(UTILS)
+ 	install -d $(DESTDIR)$(bindir)
+ 	install -m 755 $(UTILS) $(DESTDIR)$(bindir)
++
++install-docs: $(MANPAGES)
+ 	install -d $(DESTDIR)$(mandir)
+ 	for m in $(MANPAGES); \
+ 	do \
+@@ -37,4 +39,6 @@ install: all
+ 		install -m 644 "$$m" $(DESTDIR)$(mandir)/man$${m##*.}; \
+ 	done
+ 
+-.PHONY: install all
++install: install-utils install-docs
++
++.PHONY: install install-utils install-docs all
+-- 
+cgit v1.2.2-1-g5e49
+
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index a94a4cd5cd..be827e6cac 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -17,7 +17,7 @@ define HOST_OPKG_UTILS_BUILD_CMDS
 endef
 
 define HOST_OPKG_UTILS_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
 endef
 
 $(eval $(host-generic-package))

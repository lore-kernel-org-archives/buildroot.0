From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 17:58:13 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/live555: Add a
 pkg-config file for the shared libraries
Message-ID: <20181024155854.BF7B888DB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b83f394e7956df611ff55962f87aae5db10933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Needed for vlc to fix linking issue.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 13f7959e8d99468ab6718f037210c972120ea775)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-pkg-config-file-for-the-shared-libraries.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch b/package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch
new file mode 100644
index 0000000000..a2ae1c183a
--- /dev/null
+++ b/package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch
@@ -0,0 +1,66 @@
+From: Benjamin Drung <bdrung@debian.org>
+Date: Sat, 16 Sep 2017 11:22:03 +0200
+Subject: Add a pkg-config file for the shared libraries
+
+This patch was downloaded from Debian
+https://sources.debian.org/src/liblivemedia/2018.08.05-1/debian/patches/0002-Add-a-pkg-config-file-for-the-shared-libraries.patch/
+
+The local/ part of PREXIX and LIBDIR was removed to fit into buildroot.
+
+A similar version of this patch is part of the vlc source repo:
+http://git.videolan.org/?p=vlc.git;a=blob;f=contrib/src/live555/add-pkgconfig-file.patch;hb=HEAD
+
+Upstream status: Rejected
+http://lists.live555.com/pipermail/live-devel/2013-January/016374.html
+http://lists.live555.com/pipermail/live-devel/2013-January/016375.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile.head | 3 +++
+ Makefile.tail | 7 ++++++-
+ live555.pc.in | 9 +++++++++
+ 3 files changed, 18 insertions(+), 1 deletion(-)
+ create mode 100644 live555.pc.in
+
+diff --git a/Makefile.head b/Makefile.head
+index 458c54c..1571037 100644
+--- a/Makefile.head
++++ b/Makefile.head
+@@ -1 +1,4 @@
++PREFIX = /usr
++LIBDIR = /usr/lib
++VERSION = $(shell grep LIVEMEDIA_LIBRARY_VERSION_STRING liveMedia/include/liveMedia_version.hh | sed 's/.*"\([^"]*\)".*/\1/')
+ ##### Change the following for your environment:
+diff --git a/Makefile.tail b/Makefile.tail
+index fc594ea..a20a527 100644
+--- a/Makefile.tail
++++ b/Makefile.tail
+@@ -22,7 +22,12 @@ all:
+ 	@echo
+ 	@echo "For more information about this source code (including your obligations under the LGPL), please see our FAQ at http://live555.com/liveMedia/faq.html"
+ 
+-install:
++install_shared_libraries:
++	install -d $(DESTDIR)$(LIBDIR)/pkgconfig
++	sed "s#@PREFIX@#$(PREFIX)#;s#@LIBDIR@#$(LIBDIR)#;s#@VERSION@#$(VERSION)#" live555.pc.in > $(DESTDIR)$(LIBDIR)/pkgconfig/live555.pc
++	chmod 644 $(DESTDIR)$(LIBDIR)/pkgconfig/live555.pc
++
++install: $(INSTALL2)
+ 	cd $(LIVEMEDIA_DIR) ; $(MAKE) install
+ 	cd $(GROUPSOCK_DIR) ; $(MAKE) install
+ 	cd $(USAGE_ENVIRONMENT_DIR) ; $(MAKE) install
+diff --git a/live555.pc.in b/live555.pc.in
+new file mode 100644
+index 0000000..3736944
+--- /dev/null
++++ b/live555.pc.in
+@@ -0,0 +1,9 @@
++prefix=@PREFIX@
++libdir=@LIBDIR@
++includedir=${prefix}/include
++
++Name: live555
++Description: multimedia RTSP streaming library
++Version: @VERSION@
++Cflags: -I${includedir}/liveMedia -I${includedir}/groupsock -I${includedir}/BasicUsageEnvironment -I${includedir}/UsageEnvironment
++Libs: -L${libdir} -lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment

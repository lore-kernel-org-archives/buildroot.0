From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 13:51:59 +0200
Subject: [Buildroot] [git commit] package/systemd: fix build on not-recent
	distros
Message-ID: <20170401115417.6CA6282122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=902bb3a4d7cf1dd1d4ff5d54719da672dea8681a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd is at it again, using ln --relative once more, which is not
available but on the most recent distros.

Patch it out with a bit of sed magic.

Fixes:
    http://autobuild.buildroot.org/results/48e/48ecf31eca9b22339a770abd3f9abdf1ae41cfd3/
    http://autobuild.buildroot.org/results/c62/c6297c61d8c2d3ab9be77b9d398598adacdb33b3/
    http://autobuild.buildroot.org/results/22f/22ff106a4626c84422d9a3e69aa9c8fe7c76938c/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-install-don-t-use-ln-relative.patch       | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/systemd/0004-install-don-t-use-ln-relative.patch b/package/systemd/0004-install-don-t-use-ln-relative.patch
new file mode 100644
index 0000000..2d8cf53
--- /dev/null
+++ b/package/systemd/0004-install-don-t-use-ln-relative.patch
@@ -0,0 +1,40 @@
+From cdb52b24436f0926fd6c56e129c843f49f9b1ed0 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 31 Mar 2017 23:15:09 +0200
+Subject: [PATCH] install: don't use ln --relative
+
+ln --relative is too recent to be available in most distros, so it
+breaks the build.
+
+Fix that with a bit of sed magic, that turns constituents of the
+destination directory each into ../ , which when appended to the
+destination directory leads back straight to / .
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+The problem is even more visible when doing cross-compilation in
+professional build farms, which are often stuck to years-to-decade-old
+enterprise-grade distributions (because, IT), even if the target system
+is top-notch up-to-date.
+---
+ Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1cc657a..ef11e93 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -314,7 +314,8 @@ install-directories-hook:
+ 	$(MKDIR_P) $(addprefix $(DESTDIR),$(INSTALL_DIRS))
+ 
+ install-environment-conf-hook: install-directories-hook
+-	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(sysconfdir)/environment \
++	dir=$(shell echo $(environmentdir) |sed -r -e 's:/+[^/]+:../:g'); \
++	$(AM_V_LN)$(LN_S) -f $${dir}$(sysconfdir)/environment \
+ 		$(DESTDIR)$(environmentdir)/99-environment.conf
+ 
+ install-aliases-hook:
+-- 
+2.9.3
+

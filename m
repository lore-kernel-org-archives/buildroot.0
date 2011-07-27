From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 27 Jul 2011 11:34:51 +0200
Subject: [Buildroot] [PATCH] 'source' target should depend on 'dirs'
Message-ID: <d5142bce1ef181022512.1311759291@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the following command flow:
make distclean
make <board>_defconfig
make source

the dl directory would normally be created by the first wget download. If there are no such downloads, e.g. because you use a local download mirror (e.g. scp, file) or only use git/svn/hg/bzr repositories, the dl directory is not created automatically. This causes e.g. the 'pushd' command in the respective _DOWNLOAD commands to fail.

This patch adds a dependency to the 'dirs' target to 'source', fixing this scenario.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -486,7 +486,7 @@
 	done
 endif
 
-source: $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u

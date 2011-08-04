From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 21:56:33 +0200
Subject: [Buildroot] [git commit] 'source' target should depend on 'dirs'
Message-ID: <20110804195757.303B88B756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4eb982cf90f16927442f4e7692ce51dd5d21f37b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the following command flow:
make distclean
make <board>_defconfig
make source

the dl directory would normally be created by the first wget download. If there are no such downloads, e.g. because you use a local download mirror (e.g. scp, file) or only use git/svn/hg/bzr repositories, the dl directory is not created automatically. This causes e.g. the 'pushd' command in the respective _DOWNLOAD commands to fail.

This patch adds a dependency to the 'dirs' target to 'source', fixing this scenario.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 02a1659..df6ce8f 100644
--- a/Makefile
+++ b/Makefile
@@ -486,7 +486,7 @@ target-purgelocales:
 	done
 endif
 
-source: $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
-- 
1.7.3.4

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  1 Jul 2018 20:34:08 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: adjust install-static patch to
 install headers under $(prefix)/include/btrfs
Message-ID: <20180701183408.7305-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/15cc6523a42bf66508b2b37fd1fcb74625561ec2/

btrfs-progs 'make install' installs headers under $(prefix)/include/btrfs,
but our patch to also install headers for 'install-static' installed
directly into $(prefix)/include, confusing other packages as btrfs-progs
headers have very common names such as version, sizes.h, list.h, ioctl.h, ..

Fix it by adjusting the patch to also install under $(prefix)/include/btrfs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-install-static-library-and-headers-in-insta.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
index 1cdedfd984..de2db2f16f 100644
--- a/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
+++ b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
@@ -41,8 +41,8 @@ index 67fbc48..d9e34be 100644
  	$(LN_S) -f btrfs.static $(DESTDIR)$(bindir)/btrfsck.static
 +	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
 +	$(INSTALL) $(libs_static) $(DESTDIR)$(libdir)
-+	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)
-+	$(INSTALL) -m644 $(libbtrfs_headers) $(DESTDIR)$(incdir)
++	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)/btrfs
++	$(INSTALL) -m644 $(libbtrfs_headers) $(DESTDIR)$(incdir)/btrfs
  
  $(INSTALLDIRS):
  	@echo "Making install in $(patsubst install-%,%,$@)"
-- 
2.11.0

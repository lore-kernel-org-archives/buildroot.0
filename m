From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:16:25 +0200
Subject: [Buildroot] [git commit] exim: do not link buildconfig with $(LIBS)
Message-ID: <20180517201720.DE36588E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b872d829d092059ae8d5e86115d1515164d01a74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The existing patch 0001-Build-buildconfig-for-the-host.patch changes
the exim build system to use the host compiler to build the
"buildconfig" program instead of the cross-compiler.

However, it still uses $(LIBS) which lists the target libraries to
link with, which shouldn't be used. Since buildconfig doesn't use any
library beyond the C library, we can simply drop using $(LIBS).

This will fix build failures of exim on Fedora 28, where libnsl is no
longer provided by the C library, causing build failures such as:

/usr/bin/gcc buildconfig.c
/usr/bin/ld: cannot find -lnsl

Fixes:

  http://autobuild.buildroot.net/results/ac78fe18657558b3c12c03c08bf1081d7c06ca85/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/0001-Build-buildconfig-for-the-host.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
index a926fbdab3..87eb527974 100644
--- a/package/exim/0001-Build-buildconfig-for-the-host.patch
+++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
@@ -17,7 +17,7 @@ index 29a6ad3..420ba60 100644
 -	@echo "$(CC) buildconfig.c"
 -	$(FE)$(CC) $(CFLAGS) $(INCLUDE) -o buildconfig buildconfig.c $(LIBS)
 +	@echo "$(HOSTCC) buildconfig.c"
-+	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c $(LIBS)
++	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c
  
  
  # Target for the exicyclog utility script

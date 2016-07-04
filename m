From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:20:06 +0200
Subject: [Buildroot] [git commit] package/dvblast: requires NPTL
Message-ID: <20160704152244.87FAB81D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec875d9bf9b1830dbca2f2b1da9ac9646463dc1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dvblast uconditionally believes that any Linux system will have support
for clock nanosleep().

However, clock_nanosleep() is only availabe with NPTL.

Fixing dvblast is not really complicated, but not trivial either. So we
just make it depend on NPTL.

Fixes:
    http://autobuild.buildroot.org/?reason=dvblast-3.0
    http://autobuild.buildroot.org/results/dbe/dbe91dd6543b4b88fbf1e5b09d4997d2dc730747/
    http://autobuild.buildroot.org/results/32b/32bee5071f46b86de61db7f35a2cd04e270bc73c/
    [and many more...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvblast/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index 1ea8f93..b9c5c14 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -4,13 +4,13 @@ config BR2_PACKAGE_DVBLAST
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on !BR2_bfin  # libev
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	help
 	  DVBlast is a simple and powerful MPEG-2/TS demux and
 	  streaming application.
 
 	  http://www.videolan.org/projects/dvblast.html
 
-comment 'dvblast needs a toolchain w/ threads'
+comment 'dvblast needs a toolchain w/ NPTL'
 	depends on !BR2_bfin  # libev
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 22:10:45 +0100
Subject: [Buildroot] [git commit] package/radvd: drop dependency on flex
 runtime library
Message-ID: <20200320205745.87C0782B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6274868bd12d86a1e4d58f7a7a479ba76ff56532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Radvd has its own main(), and does not use yywrap() from libfl.so,
because scanner.l module contains noyywrap option. So, none of the
functions exported by libfl.so are used, and there's no need to have
the flex runtime on target.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/radvd/Config.in | 1 -
 package/radvd/radvd.mk  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index fa5a20c4c1..f1df0c3cb8 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_FLEX
 	help
 	  IPv6 Router Advertisement Daemon.
 
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 3358264f18..ba0c78bd1e 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -6,7 +6,7 @@
 
 RADVD_VERSION = 2.18
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
+RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf
 # We need to ignore <linux/if_arp.h>, because radvd already includes
 # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
 RADVD_CONF_ENV = \

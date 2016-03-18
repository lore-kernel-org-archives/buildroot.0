From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:10:39 +0100
Subject: [Buildroot] [git commit] openpgm: depends on sync2/sync4
Message-ID: <20160318211633.36861807ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56f015b3f5e3b03766a9de40af1e1c5b87d3b11d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dependency on BR2_TOOLCHAIN_HAS_SYNC_2/4 since it uses both
__sync_fetch_and_add_2() and __sync_fetch_and_add_4() atomic builtins.
Fixes:
http://autobuild.buildroot.net/results/8f2/8f2a3571611dc9414c23808e7615f87b677557dd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openpgm/Config.in | 6 ++++--
 package/zeromq/Config.in  | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index 94816d8..e37edfe 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENPGM
 	bool "openpgm"
-	# This toolchain lack required compiler intrinsics
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
@@ -15,4 +15,6 @@ config BR2_PACKAGE_OPENPGM
 	  https://github.com/steve-o/openpgm/
 
 comment "openpgm needs a toolchain w/ wchar, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index c780f25..aefdf48 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -29,7 +29,8 @@ if BR2_PACKAGE_ZEROMQ
 
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # openpgm
+	depends on BR2_TOOLCHAIN_HAS_SYNC_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)

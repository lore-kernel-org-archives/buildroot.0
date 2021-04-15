From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Apr 2021 22:27:47 +0200
Subject: [Buildroot] [git commit] package/Config.in: change postgresql
 condition
Message-ID: <20210415200613.2929683B85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=148e8c92b94aecb603f178746289e9f240ef763b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The condition around postgis was added to make a sort of submenu of the
postgresql extensions under postgresql itself. However, such a condition
should be on BR2_PACKAGE_POSTGRESQL, not on its suboption
BR2_PACKAGE_POSTGRESQL_FULL.

Change the condition in package/Config.in to BR2_PACKAGE_POSTGRESQL, and
move the BR2_PACKAGE_POSTGRESQL_FULL condition to
package/postgis/Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in         | 2 +-
 package/postgis/Config.in | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index c5014faba1..0d7cb0f446 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1407,7 +1407,7 @@ menu "Database"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
-if BR2_PACKAGE_POSTGRESQL_FULL
+if BR2_PACKAGE_POSTGRESQL
 	source "package/postgis/Config.in"
 endif
 	source "package/redis/Config.in"
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 12d8899a2b..d73ece17a6 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_POSTGIS
 	bool "postgis"
+	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on BR2_INSTALL_LIBSTDCPP # proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj

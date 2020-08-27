From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 22:24:53 +0200
Subject: [Buildroot] [git commit] package/netopeer2: bump version to 1.1.39
Message-ID: <20200902161636.96ED385EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c210fe93f8683f43cd4f1539ac6ea7d8f93b05d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-BUGFIX-take-DESTDIR-into-account-649.patch | 33 ---------
 ...pts-CHANGE-use-su-only-for-effective-root.patch | 79 ----------------------
 package/netopeer2/netopeer2.hash                   |  2 +-
 package/netopeer2/netopeer2.mk                     |  2 +-
 4 files changed, 2 insertions(+), 114 deletions(-)

diff --git a/package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch b/package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch
deleted file mode 100644
index bff4337fe7..0000000000
--- a/package/netopeer2/0001-build-BUGFIX-take-DESTDIR-into-account-649.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c6afffafd1e27054ff59b82ffed3a99795814631 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Mon, 8 Jun 2020 09:47:58 +0200
-Subject: [PATCH] build BUGFIX take DESTDIR into account (#649)
-
-When installing yang modules add DESTDIR prefix to the NP2_MODULE_DIR.
-
-Fixes #648
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-[patch taken from upstream:
-https://github.com/CESNET/netopeer2/commit/726b1384a3f93090ede1143da86c99d5d24d06c5]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- scripts/setup.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/setup.sh b/scripts/setup.sh
-index 7175bc4..81abf63 100755
---- a/scripts/setup.sh
-+++ b/scripts/setup.sh
-@@ -8,7 +8,7 @@ fi
- 
- # avoid problems with sudo path
- SYSREPOCTL=`su -c "which sysrepoctl" $USER`
--MODDIR=${NP2_MODULE_DIR}
-+MODDIR=${DESTDIR}${NP2_MODULE_DIR}
- PERMS=${NP2_MODULE_PERMS}
- OWNER=${NP2_MODULE_OWNER}
- GROUP=${NP2_MODULE_GROUP}
--- 
-2.20.1
-
diff --git a/package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch b/package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch
deleted file mode 100644
index b960a87beb..0000000000
--- a/package/netopeer2/0002-scripts-CHANGE-use-su-only-for-effective-root.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 71cc996faa5500b3bfd499ad0c436c8b96629ea7 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Wed, 10 Jun 2020 15:20:23 +0200
-Subject: [PATCH] scripts CHANGE use su only for effective root
-
-Fixes #645
-
-[patch taken from upstream:
-https://github.com/CESNET/netopeer2/commit/2161b333009c21ffc8501e5127b82e6f0570ca8e]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- scripts/merge_config.sh  |  8 ++++++--
- scripts/merge_hostkey.sh | 11 ++++++++---
- scripts/setup.sh         |  8 ++++++--
- 3 files changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/scripts/merge_config.sh b/scripts/merge_config.sh
-index dde0c75..4ad151c 100755
---- a/scripts/merge_config.sh
-+++ b/scripts/merge_config.sh
-@@ -2,8 +2,12 @@
- 
- set -e
- 
--# avoid problems with sudo path
--SYSREPOCFG=`su -c "which sysrepocfg" $USER`
-+# avoid problems with sudo PATH
-+if [ `id -u` -eq 0 ]; then
-+    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
-+else
-+    SYSREPOCFG=`which sysrepocfg`
-+fi
- KS_KEY_NAME=genkey
- 
- # check that there is no listen/Call Home configuration yet
-diff --git a/scripts/merge_hostkey.sh b/scripts/merge_hostkey.sh
-index 87947fa..a0677ee 100755
---- a/scripts/merge_hostkey.sh
-+++ b/scripts/merge_hostkey.sh
-@@ -2,9 +2,14 @@
- 
- set -e
- 
--# avoid problems with sudo path
--SYSREPOCFG=`su -c "which sysrepocfg" $USER`
--OPENSSL=`su -c "which openssl" $USER`
-+# avoid problems with sudo PATH
-+if [ `id -u` -eq 0 ]; then
-+    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
-+    OPENSSL=`su -c 'which openssl' -l $USER`
-+else
-+    SYSREPOCFG=`which sysrepocfg`
-+    OPENSSL=`which openssl`
-+fi
- 
- # check that there is no SSH key with this name yet
- KEYSTORE_KEY=`$SYSREPOCFG -X -x "/ietf-keystore:keystore/asymmetric-keys/asymmetric-key[name='genkey']/name"`
-diff --git a/scripts/setup.sh b/scripts/setup.sh
-index 81abf63..8bf6825 100755
---- a/scripts/setup.sh
-+++ b/scripts/setup.sh
-@@ -6,8 +6,12 @@ if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" -o -z "$NP2_MODULE_OWNER" -o
-     exit 1
- fi
- 
--# avoid problems with sudo path
--SYSREPOCTL=`su -c "which sysrepoctl" $USER`
-+# avoid problems with sudo PATH
-+if [ `id -u` -eq 0 ]; then
-+    SYSREPOCTL=`su -c 'which sysrepoctl' -l $USER`
-+else
-+    SYSREPOCTL=`which sysrepoctl`
-+fi
- MODDIR=${DESTDIR}${NP2_MODULE_DIR}
- PERMS=${NP2_MODULE_PERMS}
- OWNER=${NP2_MODULE_OWNER}
--- 
-2.20.1
-
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 93a094d563..1d5997505f 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66f3ad68cc6e41f3231b090ef27016ccbfe007cda7d08ec19f409f7429f46ff9  netopeer2-1.1.34.tar.gz
+sha256  e983683eda68792fedd73af54a5c7997496091489aa921f2a9e0dd27f2f6e19a  netopeer2-1.1.39.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 641666e8d3..5787d3a8cf 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 1.1.34
+NETOPEER2_VERSION = 1.1.39
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause

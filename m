From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Mar 2021 00:00:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/openldap: add
 upstream security fix for CVE-2021-27212
Message-ID: <20210309223952.B96D380E37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2b6d4c053936582167946627f8c886e6403e32b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

In OpenLDAP through 2.4.57 and 2.5.x through 2.5.1alpha, an assertion
failure in slapd can occur in the issuerAndThisUpdateCheck function via a
crafted packet, resulting in a denial of service (daemon exit) via a short
timestamp.  This is related to schema_init.c and checkTime.

For more details, see the bugtracker:
https://bugs.openldap.org/show_bug.cgi?id=9454

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2d6a0ea93e8adf53377b6c1ab06e07ce1ba4961a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...005-ITS-9454-fix-issuerAndThisUpdateCheck.patch | 26 ++++++++++++++++++++++
 package/openldap/openldap.mk                       |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch b/package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch
new file mode 100644
index 0000000000..a611b9ff59
--- /dev/null
+++ b/package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch
@@ -0,0 +1,26 @@
+From 9badb73425a67768c09bcaed1a9c26c684af6c30 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Sat, 6 Feb 2021 20:52:06 +0000
+Subject: [PATCH] ITS#9454 fix issuerAndThisUpdateCheck
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ servers/slapd/schema_init.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/servers/slapd/schema_init.c b/servers/slapd/schema_init.c
+index 31be1154e..8b1e25539 100644
+--- a/servers/slapd/schema_init.c
++++ b/servers/slapd/schema_init.c
+@@ -3900,6 +3900,8 @@ issuerAndThisUpdateCheck(
+ 					break;
+ 				}
+ 			}
++			if ( tu->bv_len < STRLENOF("YYYYmmddHHmmssZ") ) return LDAP_INVALID_SYNTAX;
++
+ 			x.bv_val += tu->bv_len + 1;
+ 			x.bv_len -= tu->bv_len + 1;
+ 
+-- 
+2.20.1
+
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index e361fc420c..02bf8a2df5 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -12,6 +12,9 @@ OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
+# 0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch
+OPENLDAP_IGNORE_CVES += CVE-2021-27212
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
 OPENLDAP_DEPENDENCIES += openssl

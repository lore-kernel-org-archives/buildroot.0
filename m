From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 14:02:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsync: fix CVE-2020-14387
Message-ID: <20210612120210.53537-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A flaw was found in rsync in versions since 3.2.0pre1. Rsync improperly
validates certificate with host mismatch vulnerability. A remote,
unauthenticated attacker could exploit the flaw by performing a
man-in-the-middle attack using a valid certificate for another hostname
which could compromise confidentiality and integrity of data transmitted
using rsync-ssl. The highest threat from this vulnerability is to data
confidentiality and integrity. This flaw affects rsync versions before
3.2.4.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-the-certificate-when-using-openssl.patch | 29 +++++++++++++++++++
 package/rsync/rsync.mk                        |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch

diff --git a/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch b/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
new file mode 100644
index 0000000000..13edeff944
--- /dev/null
+++ b/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
@@ -0,0 +1,29 @@
+From c3f7414c450faaf6a8281cc4a4403529aeb7d859 Mon Sep 17 00:00:00 2001
+From: Matt McCutchen <matt@mattmccutchen.net>
+Date: Wed, 26 Aug 2020 12:16:08 -0400
+Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
+ openssl.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://git.samba.org/?p=rsync.git;a=commitdiff;h=c3f7414c450faaf6a8281cc4a4403529aeb7d859]
+---
+ rsync-ssl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsync-ssl b/rsync-ssl
+index 8101975a..46701af1 100755
+--- a/rsync-ssl
++++ b/rsync-ssl
+@@ -129,7 +129,7 @@ function rsync_ssl_helper {
+     fi
+ 
+     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
+-	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
++	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
+     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
+ 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
+     else
+-- 
+2.25.1
+
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3ebf3a6883..32e5827739 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -20,6 +20,8 @@ RSYNC_CONF_OPTS = \
 	--disable-lz4 \
 	--disable-asm
 
+RSYNC_IGNORE_CVES += CVE-2020-14387
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
 else
-- 
2.30.2

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Feb 2011 23:37:36 +0100
Subject: [Buildroot] [git commit master 1/1] openssl: fix libdir issue
Message-ID: <20110223224020.1E00A8F626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d17c1652808829bfc354683854c7170b90f7f127
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3205

OpenSSL's build system tries to be too wise for it's own good when
guessing what libdir should be.
This causes problems like the one reported in bug #3205 so just specify
libdir to point to /lib (since it's prefixed it would finally be
/usr/lib) since it should be present on 32 and 64 bit targets.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/openssl/openssl.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 925ef5d..757754e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,6 +25,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#3205: Failing chmod when running "make" in buildroot (openssl)...
 	#3283: See why nfs-utils needs fakeroot, and convert to autotools
 
 2011.02-rc1, Released February 14th, 2011:
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index bf924cb..7bf347a 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -47,6 +47,7 @@ define OPENSSL_CONFIGURE_CMDS
 			linux-$(OPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
+			--libdir=/lib \
 			threads \
 			shared \
 			no-idea \
-- 
1.7.3.4

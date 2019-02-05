From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 05:47:52 -0600
Subject: [Buildroot] [PATCH v2] package/softether: bump to v4.28-9669-beta
Message-ID: <1549367272-15431-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Source code is now compatible with OpenSSL 1.1.x.

Fixes
http://autobuild.buildroot.net/results/a6f/a6f1f326ce2525ee0f9d423f1b6d989a89e6b87e/build-end.log

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
 - Added patch to fix RSA key size needing to be larger then 32bits for new openssl
 - Tested both host and target build
---
 .../0003-use-fhs-install-directories.patch         | 19 ++----
 ...-default-RSA-key-size-to-1024-everywhere-.patch | 78 ++++++++++++++++++++++
 package/softether/softether.hash                   |  4 +-
 package/softether/softether.mk                     |  4 +-
 4 files changed, 86 insertions(+), 19 deletions(-)
 create mode 100644 package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch

diff --git a/package/softether/0003-use-fhs-install-directories.patch b/package/softether/0003-use-fhs-install-directories.patch
index c489cc1..ba00d9b 100644
--- a/package/softether/0003-use-fhs-install-directories.patch
+++ b/package/softether/0003-use-fhs-install-directories.patch
@@ -15,20 +15,22 @@ https://github.com/dajhorn/SoftEtherVPN/commit/b9420c3bfc2a8b9d35d0c8e5f6849007c
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+[Updated for 4.28 build 9669 beta - src/Mayaqua/Encrypt.c dropped IsXRevoked()
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 ---
  autotools/softether.am      |  1 +
  src/Cedar/Admin.c           |  2 +-
  src/Cedar/Command.c         |  6 +++++-
  src/Cedar/Logging.c         |  2 +-
  src/Cedar/Server.c          |  4 ++--
- src/Mayaqua/Encrypt.c       |  2 +-
  src/Mayaqua/FileIO.c        | 39 ++++++++++++++++++++++++++++++++++++---
  src/Mayaqua/FileIO.h        |  2 ++
  src/Mayaqua/Mayaqua.c       |  4 ++++
  src/Mayaqua/Table.c         |  6 +++++-
  src/Mayaqua/Unix.c          |  6 +++---
  src/bin/hamcore/Makefile.am |  8 ++++++--
- 12 files changed, 67 insertions(+), 15 deletions(-)
+ 11 files changed, 66 insertions(+), 14 deletions(-)
 
 Index: b/autotools/softether.am
 ===================================================================
@@ -115,19 +117,6 @@ Index: b/src/Cedar/Server.c
  	Format(dir_full_path, sizeof(dir_full_path), "%s/%s", exe_dir, dirname);
  
  	dir = EnumDir(dir_full_path);
-Index: b/src/Mayaqua/Encrypt.c
-===================================================================
---- a/src/Mayaqua/Encrypt.c
-+++ b/src/Mayaqua/Encrypt.c
-@@ -579,7 +579,7 @@
- 		return false;
- 	}
- 
--	GetExeDir(dirname, sizeof(dirname));
-+	GetStateDir(dirname, sizeof(dirname));
- 
- 	// Search the CRL file
- 	t = EnumDir(dirname);
 Index: b/src/Mayaqua/FileIO.c
 ===================================================================
 --- a/src/Mayaqua/FileIO.c
diff --git a/package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch b/package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch
new file mode 100644
index 0000000..20a1f06
--- /dev/null
+++ b/package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch
@@ -0,0 +1,78 @@
+From 1fad008e1adba5cb596da6f9ec6a244d49a585cf Mon Sep 17 00:00:00 2001
+From: Davide Beatrici <davidebeatrici@gmail.com>
+Date: Mon, 9 Apr 2018 22:02:34 +0200
+Subject: [PATCH] Encrypt: set default RSA key size to 1024 everywhere, using
+ the RSA_KEY_SIZE macro
+
+This commit also fixes the problem described in #31, which was caused by the test key generated in RsaCheck() being too small for newer OpenSSL versions.
+
+Failure looks like
+-- Alert: RsaCheck() --
+OpenSSL Library Init Failed. (too old?)
+Please install the latest version of OpenSSL.
+
+Upstream: https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/commit/1fad008e1adba5cb596da6f9ec6a244d49a585cf
+(Currently still on an active pull request https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/pull/1)
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/Mayaqua/Encrypt.c | 8 ++++----
+ src/Mayaqua/Encrypt.h | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/Mayaqua/Encrypt.c b/src/Mayaqua/Encrypt.c
+index 381d1c5..a557052 100644
+--- a/src/Mayaqua/Encrypt.c
++++ b/src/Mayaqua/Encrypt.c
+@@ -2194,7 +2194,7 @@ bool RsaVerifyEx(void *data, UINT data_size, void *sign, K *k, UINT bits)
+ 	}
+ 	if (bits == 0)
+ 	{
+-		bits = 1024;
++		bits = RSA_KEY_SIZE;
+ 	}
+ 
+ 	// Hash the data
+@@ -2233,7 +2233,7 @@ bool RsaSignEx(void *dst, void *src, UINT size, K *k, UINT bits)
+ 	}
+ 	if (bits == 0)
+ 	{
+-		bits = 1024;
++		bits = RSA_KEY_SIZE;
+ 	}
+ 
+ 	Zero(dst, bits / 8);
+@@ -2302,7 +2302,7 @@ bool RsaCheck()
+ 	BIO *bio;
+ 	char errbuf[MAX_SIZE];
+ 	UINT size = 0;
+-	UINT bit = 32;
++	UINT bit = RSA_KEY_SIZE;
+ 	// Validate arguments
+ 
+ 	// Key generation
+@@ -2372,7 +2372,7 @@ bool RsaGen(K **priv, K **pub, UINT bit)
+ 	}
+ 	if (bit == 0)
+ 	{
+-		bit = 1024;
++		bit = RSA_KEY_SIZE;
+ 	}
+ 
+ 	// Key generation
+diff --git a/src/Mayaqua/Encrypt.h b/src/Mayaqua/Encrypt.h
+index d795d2d..0c48161 100644
+--- a/src/Mayaqua/Encrypt.h
++++ b/src/Mayaqua/Encrypt.h
+@@ -128,7 +128,7 @@ void RAND_Free_For_SoftEther();
+ #define	DES_IV_SIZE					8			// DES IV size
+ #define DES_BLOCK_SIZE				8			// DES block size
+ #define DES3_KEY_SIZE				(8 * 3)		// 3DES key size
+-#define RSA_KEY_SIZE				128			// RSA key size
++#define RSA_KEY_SIZE				1024		// RSA key size
+ #define DH_KEY_SIZE					128			// DH key size
+ #define	RSA_MIN_SIGN_HASH_SIZE		(15 + SHA1_HASH_SIZE)	// Minimum RSA hash size
+ #define	RSA_SIGN_HASH_SIZE			(RSA_MIN_SIGN_HASH_SIZE)	// RSA hash size
+-- 
+1.9.1
+
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index ec6e060..fdbbbca 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8e6310d36e579ea07171ce5fcb9ebe31235d218444c4e4836ca6c32aa49c1f93 softether-v4.22-9634-beta.tar.gz
-sha256 7aeb873293fa0e44425dabf68a8e46e26c848fe58efcfd3ac7c90a3386f3edd1 LICENSE
+sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-v4.28-9669-beta.tar.gz
+sha256 0a889e7e7a277397d0a2d56c37814eefd8c6b6129d8b74ee2d27fc3415fad561 LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 05d2f20..31378e8 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = v4.22-9634-beta
-SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
+SOFTETHER_VERSION = v4.28-9669-beta
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-softether libopenssl readline
-- 
1.9.1

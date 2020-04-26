From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Apr 2020 00:33:21 +0200
Subject: [Buildroot] [PATCH 2/6] package/crda: replace pycrypto by
 pycryptodomex
In-Reply-To: <20200426223325.1468127-1-romain.naour@gmail.com>
References: <20200426223325.1468127-1-romain.naour@gmail.com>
Message-ID: <20200426223325.1468127-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:
"PyCryptodome is a fork of PyCrypto, which is not maintained any more
(the last release dates back to 2013 [2]). It exposes almost the same
API, but there are a few incompatibilities [3]."

[1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
[2] https://pypi.org/project/pycrypto/#history
[3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html

Update the patch 0001-crda-support-python-3-in-utils-key2pub.py.patch
since it add pycrypto.

From [4]
"CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
("cfg80211: support loading regulatory database as firmware file") added
support to use the kernel's firmware request API which looks for the
firmware on /lib/firmware. Because of this CRDA is legacy software for
older kernels. It will continue to be maintained."

[4] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tree/README?id=9856751feaf7b102547cea678a5da6c94252d83d#n8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 ...support-python-3-in-utils-key2pub.py.patch | 32 ++++++++++++-------
 package/crda/crda.mk                          |  2 +-
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
index fb46d58ed2..f2b9cca2d6 100644
--- a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
+++ b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
@@ -1,11 +1,11 @@
-From 4c346aa9e816bddfedc8ac99809fd1ed91bfc8ee Mon Sep 17 00:00:00 2001
+From 8228c484a1533ff904b276c342adcb6310abe272 Mon Sep 17 00:00:00 2001
 From: Taahir Ahmed <ahmed.taahir@gmail.com>
 Date: Wed, 30 Mar 2016 11:23:54 -0300
 Subject: [PATCH] crda: support python 3 in utils/key2pub.py
 
 utils/key2pub.py can now be run under either python 2.7 or python 3.x.
 This required some minor syntactical changes as well as switching from
-M2Crypto to pycrypto, since M2Crypto doesn't support python 3.x.
+M2Crypto to pycryptodomex, since M2Crypto doesn't support python 3.x.
 
 In addition, some errors in the generated source file keys-ssl.h are
 fixed:
@@ -17,12 +17,22 @@ fixed:
 
 [Gustavo: don't call /utils/key2pub.py since that doesn't compute]
 
+Use pycryptodomex insdead of pycrypto
+
+From [1]:
+"PyCryptodome is a fork of PyCrypto, which is not maintained any more
+(the last release dates back to 2013 [2]). It exposes almost the same
+API, but there are a few incompatibilities [3]."
+
+[1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
+[2] https://pypi.org/project/pycrypto/#history
+[3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Rebased against crda-4.14]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
-Status: submitted upstream by author but not (yet) accepted
-URL: http://www.spinics.net/lists/linux-wireless/msg138936.html
+[Romain: Use pycryptodomex]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  Makefile         |   2 +-
  utils/key2pub.py | 146 ++++++++++++++++++++++++-----------------------
@@ -42,7 +52,7 @@ index a3ead30..8da38d0 100644
  $(LIBREG): regdb.h reglib.h reglib.c
  	$(NQ) '  CC  ' $@
 diff --git a/utils/key2pub.py b/utils/key2pub.py
-index 9bb04cd..9f92ebd 100755
+index 9bb04cd..8a0ba2a 100755
 --- a/utils/key2pub.py
 +++ b/utils/key2pub.py
 @@ -1,126 +1,128 @@
@@ -57,11 +67,11 @@ index 9bb04cd..9f92ebd 100755
 -       sys.stderr.write('Please install the "M2Crypto" Python module.\n')
 -       sys.stderr.write('On Debian GNU/Linux the package is called "python-m2crypto".\n')
 -       sys.exit(1)
-+    from Crypto.PublicKey import RSA
++    from Cryptodome.PublicKey import RSA
 +except ImportError as e:
-+    sys.stderr.write('ERROR: Failed to import the "Crypto.PublicKey" module: %s\n' % e.message)
-+    sys.stderr.write('Please install the "Crypto.PublicKey" Python module.\n')
-+    sys.stderr.write('On Debian GNU/Linux the package is called "python-crypto".\n')
++    sys.stderr.write('ERROR: Failed to import the "Cryptodome.PublicKey" module: %s\n' % e.message)
++    sys.stderr.write('Please install the "Cryptodome.PublicKey" Python module.\n')
++    sys.stderr.write('On Debian GNU/Linux the package is called "python-cryptodomex".\n')
 +    sys.exit(1)
 +
 +def bitwise_collect(value, radix_bits):
@@ -269,5 +279,5 @@ index 9bb04cd..9f92ebd 100755
  
  modes[mode][1](output, idx - 1)
 -- 
-2.18.0
+2.25.3
 
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index eb43a7d772..c5880797be 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -6,7 +6,7 @@
 
 CRDA_VERSION = 4.14
 CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot
-CRDA_DEPENDENCIES = host-pkgconf host-python-pycrypto libnl libgcrypt
+CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
 
-- 
2.25.3

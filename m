From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Apr 2020 00:33:22 +0200
Subject: [Buildroot] [PATCH 3/6] boot/optee-os: replace pycrypto by
 pycryptodomex
In-Reply-To: <20200426223325.1468127-1-romain.naour@gmail.com>
References: <20200426223325.1468127-1-romain.naour@gmail.com>
Message-ID: <20200426223325.1468127-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1] included in optee-os release 3.7.0:
"PyCryptodome is a fork of PyCrypto, which is not maintained any more
(the last release dates back to 2013 [2]). It exposes almost the same
API, but there are a few incompatibilities [3]."

pem_to_pub_c.py/sign.py scripts still use pycrypto that is replaced
by pycryptodomex. Add a patch to use pycryptodomex but don't use
upstream commit since it also switches from the algorithm
TEE_ALG_RSASSA_PKCS1_V1_5_SHA256 to TEE_ALG_RSASSA_PKCS1_PSS_MGF1_SHA256
when replacing pycrypto to pycryptodomex [4].

[1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
[2] https://pypi.org/project/pycrypto/#history
[3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html
[4] https://github.com/OP-TEE/optee_os/commit/ababd72d2fd76cb2ded8e202b49db28d6545f6eb

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/526035730

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
For master and 2020.02.x.
---
 ...o_pub_c.py-sign.py-use-pycryptodomex.patch | 64 +++++++++++++++++++
 boot/optee-os/optee-os.mk                     |  2 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch

diff --git a/boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch b/boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch
new file mode 100644
index 0000000000..1ce960e0e3
--- /dev/null
+++ b/boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch
@@ -0,0 +1,64 @@
+From 06e71feaeb08349abe56b50c3dfb08a8341cf55f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 26 Apr 2020 21:55:55 +0200
+Subject: [PATCH] scripts/pem_to_pub_c.py/sign.py: use pycryptodomex
+
+These scripts still use pycrypto.
+
+From [1]:
+"PyCryptodome is a fork of PyCrypto, which is not maintained any more
+(the last release dates back to 2013 [2]). It exposes almost the same
+API, but there are a few incompatibilities [3]."
+
+Don't use upstream commit since it also switches from the algorithm
+TEE_ALG_RSASSA_PKCS1_V1_5_SHA256 to TEE_ALG_RSASSA_PKCS1_PSS_MGF1_SHA256
+when replacing pycrypto to pycryptodomex [4].
+
+[1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
+[2] https://pypi.org/project/pycrypto/#history
+[3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html
+[4] https://github.com/OP-TEE/optee_os/commit/ababd72d2fd76cb2ded8e202b49db28d6545f6eb
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ scripts/pem_to_pub_c.py | 4 ++--
+ scripts/sign.py         | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/scripts/pem_to_pub_c.py b/scripts/pem_to_pub_c.py
+index 3a896a39..d3f0e500 100755
+--- a/scripts/pem_to_pub_c.py
++++ b/scripts/pem_to_pub_c.py
+@@ -21,8 +21,8 @@ def get_args():
+ 
+ def main():
+     import array
+-    from Crypto.PublicKey import RSA
+-    from Crypto.Util.number import long_to_bytes
++    from Cryptodome.PublicKey import RSA
++    from Cryptodome.Util.number import long_to_bytes
+ 
+     args = get_args()
+ 
+diff --git a/scripts/sign.py b/scripts/sign.py
+index 2939c591..80ce2e9f 100755
+--- a/scripts/sign.py
++++ b/scripts/sign.py
+@@ -121,10 +121,10 @@ def get_args(logger):
+ 
+ 
+ def main():
+-    from Crypto.Signature import PKCS1_v1_5
+-    from Crypto.Hash import SHA256
+-    from Crypto.PublicKey import RSA
+-    from Crypto.Util.number import ceil_div
++    from Cryptodome.Signature import PKCS1_v1_5
++    from Cryptodome.Hash import SHA256
++    from Cryptodome.PublicKey import RSA
++    from Cryptodome.Util.number import ceil_div
+     import base64
+     import logging
+     import os
+-- 
+2.25.3
+
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index acdb25b479..c6d1bbd48a 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -21,7 +21,7 @@ else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
-OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto host-python-pyelftools
+OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycryptodomex host-python-pyelftools
 
 # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
 # can be built in 64bit mode and support 32bit and 64bit
-- 
2.25.3

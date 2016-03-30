From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 12:39:19 -0300
Subject: [Buildroot] [PATCH 3/4] crda: enable host-python3 build support
In-Reply-To: <1459352360-12927-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459352360-12927-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459352360-12927-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream-submitted (but not accepted) patch in order to allow
crda to be built with python2 as well as python3.
This drops m2crypto usage (python2-only) in favour of pycrypto which can
be built against both major versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...file-allow-to-override-python-interpreter.patch |  34 ---
 ...crda-support-python-3-in-utils-key2pub.py.patch | 271 +++++++++++++++++++++
 package/crda/crda.mk                               |   9 +-
 3 files changed, 272 insertions(+), 42 deletions(-)
 delete mode 100644 package/crda/0001-Makefile-allow-to-override-python-interpreter.patch
 create mode 100644 package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch

diff --git a/package/crda/0001-Makefile-allow-to-override-python-interpreter.patch b/package/crda/0001-Makefile-allow-to-override-python-interpreter.patch
deleted file mode 100644
index 2481390..0000000
--- a/package/crda/0001-Makefile-allow-to-override-python-interpreter.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6831024a247fd89c7f7adcbee8a0be991b3caaf4 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 2 Mar 2014 23:45:44 +0100
-Subject: [PATCH] Makefile: allow to override python interpreter
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 1d34bde..d7134ff 100644
---- a/Makefile
-+++ b/Makefile
-@@ -42,6 +42,7 @@ LDLIBS += -lgcrypt
- reglib.o: keys-gcrypt.c
- 
- endif
-+PYTHON ?= python2
- MKDIR ?= mkdir -p
- INSTALL ?= install
- 
-@@ -103,7 +104,7 @@ $(REG_BIN):
- keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/*.pem)
- 	$(NQ) '  GEN ' $@
- 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
--	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
-+	$(Q)$(PYTHON) ./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
- 
- %.o: %.c regdb.h reglib.h
- 	$(NQ) '  CC  ' $@
--- 
-1.9.0
-
diff --git a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
new file mode 100644
index 0000000..99eb11c
--- /dev/null
+++ b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
@@ -0,0 +1,271 @@
+From 797f2836c48f9ba2446629ae4b6867ca1a5ea512 Mon Sep 17 00:00:00 2001
+From: Taahir Ahmed <ahmed.taahir@gmail.com>
+Date: Wed, 30 Mar 2016 11:23:54 -0300
+Subject: [PATCH 1/2] crda: support python 3 in utils/key2pub.py
+
+utils/key2pub.py can now be run under either python 2.7 or python 3.x.
+This required some minor syntactical changes as well as switching from
+M2Crypto to pycrypto, since M2Crypto doesn't support python 3.x.
+
+In addition, some errors in the generated source file keys-ssl.h are
+fixed:
+
+  * The correct OpenSSL header for BN_ULONG is included.
+
+  * The generated constants are given the 'ull' suffix to prevent
+    warnings about constants that are too large.
+
+[Gustavo: don't call /utils/key2pub.py since that doesn't compute]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: submitted upstream by author but not (yet) accepted
+URL: http://www.spinics.net/lists/linux-wireless/msg138936.html
+
+ Makefile         |   2 +-
+ utils/key2pub.py | 146 ++++++++++++++++++++++++++++---------------------------
+ 2 files changed, 75 insertions(+), 73 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1f25509..523a96e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -112,7 +112,7 @@ $(REG_BIN):
+ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/*.pem)
+ 	$(NQ) '  GEN ' $@
+ 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
+-	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
++	$(Q) python utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
+ 
+ $(LIBREG): regdb.h reglib.h reglib.c
+ 	$(NQ) '  CC  ' $@
+diff --git a/utils/key2pub.py b/utils/key2pub.py
+index 3e84cd2..c76cbbb 100755
+--- a/utils/key2pub.py
++++ b/utils/key2pub.py
+@@ -1,126 +1,128 @@
+ #!/usr/bin/env python
+ 
++import io
+ import sys
+ try:
+-       from M2Crypto import RSA
+-except ImportError, e:
+-       sys.stderr.write('ERROR: Failed to import the "M2Crypto" module: %s\n' % e.message)
+-       sys.stderr.write('Please install the "M2Crypto" Python module.\n')
+-       sys.stderr.write('On Debian GNU/Linux the package is called "python-m2crypto".\n')
+-       sys.exit(1)
++    from Crypto.PublicKey import RSA
++except ImportError as e:
++    sys.stderr.write('ERROR: Failed to import the "Crypto.PublicKey" module: %s\n' % e.message)
++    sys.stderr.write('Please install the "Crypto.PublicKey" Python module.\n')
++    sys.stderr.write('On Debian GNU/Linux the package is called "python-crypto".\n')
++    sys.exit(1)
++
++def bitwise_collect(value, radix_bits):
++    words = []
++    radix_mask = (1 << radix_bits) - 1
++    while value != 0:
++        words.append(value & radix_mask)
++        value >>= radix_bits
++    return words
+ 
+ def print_ssl_64(output, name, val):
+-    while val[0] == '\0':
+-        val = val[1:]
+-    while len(val) % 8:
+-        val = '\0' + val
+-    vnew = []
+-    while len(val):
+-        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7]))
+-        val = val[8:]
+-    vnew.reverse()
+-    output.write('static BN_ULONG %s[%d] = {\n' % (name, len(vnew)))
++    # OpenSSL expects 64-bit words given least-significant-word first.
++    vwords = bitwise_collect(val, 64)
++
++    output.write(u'static BN_ULONG {}[] = {{\n'.format(name))
+     idx = 0
+-    for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
++    for vword in vwords:
+         if not idx:
+-            output.write('\t')
+-        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2x, ' % (ord(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
++            output.write(u'\t')
++        output.write(u'0x{:016x}ULL, '.format(vword))
+         idx += 1
+         if idx == 2:
+             idx = 0
+-            output.write('\n')
++            output.write(u'\n')
+     if idx:
+-        output.write('\n')
+-    output.write('};\n\n')
++        output.write(u'\n')
++    output.write(u'};\n\n')
+ 
+ def print_ssl_32(output, name, val):
+-    while val[0] == '\0':
+-        val = val[1:]
+-    while len(val) % 4:
+-        val = '\0' + val
+-    vnew = []
+-    while len(val):
+-        vnew.append((val[0], val[1], val[2], val[3], ))
+-        val = val[4:]
+-    vnew.reverse()
+-    output.write('static BN_ULONG %s[%d] = {\n' % (name, len(vnew)))
++    # OpenSSL expects 32-bit words given least-significant-word first.
++    vwords = bitwise_collect(val, 32)
++
++    output.write(u'static BN_ULONG {}[] = {{\n'.format(name))
+     idx = 0
+-    for v1, v2, v3, v4 in vnew:
++    for vword in vwords:
+         if not idx:
+-            output.write('\t')
+-        output.write('0x%.2x%.2x%.2x%.2x, ' % (ord(v1), ord(v2), ord(v3), ord(v4)))
++            output.write(u'\t')
++        output.write(u'0x{:08x}, '.format(vword))
+         idx += 1
+         if idx == 4:
+             idx = 0
+-            output.write('\n')
++            output.write(u'\n')
+     if idx:
+-        output.write('\n')
+-    output.write('};\n\n')
++        output.write(u'\n')
++    output.write(u'};\n\n')
+ 
+ def print_ssl(output, name, val):
++
++    output.write(u'#include <stdint.h>\n')
++    output.write(u'#include <openssl/bn.h>\n')
++
+     import struct
+-    output.write('#include <stdint.h>\n')
+     if len(struct.pack('@L', 0)) == 8:
+         return print_ssl_64(output, name, val)
+     else:
+         return print_ssl_32(output, name, val)
+ 
+ def print_ssl_keys(output, n):
+-    output.write(r'''
++    output.write(u'''
+ struct pubkey {
+ 	struct bignum_st e, n;
+ };
+ 
+-#define KEY(data) {				\
+-	.d = data,				\
+-	.top = sizeof(data)/sizeof(data[0]),	\
++#define KEY(data) {                          \\
++	.d = data,                           \\
++	.top = sizeof(data)/sizeof(data[0]), \\
+ }
+ 
+-#define KEYS(e,n)	{ KEY(e), KEY(n), }
++#define KEYS(e,n)    { KEY(e), KEY(n), }
+ 
+ static struct pubkey keys[] = {
+ ''')
+     for n in xrange(n + 1):
+-        output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
+-    output.write('};\n')
++        output.write(u'	KEYS(e_{0}, n_{0}),\n'.format(n))
++    output.write(u'};\n')
+     pass
+ 
+ def print_gcrypt(output, name, val):
+-    output.write('#include <stdint.h>\n')
+-    while val[0] == '\0':
+-        val = val[1:]
+-    output.write('static const uint8_t %s[%d] = {\n' % (name, len(val)))
++    # gcrypt expects 8-bit words most-significant-word first
++    vwords = bitwise_collect(val, 8)
++    vwords.reverse()
++
++    output.write(u'#include <stdint.h>\n')
++    output.write(u'static const uint8_t %s[%d] = {\n' % (name, len(vwords)))
+     idx = 0
+-    for v in val:
++    for vword in vwords:
+         if not idx:
+-            output.write('\t')
+-        output.write('0x%.2x, ' % ord(v))
++            output.write(u'\t')
++        output.write(u'0x{:02x}, '.format(vword))
+         idx += 1
+         if idx == 8:
+             idx = 0
+-            output.write('\n')
++            output.write(u'\n')
+     if idx:
+-        output.write('\n')
+-    output.write('};\n\n')
++        output.write(u'\n')
++    output.write(u'};\n\n')
+ 
+ def print_gcrypt_keys(output, n):
+-    output.write(r'''
++    output.write(u'''
+ struct key_params {
+ 	const uint8_t *e, *n;
+ 	uint32_t len_e, len_n;
+ };
+ 
+-#define KEYS(_e, _n) {			\
+-	.e = _e, .len_e = sizeof(_e),	\
+-	.n = _n, .len_n = sizeof(_n),	\
++#define KEYS(_e, _n) {                \\
++	.e = _e, .len_e = sizeof(_e), \\
++	.n = _n, .len_n = sizeof(_n), \\
+ }
+ 
+ static const struct key_params keys[] = {
+ ''')
+-    for n in xrange(n + 1):
+-        output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
+-    output.write('};\n')
+-    
++    for n in range(n + 1):
++        output.write(u'	KEYS(e_{0}, n_{0}),\n'.format(n))
++    output.write(u'};\n')
++
+ 
+ modes = {
+     '--ssl': (print_ssl, print_ssl_keys),
+@@ -135,21 +137,21 @@ except IndexError:
+     mode = None
+ 
+ if not mode in modes:
+-    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0], '|'.join(modes.keys()))
++    print('Usage: {} [{}] input-file... output-file'.format(sys.argv[0], '|'.join(modes.keys())))
+     sys.exit(2)
+ 
+-output = open(outfile, 'w')
++output = io.open(outfile, 'w')
+ 
+ # load key
+ idx = 0
+ for f in files:
+-    try:
+-        key = RSA.load_pub_key(f)
+-    except RSA.RSAError:
+-        key = RSA.load_key(f)
+ 
+-    modes[mode][0](output, 'e_%d' % idx, key.e[4:])
+-    modes[mode][0](output, 'n_%d' % idx, key.n[4:])
++    key_contents = io.open(f, 'rb').read()
++    key = RSA.importKey(key_contents)
++
++    modes[mode][0](output, 'e_{}'.format(idx), key.e)
++    modes[mode][0](output, 'n_{}'.format(idx), key.n)
++
+     idx += 1
+ 
+ modes[mode][1](output, idx - 1)
+-- 
+2.7.3
+
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 24bfd5f..df879f6 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -7,19 +7,12 @@
 CRDA_VERSION = 3.18
 CRDA_SOURCE = crda-$(CRDA_VERSION).tar.xz
 CRDA_SITE = $(BR2_KERNEL_MIRROR)/software/network/crda
-CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
-	libnl libgcrypt host-python
+CRDA_DEPENDENCIES = host-pkgconf host-python-pycrypto libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
 
-# * key2pub.py currently is not python3 compliant (though python2/python3
-#   compliance could rather easily be achieved.
-# * key2pub.py uses M2Crypto python module, which is only available for
-#   python2, so we have to make sure this script is run using the python2
-#   interpreter, hence the host-python dependency and the PYTHON variable.
 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) all_noverify -C $(@D)
 endef
 
-- 
2.7.3

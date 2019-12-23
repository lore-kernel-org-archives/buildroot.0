From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:51:00 +0100
Subject: [Buildroot] [git commit] package/libtomcrypt: add security patch
 for CVE-2019-17362
Message-ID: <20191223194200.8CF688295D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62b34ed33ba4f2ee17046aa4d38a13840597f636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2019-17362:
"The der_decode_utf8_string function (in der_decode_utf8_string.c) does not
properly detect certain invalid UTF-8 sequences.  This allows
context-dependent attackers to cause a denial of service (out-of-bounds read
and crash) or read information from other memory locations via carefully
crafted DER-encoded data."

Details:
https://github.com/libtom/libtomcrypt/issues/507
https://nvd.nist.gov/vuln/detail/CVE-2019-17362

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
new file mode 100644
index 0000000000..91e2145853
--- /dev/null
+++ b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
@@ -0,0 +1,29 @@
+From 25c26a3b7a9ad8192ccc923e15cf62bf0108ef94 Mon Sep 17 00:00:00 2001
+From: werew <werew@ret2libc.com>
+Date: Thu, 3 Oct 2019 19:57:10 +0200
+Subject: [PATCH] Fixes #507
+
+Fix a vulnerability in der_decode_utf8_string as specified here:
+https://github.com/libtom/libtomcrypt/issues/507
+
+[for import into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+
+---
+ src/pk/asn1/der/utf8/der_decode_utf8_string.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pk/asn1/der/utf8/der_decode_utf8_string.c b/src/pk/asn1/der/utf8/der_decode_utf8_string.c
+index 94555b99f..d3ed82bea 100644
+--- a/src/pk/asn1/der/utf8/der_decode_utf8_string.c
++++ b/src/pk/asn1/der/utf8/der_decode_utf8_string.c
+@@ -65,7 +65,7 @@ int der_decode_utf8_string(const unsigned char *in,  unsigned long inlen,
+       /* count number of bytes */
+       for (z = 0; (tmp & 0x80) && (z <= 4); z++, tmp = (tmp << 1) & 0xFF);
+ 
+-      if (z > 4 || (x + (z - 1) > inlen)) {
++      if (z == 1 || z > 4 || (x + (z - 1) > inlen)) {
+          return CRYPT_INVALID_PACKET;
+       }
+ 

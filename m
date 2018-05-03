From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  3 May 2018 13:46:59 +0200
Subject: [Buildroot] [PATCH] dropbear: Fix host key loading with 521 bit
 ecdsa keys
Message-ID: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dropbear 2018.76 changed the default ecdsa host key size form 521 to 256
bits, but this breaks systems with an existing 521 bit key, blocking ssh
logins.

Apply the upstream fix from https://secure.ucc.asn.au/hg/dropbear/rev/0dc3103a5900 :

  Only advertise a single server ecdsa key when -R (generate as required) is
  specified. Fixes -R now that default ecdsa key size has changed.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/dropbear/dropbear.hash | 3 +++
 package/dropbear/dropbear.mk   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index ef2011d907..ba42d6bd0c 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
 sha256 f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65 dropbear-2018.76.tar.bz2
+
+# Locally calculated
+sha256 d4a63567465f2bae9fd5e575e022587f832647fb41b023513ac880c4eb647fdd 0dc3103a5900
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 1da1a559a3..6bfc05fb2b 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,6 +7,7 @@
 DROPBEAR_VERSION = 2018.76
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
+DROPBEAR_PATCH = https://secure.ucc.asn.au/hg/dropbear/raw-rev/0dc3103a5900
 DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
-- 
2.17.0

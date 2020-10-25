From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 15:39:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: security bump to
 version 2.3.4
Message-ID: <20201025143912.1273561-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-14382: A vulnerability was found in upstream release
cryptsetup-2.2.0 where, there's a bug in LUKS2 format validation code,
that is effectively invoked on every device/image presenting itself as
LUKS2 container. The bug is in segments validation code in file
'lib/luks2/luks2_json_metadata.c' in function
hdr_validate_segments(struct crypt_device *cd, json_object *hdr_jobj)
where the code does not check for possible overflow on memory allocation
used for intervals array (see statement "intervals = malloc(first_backup
* sizeof(*intervals));"). Due to the bug, library can be *tricked* to
expect such allocation was successful but for far less memory then
originally expected. Later it may read data FROM image crafted by an
attacker and actually write such data BEYOND allocated memory.

https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.4-ReleaseNotes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index c47d701baa..3b58345611 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/sha256sums.asc
-sha256  3bca4ffe39e2f94cef50f6ea65acb873a6dbce5db34fc6bcefe38b6d095e82df  cryptsetup-2.3.3.tar.xz
+sha256  9d16eebb96b53b514778e813019b8dd15fea9fec5aafde9fae5febf59df83773  cryptsetup-2.3.4.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 68cc1543dc..a2abf776cc 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.3
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c libargon2 \
-- 
2.28.0

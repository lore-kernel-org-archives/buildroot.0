From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 22 Jun 2019 20:46:14 -0600
Subject: [Buildroot] [PATCH 1/1] package/efivar: bump version to 37
Message-ID: <20190623024614.53491-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport patches required to build with gcc-9.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../efivar/0001-Allow-build-with-uClibc.patch |  11 +-
 ..._guid-handle-misaligned-guid-pointer.patch |  62 +++++++
 ...es-Werror-address-of-packed-member-c.patch | 174 ++++++++++++++++++
 ...r-of-Werror-address-of-packed-member.patch |  57 ++++++
 package/efivar/efivar.hash                    |   2 +-
 package/efivar/efivar.mk                      |   2 +-
 6 files changed, 300 insertions(+), 8 deletions(-)
 create mode 100644 package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
 create mode 100644 package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
 create mode 100644 package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch

diff --git a/package/efivar/0001-Allow-build-with-uClibc.patch b/package/efivar/0001-Allow-build-with-uClibc.patch
index 01fa9dee70..0db9955760 100644
--- a/package/efivar/0001-Allow-build-with-uClibc.patch
+++ b/package/efivar/0001-Allow-build-with-uClibc.patch
@@ -1,4 +1,4 @@
-From 2255601757a8a58baddad2d37d0bcc6b003a3732 Mon Sep 17 00:00:00 2001
+From f1f24eb486c4376066884bae3c31f1c455a79836 Mon Sep 17 00:00:00 2001
 From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 Date: Fri, 25 Nov 2016 19:42:27 +0200
 Subject: [PATCH] Allow build with uClibc
@@ -11,17 +11,16 @@ Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/src/export.c b/src/export.c
-index 7f2d4dd..72c02d1 100644
+index 8321bd3..ef36add 100644
 --- a/src/export.c
 +++ b/src/export.c
-@@ -21,11 +21,17 @@
+@@ -23,10 +23,16 @@
  #include <inttypes.h>
  #include <stdint.h>
  #include <stdlib.h>
 -#include <uchar.h>
  
- #include <efivar/efivar.h>
- #include "lib.h"
+ #include "efivar.h"
  
 +#ifdef __UCLIBC__
 +typedef int_least16_t char16_t;
@@ -34,5 +33,5 @@ index 7f2d4dd..72c02d1 100644
  
  #define ATTRS_UNSET 0xa5a5a5a5a5a5a5a5
 -- 
-2.10.2
+2.20.1
 
diff --git a/package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch b/package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
new file mode 100644
index 0000000000..37fd39a127
--- /dev/null
+++ b/package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
@@ -0,0 +1,62 @@
+From b98ba8921010d03f46704a476c69861515deb1ca Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 7 Jan 2019 10:30:59 -0500
+Subject: [PATCH] dp.h: make format_guid() handle misaligned guid pointers
+ safely.
+
+GCC 9 adds -Werror=address-of-packed-member, which causes us to see the
+build error reported at
+ https://bugzilla.opensuse.org/show_bug.cgi?id=1120862 .
+
+That bug report shows us the following:
+
+In file included from dp.c:26:
+dp.h: In function 'format_vendor_helper':
+dp.h:120:37: error: taking address of packed member of 'struct <anonymous>' may result in an unaligned pointer value [-Werror=address-of-packed-member]
+  120 |  format_guid(buf, size, off, label, &dp->hw_vendor.vendor_guid);
+      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
+dp.h:74:25: note: in definition of macro 'format_guid'
+   74 |   _rc = efi_guid_to_str(guid, &_guidstr);   \
+      |                         ^~~~
+cc1: all warnings being treated as errors
+
+This patch makes format_guid() use a local variable as a bounce buffer
+in the case that the guid we're passed is aligned as chaotic neutral.
+
+Note that this only fixes this instance and there may be others that bz
+didn't show because it exited too soon, and I don't have a gcc 9 build
+in front of me right now.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+b98ba8921010d03f46704a476c69861515deb1ca]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/dp.h | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/dp.h b/src/dp.h
+index aa4e390..20cb608 100644
+--- a/src/dp.h
++++ b/src/dp.h
+@@ -70,8 +70,15 @@
+ #define format_guid(buf, size, off, dp_type, guid) ({			\
+ 		int _rc;						\
+ 		char *_guidstr = NULL;					\
+-									\
+-		_rc = efi_guid_to_str(guid, &_guidstr);			\
++		efi_guid_t _guid;					\
++		const efi_guid_t * const _guid_p =			\
++			likely(__alignof__(guid) == sizeof(guid))	\
++				? guid					\
++				: &_guid;				\
++								        \
++		if (unlikely(__alignof__(guid) == sizeof(guid)))	\
++			memmove(&_guid, guid, sizeof(_guid));		\
++		_rc = efi_guid_to_str(_guid_p, &_guidstr);		\
+ 		if (_rc < 0) {						\
+ 			efi_error("could not build %s GUID DP string",	\
+ 				  dp_type);				\
+-- 
+2.20.1
+
diff --git a/package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch b/package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
new file mode 100644
index 0000000000..52db443b7e
--- /dev/null
+++ b/package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
@@ -0,0 +1,174 @@
+From c3c553db85ff10890209d0fe48fb4856ad68e4e0 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Thu, 21 Feb 2019 15:20:12 -0500
+Subject: [PATCH] Fix all the places -Werror=address-of-packed-member catches.
+
+This gets rid of all the places GCC 9's -Werror=address-of-packed-member
+flags as problematic.
+
+Fixes github issue #123
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+c3c553db85ff10890209d0fe48fb4856ad68e4e0]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/dp-message.c            |  6 ++++--
+ src/dp.h                    | 12 ++++--------
+ src/guid.c                  |  2 +-
+ src/include/efivar/efivar.h |  2 +-
+ src/ucs2.h                  | 27 +++++++++++++++++++--------
+ 5 files changed, 29 insertions(+), 20 deletions(-)
+
+diff --git a/src/dp-message.c b/src/dp-message.c
+index 3724e5f..9f96466 100644
+--- a/src/dp-message.c
++++ b/src/dp-message.c
+@@ -620,11 +620,13 @@ _format_message_dn(char *buf, size_t size, const_efidp dp)
+ 			  ) / sizeof(efi_ip_addr_t);
+ 		format(buf, size, off, "Dns", "Dns(");
+ 		for (int i=0; i < end; i++) {
+-			const efi_ip_addr_t *addr = &dp->dns.addrs[i];
++			efi_ip_addr_t addr;
++
++			memcpy(&addr, &dp->dns.addrs[i], sizeof(addr));
+ 			if (i != 0)
+ 				format(buf, size, off, "Dns", ",");
+ 			format_ip_addr(buf, size, off, "Dns",
+-				       dp->dns.is_ipv6, addr);
++				       dp->dns.is_ipv6, &addr);
+ 		}
+ 		format(buf, size, off, "Dns", ")");
+ 		break;
+diff --git a/src/dp.h b/src/dp.h
+index 20cb608..1f921d5 100644
+--- a/src/dp.h
++++ b/src/dp.h
+@@ -71,13 +71,9 @@
+ 		int _rc;						\
+ 		char *_guidstr = NULL;					\
+ 		efi_guid_t _guid;					\
+-		const efi_guid_t * const _guid_p =			\
+-			likely(__alignof__(guid) == sizeof(guid))	\
+-				? guid					\
+-				: &_guid;				\
+-								        \
+-		if (unlikely(__alignof__(guid) == sizeof(guid)))	\
+-			memmove(&_guid, guid, sizeof(_guid));		\
++		const efi_guid_t * const _guid_p = &_guid;		\
++									\
++		memmove(&_guid, guid, sizeof(_guid));			\
+ 		_rc = efi_guid_to_str(_guid_p, &_guidstr);		\
+ 		if (_rc < 0) {						\
+ 			efi_error("could not build %s GUID DP string",	\
+@@ -86,7 +82,7 @@
+ 			_guidstr = onstack(_guidstr,			\
+ 					   strlen(_guidstr)+1);		\
+ 			_rc = format(buf, size, off, dp_type, "%s",	\
+-				     _guidstr);	\
++				     _guidstr);				\
+ 		}							\
+ 		_rc;							\
+ 	})
+diff --git a/src/guid.c b/src/guid.c
+index 306c9ff..3156b3b 100644
+--- a/src/guid.c
++++ b/src/guid.c
+@@ -31,7 +31,7 @@
+ extern const efi_guid_t efi_guid_zero;
+ 
+ int NONNULL(1, 2) PUBLIC
+-efi_guid_cmp(const efi_guid_t *a, const efi_guid_t *b)
++efi_guid_cmp(const void * const a, const void * const b)
+ {
+ 	return memcmp(a, b, sizeof (efi_guid_t));
+ }
+diff --git a/src/include/efivar/efivar.h b/src/include/efivar/efivar.h
+index 316891c..ad6449d 100644
+--- a/src/include/efivar/efivar.h
++++ b/src/include/efivar/efivar.h
+@@ -128,7 +128,7 @@ extern int efi_symbol_to_guid(const char *symbol, efi_guid_t *guid)
+ 
+ extern int efi_guid_is_zero(const efi_guid_t *guid);
+ extern int efi_guid_is_empty(const efi_guid_t *guid);
+-extern int efi_guid_cmp(const efi_guid_t *a, const efi_guid_t *b);
++extern int efi_guid_cmp(const void * const a, const void * const b);
+ 
+ /* import / export functions */
+ typedef struct efi_variable efi_variable_t;
+diff --git a/src/ucs2.h b/src/ucs2.h
+index dbb5900..edd8367 100644
+--- a/src/ucs2.h
++++ b/src/ucs2.h
+@@ -23,16 +23,21 @@
+ 	(((val) & ((mask) << (shift))) >> (shift))
+ 
+ static inline size_t UNUSED
+-ucs2len(const uint16_t * const s, ssize_t limit)
++ucs2len(const void *vs, ssize_t limit)
+ {
+ 	ssize_t i;
+-	for (i = 0; i < (limit >= 0 ? limit : i+1) && s[i] != (uint16_t)0; i++)
++	const uint16_t *s = vs;
++	const uint8_t *s8 = vs;
++
++	for (i = 0;
++	     i < (limit >= 0 ? limit : i+1) && s8[0] != 0 && s8[1] != 0;
++	     i++, s8 += 2, s++)
+ 		;
+ 	return i;
+ }
+ 
+ static inline size_t UNUSED
+-ucs2size(const uint16_t * const s, ssize_t limit)
++ucs2size(const void *s, ssize_t limit)
+ {
+ 	size_t rc = ucs2len(s, limit);
+ 	rc *= sizeof (uint16_t);
+@@ -69,10 +74,11 @@ utf8size(uint8_t *s, ssize_t limit)
+ }
+ 
+ static inline unsigned char * UNUSED
+-ucs2_to_utf8(const uint16_t * const chars, ssize_t limit)
++ucs2_to_utf8(const void * const voidchars, ssize_t limit)
+ {
+ 	ssize_t i, j;
+ 	unsigned char *ret;
++	const uint16_t * const chars = voidchars;
+ 
+ 	if (limit < 0)
+ 		limit = ucs2len(chars, -1);
+@@ -124,10 +130,12 @@ ucs2_to_utf8(const uint16_t * const chars, ssize_t limit)
+ }
+ 
+ static inline ssize_t UNUSED NONNULL(4)
+-utf8_to_ucs2(uint16_t *ucs2, ssize_t size, int terminate, uint8_t *utf8)
++utf8_to_ucs2(void *ucs2void, ssize_t size, int terminate, uint8_t *utf8)
+ {
+ 	ssize_t req;
+ 	ssize_t i, j;
++	uint16_t *ucs2 = ucs2void;
++	uint16_t val16;
+ 
+ 	if (!ucs2 && size > 0) {
+ 		errno = EINVAL;
+@@ -162,10 +170,13 @@ utf8_to_ucs2(uint16_t *ucs2, ssize_t size, int terminate, uint8_t *utf8)
+ 			val = utf8[i] & 0x7f;
+ 			i += 1;
+ 		}
+-		ucs2[j] = val;
++		val16 = val;
++		ucs2[j] = val16;
++	}
++	if (terminate) {
++		val16 = 0;
++		ucs2[j++] = val16;
+ 	}
+-	if (terminate)
+-		ucs2[j++] = (uint16_t)0;
+ 	return j;
+ };
+ 
+-- 
+2.20.1
+
diff --git a/package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch b/package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch
new file mode 100644
index 0000000000..b103e975a3
--- /dev/null
+++ b/package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch
@@ -0,0 +1,57 @@
+From 0dad6d78a7fb5f6c5fb4a1d646040539db6cf865 Mon Sep 17 00:00:00 2001
+From: Chih-Wei Huang <cwhuang@linux.org.tw>
+Date: Tue, 26 Feb 2019 18:42:20 +0800
+Subject: [PATCH] Fix another error of -Werror=address-of-packed-member
+
+Android 9 clang complains:
+
+external/efivar/src/dp-message.c:367:24: error: taking address of packed member '' of class or structure 'efidp_infiniband' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
+                                    (efi_guid_t *)&dp->infiniband.ioc_guid);
+                                                   ^~~~~~~~~~~~~~~~~~~~~~~
+external/efivar/src/dp.h:76:19: note: expanded from macro 'format_guid'
+                memmove(&_guid, guid, sizeof(_guid));                   \
+                                ^~~~
+1 error generated.
+
+Since commit c3c553d the fifth parameter of format_guid() is treated as
+a const void *. The casting is unnecessary.
+
+Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
+[james.hilliard1 at gmail.com: backport from upstream commit
+0dad6d78a7fb5f6c5fb4a1d646040539db6cf865]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ src/dp-media.c   | 3 +--
+ src/dp-message.c | 2 +-
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/dp-media.c b/src/dp-media.c
+index 96a576f..be691c4 100644
+--- a/src/dp-media.c
++++ b/src/dp-media.c
+@@ -46,8 +46,7 @@ _format_media_dn(char *buf, size_t size, const_efidp dp)
+ 			break;
+ 		case EFIDP_HD_SIGNATURE_GUID:
+ 			format(buf, size, off, "HD", "GPT,");
+-			format_guid(buf, size, off, "HD",
+-				    (efi_guid_t *)dp->hd.signature);
++			format_guid(buf, size, off, "HD", dp->hd.signature);
+ 			format(buf, size, off, "HD",
+ 			       ",0x%"PRIx64",0x%"PRIx64")",
+ 			       dp->hd.start, dp->hd.size);
+diff --git a/src/dp-message.c b/src/dp-message.c
+index 9f96466..6b8e907 100644
+--- a/src/dp-message.c
++++ b/src/dp-message.c
+@@ -364,7 +364,7 @@ _format_message_dn(char *buf, size_t size, const_efidp dp)
+ 			       dp->infiniband.port_gid[1],
+ 			       dp->infiniband.port_gid[0]);
+ 			format_guid(buf, size, off, "Infiniband",
+-				    (efi_guid_t *)&dp->infiniband.ioc_guid);
++				    &dp->infiniband.ioc_guid);
+ 			format(buf, size, off, "Infiniband",
+ 			       ",%"PRIu64",%"PRIu64")",
+ 			       dp->infiniband.target_port_id,
+-- 
+2.20.1
+
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index 7feb5b7533..b521e08a53 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 747bc4d97b4bd74979e5356c44a172534a8a07184f130349fd201742e683d292  efivar-35.tar.gz
+sha256 74c52b4f479120fb6639e753e71163ba3f557a7a67c0be225593f9f05b253f36  efivar-37.tar.gz
 sha256 91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index d96bd98d09..8708057b18 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 35
+EFIVAR_VERSION = 37
 EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
-- 
2.20.1

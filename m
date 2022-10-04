Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1047C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 14:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 333FA40462;
	Tue,  4 Oct 2022 14:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 333FA40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdtVGS0P1gyi; Tue,  4 Oct 2022 14:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7106B408E5;
	Tue,  4 Oct 2022 14:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7106B408E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95FF21BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 14:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70EEF82AA9
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 14:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70EEF82AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ir4zNvrwwMMe for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 14:40:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9310F828F7
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9310F828F7
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 14:40:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a26so29339897ejc.4
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 07:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZL9NtH3KUp22buXGXEmvE07n93mi6kFO6s+li+9J/ZY=;
 b=QEeVV5wgFwBa6CJCOO7zxu8Z86L5ogv8LD9wBCqY+aXWBMDcPVECNdPGuGEcLwK4/f
 UyLlgRXkHx8FNhfc+y88il77b/abcz8Q+fe74Exc9ZYsiIjxCGkrpYdoiT4vsDvNrJAZ
 oYjtSd197pyDmPounnmLged11JmslK/Uaj4P+kBJuwJQKLT0hn0pVFEsRLVfxfxHL3JC
 e2EG60qFInL2pcGp4/0Gz9EjEU+9PaTca2oii2T359RHttp+mD0EzZgiKOhe29qgkSWu
 jkkTUPxQgu+vz/vJBVSviXw8JcHTdi19xUsbFJK0mMMBGUhTKzFtaSkdHqiNwTlUusw7
 L+Qg==
X-Gm-Message-State: ACrzQf0CbKlOmd7QU81fBLQh/kINHK1mgn8JlMmt72x3qezawjQ1eDjj
 poxOqLEOUgY5zPgNUBEVwkbmWJIqo/b8dQ==
X-Google-Smtp-Source: AMsMyM4E7pKOcWbx5vyCNn+dlgMEAk8IkIDEK+SL5UiW4oI0tCCGvnXwAZydJreg8v5zB+KQhT8IRA==
X-Received: by 2002:a17:907:96ab:b0:782:2f88:cf29 with SMTP id
 hd43-20020a17090796ab00b007822f88cf29mr19772538ejc.72.1664894398658; 
 Tue, 04 Oct 2022 07:39:58 -0700 (PDT)
Received: from centennial.enunes.eu.com (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 d25-20020a50fe99000000b00457a92f8ad6sm1828777edt.28.2022.10.04.07.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:39:58 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 16:39:42 +0200
Message-Id: <20221004143943.1456694-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZL9NtH3KUp22buXGXEmvE07n93mi6kFO6s+li+9J/ZY=;
 b=Ledv4tmPlTacLwBib36fx2rP31Vxd/TK9cP83/Vy8FRqbtIGcFg1epXYwtu9OWATOg
 ScA+OPe4vtDdU9GbsciWdocVpm/9B2udPYbYSr4xlr7urInFgWUaMSuhFG28w1hoOcPr
 ys/E7ldQfwAgj+f7M+ijDv37EY1cXVxrvvMHaYGGSg8SYf4iZVj9iEW/vlNIkvyZ5CCY
 ZC2LyDd0jgrGtJcTMMrbWCo9m36Mi5rH18VAANqpyBODZu4CgEKRtjkDAoc35WrjxQG3
 /hV2GrssGctw1KGurGEhVCarWSIW3SlwJ4ctySgAiV212YMdFNQ5ilXwQm97++YCSMFP
 ZeLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ledv4tmP
Subject: [Buildroot] [PATCH v2 1/2] package/efivar: bump to version 38
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop backported patches and rebase the ones that are still relevant.

From version 37 to 38, there is a new build system in place, which is
still custom Makefiles.
This introduces a host-efivar package to account for the 'makeguids'
tool. Previously it was not too cumbersome to work around building that
tool for the host, but with the new build system it is increasingly
coupled with the target build that the least hacky way to work around it
is with a host package and a Makefile patch.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
v2:
- separate host parts into a host-efivar build
- move cross-compilation workarounds into a patch
---
 .../efivar/0001-Allow-build-with-uClibc.patch |  12 +-
 ..._guid-handle-misaligned-guid-pointer.patch |  62 -------
 ...patch => 0002-gcc.specs-drop-Werror.patch} |  34 ++--
 ...es-Werror-address-of-packed-member-c.patch | 174 ------------------
 ...ar-isolate-makeguids-host-tool-build.patch |  48 +++++
 ...r-of-Werror-address-of-packed-member.patch |  57 ------
 .../0005-ucs2.h-remove-unused-variable.patch  |  35 ----
 ...-that-checks-for-UCS-2-string-termin.patch |  32 ----
 package/efivar/efivar.hash                    |   2 +-
 package/efivar/efivar.mk                      |  24 ++-
 10 files changed, 93 insertions(+), 387 deletions(-)
 delete mode 100644 package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
 rename package/efivar/{0007-gcc.specs-drop-Werror.patch => 0002-gcc.specs-drop-Werror.patch} (68%)
 delete mode 100644 package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
 create mode 100644 package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch
 delete mode 100644 package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch
 delete mode 100644 package/efivar/0005-ucs2.h-remove-unused-variable.patch
 delete mode 100644 package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch

diff --git a/package/efivar/0001-Allow-build-with-uClibc.patch b/package/efivar/0001-Allow-build-with-uClibc.patch
index 0db9955760..0da80f26d2 100644
--- a/package/efivar/0001-Allow-build-with-uClibc.patch
+++ b/package/efivar/0001-Allow-build-with-uClibc.patch
@@ -1,4 +1,4 @@
-From f1f24eb486c4376066884bae3c31f1c455a79836 Mon Sep 17 00:00:00 2001
+From bfd9cd9e603ef0d0e593d4432048bffc2acfeb7c Mon Sep 17 00:00:00 2001
 From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 Date: Fri, 25 Nov 2016 19:42:27 +0200
 Subject: [PATCH] Allow build with uClibc
@@ -6,15 +6,17 @@ Subject: [PATCH] Allow build with uClibc
 Basically this replaces type definitions in <uchar.h>.
 
 Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+[Erico: rebase to 38]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 ---
  src/export.c | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/src/export.c b/src/export.c
-index 8321bd3..ef36add 100644
+index db5e637..21c5617 100644
 --- a/src/export.c
 +++ b/src/export.c
-@@ -23,10 +23,16 @@
+@@ -9,10 +9,16 @@
  #include <inttypes.h>
  #include <stdint.h>
  #include <stdlib.h>
@@ -29,9 +31,9 @@ index 8321bd3..ef36add 100644
 +#include <uchar.h>
 +#endif
 +
- #define EFIVAR_MAGIC 0xf3df1597
+ #define EFIVAR_MAGIC 0xf3df1597u
  
  #define ATTRS_UNSET 0xa5a5a5a5a5a5a5a5
 -- 
-2.20.1
+2.37.3
 
diff --git a/package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch b/package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
deleted file mode 100644
index 37fd39a127..0000000000
--- a/package/efivar/0002-dp.h-make-format_guid-handle-misaligned-guid-pointer.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b98ba8921010d03f46704a476c69861515deb1ca Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Mon, 7 Jan 2019 10:30:59 -0500
-Subject: [PATCH] dp.h: make format_guid() handle misaligned guid pointers
- safely.
-
-GCC 9 adds -Werror=address-of-packed-member, which causes us to see the
-build error reported at
- https://bugzilla.opensuse.org/show_bug.cgi?id=1120862 .
-
-That bug report shows us the following:
-
-In file included from dp.c:26:
-dp.h: In function 'format_vendor_helper':
-dp.h:120:37: error: taking address of packed member of 'struct <anonymous>' may result in an unaligned pointer value [-Werror=address-of-packed-member]
-  120 |  format_guid(buf, size, off, label, &dp->hw_vendor.vendor_guid);
-      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
-dp.h:74:25: note: in definition of macro 'format_guid'
-   74 |   _rc = efi_guid_to_str(guid, &_guidstr);   \
-      |                         ^~~~
-cc1: all warnings being treated as errors
-
-This patch makes format_guid() use a local variable as a bounce buffer
-in the case that the guid we're passed is aligned as chaotic neutral.
-
-Note that this only fixes this instance and there may be others that bz
-didn't show because it exited too soon, and I don't have a gcc 9 build
-in front of me right now.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-b98ba8921010d03f46704a476c69861515deb1ca]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/dp.h | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/dp.h b/src/dp.h
-index aa4e390..20cb608 100644
---- a/src/dp.h
-+++ b/src/dp.h
-@@ -70,8 +70,15 @@
- #define format_guid(buf, size, off, dp_type, guid) ({			\
- 		int _rc;						\
- 		char *_guidstr = NULL;					\
--									\
--		_rc = efi_guid_to_str(guid, &_guidstr);			\
-+		efi_guid_t _guid;					\
-+		const efi_guid_t * const _guid_p =			\
-+			likely(__alignof__(guid) == sizeof(guid))	\
-+				? guid					\
-+				: &_guid;				\
-+								        \
-+		if (unlikely(__alignof__(guid) == sizeof(guid)))	\
-+			memmove(&_guid, guid, sizeof(_guid));		\
-+		_rc = efi_guid_to_str(_guid_p, &_guidstr);		\
- 		if (_rc < 0) {						\
- 			efi_error("could not build %s GUID DP string",	\
- 				  dp_type);				\
--- 
-2.20.1
-
diff --git a/package/efivar/0007-gcc.specs-drop-Werror.patch b/package/efivar/0002-gcc.specs-drop-Werror.patch
similarity index 68%
rename from package/efivar/0007-gcc.specs-drop-Werror.patch
rename to package/efivar/0002-gcc.specs-drop-Werror.patch
index aa717fedaf..a25b844906 100644
--- a/package/efivar/0007-gcc.specs-drop-Werror.patch
+++ b/package/efivar/0002-gcc.specs-drop-Werror.patch
@@ -1,4 +1,4 @@
-From 8d5cf3347cce9d644f670ffd1d48e71d74635481 Mon Sep 17 00:00:00 2001
+From a1d469753528a98aec971377a526619da5054b20 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 22 Mar 2021 07:52:34 +0100
 Subject: [PATCH] gcc.specs: drop -Werror
@@ -22,23 +22,25 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: not upstreamable as Makefiles were reworked and a new
 ERRORS parameter was added:
 https://github.com/rhboot/efivar/commit/998f617cec92d526e1fadb745673ceef63fa1483]
+[Erico: rebase to 38]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 ---
- gcc.specs | 2 +-
+ src/include/defaults.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gcc.specs b/gcc.specs
-index 45d43d1..1baf11a 100644
---- a/gcc.specs
-+++ b/gcc.specs
-@@ -2,7 +2,7 @@
- + -D_GNU_SOURCE
- 
- *efivar_cpp_options:
-- -Werror -Wall -std=gnu11 -Wextra
-+ -Wall -std=gnu11 -Wextra
- 
- *cpp_options:
- + %(efivar_cpp_options)
+diff --git a/src/include/defaults.mk b/src/include/defaults.mk
+index 632b155..2a9537a 100644
+--- a/src/include/defaults.mk
++++ b/src/include/defaults.mk
+@@ -29,7 +29,7 @@ WARNINGS_GCC ?=
+ WARNINGS_CCC_ANALYZER ?= $(WARNINGS_GCC)
+ WARNINGS ?= -Wall -Wextra $(call family,WARNINGS)
+ ERRORS_GCC ?=
+-ERRORS ?= -Werror $(call family,ERRORS)
++ERRORS ?= $(call family,ERRORS)
+ CPPFLAGS ?=
+ override _CPPFLAGS := $(CPPFLAGS)
+ override CPPFLAGS = $(_CPPFLAGS) -DLIBEFIVAR_VERSION=$(VERSION) \
 -- 
-2.30.1
+2.37.3
 
diff --git a/package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch b/package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
deleted file mode 100644
index 52db443b7e..0000000000
--- a/package/efivar/0003-Fix-all-the-places-Werror-address-of-packed-member-c.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From c3c553db85ff10890209d0fe48fb4856ad68e4e0 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Thu, 21 Feb 2019 15:20:12 -0500
-Subject: [PATCH] Fix all the places -Werror=address-of-packed-member catches.
-
-This gets rid of all the places GCC 9's -Werror=address-of-packed-member
-flags as problematic.
-
-Fixes github issue #123
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-c3c553db85ff10890209d0fe48fb4856ad68e4e0]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/dp-message.c            |  6 ++++--
- src/dp.h                    | 12 ++++--------
- src/guid.c                  |  2 +-
- src/include/efivar/efivar.h |  2 +-
- src/ucs2.h                  | 27 +++++++++++++++++++--------
- 5 files changed, 29 insertions(+), 20 deletions(-)
-
-diff --git a/src/dp-message.c b/src/dp-message.c
-index 3724e5f..9f96466 100644
---- a/src/dp-message.c
-+++ b/src/dp-message.c
-@@ -620,11 +620,13 @@ _format_message_dn(char *buf, size_t size, const_efidp dp)
- 			  ) / sizeof(efi_ip_addr_t);
- 		format(buf, size, off, "Dns", "Dns(");
- 		for (int i=0; i < end; i++) {
--			const efi_ip_addr_t *addr = &dp->dns.addrs[i];
-+			efi_ip_addr_t addr;
-+
-+			memcpy(&addr, &dp->dns.addrs[i], sizeof(addr));
- 			if (i != 0)
- 				format(buf, size, off, "Dns", ",");
- 			format_ip_addr(buf, size, off, "Dns",
--				       dp->dns.is_ipv6, addr);
-+				       dp->dns.is_ipv6, &addr);
- 		}
- 		format(buf, size, off, "Dns", ")");
- 		break;
-diff --git a/src/dp.h b/src/dp.h
-index 20cb608..1f921d5 100644
---- a/src/dp.h
-+++ b/src/dp.h
-@@ -71,13 +71,9 @@
- 		int _rc;						\
- 		char *_guidstr = NULL;					\
- 		efi_guid_t _guid;					\
--		const efi_guid_t * const _guid_p =			\
--			likely(__alignof__(guid) == sizeof(guid))	\
--				? guid					\
--				: &_guid;				\
--								        \
--		if (unlikely(__alignof__(guid) == sizeof(guid)))	\
--			memmove(&_guid, guid, sizeof(_guid));		\
-+		const efi_guid_t * const _guid_p = &_guid;		\
-+									\
-+		memmove(&_guid, guid, sizeof(_guid));			\
- 		_rc = efi_guid_to_str(_guid_p, &_guidstr);		\
- 		if (_rc < 0) {						\
- 			efi_error("could not build %s GUID DP string",	\
-@@ -86,7 +82,7 @@
- 			_guidstr = onstack(_guidstr,			\
- 					   strlen(_guidstr)+1);		\
- 			_rc = format(buf, size, off, dp_type, "%s",	\
--				     _guidstr);	\
-+				     _guidstr);				\
- 		}							\
- 		_rc;							\
- 	})
-diff --git a/src/guid.c b/src/guid.c
-index 306c9ff..3156b3b 100644
---- a/src/guid.c
-+++ b/src/guid.c
-@@ -31,7 +31,7 @@
- extern const efi_guid_t efi_guid_zero;
- 
- int NONNULL(1, 2) PUBLIC
--efi_guid_cmp(const efi_guid_t *a, const efi_guid_t *b)
-+efi_guid_cmp(const void * const a, const void * const b)
- {
- 	return memcmp(a, b, sizeof (efi_guid_t));
- }
-diff --git a/src/include/efivar/efivar.h b/src/include/efivar/efivar.h
-index 316891c..ad6449d 100644
---- a/src/include/efivar/efivar.h
-+++ b/src/include/efivar/efivar.h
-@@ -128,7 +128,7 @@ extern int efi_symbol_to_guid(const char *symbol, efi_guid_t *guid)
- 
- extern int efi_guid_is_zero(const efi_guid_t *guid);
- extern int efi_guid_is_empty(const efi_guid_t *guid);
--extern int efi_guid_cmp(const efi_guid_t *a, const efi_guid_t *b);
-+extern int efi_guid_cmp(const void * const a, const void * const b);
- 
- /* import / export functions */
- typedef struct efi_variable efi_variable_t;
-diff --git a/src/ucs2.h b/src/ucs2.h
-index dbb5900..edd8367 100644
---- a/src/ucs2.h
-+++ b/src/ucs2.h
-@@ -23,16 +23,21 @@
- 	(((val) & ((mask) << (shift))) >> (shift))
- 
- static inline size_t UNUSED
--ucs2len(const uint16_t * const s, ssize_t limit)
-+ucs2len(const void *vs, ssize_t limit)
- {
- 	ssize_t i;
--	for (i = 0; i < (limit >= 0 ? limit : i+1) && s[i] != (uint16_t)0; i++)
-+	const uint16_t *s = vs;
-+	const uint8_t *s8 = vs;
-+
-+	for (i = 0;
-+	     i < (limit >= 0 ? limit : i+1) && s8[0] != 0 && s8[1] != 0;
-+	     i++, s8 += 2, s++)
- 		;
- 	return i;
- }
- 
- static inline size_t UNUSED
--ucs2size(const uint16_t * const s, ssize_t limit)
-+ucs2size(const void *s, ssize_t limit)
- {
- 	size_t rc = ucs2len(s, limit);
- 	rc *= sizeof (uint16_t);
-@@ -69,10 +74,11 @@ utf8size(uint8_t *s, ssize_t limit)
- }
- 
- static inline unsigned char * UNUSED
--ucs2_to_utf8(const uint16_t * const chars, ssize_t limit)
-+ucs2_to_utf8(const void * const voidchars, ssize_t limit)
- {
- 	ssize_t i, j;
- 	unsigned char *ret;
-+	const uint16_t * const chars = voidchars;
- 
- 	if (limit < 0)
- 		limit = ucs2len(chars, -1);
-@@ -124,10 +130,12 @@ ucs2_to_utf8(const uint16_t * const chars, ssize_t limit)
- }
- 
- static inline ssize_t UNUSED NONNULL(4)
--utf8_to_ucs2(uint16_t *ucs2, ssize_t size, int terminate, uint8_t *utf8)
-+utf8_to_ucs2(void *ucs2void, ssize_t size, int terminate, uint8_t *utf8)
- {
- 	ssize_t req;
- 	ssize_t i, j;
-+	uint16_t *ucs2 = ucs2void;
-+	uint16_t val16;
- 
- 	if (!ucs2 && size > 0) {
- 		errno = EINVAL;
-@@ -162,10 +170,13 @@ utf8_to_ucs2(uint16_t *ucs2, ssize_t size, int terminate, uint8_t *utf8)
- 			val = utf8[i] & 0x7f;
- 			i += 1;
- 		}
--		ucs2[j] = val;
-+		val16 = val;
-+		ucs2[j] = val16;
-+	}
-+	if (terminate) {
-+		val16 = 0;
-+		ucs2[j++] = val16;
- 	}
--	if (terminate)
--		ucs2[j++] = (uint16_t)0;
- 	return j;
- };
- 
--- 
-2.20.1
-
diff --git a/package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch b/package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch
new file mode 100644
index 0000000000..f136bf2cd3
--- /dev/null
+++ b/package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch
@@ -0,0 +1,48 @@
+From b069a48abd62a669851b9c3b501d579748dab0fd Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Mon, 3 Oct 2022 18:16:55 +0200
+Subject: [PATCH] efivar: isolate makeguids host tool build
+
+efivar build includes a 'makeguids' host tool which is normally built by
+distributions during the package build step. This is unfortunately not
+written with cross-compilation in mind, since it needs to build for the
+host architecture, including the build of object files which it then
+assumes can be linked into the target library.
+To make the packaging process simpler for a cross-compilation system
+like Buildroot, separate the 'makeguids' tool build to an explicit make
+target and remove target build dependencies from it.
+This way, Buildroot can build the tool separately in a host build step
+and the target build step can then be straightforward.
+
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ src/Makefile | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 0e423c4..82c59c2 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -68,7 +68,6 @@ makeguids : LDFLAGS=$(HOST_LDFLAGS)
+ makeguids : CCLDFLAGS=$(HOST_CCLDFLAGS)
+ makeguids : $(MAKEGUIDS_OBJECTS)
+ 
+-$(MAKEGUIDS_OUTPUT) : makeguids
+ $(MAKEGUIDS_OUTPUT) : guids.txt
+ 	@set -e ; \
+ 	missing=no ; \
+@@ -81,9 +80,9 @@ $(MAKEGUIDS_OUTPUT) : guids.txt
+ 	if [ "$${missing}" != "no" ]; then \
+ 		exit 1 ; \
+ 	fi
+-	./makeguids $(LD_DASH_T) guids.txt guid-symbols.c include/efivar/efivar-guids.h guids.lds
++	makeguids $(LD_DASH_T) guids.txt guid-symbols.c include/efivar/efivar-guids.h guids.lds
+ 
+-prep : makeguids $(GENERATED_SOURCES)
++prep : $(GENERATED_SOURCES)
+ 
+ $(LIBEFIVAR_OBJECTS) $(LIBEFIBOOT_OBJECTS) : prep
+ 
+-- 
+2.37.3
+
diff --git a/package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch b/package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch
deleted file mode 100644
index b103e975a3..0000000000
--- a/package/efivar/0004-Fix-another-error-of-Werror-address-of-packed-member.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 0dad6d78a7fb5f6c5fb4a1d646040539db6cf865 Mon Sep 17 00:00:00 2001
-From: Chih-Wei Huang <cwhuang@linux.org.tw>
-Date: Tue, 26 Feb 2019 18:42:20 +0800
-Subject: [PATCH] Fix another error of -Werror=address-of-packed-member
-
-Android 9 clang complains:
-
-external/efivar/src/dp-message.c:367:24: error: taking address of packed member '' of class or structure 'efidp_infiniband' may result in an unaligned pointer value [-Werror,-Waddress-of-packed-member]
-                                    (efi_guid_t *)&dp->infiniband.ioc_guid);
-                                                   ^~~~~~~~~~~~~~~~~~~~~~~
-external/efivar/src/dp.h:76:19: note: expanded from macro 'format_guid'
-                memmove(&_guid, guid, sizeof(_guid));                   \
-                                ^~~~
-1 error generated.
-
-Since commit c3c553d the fifth parameter of format_guid() is treated as
-a const void *. The casting is unnecessary.
-
-Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
-[james.hilliard1@gmail.com: backport from upstream commit
-0dad6d78a7fb5f6c5fb4a1d646040539db6cf865]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- src/dp-media.c   | 3 +--
- src/dp-message.c | 2 +-
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/dp-media.c b/src/dp-media.c
-index 96a576f..be691c4 100644
---- a/src/dp-media.c
-+++ b/src/dp-media.c
-@@ -46,8 +46,7 @@ _format_media_dn(char *buf, size_t size, const_efidp dp)
- 			break;
- 		case EFIDP_HD_SIGNATURE_GUID:
- 			format(buf, size, off, "HD", "GPT,");
--			format_guid(buf, size, off, "HD",
--				    (efi_guid_t *)dp->hd.signature);
-+			format_guid(buf, size, off, "HD", dp->hd.signature);
- 			format(buf, size, off, "HD",
- 			       ",0x%"PRIx64",0x%"PRIx64")",
- 			       dp->hd.start, dp->hd.size);
-diff --git a/src/dp-message.c b/src/dp-message.c
-index 9f96466..6b8e907 100644
---- a/src/dp-message.c
-+++ b/src/dp-message.c
-@@ -364,7 +364,7 @@ _format_message_dn(char *buf, size_t size, const_efidp dp)
- 			       dp->infiniband.port_gid[1],
- 			       dp->infiniband.port_gid[0]);
- 			format_guid(buf, size, off, "Infiniband",
--				    (efi_guid_t *)&dp->infiniband.ioc_guid);
-+				    &dp->infiniband.ioc_guid);
- 			format(buf, size, off, "Infiniband",
- 			       ",%"PRIu64",%"PRIu64")",
- 			       dp->infiniband.target_port_id,
--- 
-2.20.1
-
diff --git a/package/efivar/0005-ucs2.h-remove-unused-variable.patch b/package/efivar/0005-ucs2.h-remove-unused-variable.patch
deleted file mode 100644
index a814043ce8..0000000000
--- a/package/efivar/0005-ucs2.h-remove-unused-variable.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fdb803402fb32fa6d020bac57a40c7efe4aabb7d Mon Sep 17 00:00:00 2001
-From: Javier Martinez Canillas <javierm@redhat.com>
-Date: Tue, 5 Mar 2019 17:23:24 +0100
-Subject: [PATCH] ucs2.h: remove unused variable
-
-The const uint16_t pointer is not used since now the two bytes of the
-UCS-2 chars are checked to know if is the termination of the string.
-
-Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ucs2.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/ucs2.h b/src/ucs2.h
-index edd8367..e0390c3 100644
---- a/src/ucs2.h
-+++ b/src/ucs2.h
-@@ -26,12 +26,11 @@ static inline size_t UNUSED
- ucs2len(const void *vs, ssize_t limit)
- {
- 	ssize_t i;
--	const uint16_t *s = vs;
- 	const uint8_t *s8 = vs;
- 
- 	for (i = 0;
- 	     i < (limit >= 0 ? limit : i+1) && s8[0] != 0 && s8[1] != 0;
--	     i++, s8 += 2, s++)
-+	     i++, s8 += 2)
- 		;
- 	return i;
- }
--- 
-2.20.1
-
diff --git a/package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch b/package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch
deleted file mode 100644
index 00b20332ef..0000000000
--- a/package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4e04afc2df9bbc26e5ab524b53a6f4f1e61d7c9e Mon Sep 17 00:00:00 2001
-From: Javier Martinez Canillas <javierm@redhat.com>
-Date: Tue, 5 Mar 2019 17:23:32 +0100
-Subject: [PATCH] ucs2.h: fix logic that checks for UCS-2 string termination
-
-Currently the loop to count the lenght of the UCS-2 string ends if either
-of the two bytes are 0, but 0 is a valid value for UCS-2 character codes.
-
-So only break the loop when 0 is the value for both UCS-2 char bytes.
-
-Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ucs2.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ucs2.h b/src/ucs2.h
-index e0390c3..fd8b056 100644
---- a/src/ucs2.h
-+++ b/src/ucs2.h
-@@ -29,7 +29,7 @@ ucs2len(const void *vs, ssize_t limit)
- 	const uint8_t *s8 = vs;
- 
- 	for (i = 0;
--	     i < (limit >= 0 ? limit : i+1) && s8[0] != 0 && s8[1] != 0;
-+	     i < (limit >= 0 ? limit : i+1) && !(s8[0] == 0 && s8[1] == 0);
- 	     i++, s8 += 2)
- 		;
- 	return i;
--- 
-2.20.1
-
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index 132022bf67..827b46baa4 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  74c52b4f479120fb6639e753e71163ba3f557a7a67c0be225593f9f05b253f36  efivar-37.tar.gz
+sha256  e3bbde37238bd47af1fcf270dc0ef1f4be030d86364c917b93669222ec52bbea  efivar-38.tar.gz
 sha256  91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 8708057b18..8b1d338bec 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,31 +4,44 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 37
+EFIVAR_VERSION = 38
 EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
 EFIVAR_INSTALL_STAGING = YES
+EFIVAR_DEPENDENCIES = host-efivar
 
 # -fPIC is needed at least on MIPS, otherwise fails to build shared
 # -library.
+# SUBDIRS is redefined so it skips building docs.
+# LD_DASH_T is redefined as the linker detection does not seem to
+# work properly for cross-compilation.
 EFIVAR_MAKE_OPTS = \
 	libdir=/usr/lib \
-	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"
+	LDFLAGS="$(TARGET_LDFLAGS) -fPIC" \
+	TOPDIR=$(@D) \
+	SUBDIRS=src \
+	LD_DASH_T=-T
 
-define EFIVAR_BUILD_CMDS
+define HOST_EFIVAR_BUILD_CMDS
 	# makeguids is an internal host tool and must be built separately with
 	# $(HOST_CC), otherwise it gets cross-built.
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
-		$(MAKE) -C $(@D)/src gcc_cflags=  makeguids
+		TOPDIR=$(@D) CFLAGS_GCC= \
+		$(MAKE) -C $(@D)/src makeguids
+endef
 
+define EFIVAR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
-		AR=$(TARGET_AR) NM=$(TARGET_NM) RANLIB=$(TARGET_RANLIB) \
 		$(EFIVAR_MAKE_OPTS) \
 		all
 endef
 
+define HOST_EFIVAR_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/makeguids $(HOST_DIR)/usr/bin/makeguids
+endef
+
 define EFIVAR_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
 		$(EFIVAR_MAKE_OPTS) \
@@ -44,3 +57,4 @@ define EFIVAR_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

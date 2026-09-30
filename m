Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230D7CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA86A407C0;
	Thu,  1 Oct 2026 14:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2S6D6JKrRbi; Thu,  1 Oct 2026 14:23:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E26034085B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864580;
	b=GjLd81JhMXNdf+Y18v1cjhfMUARzcKainEs4L2gIWkzmXofBSPmoyx6AOzZdOLJ/18U9
	 8qAynmp40hkXnbPHPY7GQnIhoRlizqipkkVWD4gmzwCeoQiUa3XG3dKyuh7GPL5cyZC+0
	 1jyl2WiNHUW5vfIrq99RsmZV4AtO3Fv4mUPXlb57PuQOqZlELc2MAZFQ64Iz0rKf+AcY0
	 aaeNTlHE7d+agN+UaDLeE+QZCZsRGJNpQdwGl3SXNBMlYIu0G8SAIAxQm09CPkzdguPRA
	 lGOSxru/jTy9teKUe4iDblo7Jbi6ybDvbG40Khti/qLfH3PLB8r1S3l9UHmQAPstoJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rNYimvsYRturdWlKkFfNPGGWp3PXtPej4ifap7Xd1DM=;
	b=l14Pl4u4gVKtOspB8s9tb+4mn72NNyTIm7q6Hgco3QUf8uL+KwTJIirGpv2Z0e0sG4Ty
	 mJz1lLpGHBAQrHjHH5+mdnNDj68hAuCB+Y8FvW9ZELm9HdQzyS0mfg9GzMLbuDxB3TrZN
	 bUSO51HYzso7X7vnw5MB97SsGjRvbKmJa4EfA8c1s4vv7b8DnC0yMI3RgluZdGtzI/PxH
	 eCJuYsuLlNOCkxGqbuLqrTeAZ+5uDR7sYPU1Oi/jWrBvxk9MTcRuON6zNVM3q3ArwNmvW
	 w6VBcaspBE8YZmBvVHD97nNiKXBjfqwSlqa4wJa8yO/pTGWXsZHlESD9blasPE5mPYg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864580;
	bh=rNYimvsYRturdWlKkFfNPGGWp3PXtPej4ifap7Xd1DM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F6O4kBi3ngdSs8SZWGbkKPtXcrpIhmtsCvrsJnbU4uNqK5+5t8EOAmbdtCQ4grqqW
	 GrBx5Cl99jv8Nb6cZUJWkubatzkU3NjNVGvjxQgOzT1bMn5n4P88+uHUqYgd02vI2o
	 tGdYokgdEKvAeB1I00HyORHYWTzWPTitR3jMQrlHTK+/shfdeWOcvWMIIc8OExHa3h
	 XUoybjOG5dIIQjC/DGIWefpYGhAtegaUJgJfRMC5kqZaWX/29y01DHQELSRBdT+hJX
	 W33QI2hHM2WfQKabde+yQaLA6tJT3hT2W99kAkw1EfzQmWmpnxAsvVTSc035Zb/x/C
	 i2FojPUglxlHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26034085B;
	Thu,  1 Oct 2026 14:22:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA9E01FEA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D9A40098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju2fZVRRAQD5 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D5AB84052B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=D6GQJZrVD3LmSmGXI8YJqPkeyjep3MEDMpdhPO0GyDbBAPvYhE4KsFgvx/CreJDXs6Ti
 CKSr5dPOd7cy7AHUzWhm6Inct4FSHLIIP5dln9vX+IaJmdJfCWWJ9LLqwZkOfz1WO637z
 0OefGFKSYN3S2CBPPOjm9tIYka15w5lAPsHtSyEXy6xnV0TjQ9+dTFQKoIKR1E1DsGBrx
 5XQ8+lrbOVCY7sW0nCo6KX896qQiPXngsXldQtNj0I6MJdq5MJ2YdPTMGpgyN8xqhk/Ny
 zPWbd+R/71T4h39UdujY9oD6gMxQQsYjOluyZ7kSWTaehDfIjhtMfG6xaz8yibSPTEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=D+bMl4Dp2l+YKGCnbT8Nv2z4ZuXdNrgS1Y0t+RlWSss=;
 b=na6LjU2GamQTFcdsnCzc5au8ljhd2zf6z5c+LXy0GlY3AQKU+8FRasgKq3TRCzfgOreg
 b2M0pNNd1+rvHP1oMFVUQ6EIVVsAJeHXfjwmwAMrUdteZvHqSN7JiFtGdwzdHTpc2dVuX
 aZiqFE3ppMKMmEKGkjduKTp8KuAzxbkg7DzD+C/Dzb1ZHj7RVD9WuwDK5kfrggnDcFXgI
 vJym8JpnazWvdiQD/U/5lLTS5L9/BICKamoOfjODOdUbAZ4TvNIovzuAsXJcfkg7/fAZO
 XayDWntinOL/fNcH9DiweXAA3vwAPhorAM5WS47mtj5LBja0hY59lK8BSw4LRY5vBbQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5AB84052B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A7939844E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:10:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 29fe2566b3b280cfbbbf293f80b78b4b140ad218
X-Git-Newrev: d01d6c48a0fba91680c8a3ddb19492576ffc1998
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.0A7939844E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ntpsec: bump
 version to 1.2.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2437189481891807637=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2437189481891807637==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d01d6c48a0fba91680c8a3ddb19492576ffc1998
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://gitlab.com/NTPsec/ntpsec/-/blob/NTPsec_1_2_4/NEWS.adoc?ref_type=tags

Buildroot commit a5327724686a1ba719d37caff5986f241993b500 added patch
0003 although it should have been 0002 => renumbered.

Added upstream commit as 0003 for partial build fix with gcc 14.x

Added another patch to fix build with gcc >= 14.x for
BR2_PACKAGE_NTPSEC_REFCLOCK_ALL=y

Move env variable declarations from _CONF_OPTS to _CONF_ENV to fix a
configure error caused by updated waf scripts included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 789d1952d22d17f239158a8a2afd96166be451c2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...upport.patch => 0002-disable-PIE-support.patch} |  0
 ...ock_gpsd.c-Add-missing-time.h-for-strptim.patch | 47 ++++++++++++++++++++++
 ...-refclock_gpsd-add-build-fix-for-gcc-14.x.patch | 32 +++++++++++++++
 package/ntpsec/ntpsec.hash                         |  2 +-
 package/ntpsec/ntpsec.mk                           | 10 +++--
 5 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/package/ntpsec/0003-disable-PIE-support.patch b/package/ntpsec/0002-disable-PIE-support.patch
similarity index 100%
rename from package/ntpsec/0003-disable-PIE-support.patch
rename to package/ntpsec/0002-disable-PIE-support.patch
diff --git a/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch b/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
new file mode 100644
index 0000000000..0a2ae6a259
--- /dev/null
+++ b/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
@@ -0,0 +1,47 @@
+From 904983bf9465017753c6f5b602fc9c98458615f7 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Mon, 27 Oct 2025 12:35:35 -0700
+Subject: [PATCH] ntpd/refclock_gpsd.c: Add missing time.h for strptime()
+
+Upstream: https://gitlab.com/NTPsec/ntpsec/-/commit/5137c155d8895cfc50fb577ee720b3b23589c662
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ntpd/refclock_gpsd.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/ntpd/refclock_gpsd.c b/ntpd/refclock_gpsd.c
+index 1dfec3103..0a2987d84 100644
+--- a/ntpd/refclock_gpsd.c
++++ b/ntpd/refclock_gpsd.c
+@@ -100,20 +100,20 @@ typedef unsigned long int json_uint;
+  * header stuff we need
+  */
+ 
+-#include <netdb.h>
+-#include <unistd.h>
+-#include <fcntl.h>
+-#include <string.h>
+ #include <ctype.h>
++#include <fcntl.h>
+ #include <math.h>
++#include <netdb.h>
++#include <string.h>
++#include <time.h>         // for strptime()
++#include <unistd.h>
+ 
+-#include <sys/types.h>
++#include <sys/select.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <netinet/tcp.h>
+ 
+-#include <sys/select.h>
+-
+ #include "ntpd.h"
+ #include "ntp_io.h"
+ #include "ntp_refclock.h"
+-- 
+2.47.3
+
diff --git a/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch b/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
new file mode 100644
index 0000000000..821a34e966
--- /dev/null
+++ b/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
@@ -0,0 +1,32 @@
+From 55c230d61ece7213506f1dccac76c21aefbade9e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 27 Oct 2025 19:18:13 +0100
+Subject: [PATCH] refclock_gpsd: add build fix for gcc => 14.x
+
+../../ntpd/refclock_gpsd.c:2076:14: error: implicit declaration of
+ function 'strptime'; did you mean 'strftime'?
+ [-Wimplicit-function-declaration]
+
+Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1484
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ntpd/refclock_gpsd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ntpd/refclock_gpsd.c b/ntpd/refclock_gpsd.c
+index a4a6f7095..a3995896a 100644
+--- a/ntpd/refclock_gpsd.c
++++ b/ntpd/refclock_gpsd.c
+@@ -59,6 +59,8 @@
+  */
+ 
+ 
++#define _XOPEN_SOURCE
++#define _DEFAULT_SOURCE
+ #include "config.h"
+ #include "ntp.h"
+ #include "ntp_types.h"
+-- 
+2.47.3
+
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index a3802c11ba..40c06d6926 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a9ec4416688a1c1c88833f3f6acc35518e3d63409af372eec010455002b33050  ntpsec-NTPsec_1_2_3.tar.bz2
+sha256  3abc1b057a252d214ef2e76aa375fe0d81432c626e75304b17850d68eee0c54f  ntpsec-NTPsec_1_2_4.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 3acf7745cf..d48bc5baa9 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.3
+NTPSEC_VERSION = 1.2.4
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \
@@ -37,13 +37,15 @@ NTPSEC_DEPENDENCIES = \
 	libcap \
 	openssl
 
+NTPSEC_CONF_ENV = \
+	CC="$(HOSTCC)" \
+	CFLAGS="$(HOST_CFLAGS)" \
+	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+
 # CC="$(HOSTCC)" is strange but needed to build some host tools, the
 # cross-compiler will properly be used to build target code thanks to
 # --cross-compiler
 NTPSEC_CONF_OPTS = \
-	CC="$(HOSTCC)" \
-	CFLAGS="$(HOST_CFLAGS)" \
-	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
 	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
 	--cross-compiler="$(TARGET_CC)" \
 	--cross-cflags="$(TARGET_CFLAGS) -std=gnu99" \

--===============2437189481891807637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2437189481891807637==--

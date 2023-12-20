Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1CCC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E29C5436EE;
	Wed, 20 Dec 2023 20:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29C5436EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QechWELSOR2H; Wed, 20 Dec 2023 20:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4B1E436E6;
	Wed, 20 Dec 2023 20:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B1E436E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 014F71BF39C
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE35641E26
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE35641E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uis787Qi4d-q for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:01:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 091DC41BDE
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091DC41BDE
Received: by mail.gandi.net (Postfix) with ESMTPA id 7AB4D60007;
 Wed, 20 Dec 2023 20:01:18 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, peter.verbrugge@technolution.nl
Date: Wed, 20 Dec 2023 21:01:08 +0100
Message-ID: <20231220200110.1819507-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703102478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfWYz0DPkdCRTZwYkgBzRMLnCV/XF3a3FcKVaQh49rs=;
 b=DZhAuSWADbdMysCImAfZmgkoiOBoRtde5laCLNfWiT/26H3TBubFClD62pl3h6oS2OlJCd
 sd3RkmWGJ4DVeugI7Vw43FA8/7KMWvtZKsXcRZX1d9QME5XusCv7MFVboU9k7p3XvF47oH
 D5n57mclmRKrce77IB32R/ooJhkk6ii6aBr29KIC9DWapFH4BEeJZcdWjQDZDVDT99KD0P
 8wKa3gwsvbLgufUmBXmsFY6ROi62XL6tk7GC6FGMcZeP+I2xkusrtjgKJpHXnbqOzqFAAX
 9JsAfyyAmHWUHgAPPs/xNMOhFnTiqL/HzTrb5sBYy6j/csBw3QMS4gJZ5XsFmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZhAuSWA
Subject: [Buildroot] [PATCH 2/3] package/glibc: ignore CVEs not considered
 as security issues by upstream
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

5 CVEs affecting glibc according to the NVD database are considered as
not being security issues by upstream glibc developers:

* CVE-2010-4756: The glob implementation in the GNU C Library (aka
  glibc or libc6) allows remote authenticated users to cause a denial
  of service (CPU and memory consumption) via crafted glob expressions
  that do not match any pathnames. glibc maintainers position: "That's
  standard POSIX behaviour implemented by (e)glibc. Applications using
  glob need to impose limits for themselves"

* CVE-2019-1010022: GNU Libc current is affected by: Mitigation
  bypass. The impact is: Attacker may bypass stack guard
  protection. The component is: nptl. The attack vector is: Exploit
  stack buffer overflow vulnerability and use this bypass
  vulnerability to bypass stack guard. NOTE: Upstream comments
  indicate "this is being treated as a non-security bug and no real
  threat. glibc maintainers position: "Not treated as a security issue
  by upstream https://sourceware.org/bugzilla/show_bug.cgi?id=22850"

* CVE-2019-1010023: GNU Libc current is affected by: Re-mapping
  current loaded library with malicious ELF file. The impact is: In
  worst case attacker may evaluate privileges. The component is:
  libld. The attack vector is: Attacker sends 2 ELF files to victim
  and asks to run ldd on it. ldd execute code. NOTE: Upstream comments
  indicate "this is being treated as a non-security bug and no real
  threat. glibc maintainers position: "Not treated as a security issue
  by upstream https://sourceware.org/bugzilla/show_bug.cgi?id=22851"

* CVE-2019-1010024: GNU Libc current is affected by: Mitigation
  bypass. The impact is: Attacker may bypass ASLR using cache of
  thread stack and heap. The component is: glibc. NOTE: Upstream
  comments indicate "this is being treated as a non-security bug and
  no real threat. glibc maintainers position: "Not treated as a
  security issue by upstream
  https://sourceware.org/bugzilla/show_bug.cgi?id=22852"

* CVE-2019-1010025: GNU Libc current is affected by: Mitigation
  bypass. The impact is: Attacker may guess the heap addresses of
  pthread_created thread. The component is: glibc. NOTE: the vendor's
  position is "ASLR bypass itself is not a vulnerability. Glibc
  maintainers position: "Not treated as a security issue by upstream
  https://sourceware.org/bugzilla/show_bug.cgi?id=22853"

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
I believe those CVEs should be ignored, because they will never be
fixed, and therefore they cause additional noise that makes it more
difficult to spot the real CVEs that need to be fixed.
---
 package/glibc/glibc.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 32e6516c7f..29411c58e2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -36,6 +36,20 @@ GLIBC_IGNORE_CVES += CVE-2023-4911
 # 2.38 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-5156
 
+# All these CVEs are considered as not being security issues by
+# upstream glibc:
+#  https://security-tracker.debian.org/tracker/CVE-2010-4756
+#  https://security-tracker.debian.org/tracker/CVE-2019-1010022
+#  https://security-tracker.debian.org/tracker/CVE-2019-1010023
+#  https://security-tracker.debian.org/tracker/CVE-2019-1010024
+#  https://security-tracker.debian.org/tracker/CVE-2019-1010025
+GLIBC_IGNORE_CVES += \
+	CVE-2010-4756 \
+	CVE-2019-1010022 \
+	CVE-2019-1010023 \
+	CVE-2019-1010024 \
+	CVE-2019-1010025
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

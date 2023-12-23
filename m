Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E87C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F5060B9E;
	Sat, 23 Dec 2023 10:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F5060B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcZHivS6zIXY; Sat, 23 Dec 2023 10:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A78C060D58;
	Sat, 23 Dec 2023 10:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78C060D58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4D61BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DA3B827BA
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA3B827BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aq2H0oftMH1M for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14695827D8
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14695827D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0210B87BD1; Sat, 23 Dec 2023 10:27:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 11:11:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af8c0e5c746b11872b57e660afc2118e882f7722
X-Git-Newrev: adaae82c5872aa611b18a4c81bf60be268696442
X-Patchwork-Hint: ignore
Message-Id: <20231223102700.0210B87BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: ignore CVEs not considered
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=adaae82c5872aa611b18a4c81bf60be268696442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09047C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 08:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3838102D;
	Sun, 27 Sep 2026 08:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beH4r_cuO27k; Sun, 27 Sep 2026 08:40:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 662DD81089
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790498419;
	b=dxi65g3IE4qwzmptHYsLHVmm0wjALPNp8niqRUpPYqHMI4xw/+Gwc9EZatbi2bA/Aman
	 HfXJisZ5XkmdLDdYaQ5ZKrp960mgfD7DZZ8q09pvcib6/v/L+b2MYQgdRj7hhd6kbQqin
	 zQGZ3KTiGVOI+f4L2DO/xw+c281qphsHb5Fg253RiSVrJ3vzwZIQXkfBa2UnQkMHmKf6k
	 ItVBXLvtcTQpQ2JzgLQqJ3MbNfvgmxlIRkzraXeshEj79ibgk1+zoYgAaRcIRt+q7XZfd
	 OQ/enOsHNd+PgwEZ43+7ABJBSlsD/qvQyeYGZAJUq63le8XyvhgEjcgQdlvj4elbDQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790498419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Bc6dxhCzaTuh3wxmUAoMRIQSPCWrh4MYFnWaU3NyNRU=;
	b=NFhHdI4F248LmvG6h53CvNr1UVJc+FuYTOrgiiMdETh+nsePIiUs+1ZxBmNrnC5OCWjI
	 qu/zXLLOM/UEwo+EvGrn6j249Y11lktv+o5edC/HnucHssF/tt7/Vs6d1P5AUh9Ffa9s0
	 cx1g1GoTT+bpBybE67EWpManbWgY14ioyitkjC0pu4XpdEqx+9pgzCF5udHpU+LytGWhv
	 0Li/5dRwq2mtJo5L+ZzONCwREv6FUOwZnsxq5DZzcte2YHxBKp0lGQBmGrtwHH/nM22Hm
	 rv1Sti9t8ADwqi+exi+6+V5Gp6BTBVPX2sxp1rRHiM2RxB9gPHnAtdM7SB2zldrBvMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790498419;
	bh=Bc6dxhCzaTuh3wxmUAoMRIQSPCWrh4MYFnWaU3NyNRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qo4rzO3yURBalhHdE/+ur7LiJaDGqwEHwfa55ALokSUSCr51bPNdm9Upgb6ZBoV15
	 s/hFCEW1bg/7RsYtCAJfkiHm3EQXQQIfK8OzDIeRrdwrd4ufaPFZ5Ib9hiA1GwcPUV
	 w8u8gPpzxy/3pd5Mz9X+BskOgNgnVmO0mRKYmKFjgbJ1O/gLjGTViypSPVK8c9TuQO
	 dHrM9w2SpLqn58uqMSfFl7uiwbA58Jz1sjvI+5ZB9q6PUXQHLyR0bosfMjLl/PGpJ6
	 Gt3A8kf59z8w2cH8vET/87rT3yEBT0S0MBgfCSzwJ/FHBKP3huOeq7BM3tLeDuiZEc
	 +bSlzPrrygUUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 662DD81089;
	Sun, 27 Sep 2026 08:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE0FD2B6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF7BB4005C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_ocqpmF1Z4H for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 08:40:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C152B40059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790498415;
 b=jvPqYyI6RLOhbvr+o1esimZw2JmQbuGu/2/oV0ZPG9t1ja2s5fGuDMCZuP6cQ+nAbvDS
 KWCb5Y1Keb4g96HY5e4/a5WTW0yFb2y8905BfPl4s25ikd08OC6lDsUlKlZwBjzAIwkl3
 4N7C7nWxy9BrdGx68Jb0KCIGB6QNdpzfzlr89Jv/NJPuTJXOEzG4PA9LtNky896GvW7Kr
 LUG5IGy8K7MUoCIIavFgeJmNaItm3udaYsP90QYhwKf8xrNQShYUlMIdWqC8hevLxO87e
 y5pRVe4f9sjjd+pTxh9xECdCRrpd1WDIQyT77FOPdWIb/3qzhpWbmpe7NdOuBxFz/rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790498415;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UEBFjjhEUB19UIWA5T7jIaCDYYSvbo01chSfTs9NsGM=;
 b=CK8x1AIkDE6QFstqu9O6B9MGGCopuNTHIyseBctEzuER7MgYSROM8lr5GMJmDVtA3TQz
 uXr/48ENgH4MACz9cSlO8YVuj4GuXHxAzGbwDGUSpfn1im8i5MMHvuluXCSp8f7j9vMws
 koBZuSA1RMuf2DvX6aaQxL0n9+2ARSQK3FzfHt56UaacPZz2eGCIuAtlEMh3pXJFLQ7xU
 maJHhaZJPwVd2czgFEeJFQFwXg86I9MwKSXCwU5BUxSca/jyeLV8joakSjG9B1tskaDjh
 bI0GIMtXa23+DmNT80r7V8L2dzqGzyrfSpk0lItrt7OuB6tvr8YWzMs8w+YAcFl2CPg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C152B40059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:40:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2250791950; Sun, 27 Sep 2026 08:39:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 10:23:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 063863ee5c6f7aafa15820f20f04e66243b727a5
X-Git-Newrev: 1caeb632a6e99e8f4c98e71c4df01eeb8994f055
X-Patchwork-Hint: ignore
Message-Id: <20260927083904.2250791950@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: security bump version to
 1.2.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960932183216169904=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0960932183216169904==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1caeb632a6e99e8f4c98e71c4df01eeb8994f055
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes: CVE-2026-18321:
https://nvd.nist.gov/vuln/detail/cve-2026-18321

- bump version to 1.2.5 (for details see [1])
- rebased 0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
- rebased 0002-disable-PIE-support.patch
- removed 0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
  (from upstream [2])
- moved 0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch to
  0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch, rebased and enhanced
  as the original conflicts with upstream commit 5505260c ("Fix redefined
  _XOPEN_SOURCE warning in refclock_gpsd.c") [3] and leads to the following
  compile failure:

    ../../ntpd/refclock_gpsd.c:113:21: error: operator ‘<’ has no left operand
      113 |   #if _XOPEN_SOURCE < 700
          |                     ^

[1] https://lists.ntpsec.org/pipermail/devel/2026-July/011029.html
[2] https://gitlab.com/NTPsec/ntpsec/-/commit/5137c155d8895cfc50fb577ee720b3b23589c662
[3] https://gitlab.com/NTPsec/ntpsec/-/commit/5505260cd14d2fc72bd1bb255b828c0a1491294b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Julien: mark commit as "security bump"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ove-checks-for-bsd-string.h-fixes-host-co.patch | 14 ++++---
 package/ntpsec/0002-disable-PIE-support.patch      | 12 +++---
 ...ock_gpsd.c-Add-missing-time.h-for-strptim.patch | 47 ----------------------
 ...refclock_gpsd-add-build-fix-for-gcc-14.x.patch} | 11 +++--
 package/ntpsec/ntpsec.hash                         |  2 +-
 package/ntpsec/ntpsec.mk                           |  2 +-
 6 files changed, 24 insertions(+), 64 deletions(-)

diff --git a/package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch b/package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
index d6ac61fc70..c169a20df6 100644
--- a/package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
+++ b/package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
@@ -1,4 +1,4 @@
-From 54fbeaa68a59f536819d1cfb2e9204176fbff54b Mon Sep 17 00:00:00 2001
+From 01d75b8d4624883133964deedc4c83e20adbee82 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Thu, 16 Dec 2021 23:27:35 +0100
 Subject: [PATCH] wscript: remove checks for bsd/string.h, fixes host-compile
@@ -15,6 +15,8 @@ in case target libbsd is found:
         |          ^~~~~~~~~~~~~~
   compilation terminated.
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased on ntpsec-1.2.5]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  include/ntp_stdlib.h |  4 ----
@@ -22,7 +24,7 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  2 files changed, 18 deletions(-)
 
 diff --git a/include/ntp_stdlib.h b/include/ntp_stdlib.h
-index fe4d78e5c..73d97084f 100644
+index 80e4765cf..c6cb04d04 100644
 --- a/include/ntp_stdlib.h
 +++ b/include/ntp_stdlib.h
 @@ -16,10 +16,6 @@
@@ -37,10 +39,10 @@ index fe4d78e5c..73d97084f 100644
  #define NTP_PRINTF(fmt, args) __attribute__((__format__(__printf__, fmt, args)))
  #else
 diff --git a/wscript b/wscript
-index 641073f00..aa04b1d1c 100644
+index 65592c997..ba8939aff 100644
 --- a/wscript
 +++ b/wscript
-@@ -660,19 +660,6 @@ int main(int argc, char **argv) {
+@@ -643,19 +643,6 @@ int main(int argc, char **argv) {
                         prerequisites=ft[1], use=ft[2],
                         mandatory=ft[3])
  
@@ -60,7 +62,7 @@ index 641073f00..aa04b1d1c 100644
      # Nobody uses the symbol, but this seems like a good sanity check.
      ctx.check_cc(header_name="stdbool.h", mandatory=True,
                   comment="Sanity check.")
-@@ -691,7 +678,6 @@ int main(int argc, char **argv) {
+@@ -674,7 +661,6 @@ int main(int argc, char **argv) {
      optional_headers = (
          "alloca.h",
          ("arpa/nameser.h", ["sys/types.h"]),
@@ -69,5 +71,5 @@ index 641073f00..aa04b1d1c 100644
          ("linux/if_addr.h", ["sys/socket.h"]),
          ("linux/rtnetlink.h", ["sys/socket.h"]),
 -- 
-2.34.1
+2.55.0
 
diff --git a/package/ntpsec/0002-disable-PIE-support.patch b/package/ntpsec/0002-disable-PIE-support.patch
index 64eb559de0..b1b1ab23ec 100644
--- a/package/ntpsec/0002-disable-PIE-support.patch
+++ b/package/ntpsec/0002-disable-PIE-support.patch
@@ -1,20 +1,22 @@
-From 712675fbd2a736df817fecd7bfb39055946ef85b Mon Sep 17 00:00:00 2001
+From 93c8fe7187d1f8b2b4a41829272ffefc717165be Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Sun, 13 Aug 2023 13:48:03 +0200
 Subject: [PATCH] disable PIE support
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 Upstream: N/A Not upstreamable
+[Rebased on ntpsec-1.2.5]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  wscript | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/wscript b/wscript
-index 292e3a45b..105c7eac2 100644
+index ba8939aff..bdc3a2748 100644
 --- a/wscript
 +++ b/wscript
-@@ -299,7 +299,6 @@ def configure(ctx):
- 
+@@ -291,7 +291,6 @@ def configure(ctx):
+ #       ('w_everything', "-Weverything"),  # clang
      cc_test_flags = [
          ('PIC', '-fPIC'),
 -        ('PIE', '-pie -fPIE'),
@@ -22,5 +24,5 @@ index 292e3a45b..105c7eac2 100644
          ('unused', '-Qunused-arguments'),
          # This is a useless warning on any architecture with a barrel
 -- 
-2.39.2
+2.55.0
 
diff --git a/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch b/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
deleted file mode 100644
index 0a2ae6a259..0000000000
--- a/package/ntpsec/0003-ntpd-refclock_gpsd.c-Add-missing-time.h-for-strptim.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 904983bf9465017753c6f5b602fc9c98458615f7 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Mon, 27 Oct 2025 12:35:35 -0700
-Subject: [PATCH] ntpd/refclock_gpsd.c: Add missing time.h for strptime()
-
-Upstream: https://gitlab.com/NTPsec/ntpsec/-/commit/5137c155d8895cfc50fb577ee720b3b23589c662
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- ntpd/refclock_gpsd.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/ntpd/refclock_gpsd.c b/ntpd/refclock_gpsd.c
-index 1dfec3103..0a2987d84 100644
---- a/ntpd/refclock_gpsd.c
-+++ b/ntpd/refclock_gpsd.c
-@@ -100,20 +100,20 @@ typedef unsigned long int json_uint;
-  * header stuff we need
-  */
- 
--#include <netdb.h>
--#include <unistd.h>
--#include <fcntl.h>
--#include <string.h>
- #include <ctype.h>
-+#include <fcntl.h>
- #include <math.h>
-+#include <netdb.h>
-+#include <string.h>
-+#include <time.h>         // for strptime()
-+#include <unistd.h>
- 
--#include <sys/types.h>
-+#include <sys/select.h>
- #include <sys/socket.h>
- #include <sys/stat.h>
-+#include <sys/types.h>
- #include <netinet/tcp.h>
- 
--#include <sys/select.h>
--
- #include "ntpd.h"
- #include "ntp_io.h"
- #include "ntp_refclock.h"
--- 
-2.47.3
-
diff --git a/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch b/package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
similarity index 68%
rename from package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
rename to package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
index 821a34e966..0b5832ba27 100644
--- a/package/ntpsec/0004-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
+++ b/package/ntpsec/0003-refclock_gpsd-add-build-fix-for-gcc-14.x.patch
@@ -1,4 +1,4 @@
-From 55c230d61ece7213506f1dccac76c21aefbade9e Mon Sep 17 00:00:00 2001
+From 19cba844e9df1ed3942d44a83cf7875bb52d9a33 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd@kuhls.net>
 Date: Mon, 27 Oct 2025 19:18:13 +0100
 Subject: [PATCH] refclock_gpsd: add build fix for gcc => 14.x
@@ -10,23 +10,26 @@ Subject: [PATCH] refclock_gpsd: add build fix for gcc => 14.x
 Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1484
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Rebased on ntpsec-1.2.5 and fixed for changes from upstream commit
+ 5505260c ("Fix redefined _XOPEN_SOURCE warning in refclock_gpsd.c")]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  ntpd/refclock_gpsd.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/ntpd/refclock_gpsd.c b/ntpd/refclock_gpsd.c
-index a4a6f7095..a3995896a 100644
+index a316f724a..55d4dfe83 100644
 --- a/ntpd/refclock_gpsd.c
 +++ b/ntpd/refclock_gpsd.c
 @@ -59,6 +59,8 @@
   */
  
  
-+#define _XOPEN_SOURCE
++#define _XOPEN_SOURCE 700
 +#define _DEFAULT_SOURCE
  #include "config.h"
  #include "ntp.h"
  #include "ntp_types.h"
 -- 
-2.47.3
+2.55.0
 
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 40c06d6926..768ee75a86 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3abc1b057a252d214ef2e76aa375fe0d81432c626e75304b17850d68eee0c54f  ntpsec-NTPsec_1_2_4.tar.bz2
+sha256  48717ea84a8c89bfa082ab5d0dc58b44e6328158632e77d2a74c85b7a509e498  ntpsec-NTPsec_1_2_5.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index d48bc5baa9..0fa8a3f527 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.4
+NTPSEC_VERSION = 1.2.5
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \

--===============0960932183216169904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0960932183216169904==--

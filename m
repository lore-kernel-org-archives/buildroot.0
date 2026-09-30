Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE5ACA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1380740D06;
	Thu,  1 Oct 2026 14:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzdz340Po_yG; Thu,  1 Oct 2026 14:23:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B2F1540A44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864584;
	b=DazBxXf0B/W8PuVWPv46kxzzgBflomRQFmvQZTScErnFV8F4k94LWS4Ys8Pm9OpZVkZQ
	 dhwDWbv/4Wh4S+ec66ZzhpoQGFCqEepczkDIAtWra9N1JJeSmsqB+BGQAXlmXYtOWD8gP
	 LLhWkJmvakPCkQ1tHIqs4u40rHMnWFTNncecvCJQhTRW5SEIfLxEn1/BmaT99JCdpYz+W
	 T+BqfQw0AsPFWfsTtDzbOrjegB8lk1tpC1syhogSHHXyOK2MY5Iz1sOi8N5XnM32vll/T
	 B/H/SRBkBTtj8Gow27zCaUyhBJpz+FXrCjYFsihqesdGoSIzltRndzKs7FKrRpPH5lA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864584;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4g89xmiqCoym9aHI1cBsNVXW3TZGOo4uBxV50fJwGzc=;
	b=hQdDjFvE5RYQjtw4bYp855Tf9F5B5CLoI4og8IV1xycjnni/EnvQOK9cMte/+rTF+toY
	 zzVldYgE8Iv3e61VMfzg8ouLFtqgwbg5CgWSshToyl7qA9vI8BYCOvVJQwjjtpMmJ00ar
	 Vps3IihIHGwlUgOfwRbkyL1HfCvwaGghM6UsASckRL8qTstxRXvAEwuvYDiegkxyq0qa7
	 6Pgw84GBRdYhIVDuiOD67Omw1pQ28P3uFZjE5zNIjRgBN29ie5/UOkBwXUDqKk/bdoOba
	 D7ogmt9JRMvwIBTm/aK66c/D9+cNXj4EpUSNlyxu8NGdbid23mxAkOvvsjr+lKS5Svw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864584;
	bh=4g89xmiqCoym9aHI1cBsNVXW3TZGOo4uBxV50fJwGzc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k0lE/dDcp4WKsjYYDlzsArqs434SGKsrBMjtlHPXxD3fpW435GhUJK5C/womzMeow
	 TpKFCiTf1kai2cG5yZqrmLBEJaYaSnGYg4+9wRN656sxov3ejMhMUE0actjRDGQQjr
	 Ku8kG1LVR34F2aHTIGM8fKMQDVN48AGVjLiyUgnwq12SgrLlRAbZUPsVbSnVTeEKKb
	 v8XgbWWKuAtUMKUcvRj8AhjIivPi3G7gwadkqLGIMzHNDHpAhhJSFFEf8XY2gbj67/
	 +jEG+s2saJF6Q6tji7SHtRp6l7qzzPzu7v27d8U+/W75agO54gV0m6ZhcLu0wvwgLm
	 SRYQZaNU2meuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F1540A44;
	Thu,  1 Oct 2026 14:23:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1622A32A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC93E80DD8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBhtIZ2Ax46N for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BFC0180E57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=jo0KQGbonFxaiiex4mTcN6zolYvdB8R7Bbg7QVsQ9Z4AKBcDi+uVDjnYNXHMwm3Ca6WK
 hC9bNPvWA+qhPIJ75XLrY77oJCA4m7AbsBKW9g3VrpYFgAwYXfKe2rkoj8OCDtHlWkD7w
 3sQsu16f6uVexg6UEH4CQXPDz3IAtXIBi3DDTh3klYSzyV3q3iCMzv7DIMt67BXFMGCuP
 z+ltpjlxj4xmI3e5wTkkf3VE0SYCdCCKDof1KrTS1tI6SWTX6CfZqJoY9vt3RVbbegFZr
 Qoe49SrchVcEvg2ThW0E2eJSR4Aoo+88qRpi226eOKlhgSkrT6GM+XwYeZ5bclv/GDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6fWFfYSPGR+7Hv3w1ZNRFVvm2Da4IjU6biAceO7mclc=;
 b=ns8EQyrS1VbdnHge99BA4QOPjlsVUAd/PJz4iC2NME2GnqdULIgMa0AVgCinq9gUkNMF
 krIvhrCigkn+sXPXHpwaL5ljGHW7p7M7hP5pEJZNo3B6MekK5oWmHvSQ1ajzPpzqlqdJe
 CrXwwrcwY2IySt3L2HUCIASIR8nZjgJnr4YJmBLyXJ1zP0VtGs2v9IrK/ErYQax5xG8Un
 6MpXJtLC0qgxs3axMXVAR26o8PMW56usAoZzlfzg25qS5o5xKNBWWkF7gf3IxASadsjQs
 gcfmHICj9BinHZw+CW7QTe9Fyj6VPkNicOoqSWRMdhDzLxNMStCgv+Tp8bywnVn5Ntw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC0180E57
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1400195B8E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:10:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d01d6c48a0fba91680c8a3ddb19492576ffc1998
X-Git-Newrev: 5a1582ca0e7f25ad742d88fc7a0fc14211dbf996
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.1400195B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ntpsec: security
 bump version to 1.2.5
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
Content-Type: multipart/mixed; boundary="===============6291532537369100983=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6291532537369100983==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a1582ca0e7f25ad742d88fc7a0fc14211dbf996
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 1caeb632a6e99e8f4c98e71c4df01eeb8994f055)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============6291532537369100983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6291532537369100983==--

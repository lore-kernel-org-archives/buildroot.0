Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2BFC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 18:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C83680B4B;
	Tue, 27 Sep 2022 18:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C83680B4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cr3xnuBYU16N; Tue, 27 Sep 2022 18:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FE480B27;
	Tue, 27 Sep 2022 18:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FE480B27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B22D1BF2BE
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 18:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 832E1400F1
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 18:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 832E1400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4USruyTtw4z for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 18:44:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDCD9400C8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDCD9400C8
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 18:44:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s14so16438654wro.0
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 11:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RHGBg3m7dKNf7nbZr5bKdWmzOInrS+V/ZIbpRLLTRR4=;
 b=TjKj9gxVs19fMD42XevBQqdISxeGR1vgM3EdnodyD9Ic2NHKKsXXoTOkik/yNv8XFt
 cAeikLGGYLejtJX4jUv6zzoTmfatoxc2Vw7SQbCij5fSO/Xzn8Z9LDkqXPEyNjJwl8M/
 LOO5orCRPbhp/mpRPgtkELkUEo+R/XqYPqlDfHrEjGEtFvUKLNPzoDWuw673RaiVv2Hq
 n9Ma3YmEVsvxj78ySL9RbEg06NGtR+XPhN6m+msD49YtNes0aBaf9IQjwktCTRbUFR3b
 1E3yxhnZJB5sB5H5PbIL10KL67/KRmaQIrlNyACC+hA4DItlluTmXLElzfRZic82TZgh
 kMLQ==
X-Gm-Message-State: ACrzQf2OM/h4+zd1/DfS4joLPOQxX/GCRZq3+CY/SVY2BHsKd3IzMzqu
 xCsR6c+xftDQTwvDozoXSupmrGvYMbs=
X-Google-Smtp-Source: AMsMyM6fJjmaxGNn0bIZHauuD0dm9I5dhd1LhvdGl9GI5VUyPHLF60guWHACSlwhYkGl3B2gyhqdRg==
X-Received: by 2002:a05:6000:1e0d:b0:22c:aa08:5272 with SMTP id
 bj13-20020a0560001e0d00b0022caa085272mr6785463wrb.296.1664304246658; 
 Tue, 27 Sep 2022 11:44:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v187-20020a1cacc4000000b003b492338f45sm2512585wme.39.2022.09.27.11.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 11:44:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 20:44:01 +0200
Message-Id: <20220927184401.12423-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RHGBg3m7dKNf7nbZr5bKdWmzOInrS+V/ZIbpRLLTRR4=;
 b=WCHc36slmsx932FjE67+jYVrmaK+cv7o+vg9jAvanEWVh7t6+7EMGO1sHMfAchgqPb
 XeY2pC2W86ao6AU6ltIeItUhDJBtgNWOjKaEwJCHc6LXMrJqPdmwdIcjYOzz0QXz0HPz
 7F9p/NB4w81ooeRykhw/eYxYI8l7mpsfRWZ4SJ9Fc5F99XY/jI4ssK/S+XHP+ojswdKY
 eEFCUo18yKcGtEQz2UHHDqOsvowe5RngEv7CRRAuRubE15T597wQCZxnYpK3mcLog8qc
 XAOGY2xduc/j3O79ak9B9mn+xbJl49G57lM1uvg7FOISo0T0f/iY8gpGM44HUNfWz6qk
 BhdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WCHc36sl
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: security bump to version
 2.87
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-0934:
  https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2022q1/016274.html
- Drop patches (already in version)
- Update hash of COPYING, slight updates:
  https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commitdiff;h=858bfcf261e12a0baf4de6dbbf3b8858bab7cc53

https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2022q3/016560.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-src-option.c-fix-build-with-gcc-4.8.patch | 52 -----------------
 ...9080ff8743133fbd52427b4b2213171-typo.patch | 36 ------------
 ...-not-DNSSEC-compile-options-selected.patch | 34 -----------
 ...src-pattern.c-fix-build-with-gcc-4.8.patch | 57 -------------------
 package/dnsmasq/dnsmasq.hash                  |  6 +-
 package/dnsmasq/dnsmasq.mk                    |  2 +-
 6 files changed, 4 insertions(+), 183 deletions(-)
 delete mode 100644 package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
 delete mode 100644 package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
 delete mode 100644 package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
 delete mode 100644 package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch

diff --git a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 50ecf2f18a..0000000000
--- a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 46312909d9080ff8743133fbd52427b4b2213171 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 31 Dec 2021 17:29:44 +0100
-Subject: [PATCH] src/option.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 raised since version 2.86:
-
-option.c: In function 'one_opt':
-option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
-           for (char *p = arg; *p; p++) {
-           ^
-option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
-option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
-           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
-           ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream commit 46312909d9080ff8743133fbd52427b4b2213171]
----
- src/option.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/option.c b/src/option.c
-index ff54def..c57f6d8 100644
---- a/src/option.c
-+++ b/src/option.c
-@@ -2525,7 +2525,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
-           arg += 9;
-           if (strlen(arg) != 16)
-               ret_err(gen_err);
--          for (char *p = arg; *p; p++) {
-+          char *p;
-+          for (*p = arg; *p; p++) {
-             if (!isxdigit((int)*p))
-               ret_err(gen_err);
-           }
-@@ -2533,7 +2534,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
- 
-           u8 *u = daemon->umbrella_device;
-           char word[3];
--          for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
-+          u8 i;
-+          for (i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
-             memcpy(word, &(arg[0]), 2);
-             *u++ = strtoul(word, NULL, 16);
-           }
--- 
-2.33.0
-
diff --git a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
deleted file mode 100644
index 8cdf5b3f1b..0000000000
--- a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2748fb81e23b71e2c44956e99321816aca91905d Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Sat, 1 Jan 2022 23:03:26 +0000
-Subject: [PATCH] Fix 46312909d9080ff8743133fbd52427b4b2213171 typo.
-
-[Upstream commit 2748fb81e23b71e2c44956e99321816aca91905d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com> 
----
- src/option.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/option.c b/src/option.c
-index c57f6d8..6f56ce8 100644
---- a/src/option.c
-+++ b/src/option.c
-@@ -357,7 +357,7 @@ static const struct myoption opts[] =
-     { "dhcp-ignore-clid", 0, 0,  LOPT_IGNORE_CLID },
-     { "dynamic-host", 1, 0, LOPT_DYNHOST },
-     { "log-debug", 0, 0, LOPT_LOG_DEBUG },
--	{ "umbrella", 2, 0, LOPT_UMBRELLA },
-+    { "umbrella", 2, 0, LOPT_UMBRELLA },
-     { "quiet-tftp", 0, 0, LOPT_QUIET_TFTP },
-     { NULL, 0, 0, 0 }
-   };
-@@ -2526,7 +2526,7 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
-           if (strlen(arg) != 16)
-               ret_err(gen_err);
-           char *p;
--          for (*p = arg; *p; p++) {
-+          for (p = arg; *p; p++) {
-             if (!isxdigit((int)*p))
-               ret_err(gen_err);
-           }
--- 
-2.33.0
-
diff --git a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
deleted file mode 100644
index 9c98af2be5..0000000000
--- a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2c60441239e1c10c4987cb586653b1ea08f703c0 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Tue, 28 Sep 2021 23:42:15 +0100
-Subject: [PATCH] Fix FTBFS when CONNTRACK and UBUS but not DNSSEC compile
- options selected.
-
-[Retrieved from:
-https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=2c60441239e1c10c4987cb586653b1ea08f703c0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/dnsmasq.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/dnsmasq.h b/src/dnsmasq.h
-index c8a918a..3fdc1b0 100644
---- a/src/dnsmasq.h
-+++ b/src/dnsmasq.h
-@@ -1173,9 +1173,12 @@ extern struct daemon {
-   char *packet; /* packet buffer */
-   int packet_buff_sz; /* size of above */
-   char *namebuff; /* MAXDNAME size buffer */
-+#if (defined(HAVE_CONNTRACK) && defined(HAVE_UBUS)) || defined(HAVE_DNSSEC)
-+  /* CONNTRACK UBUS code uses this buffer, as well as DNSSEC code. */
-+  char *workspacename;
-+#endif
- #ifdef HAVE_DNSSEC
-   char *keyname; /* MAXDNAME size buffer */
--  char *workspacename; /* ditto */
-   unsigned long *rr_status; /* ceiling in TTL from DNSSEC or zero for insecure */
-   int rr_status_sz;
-   int dnssec_no_time_check;
--- 
-2.20.1
-
diff --git a/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 90bb02b23a..0000000000
--- a/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 0c89dd2fa0fe50b00bca638dbbacfbd361526e0a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 2 Jan 2022 21:57:52 +0100
-Subject: [PATCH] src/pattern.c: fix build with gcc 4.8
-
-Fix the following build failure:
-
-pattern.c: In function 'is_valid_dns_name':
-pattern.c:134:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (const char *c = value;; c++)
-   ^
-pattern.c:134:3: note: use option -std=c99 or -std=gnu99 to compile your code
-pattern.c: In function 'is_valid_dns_name_pattern':
-pattern.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (const char *c = value;; c++)
-   ^
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=b2690415bfa1bc105e61b75f642fb5c1aaf0fae8]
----
- src/pattern.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/pattern.c b/src/pattern.c
-index 03e23b9..928d259 100644
---- a/src/pattern.c
-+++ b/src/pattern.c
-@@ -129,9 +129,9 @@ int is_valid_dns_name(const char *value)
-   
-   size_t num_bytes = 0;
-   size_t num_labels = 0;
--  const char *label = NULL;
-+  const char *c, *label = NULL;
-   int is_label_numeric = 1;
--  for (const char *c = value;; c++)
-+  for (c = value;; c++)
-     {
-       if (*c &&
- 	  *c != '-' && *c != '.' &&
-@@ -242,11 +242,11 @@ int is_valid_dns_name_pattern(const char *value)
-   
-   size_t num_bytes = 0;
-   size_t num_labels = 0;
--  const char *label = NULL;
-+  const char *c, *label = NULL;
-   int is_label_numeric = 1;
-   size_t num_wildcards = 0;
-   int previous_label_has_wildcard = 1;
--  for (const char *c = value;; c++)
-+  for (c = value;; c++)
-     {
-       if (*c &&
- 	  *c != '*' && /* Wildcard. */
--- 
-2.20.1
-
diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 804012821e..78127ca714 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.86.tar.xz.asc
-sha256  28d52cfc9e2004ac4f85274f52b32e1647b4dbc9761b82e7de1e41c49907eb08  dnsmasq-2.86.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.87.tar.xz.asc
+sha256  0228c0364a7f2356fd7e7f1549937cbf3099a78d3b2eb1ba5bb0c31e2b89de7a  dnsmasq-2.87.tar.xz
 # Locally calculated
-sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 230e4a8116..46a40c4bbb 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.86
+DNSMASQ_VERSION = 2.87
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

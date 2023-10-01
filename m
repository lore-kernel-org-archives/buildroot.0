Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCDEE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6A241753;
	Sun,  1 Oct 2023 14:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C6A241753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cICXYDTge9FW; Sun,  1 Oct 2023 14:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15C4641769;
	Sun,  1 Oct 2023 14:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C4641769
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5BF1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 477C340545
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 477C340545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AaT7uldsruE5 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:20:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D45140004
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D45140004
Received: by mail.gandi.net (Postfix) with ESMTPSA id 771181C0004;
 Sun,  1 Oct 2023 14:20:26 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qmxJ3-00Gc7t-Pl; Sun, 01 Oct 2023 16:20:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 16:20:24 +0200
Message-Id: <20231001142024.3959758-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/cups: add upstream security fix for
 CVE-2023-4504
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-4504: Postscript Parsing Heap Overflow

https://github.com/OpenPrinting/cups/security/advisories/GHSA-pf5r-86w9-678h
https://takeonme.org/cves/CVE-2023-4504.html

There is a 2.4.7 release with this fix, but upstream unfortunately broke
!gnutls builds, so backport the security fix instead:

https://github.com/OpenPrinting/cups/issues/762

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...raster-interpret.c-Fix-CVE-2023-4504.patch | 45 +++++++++++++++++++
 package/cups/cups.mk                          |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch

diff --git a/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch b/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch
new file mode 100644
index 0000000000..d1dff4e1fa
--- /dev/null
+++ b/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch
@@ -0,0 +1,45 @@
+From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 20 Sep 2023 14:45:17 +0200
+Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
+
+We didn't check for end of buffer if it looks there is an escaped
+character - check for NULL terminator there and if found, return NULL
+as return value and in `ptr`, because a lone backslash is not
+a valid PostScript character.
+
+Upstream: https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31
+[Peter: drop CHANGES hunk]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ cups/raster-interpret.c | 14 +++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
+index 6fcf731b5..b8655c8c6 100644
+--- a/cups/raster-interpret.c
++++ b/cups/raster-interpret.c
+@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
+ 
+ 	    cur ++;
+ 
+-            if (*cur == 'b')
++	   /*
++	    * Return NULL if we reached NULL terminator, a lone backslash
++	    * is not a valid character in PostScript.
++	    */
++
++	    if (!*cur)
++	    {
++	      *ptr = NULL;
++
++	      return (NULL);
++	    }
++
++	    if (*cur == 'b')
+ 	      *valptr++ = '\b';
+ 	    else if (*cur == 'f')
+ 	      *valptr++ = '\f';
+-- 
+2.30.2
+
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index a3bb2f8dfc..4bc5eeedee 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -13,6 +13,9 @@ CUPS_CPE_ID_VENDOR = openprinting
 CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
+# 0005-raster-interpret.c-Fix-CVE-2023-4504.patch
+CUPS_IGNORE_CVES += CVE-2023-4504
+
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
 define CUPS_RUN_AUTOCONF
 	cd $(@D); $(AUTOCONF) -f
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

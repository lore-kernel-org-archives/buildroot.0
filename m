Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD48EC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 640794033C;
	Sun,  5 Mar 2023 17:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 640794033C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0j6p9rlNsQzD; Sun,  5 Mar 2023 17:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABAA40A05;
	Sun,  5 Mar 2023 17:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ABAA40A05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8621F1BF868
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14EAF60E46
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14EAF60E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2uyfifwNbEZ for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1642560E53
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1642560E53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05E5D861FB; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:34:58 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: a1d2b230f8a176137ab051094755bfadbadbadab
X-Git-Newrev: 1894957267d1cba00c94521548ec2d2b36bcc560
X-Patchwork-Hint: ignore
Message-Id: <20230305173948.05E5D861FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wpa_supplicant:
 fix builds with missing sha384 hash functions
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

commit: https://git.buildroot.net/buildroot/commit/?id=1894957267d1cba00c94521548ec2d2b36bcc560
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

SAE, unlike OWE or DPP, does not explicitly enable support for sha384
hash functions. Possible WPA3 build issue is masked, since all three
SAE/OWE/DPP are included. However, there exist other configurations
that enable only SAE. For instance, one such build configuration is
wpa_supplicant AP mode with mesh support.

This change adds upstream patch that includes sha384 and sha256 hash
functions to builds with SAE support.

Fixes: http://autobuild.buildroot.net/results/f349130985870f4a781cca56c3f551108f81aa3e/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 93b461bb5e34ec25c9aac3024b41d132736c5dd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...C-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch b/package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch
new file mode 100644
index 0000000000..98df56e540
--- /dev/null
+++ b/package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch
@@ -0,0 +1,64 @@
+From c7f71fb8679c4cdd2607dbaac467a1d5efe9f0f9 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 17 Apr 2022 12:28:41 +0300
+Subject: [PATCH] Include HMAC-SHA384/512 KDF for SAE if SHA384/512 is included
+
+It was possible to miss the HMAC functions if some other build
+configuration parameters ended up setting NEED_SHA384/512=y.
+
+Upstream: https://w1.fi/cgit/hostap/commit/?id=c7f71fb8679c4cdd2607dbaac467a1d5efe9f0f9
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ wpa_supplicant/Android.mk | 11 +++++++++++
+ wpa_supplicant/Makefile   | 11 +++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/wpa_supplicant/Android.mk b/wpa_supplicant/Android.mk
+index 0e0ce467c..bcdbd6c90 100644
+--- a/wpa_supplicant/Android.mk
++++ b/wpa_supplicant/Android.mk
+@@ -1361,6 +1361,17 @@ endif
+ endif
+ endif
+ 
++ifdef CONFIG_SAE
++ifdef NEED_SHA384
++# Need to add HMAC-SHA384 KDF as well, if SHA384 was enabled.
++NEED_HMAC_SHA384_KDF=y
++endif
++ifdef NEED_SHA512
++# Need to add HMAC-SHA512 KDF as well, if SHA512 was enabled.
++NEED_HMAC_SHA512_KDF=y
++endif
++endif
++
+ SHA256OBJS = # none by default
+ L_CFLAGS += -DCONFIG_SHA256
+ ifneq ($(CONFIG_TLS), openssl)
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index ed49aa972..69c80121c 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1475,6 +1475,17 @@ endif
+ endif
+ endif
+ 
++ifdef CONFIG_SAE
++ifdef NEED_SHA384
++# Need to add HMAC-SHA384 KDF as well, if SHA384 was enabled.
++NEED_HMAC_SHA384_KDF=y
++endif
++ifdef NEED_SHA512
++# Need to add HMAC-SHA512 KDF as well, if SHA512 was enabled.
++NEED_HMAC_SHA512_KDF=y
++endif
++endif
++
+ SHA256OBJS = # none by default
+ CFLAGS += -DCONFIG_SHA256
+ ifneq ($(CONFIG_TLS), openssl)
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

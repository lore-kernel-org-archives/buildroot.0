Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC0EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 19:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D3A040620;
	Thu,  7 Apr 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Br27gwHSl2Xq; Thu,  7 Apr 2022 19:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F1F740D81;
	Thu,  7 Apr 2022 19:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 965431BF282
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81738417E5
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4w1Dusv8m-pm for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 19:57:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D3AA4182D
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 19:57:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F10B183701; Thu,  7 Apr 2022 19:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Apr 2022 21:55:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cf458ccc3864f975e56a719e01f18d3caf8c2d8d
X-Git-Newrev: a2e374f3b9fcde71bb363cb70d9ccb3aeb7ef3ea
X-Patchwork-Hint: ignore
Message-Id: <20220407194802.F10B183701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/apr: fix
 CVE-2021-35940
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2e374f3b9fcde71bb363cb70d9ccb3aeb7ef3ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

An out-of-bounds array read in the apr_time_exp*() functions was fixed
in the Apache Portable Runtime 1.6.3 release (CVE-2017-12613). The fix
for this issue was not carried forward to the APR 1.7.x branch, and
hence version 1.7.0 regressed compared to 1.6.3 and is vulnerable to the
same issue.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 10d80eb39aed471b6c47400e1b155c94a61d8e61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/0004-apr-1.7.0-CVE-2021-35940.patch | 57 +++++++++++++++++++++++++
 package/apr/apr.mk                              |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
new file mode 100644
index 0000000000..b065a3330a
--- /dev/null
+++ b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
@@ -0,0 +1,57 @@
+
+SECURITY: CVE-2021-35940 (cve.mitre.org)
+
+Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
+was addressed in 1.6.x in 1.6.3 and later via r1807976.
+
+The fix was merged back to 1.7.x in r1891198.
+
+Since this was a regression in 1.7.0, a new CVE name has been assigned
+to track this, CVE-2021-35940.
+
+Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
+
+https://svn.apache.org/viewvc?view=revision&revision=1891198
+
+[Retrieved from:
+https://dist.apache.org/repos/dist/release/apr/patches/apr-1.7.0-CVE-2021-35940.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Index: ./time/unix/time.c
+===================================================================
+--- ./time/unix/time.c	(revision 1891197)
++++ ./time/unix/time.c	(revision 1891198)
+@@ -142,6 +142,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
+Index: ./time/win32/time.c
+===================================================================
+--- ./time/win32/time.c	(revision 1891197)
++++ ./time/win32/time.c	(revision 1891198)
+@@ -54,6 +54,9 @@
+     static const int dayoffset[12] =
+     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
+ 
++    if (tm->wMonth < 1 || tm->wMonth > 12)
++        return APR_EBADDATE;
++
+     /* Note; the caller is responsible for filling in detailed tm_usec,
+      * tm_gmtoff and tm_isdst data when applicable.
+      */
+@@ -228,6 +231,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 7ff2c007b4..77217ccbb3 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -16,6 +16,9 @@ APR_INSTALL_STAGING = YES
 # so we need to autoreconf:
 APR_AUTORECONF = YES
 
+# 0004-apr-1.7.0-CVE-2021-35940.patch
+APR_IGNORE_CVES += CVE-2021-35940
+
 # avoid apr_hints.m4 by setting apr_preload_done=yes and set
 # the needed CFLAGS on our own (avoids '-D_REENTRANT' in case
 # not supported by toolchain and subsequent configure failure)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B738C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DA1610CE;
	Wed,  7 Dec 2022 13:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DA1610CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyxNkOyL1o8X; Wed,  7 Dec 2022 13:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11796610BC;
	Wed,  7 Dec 2022 13:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11796610BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5091BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4917840156
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4917840156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLEW565Wj_hE for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC064402F2
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC064402F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B978B85DE3; Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 14:35:46 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e101c2edd67be39b8aea95a6386f4663c6fbaf39
X-Git-Newrev: bad10e2f946bf9c1ccfc8e9ecea162697908d0fc
X-Patchwork-Hint: ignore
Message-Id: <20221207133943.B978B85DE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libarchive: fix
 CVE-2022-36227
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

commit: https://git.buildroot.net/buildroot/commit/?id=bad10e2f946bf9c1ccfc8e9ecea162697908d0fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

In libarchive 3.6.1, the software does not check for an error after
calling calloc function that can return with a NULL pointer if the
function fails, which leads to a resultant NULL pointer dereference.
NOTE: the discoverer cites this CWE-476 remark but third parties dispute
the code-execution impact: "In rare circumstances, when NULL is
equivalent to the 0x0 memory address and privileged code can access it,
then writing or reading memory is possible, which may lead to code
execution."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d74137341d009e9a0dd79bca80015548f5af92ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...libarchive-Handle-a-calloc-returning-NULL.patch | 38 ++++++++++++++++++++++
 package/libarchive/libarchive.mk                   |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
new file mode 100644
index 0000000000..75ce6112fe
--- /dev/null
+++ b/package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch
@@ -0,0 +1,38 @@
+From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
+
+[Retrieved from:
+https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 66592e826..27626b541 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
+ 	struct archive_write_filter *f;
+ 
+ 	f = calloc(1, sizeof(*f));
++
++	if (f == NULL)
++		return (NULL);
++
+ 	f->archive = _a;
+ 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
+ 	if (a->filter_first == NULL)
+@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
+ 	a->client_data = client_data;
+ 
+ 	client_filter = __archive_write_allocate_filter(_a);
++
++	if (client_filter == NULL)
++		return (ARCHIVE_FATAL);
++
+ 	client_filter->open = archive_write_client_open;
+ 	client_filter->write = archive_write_client_write;
+ 	client_filter->close = archive_write_client_close;
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 865f605e2f..649b7dd4dc 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -12,6 +12,9 @@ LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
 
+# 0001-libarchive-Handle-a-calloc-returning-NULL.patch
+LIBARCHIVE_IGNORE_CVES += CVE-2022-36227
+
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBARCHIVE_CONF_OPTS += --enable-bsdtar=static
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

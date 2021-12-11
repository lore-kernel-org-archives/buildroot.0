Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80AA784C75;
	Sat, 11 Dec 2021 23:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gnaXtCttRap; Sat, 11 Dec 2021 23:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD8684C68;
	Sat, 11 Dec 2021 23:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0E621BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB1660C0E
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TB9t6-Ej4_F8 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A3E460BFE
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A8E6282A50; Sat, 11 Dec 2021 23:01:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 23:40:35 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fd952fa2c63122fc77468497864c10c1a8dd3ce6
X-Git-Newrev: 69fa2d879c0f08c25e5c94cdf1801ddc3b98a181
X-Patchwork-Hint: ignore
Message-Id: <20211211230107.A8E6282A50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pure-ftpd: fix
 CVE-2021-40524
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

commit: https://git.buildroot.net/buildroot/commit/?id=69fa2d879c0f08c25e5c94cdf1801ddc3b98a181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

In Pure-FTPd 1.0.49, an incorrect max_filesize quota mechanism in the
server allows attackers to upload files of unbounded size, which may
lead to denial of service or a server hang. This occurs because a
certain greater-than-zero test does not anticipate an initial -1 value.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4fd5d8df2a1c468d78ca517e0b304edeebe21ff3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-upload-file-size-when-quotas-are-enabled.patch | 33 ++++++++++++++++++++++
 package/pure-ftpd/pure-ftpd.mk                     |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch b/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
new file mode 100644
index 0000000000..b269e6cfe7
--- /dev/null
+++ b/package/pure-ftpd/0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
@@ -0,0 +1,33 @@
+From 37ad222868e52271905b94afea4fc780d83294b4 Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Tue, 23 Nov 2021 18:53:34 +0100
+Subject: [PATCH] Initialize the max upload file size when quotas are enabled
+
+Due to an unwanted check, files causing the quota to be exceeded
+were deleted after the upload, but not during the upload.
+
+The bug was introduced in 2009 in version 1.0.23
+
+Spotted by @DroidTest, thanks!
+
+[Retrieved from:
+https://github.com/jedisct1/pure-ftpd/commit/37ad222868e52271905b94afea4fc780d83294b4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/ftpd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/ftpd.c b/src/ftpd.c
+index d856839..be2fd78 100644
+--- a/src/ftpd.c
++++ b/src/ftpd.c
+@@ -4247,8 +4247,7 @@ void dostor(char *name, const int append, const int autorename)
+     if (quota_update(&quota, 0LL, 0LL, &overflow) == 0 &&
+         (overflow > 0 || quota.files >= user_quota_files ||
+          quota.size > user_quota_size ||
+-         (max_filesize >= (off_t) 0 &&
+-          (max_filesize = user_quota_size - quota.size) < (off_t) 0))) {
++         (max_filesize = user_quota_size - quota.size) < (off_t) 0)) {
+         overflow = 1;
+         (void) close(f);
+         goto afterquota;
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 7e3d18b433..35a1aac917 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -21,6 +21,9 @@ PURE_FTPD_IGNORE_CVES += CVE-2020-9365
 # 0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
 PURE_FTPD_IGNORE_CVES += CVE-2020-9274
 
+# 0004-Initialize-the-max-upload-file-size-when-quotas-are-enabled.patch
+PURE_FTPD_IGNORE_CVES += CVE-2021-40524
+
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
 	--with-puredb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

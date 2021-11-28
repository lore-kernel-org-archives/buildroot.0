Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7861C433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C76360726;
	Sun, 28 Nov 2021 13:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drGTiP-W0uiN; Sun, 28 Nov 2021 13:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E9360725;
	Sun, 28 Nov 2021 13:39:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9EE1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 608AC40106
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIr93ZykZmTD for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:39:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63AC840260
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:39:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D33669034E; Sun, 28 Nov 2021 13:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 14:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d317b76458163f718db9fc274e7a7839e4a39b43
X-Git-Newrev: 4fd5d8df2a1c468d78ca517e0b304edeebe21ff3
X-Patchwork-Hint: ignore
Message-Id: <20211128133428.D33669034E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pure-ftpd: fix CVE-2021-40524
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fd5d8df2a1c468d78ca517e0b304edeebe21ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Pure-FTPd 1.0.49, an incorrect max_filesize quota mechanism in the
server allows attackers to upload files of unbounded size, which may
lead to denial of service or a server hang. This occurs because a
certain greater-than-zero test does not anticipate an initial -1 value.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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

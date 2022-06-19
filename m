Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F28D8242D;
	Sun, 19 Jun 2022 15:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F28D8242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNDs6sQXieYD; Sun, 19 Jun 2022 15:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 216B682444;
	Sun, 19 Jun 2022 15:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 216B682444
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 336CD1BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DF8408F2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DF8408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T47cVL30Hh7i for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90772408EF
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90772408EF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5A0E7873C0; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f90061fc384d42805145e0c6cfa01de0afe48f31
X-Git-Newrev: e122d962a1415fb595286ad71771701f9860765d
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.5A0E7873C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ecryptfs-utils: add libgpgme
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e122d962a1415fb595286ad71771701f9860765d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 393ea4da78..6eb3add98b 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -16,6 +16,15 @@ ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
 ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
 
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+ECRYPTFS_UTILS_CONF_OPTS += \
+	--enable-gpg \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr
+ECRYPTFS_UTILS_DEPENDENCIES += libgpgme
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-gpg
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
 ECRYPTFS_UTILS_DEPENDENCIES += linux-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

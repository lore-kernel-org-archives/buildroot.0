Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70405D743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B31E60C14;
	Wed, 20 Nov 2024 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rs12FvDhCfqf; Wed, 20 Nov 2024 21:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 665E060BCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 665E060BCF;
	Wed, 20 Nov 2024 21:03:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B4F85B28
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 397E685115
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ch3t5eL7erNd for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACD085125
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ACD085125
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56700864E7; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:43:12 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 9ffb14ced94a106e05b81de4f3029ee711d127b2
X-Git-Newrev: d184ae6720fcfda2e3980e45f1c1f3de49a8e485
X-Patchwork-Hint: ignore
Message-Id: <20241120210257.56700864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/linux-pam: adjust
 login pam file for lastlog
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d184ae6720fcfda2e3980e45f1c1f3de49a8e485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

when pam_lastlog.so is not installed login issues an error
that it is not able to load it.

Hence only enable the entry when pam_lastlog.so is installed.

Fixes:
 login[649]: PAM unable to dlopen(/lib/security/pam_lastlog.so): /lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
 login[649]: PAM adding faulty module: /lib/security/pam_lastlog.so

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee5c08aa88757c214172161b469437450880a7f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-pam/linux-pam.mk | 5 +++++
 package/linux-pam/login.pam    | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index a5b8c9151f..23b09efbae 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -56,6 +56,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
 LINUX_PAM_CONF_OPTS += --enable-lastlog
+define LINUX_PAM_LASTLOG_PAMFILE_TWEAK
+	$(SED) 's/^# \(.*pam_lastlog.so.*\)$$/\1/' \
+		$(TARGET_DIR)/etc/pam.d/login
+endef
 else
 LINUX_PAM_CONF_OPTS += --disable-lastlog
 endif
@@ -66,6 +70,7 @@ define LINUX_PAM_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/pam.d/login
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
 		$(TARGET_DIR)/etc/pam.d/other
+	$(LINUX_PAM_LASTLOG_PAMFILE_TWEAK)
 	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
 endef
 
diff --git a/package/linux-pam/login.pam b/package/linux-pam/login.pam
index 5df7db628c..21d2afb61e 100644
--- a/package/linux-pam/login.pam
+++ b/package/linux-pam/login.pam
@@ -8,5 +8,5 @@ password	required	pam_unix.so nullok
 session		required	pam_limits.so
 session		required	pam_env.so
 session		required	pam_unix.so
-session		optional	pam_lastlog.so
+# session	optional	pam_lastlog.so
 # session	required	pam_selinux.so open
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

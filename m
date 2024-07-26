Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5500BC3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 12:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F1060B14;
	Fri, 26 Jul 2024 12:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNKXldAkbgAi; Fri, 26 Jul 2024 12:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0177560B17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0177560B17;
	Fri, 26 Jul 2024 12:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1011BF29A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 12:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2717A81E31
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 12:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9ZJKDRgz9G3 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 12:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 472738110F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472738110F
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 12:11:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3265B87107; Fri, 26 Jul 2024 12:11:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 14:11:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ef2bb44379e4763682199ad2ecfd23d51cbacc0
X-Git-Newrev: 541eb8bf7db553708ff2286995ce94b38fc8d537
X-Patchwork-Hint: ignore
Message-Id: <20240726121124.3265B87107@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpwquality: fix PAM module path
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=541eb8bf7db553708ff2286995ce94b38fc8d537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libpwquality package provides the pam_pwquality PAM module - the
replacement for pam_cracklib that was dropped from linux-pam back in
version 1.5.0.  However, it currently installs it to the wrong place,
so passwd and friends fail to find it.  This commit sets the security
directory path to /lib/security to match the corresponding setting in
linux-pam.mk.

Note that libpwquality has *always* installed pam_pwquality in the wrong
place, since version 1.3.0 was added to buildroot in 2017 in commit
462040443ca943694fc59ec8380c82f8bf9aaddc.  However, back then, linux-pam
version 1.3.0 still provided pam_cracklib for advanced password checking.
Linux-pam deprecated pam_cracklib in 1.4.0 but still built it for us when
linux-pam.mk set --enable-cracklib.  Linux-PAM deleted pam_cracklib
altogether in 1.5.0, so it was not until our update to linux-pam-1.5.1
in commit 276f1e0a896698abec85500a86686bf72c79eb91 that pam_cracklib
became unavailable.  After that point, pam_pwquality was the only
alternative for PAM-based password checking.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpwquality/libpwquality.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index f12e583b2d..ba62cdfb09 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -23,7 +23,7 @@ LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-LIBPWQUALITY_CONF_OPTS += --enable-pam
+LIBPWQUALITY_CONF_OPTS += --enable-pam --with-securedir=/lib/security
 LIBPWQUALITY_DEPENDENCIES += linux-pam
 else
 LIBPWQUALITY_CONF_OPTS += --disable-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

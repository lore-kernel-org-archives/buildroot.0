Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B0C4167B
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14ECD40A57;
	Thu,  9 Nov 2023 15:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14ECD40A57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xcc-SWbWRGzy; Thu,  9 Nov 2023 15:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA0540165;
	Thu,  9 Nov 2023 15:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA0540165
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8759B1BF40A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F38C40A4D
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 15:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F38C40A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxOONhpxr1sA for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 15:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1B740165
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 15:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1B740165
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 389E786E00; Thu,  9 Nov 2023 15:09:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 16:07:20 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: d8191f154660d28c9dce63b5a2d96c75c7023436
X-Git-Newrev: 3a00793d8fc00c04408eb17ce5e6dfb864bdfaea
X-Patchwork-Hint: ignore
Message-Id: <20231109150924.389E786E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/linux-pam: link
 with -latomic when needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a00793d8fc00c04408eb17ce5e6dfb864bdfaea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following build failure raised since bump to version 1.5.3 in
commit f8147e27cdac8f998ec6644a09ce4e8d62b6433c and
https://github.com/linux-pam/linux-pam/commit/a35e092e24ee7632346a0e1b4a203c04d4cd2c62:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/11.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: .libs/pam_keyinit.o: in function `pam_sm_open_session':
pam_keyinit.c:(.text+0x824): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/52c51b5ad5930ed783b88fb33932297379fd4429

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f1a47904b635c3c4c3b5656e58c0c575c1674993)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-pam/linux-pam.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 21e5decb9c..92d8c952ac 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -21,9 +21,14 @@ LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES)
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
-LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
+LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
+LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LINUX_PAM_LIBS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
 LINUX_PAM_DEPENDENCIES += libselinux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

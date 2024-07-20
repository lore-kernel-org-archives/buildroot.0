Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0966C3DA63
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 08:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F09260F90;
	Sat, 20 Jul 2024 08:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfsWjnrpFAK6; Sat, 20 Jul 2024 08:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EA3060F84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA3060F84;
	Sat, 20 Jul 2024 08:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B65E1BF349
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08D6A606F2
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3AdaVXWPNRi for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 08:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51962605DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51962605DE
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 08:28:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D5C186D93; Sat, 20 Jul 2024 08:28:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 10:28:11 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 2555f47788964d796c8a49e81ce1f5d63b9cb9ac
X-Git-Newrev: 144a817f4ff9c768de7a9daf2ea7ae406119d1f9
X-Patchwork-Hint: ignore
Message-Id: <20240720082839.4D5C186D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/openssh: add CVE
 ignore for CVE-2024-6387
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

commit: https://git.buildroot.net/buildroot/commit/?id=144a817f4ff9c768de7a9daf2ea7ae406119d1f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Commit e7f124e9b632 (package/openssh: disable async-signal-unsafe code in
sshsigdie()) add a patch for CVE-2024-6387 but forgot to add an _IGNORE_CVES
entry.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 5a568d5fd1..9a1dee2a3d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -16,6 +16,9 @@ OPENSSH_LICENSE_FILES = LICENCE
 # 0001-Improve-detection-of-fzero-call-used-regs-used.patch
 OPENSSH_AUTORECONF = YES
 
+# 0002-sshsigdie-async-signal-unsafe.patch
+OPENSSH_IGNORE_CVES += CVE-2024-6387
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE756C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:18:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF2960F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FF2960F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F80660A3B;
	Tue,  3 Aug 2021 23:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lXOXSU_YgVq; Tue,  3 Aug 2021 23:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACEEC60A5A;
	Tue,  3 Aug 2021 23:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA331BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2834069A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyJfG81uH6Nz for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF6594064D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2F17482926; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 15:03:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f8e7b388589888704f84dc17bb8d1146de668ab
X-Git-Newrev: 422fd73fadfbe33523e1687f90bbfecd3f7ab5d5
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.2F17482926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gesftpserver: fix
 build without Python
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=422fd73fadfbe33523e1687f90bbfecd3f7ab5d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The build of gesftserver in an environment without Python fails with:

checking for Python 2.4 or better... configure: error: cannot find Python 2.4 or better

However, it turns out that Python is only needed for tests, which we
don't run/use in Buildroot, so we can safely build gesftpserver
without Python.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gesftpserver/gesftpserver.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 85511a3c97..20ad92d25a 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -23,6 +23,10 @@ GESFTPSERVER_DEPENDENCIES += \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(if $(BR2_PACKAGE_OPENSSH),openssh)
 
+# Python on the host is only used for tests, which we don't use in
+# Buildroot
+GESFTPSERVER_CONF_ENV += rjk_cv_python24=false
+
 # openssh/dropbear looks here
 define GESFTPSERVER_ADD_SYMLINK
 	ln -sf gesftpserver $(TARGET_DIR)/usr/libexec/sftp-server
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

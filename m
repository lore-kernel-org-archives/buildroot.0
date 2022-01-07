Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6EFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357C0429B7;
	Fri,  7 Jan 2022 20:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZ7NkvG1rMLN; Fri,  7 Jan 2022 20:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED0D429A2;
	Fri,  7 Jan 2022 20:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49F831C116E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B4F404D1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RB3EIZSc9Kd for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC53404C5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9D94C8027C; Fri,  7 Jan 2022 20:28:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 21:33:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c86ec14d2aab1afe7815801d194d0da477e81db7
X-Git-Newrev: 8b78e3a62477dad00a2c081883dae13d0f7e8856
X-Patchwork-Hint: ignore
Message-Id: <20220107202839.9D94C8027C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: enable CONFIG_IO_URING
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b78e3a62477dad00a2c081883dae13d0f7e8856
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable CONFIG_IO_URING through LIBURING_LINUX_CONFIG_FIXUPS in case the
user is also building a kernel

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liburing/liburing.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index a977e74b4f..74ce4156f8 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -11,6 +11,10 @@ LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
 
+define LIBURING_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IO_URING)
+endef
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBURING_MAKE_OPTS += ENABLE_SHARED=0
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D33C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBB8A4011C;
	Mon,  4 Apr 2022 17:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tp78HS0sPfef; Mon,  4 Apr 2022 17:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 067B940576;
	Mon,  4 Apr 2022 17:27:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECB371BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCACA8278F
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3u5UCVfEKbIH for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D54B78141E
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 64D5786230; Mon,  4 Apr 2022 17:17:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:15:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43991ac5e0e6cdb4aa03ed7011243aa0f473fd56
X-Git-Newrev: 8bcae68f37d2c608e9e151fb983f16c09c11f85e
X-Patchwork-Hint: ignore
Message-Id: <20220404171729.64D5786230@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/upower: add gobject-introspection
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bcae68f37d2c608e9e151fb983f16c09c11f85e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gobject-introspection is an optional dependency which is enabled by
default since
https://gitlab.freedesktop.org/upower/upower/-/commit/0d7bf34ed6702c60028fa80e5d481621e9741d09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/upower/upower.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index 8989ca9f5d..a6f39d2f46 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -22,4 +22,11 @@ UPOWER_DEPENDENCIES = \
 
 UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+UPOWER_CONF_OPTS += --enable-introspection
+UPOWER_DEPENDENCIES += gobject-introspection
+else
+UPOWER_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

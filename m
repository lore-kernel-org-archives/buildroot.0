Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7242C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79AA5428E4;
	Fri,  7 Jan 2022 19:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NYy-hM_heXT; Fri,  7 Jan 2022 19:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F359E428B3;
	Fri,  7 Jan 2022 19:08:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8C71C116E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57E7E40141
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kfkw-bTcsCQ3 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:07:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D1640002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:07:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CB02E8349D; Fri,  7 Jan 2022 19:01:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 20:07:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03ca6f4e39874583060317e7e15e9e360220877e
X-Git-Newrev: 352252149e5617e6e2c69d09f9e118786db6ffa8
X-Patchwork-Hint: ignore
Message-Id: <20220107190148.CB02E8349D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: add liburing optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=352252149e5617e6e2c69d09f9e118786db6ffa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liburing is an optional dependency (enabed by default) since version
4.0.11 and
https://github.com/lxc/lxc/commit/b1f9aee5c466b5a6d88582375ea15971d846d18b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lxc/lxc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 4d63fc14cb..08f64bcec7 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -44,6 +44,13 @@ else
 LXC_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBURING),y)
+LXC_CONF_OPTS += --enable-liburing
+LXC_DEPENDENCIES += liburing
+else
+LXC_CONF_OPTS += --disable-liburing
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LXC_CONF_OPTS += --enable-openssl
 LXC_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

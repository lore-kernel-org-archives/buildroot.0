Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5CCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C1160B1B;
	Sun, 20 Mar 2022 21:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_92bhieAJMB; Sun, 20 Mar 2022 21:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD8460ADE;
	Sun, 20 Mar 2022 21:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EB2E1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F074032A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlm_sBv2WYlx for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 481574049F
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0960F846A3; Sun, 20 Mar 2022 21:33:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:41:20 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 76de77202d01d280a2b0f4c6c98e8b8887e73675
X-Git-Newrev: af8839589acb2b3399e36a925e37a48d7b170382
X-Patchwork-Hint: ignore
Message-Id: <20220320213325.0960F846A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zynaddsubfx: add
 jack{1, 2} optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=af8839589acb2b3399e36a925e37a48d7b170382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

jack{1,2} is an optional dependency (enabled by default) since the
addition of the package in commit
18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3bcedaa732b539e4ad32776e867ef9626ffca5b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index aeeb0b6405..461146aae8 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -30,4 +30,11 @@ else
 ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_JACK1)$(BR2_PACKAGE_JACK2),y)
+ZYNADDSUBFX_DEPENDENCIES += $(if $(BR2_PACKAGE_JACK1),jack1,jack2)
+ZYNADDSUBFX_CONF_OPTS += -DJackEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DJackEnable=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

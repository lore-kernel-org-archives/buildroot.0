Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D7DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897A783EF4;
	Thu, 14 Apr 2022 19:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtTW7gDDEffd; Thu, 14 Apr 2022 19:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A28DB83EED;
	Thu, 14 Apr 2022 19:37:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC0E1BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C91160F8D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozIak_BELCNn for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDC8A60F57
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7668C83C8F; Thu, 14 Apr 2022 19:27:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:35:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 213629f2d3050465d2a6cb6842d056f71648fe55
X-Git-Newrev: f909dce3b0979bc2de54fd848ded3dc4a6c417e8
X-Patchwork-Hint: ignore
Message-Id: <20220414192729.7668C83C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: Conditionally enable
 Power8 option
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
Content-Type: multipart/mixed; boundary="===============6465586604015573195=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6465586604015573195==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f909dce3b0979bc2de54fd848ded3dc4a6c417e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib-ng's build system does not correctly detect if it supports the
Power8 feature. Force it off to fix building for configurations that
don't support the vector builtin functions.

For example, building for BR2_powerpc_601:

  warning: implicit declaration of function ‘vec_xl’; did you mean
 ‘vec_rl’? [-Wimplicit-function-declaration]
   93 |             vbuf = vec_xl(0, (unsigned char *) buf);

This logic was incorrectly removed in commit 04e26cb7feb.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zlib-ng/zlib-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fb497b8c11..dd1723ac86 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -23,4 +23,11 @@ ifeq ($(BR2_arm),y)
 ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
 endif
 
+ifeq ($(BR2_powerpc_power8),y)
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
+endif
+
+
 $(eval $(cmake-package))

--===============6465586604015573195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6465586604015573195==--

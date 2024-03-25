Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A46CC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBDC181E37;
	Mon, 25 Mar 2024 08:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBbAnZwK-UTI; Mon, 25 Mar 2024 08:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609BC81E22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609BC81E22;
	Mon, 25 Mar 2024 08:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28FF71BF20B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3021581276
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_R5W0a7ITTf for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62CDD812C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62CDD812C1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ECE783D31; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:54:56 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 192d6bc5b20408afedab49f80a18498d20e379da
X-Git-Newrev: db54b8a716f016937dff291fb11c5e8dfa8caade
X-Patchwork-Hint: ignore
Message-Id: <20240325075958.4ECE783D31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libdrm: disable
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=db54b8a716f016937dff291fb11c5e8dfa8caade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Disable tests to avoid the following build failure with amdgpu and gcc 5
if cunit is built before libdrm:

In file included from ../tests/amdgpu/shader_test_util.c:10:0:
../tests/amdgpu/shader_code.h:113:2: error: initializer element is not constant
  ps_##_ps##_shader_patchinfo_code_size_gfx##_n, \
  ^

tests can be disabled since
https://gitlab.freedesktop.org/mesa/drm/-/commit/46d1e99a5d291b22d86ac52710b079491beedff8

Fixes:
 - http://autobuild.buildroot.org/results/612aad1fa642993da36bbec6c16c9020ac283e34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f95069814bd68cfc10ccf2dbc41efa6f1e127495)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 61d1c24377..a04331c2da 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,7 +17,8 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
-	-Dman-pages=disabled
+	-Dman-pages=disabled \
+	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

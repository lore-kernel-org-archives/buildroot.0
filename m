Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F7FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFED481E57;
	Mon, 25 Mar 2024 08:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKHGkPtg5mFa; Mon, 25 Mar 2024 08:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 334D081EA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 334D081EA7;
	Mon, 25 Mar 2024 08:01:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC841BF909
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F024E81DFD
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYkmQmApVhJv for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 08:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460FC81DA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 460FC81DA3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 08:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3452A83D48; Mon, 25 Mar 2024 08:01:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:55:42 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3b4efbd59de6de1a9941583dd5c0bdd6d0dc06bc
X-Git-Newrev: b96fc0ec5142d2e4a79a313e9d88cd516b29a6ec
X-Patchwork-Hint: ignore
Message-Id: <20240325080110.3452A83D48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libdrm: disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=b96fc0ec5142d2e4a79a313e9d88cd516b29a6ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index b9201e4bd3..3c048ac22e 100644
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

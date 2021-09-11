Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32538C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:26:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C6F611B0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85C6F611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DB5607ED;
	Sat, 11 Sep 2021 15:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GowUc3cYdlQB; Sat, 11 Sep 2021 15:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A6D606CF;
	Sat, 11 Sep 2021 15:26:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3031BF35A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69FF383AC8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI_lBN9V6_GR for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:26:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC09D8364B
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:26:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 92A878907D; Sat, 11 Sep 2021 15:25:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 17:25:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd8e9f051d3e2e3b931721739493569da451fa3b
X-Git-Newrev: 3245874961152628877d1fb8cd14406aa4c8bd6a
X-Patchwork-Hint: ignore
Message-Id: <20210911152510.92A878907D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: work around arc gcc10 bug
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3245874961152628877d1fb8cd14406aa4c8bd6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With BR2_GCC_VERSION_ARC=y(arc gcc10) harfbuzz package exhibits a gcc bug
that makes build to fail. This bug is found only in official arc gcc10
provided by Synopsis, so we can't use the BR2_TOOLCHAIN_HAS_GCC_BUG_
approach since bug can't be even filed in gcc bugzilla.
To work around this, if BR2_GCC_VERSION_ARC=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/e4d/e4da9ba40c8f4567601d404e20dd6a0b322210c2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/harfbuzz/harfbuzz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index d0595d6416..70c1e1f7e6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -94,5 +94,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
 endif
 
+ifeq ($(BR2_GCC_VERSION_ARC),y)
+HARFBUZZ_CXXFLAGS += -O0
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324C2C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B7E60F41
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7B7E60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DA7607A7;
	Tue, 17 Aug 2021 07:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1KhFzOldeAn; Tue, 17 Aug 2021 07:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A8E6607F2;
	Tue, 17 Aug 2021 07:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43C981BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30A56401C3
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DMtYR2E3sJe for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:41:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AACD40189
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:41:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3A17584639; Tue, 17 Aug 2021 07:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 09:40:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eef89bde330e5ad524dd324527ee77f575a70216
X-Git-Newrev: 6454eacf1018ec9be9d4f833e7a8f0a21a47f167
X-Patchwork-Hint: ignore
Message-Id: <20210817074022.3A17584639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=6454eacf1018ec9be9d4f833e7a8f0a21a47f167
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failures without threads by defining HB_NO_MT as
specified in https://github.com/harfbuzz/harfbuzz/blob/main/CONFIG.md:

In file included from ../src/hb.hh:458,
                 from ../src/hb-blob.cc:28:
../src/hb-mutex.hh:88:2: error: #error "Could not find any system to define mutex macros."
   88 | #error "Could not find any system to define mutex macros."
      |  ^~~~~

This build failure is raised since bump to version 2.8.1 in commit
e9ba1c80e8ebf5f5ad9d889d2dd37f27af87e811 and
https://github.com/harfbuzz/harfbuzz/commit/711c241f6c7e18c5403602375a733af74df76f83
which removed busyloop mutex implementation.

Fixes:
 - http://autobuild.buildroot.org/results/0c03aca5e3ade735b54b0b9233896b868aec1520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f327a95eb6..c7f5dfe9d2 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -90,5 +90,9 @@ else
 HARFBUZZ_CONF_OPTS += -Dicu=disabled
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

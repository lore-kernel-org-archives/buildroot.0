Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742E5C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC0661368
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EC0661368
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E593C40465;
	Mon, 23 Aug 2021 22:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIpdVPFfoov5; Mon, 23 Aug 2021 22:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7307540467;
	Mon, 23 Aug 2021 22:27:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 771331BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6675D40467
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRGpRyOhuySY for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:27:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6EE640465
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:27:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 31A138DAC8; Mon, 23 Aug 2021 22:26:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 00:24:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3298e67ac64ce1f52f58f1ef668c4c8c63309d04
X-Git-Newrev: 2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839
X-Patchwork-Hint: ignore
Message-Id: <20210823222610.31A138DAC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: disable -fPIC on
 m68k_cf
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has -fPIC gcc option set by default but we can't use it on
m68k_cf since it doesn't support it throwing a gcc build failure. So let's
disable it by passing -fno-PIC.

Fixes:
http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libmodsecurity/libmodsecurity.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 66e7e522a1..be46eb6e02 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -52,4 +52,14 @@ else
 LIBMODSECURITY_CONF_OPTS += --without-maxmind
 endif
 
+LIBMODSECURITY_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+# m68k_cf can't use -fPIC that libmodsecurity forces to use, so we need
+# to disable it to avoid a build failure.
+ifeq ($(BR2_m68k_cf),y)
+LIBMODSECURITY_CXXFLAGS += -fno-PIC
+endif
+
+LIBMODSECURITY_CONF_OPTS += CXXFLAGS="$(LIBMODSECURITY_CXXFLAGS)"
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

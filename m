Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6439DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDBFC610CE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDBFC610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8A4760773;
	Mon, 13 Sep 2021 17:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsUB2SIbkMIH; Mon, 13 Sep 2021 17:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EED560775;
	Mon, 13 Sep 2021 17:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1411BF97F
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AECB80E32
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARbgB091EE2k for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E892980E43
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D300C8A590; Mon, 13 Sep 2021 17:45:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:25:09 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8c14a7171a12b72e0899f2f1fe8e5424c017c14d
X-Git-Newrev: a0f807a4bb1d123a86ac71d873b5c8e942c6db08
X-Patchwork-Hint: ignore
Message-Id: <20210913174527.D300C8A590@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/ruby: fix build
 failure due to gcc bug 83143
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0f807a4bb1d123a86ac71d873b5c8e942c6db08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

The ruby package exhibits gcc bug 83143 when built for the SH4 architecture
with optimization enabled, which causes a build failure.

Differentely from other packages in Buildroot where we work around this
gcc bug by setting optimization to -O0 we can use -freorder-blocks-algorithm=simple
as suggested here [1] if BR2_TOOLCHAIN_HAS_GCC_BUG_83143=y.

Fixes:
http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143#c15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4e070082495c1686b2b207db7fe7720271dc7d86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2434ce946b..b02744f0e5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -77,6 +77,14 @@ else
 RUBY_CONF_OPTS += --without-gmp
 endif
 
+RUBY_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_83143),y)
+RUBY_CFLAGS += -freorder-blocks-algorithm=simple
+endif
+
+RUBY_CONF_OPTS += CFLAGS="$(RUBY_CFLAGS)"
+
 # Remove rubygems and friends, as they need extensions that aren't
 # built and a target compiler.
 RUBY_EXTENSIONS_REMOVE = rake* rdoc* rubygems*
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

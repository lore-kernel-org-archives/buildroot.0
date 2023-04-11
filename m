Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D7CC76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 12:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4763341BF8;
	Tue, 11 Apr 2023 12:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4763341BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmXuhns-llAZ; Tue, 11 Apr 2023 12:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D3641BEA;
	Tue, 11 Apr 2023 12:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12D3641BEA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C69851C3BF7
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE0748203F
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0748203F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzb9kxaylyL4 for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D446781E54
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D446781E54
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0EF383F78; Tue, 11 Apr 2023 12:20:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 14:11:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f002280e73fded677b1d7476f928d1bc0ee56359
X-Git-Newrev: 6838495a88684e69c130cff58f96d5a78bf0e1c7
X-Patchwork-Hint: ignore
Message-Id: <20230411122031.C0EF383F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/matio: fix build
 failure due to gcc bug 99410
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

commit: https://git.buildroot.net/buildroot/commit/?id=6838495a88684e69c130cff58f96d5a78bf0e1c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The matio package exhibits gcc bug 99410 when built for the Nios2
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_99410=y.

Fixes:
http://autobuild.buildroot.net/results/971/9714160b80a0d1a01983d29af38a95049c07b4d3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 97f8cc355b164ce023cd6a098051ce63c7a25f9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matio/matio.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index d282852d37..1370b32edf 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -15,6 +15,14 @@ MATIO_INSTALL_STAGING = YES
 # va_copy()
 MATIO_CONF_ENV = ac_cv_va_copy=yes
 
+MATIO_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
+MATIO_CFLAGS += -O0
+endif
+
+MATIO_CONF_ENV += CFLAGS="$(MATIO_CFLAGS)"
+
 # mat73 require hdf5 (not available), extented-sparse take 2KB
 MATIO_CONF_OPTS = --disable-mat73 --enable-extended-sparse
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

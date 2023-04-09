Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB3C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1A5A4014E;
	Sun,  9 Apr 2023 13:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1A5A4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wt9RCcX42Oi; Sun,  9 Apr 2023 13:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06233404B9;
	Sun,  9 Apr 2023 13:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06233404B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71BB61BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 439D540432
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439D540432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfRurs2OVE8M for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:38:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FDDD403A7
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDDD403A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5348A83A6B; Sun,  9 Apr 2023 13:38:11 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 15:32:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00709af66ec7056ff76a6238f22985cfa0bcc3a6
X-Git-Newrev: 97f8cc355b164ce023cd6a098051ce63c7a25f9a
X-Patchwork-Hint: ignore
Message-Id: <20230409133811.5348A83A6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matio: fix build failure due to
 gcc bug 99410
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

commit: https://git.buildroot.net/buildroot/commit/?id=97f8cc355b164ce023cd6a098051ce63c7a25f9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The matio package exhibits gcc bug 99410 when built for the Nios2
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_99410=y.

Fixes:
http://autobuild.buildroot.net/results/971/9714160b80a0d1a01983d29af38a95049c07b4d3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/matio/matio.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 5e09f4e6ce..2ba9c8f568 100644
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

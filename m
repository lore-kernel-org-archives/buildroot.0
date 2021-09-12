Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33145C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:27:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C2F61039
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 09:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7C2F61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EFD8247F;
	Sun, 12 Sep 2021 09:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Wvk9KGVuUaL; Sun, 12 Sep 2021 09:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E794381D34;
	Sun, 12 Sep 2021 09:27:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 869611BF47E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 756CA40139
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 09:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rX5oIFyZWhK6 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 09:27:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76408400B5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:27:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7B7C98A3C7; Sun, 12 Sep 2021 09:25:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 11:26:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af99e7a5f386304967480fcf68e55131f26f9b4f
X-Git-Newrev: 63f34c54090a70987a707346a6e77d1a6fbead99
X-Patchwork-Hint: ignore
Message-Id: <20210912092530.7B7C98A3C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: disable raw with
 kernel >= 5.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=63f34c54090a70987a707346a6e77d1a6fbead99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

raw has been dropped from kernel since version 5.14 and
https://github.com/torvalds/linux/commit/603e4922f1c81fc2ed3a87b4f91a8d3aafc7e093
resulting in the following build failure:

configure: error: raw selected, but required raw.h header file not available

https://github.com/karelzak/util-linux/issues/1442

Fixes:
 - http://autobuild.buildroot.org/results/d009d663a7c3c75872b19a92d3eadd3ecee2df63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1f33eb5514..f045361ab5 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -291,9 +291,13 @@ config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 
 config BR2_PACKAGE_UTIL_LINUX_RAW
 	bool "raw"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	help
 	  Build a linux raw character device
 
+comment "raw needs a toolchain w/ headers < 5.14"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
 config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "rename"
 	help
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470E7C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D71094EE53;
	Tue, 21 Feb 2023 00:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D71094EE53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sstv-PJuWztk; Tue, 21 Feb 2023 00:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E05E4F1D2;
	Tue, 21 Feb 2023 00:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E05E4F1D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 472921BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3E296FAF0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E296FAF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 406VBgL8cPms for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E820E6FAA8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E820E6FAA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6887828C8; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:37:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 84e52a60b4044d3c54d6d4be5729a6d30aaf5aee
X-Git-Newrev: e6365126e731a1d0bf40eea91cb51b98b6918ecf
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.E6887828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: add zlib
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6365126e731a1d0bf40eea91cb51b98b6918ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

zlib is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/7133f6944dc26740f5ebf56c2ca33be86a6e0f09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 5da344fc55..f7fd72558e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -157,6 +157,13 @@ else
 WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WIRESHARK_CONF_OPTS += -DENABLE_ZLIB=ON
+WIRESHARK_DEPENDENCIES += zlib
+else
+WIRESHARK_CONF_OPTS += -DENABLE_ZLIB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=ON
 WIRESHARK_DEPENDENCIES += zstd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

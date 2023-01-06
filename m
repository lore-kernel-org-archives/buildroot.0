Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1453EC3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 07:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A554961126;
	Fri,  6 Jan 2023 07:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A554961126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UGqmP559_0q; Fri,  6 Jan 2023 07:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA08161131;
	Fri,  6 Jan 2023 07:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA08161131
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 441C21BF359
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D22C61164
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D22C61164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41iMCANj7Vp3 for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B8496113E
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8496113E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4422E875EC; Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:37:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6365126e731a1d0bf40eea91cb51b98b6918ecf
X-Git-Newrev: 8702cecb142e42c6fd522d8256732ec54bab1711
X-Patchwork-Hint: ignore
Message-Id: <20230106074006.4422E875EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: add minizip-zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=8702cecb142e42c6fd522d8256732ec54bab1711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

minizip-zlib is an optional dependency which is enabled by default since
version 3.1.0 and
https://github.com/wireshark/wireshark/commit/390071ed0bc8aaf378c3468989ccde1c93817542

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index f7fd72558e..c1efef2280 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -115,6 +115,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LZ4=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MINIZIP_ZLIB),y)
+WIRESHARK_CONF_OPTS += -DENABLE_MINIZIP=ON
+WIRESHARK_DEPENDENCIES += minizip-zlib
+else
+WIRESHARK_CONF_OPTS += -DENABLE_MINIZIP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
 WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=ON
 WIRESHARK_DEPENDENCIES += nghttp2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

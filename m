Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F68E78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5CF8146A;
	Sun,  1 Oct 2023 19:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD5CF8146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieHgnY5X0NMP; Sun,  1 Oct 2023 19:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B4228143A;
	Sun,  1 Oct 2023 19:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B4228143A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09AD21BF588
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F0F40609
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F0F40609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mF-jVEv9_wDV for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:15:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C269640490
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C269640490
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B15DC83F75; Sun,  1 Oct 2023 19:15:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 21:14:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c427c64726560ea1743282a3fdb78f5b28692eb
X-Git-Newrev: f10f47ff2873d2259e4a03060e9cf0fd1b0f05e0
X-Patchwork-Hint: ignore
Message-Id: <20231001191539.B15DC83F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: add a FAQ entry about Y2038
 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f10f47ff2873d2259e4a03060e9cf0fd1b0f05e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was reviewed in person by Arnout.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/faq-troubleshooting.adoc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/manual/faq-troubleshooting.adoc b/docs/manual/faq-troubleshooting.adoc
index b08bf9bc4a..a61276d4c5 100644
--- a/docs/manual/faq-troubleshooting.adoc
+++ b/docs/manual/faq-troubleshooting.adoc
@@ -242,3 +242,31 @@ help reduce the build time:
 
  * Experiment with top-level parallel build, see
    xref:top-level-parallel-build[].
+
+[[faq-2038]]
+=== How does Buildroot support Y2038?
+
+There are multiple situations to consider:
+
+ * On 64-bit architectures, there is no problem, as +time_t+ has
+   always been 64-bit.
+
+ * On 32-bit architectures, the situation depends on the C library:
+
+ ** With _uclibc-ng_, there is no support for 64-bit +time_t+ on
+    32-bit architectures, so systems using _uclibc-ng_ on 32-bit
+    platforms will not be Y2038 compatible.
+
+ ** With _musl_, 64-bit +time_t+ has always been used on 32-bit
+    architectures, so systems using _musl_ on 32-bit platforms are
+    Y2038 compatible.
+
+ ** With _glibc_, 64-bit +time_t+ on 32-bit architectures is enabled
+    by the Buildroot option +BR2_TIME_BITS_64+. With this option
+    enabled, systems using _glibc_ on 32-bit platforms are Y2038
+    compatible.
+
+Note that the above only comments about the capabilities of the C
+library. Individual user-space libraries or applications, even when
+built in a Y2038-compatible setup, can exhibit incorrect behavior if
+they do not make correct use of the time APIs and types.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

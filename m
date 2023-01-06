Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD050C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE634F1EB;
	Tue, 21 Feb 2023 00:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE634F1EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xY3uOBUcBTKD; Tue, 21 Feb 2023 00:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300D44F1E8;
	Tue, 21 Feb 2023 00:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300D44F1E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 566CA1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD806FAFC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD806FAFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTnD2rA6QT50 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13B6F610B3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B6F610B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12312828C8; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:38:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8702cecb142e42c6fd522d8256732ec54bab1711
X-Git-Newrev: f70149c80cda5d2f6bbe2266b247d52818391cda
X-Patchwork-Hint: ignore
Message-Id: <20230220205227.12312828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: add libcap
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

commit: https://git.buildroot.net/buildroot/commit/?id=f70149c80cda5d2f6bbe2266b247d52818391cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libcap is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/9250a69a9976617c735679aa5383e53802e5b43e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c1efef2280..d9314fb211 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -65,6 +65,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=ON
+WIRESHARK_DEPENDENCIES += libcap
+else
+WIRESHARK_CONF_OPTS += -DENABLE_CAP=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=ON
 WIRESHARK_DEPENDENCIES += libkrb5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

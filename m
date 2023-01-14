Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AEFC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FCD570348;
	Tue, 21 Feb 2023 02:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FCD570348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASHQoF7-XHVw; Tue, 21 Feb 2023 02:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98E9701FD;
	Tue, 21 Feb 2023 02:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98E9701FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C16F51BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B5186FB24
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5186FB24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg3shGXSTqWo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66E4E6FB58
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E4E6FB58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BF22828C8; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:06:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06aa16e23490d03ef9098e61cdcf698af7317a96
X-Git-Newrev: 60cf07079b78d4c4bb495fd18cb2a145a4cb3635
X-Patchwork-Hint: ignore
Message-Id: <20230220205232.5BF22828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/janus-gateway: add
 libcurl optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=60cf07079b78d4c4bb495fd18cb2a145a4cb3635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libcurl is an optional dependency which is enabled by default since at
least version 0.0.9 and
https://github.com/meetecho/janus-gateway/commit/ca9c0a86f975f88fbdd791af3cb4f8986883c1c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 0d906f1b62..dd898563e5 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -128,6 +128,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+JANUS_GATEWAY_DEPENDENCIES += libcurl
+JANUS_GATEWAY_CONF_OPTS += --enable-turn-rest-api
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-turn-rest-api
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 JANUS_GATEWAY_DEPENDENCIES += systemd
 JANUS_GATEWAY_CONF_OPTS += --enable-systemd-sockets
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

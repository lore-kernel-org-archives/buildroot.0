Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01298C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881E181EA0;
	Sat, 14 Jan 2023 20:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881E181EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xizdYjN35_fb; Sat, 14 Jan 2023 20:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFB1980C60;
	Sat, 14 Jan 2023 20:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB1980C60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD091BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB4A260F64
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB4A260F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMu0x35lonaF for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30DEA60BA9
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30DEA60BA9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC1587B2E; Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:06:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06aa16e23490d03ef9098e61cdcf698af7317a96
X-Git-Newrev: 60cf07079b78d4c4bb495fd18cb2a145a4cb3635
X-Patchwork-Hint: ignore
Message-Id: <20230114200728.1BC1587B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: add libcurl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60cf07079b78d4c4bb495fd18cb2a145a4cb3635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

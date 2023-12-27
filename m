Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B5C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B7A41612;
	Wed, 27 Dec 2023 16:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B7A41612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r944aBJLQEEw; Wed, 27 Dec 2023 16:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757A0409C3;
	Wed, 27 Dec 2023 16:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 757A0409C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA8C1BF3E1
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E925060FDF
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 16:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E925060FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORSty5qUHuh8 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 16:20:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DCBB60FDE
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 16:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCBB60FDE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55E5A60004;
 Wed, 27 Dec 2023 16:20:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rIWe8-002QrA-1S;
 Wed, 27 Dec 2023 17:20:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 17:20:38 +0100
Message-Id: <20231227162039.579880-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: security bump to
 version 21.1.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

1) CVE-2023-6377: X.Org server: Out-of-bounds memory write in XKB button actions

A device has XKB button actions for each button on the device.  When a
logical device switch happens (e.g.  moving from a touchpad to a mouse), the
server re-calculates the information available on the respective master
device (typically the Virtual Core Pointer).  This re-calculation only
allocated enough memory for a single XKB action rather instead of enough for
the newly active physical device's number of button.  As a result, querying
or changing the XKB button actions results in out-of-bounds memory reads and
writes.

This may lead to local privilege escalation if the server is run as root or
remote code execution (e.g. x11 over ssh).

2) CVE-2023-6478: X.Org server: Out-of-bounds memory read in
RRChangeOutputProperty and RRChangeProviderProperty

This fixes an OOB read and the resulting information disclosure.

Length calculation for the request was clipped to a 32-bit integer.  With
the correct stuff->nUnits value the expected request size was truncated,
passing the REQUEST_FIXED_SIZE check.

The server then proceeded with reading at least stuff->nUnits bytes
(depending on stuff->format) from the request and stuffing whatever it finds
into the property.  In the process it would also allocate at least
stuff->nUnits bytes, i.e.  4GB.

See also CVE-2022-46344 where this issue was fixed for other requests.

For more details, see the advisory:
https://lists.x.org/archives/xorg-announce/2023-December/003435.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index ccd7cc74fa..de93b11927 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003431.html
-sha256  ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a  xorg-server-21.1.9.tar.xz
-sha512  9044e1b9222616fb63aea444b75f4ca6582edb7d899018f8ea30359e57edf04b1555e69397ebc4d288f7e36d6b82a54dde3895f11d414573d229e908ac17bfe8  xorg-server-21.1.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-December/003436.html
+sha256  ceb0b3a2efc57ac3ccf388d3dc88b97615068639fb284d469689ae3d105611d0  xorg-server-21.1.10.tar.xz
+sha512  8135d9b7c0c71f427ba0a3b80741fee4f6ae195779399b73261a00858882f3516e367a08e2da1403734b04eacabae9aa231e5375eff23b57a3ff764e9caf8926  xorg-server-21.1.10.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index cf0e688c36..4ac4283e4b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.9
+XSERVER_XORG_SERVER_VERSION = 21.1.10
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

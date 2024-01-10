Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AEAC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D471436EF;
	Wed, 10 Jan 2024 20:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D471436EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wt2ORqpkAcKh; Wed, 10 Jan 2024 20:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36A4443779;
	Wed, 10 Jan 2024 20:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A4443779
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 204C51BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE7D042233
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7D042233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YT0b4yVDcTLf for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD364223E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD364223E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AFD585CC8; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:03:02 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ad202bc68ffcf43376dba03aff5fb1dbed9128b6
X-Git-Newrev: 0595f7c93320822a4c821a3407f330caca8b1743
X-Patchwork-Hint: ignore
Message-Id: <20240110201652.0AFD585CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/x11r7/xserver_xorg-server: security bump to version 21.1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0595f7c93320822a4c821a3407f330caca8b1743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b62f5905e9f9d47363983a5bd7ef8672b21cca6)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

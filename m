Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389C0C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B78436D6;
	Wed, 10 Jan 2024 20:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B78436D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVlToyck8EKm; Wed, 10 Jan 2024 20:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A35044380B;
	Wed, 10 Jan 2024 20:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A35044380B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73C9A1BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47F9E83A77
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F9E83A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LL_PmWaoXLwY for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA17A83B40
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA17A83B40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAAB285D63; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:02:56 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 232a03959253f6a19e90d3588c280d2f904fc4ad
X-Git-Newrev: 030d5daa7de21548039d0691768182ba9ee03008
X-Patchwork-Hint: ignore
Message-Id: <20240110202203.DAAB285D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=030d5daa7de21548039d0691768182ba9ee03008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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

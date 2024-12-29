Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D5E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C32140565;
	Sun, 29 Dec 2024 12:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFpVSO0PPGDT; Sun, 29 Dec 2024 12:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0309A40583
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0309A40583;
	Sun, 29 Dec 2024 12:00:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 415A772
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E72D80ED7
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EpK2jLc6NC7 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758DA80DE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 758DA80DE4
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CF238767B; Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 12:43:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d08940ce6454066254204aa9126a5c65cad7628
X-Git-Newrev: ca46491736b4b3ae9549acbdef6383d145932963
X-Patchwork-Hint: ignore
Message-Id: <20241229120014.6CF238767B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump to version 1.27
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca46491736b4b3ae9549acbdef6383d145932963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From
https://lists.freedesktop.org/archives/wayland-devel/2024-November/043860.html:

In terms of new features we have a "sticky" mode for drag-locking. Previously a
tap-and-drag lock would always expire after a timeout, now the button is held
logically down until a completing tap. Desktop environments are encouraged to
use this as the default as it provides a better experience for anyone with
less-than-perfect dexterity. For backwards-compatibility reasons libinput cannot
easily change its defaults without risking bugs in the callers.

For tablet pads we now support tablet pad mode groups for devices without
status LEDs as well, the previous implementation was tied to LEDs which some
devices like the XP Pen ACK05 remote don't have. Since the mode is a software
feature anyway tying it to LEDs is not necessary.

If a tablet is unknown to libwacom we now assume that it is a built-in tablet.
This matches the behavior of libwacom 2.11 but in our case the only visible
result is that the device now has the calibration configuration available.
Better to have it and not use it, as they say.

The available area on external tablets can be reduced via the new tablet "area"
configuration. Users can set a rectangle smaller than the width/height
of the tablet and input outside this rectangle will be ignored.

For packagers: the check dependency is now optional, almost all tests
can now run without it.

And then we have of course the usual collection of bug fixes and
device-specific quirks.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 2ab56e4827..f6ec570588 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8c582b86c6865aaee2516ee96b299cef60c98e113d1391bbd2683eac08221a07  libinput-1.26.0.tar.bz2
+sha256  8e823cc9f44c51b63ae90af0b73676ed82c0402cc1cbd4a59ac91b7bb6cad716  libinput-1.27.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 3b5070c85e..ee15b781e6 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.26.0
+LIBINPUT_VERSION = 1.27.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

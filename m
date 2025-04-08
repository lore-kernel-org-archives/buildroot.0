Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E263C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 13:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F788408FD;
	Mon, 14 Apr 2025 13:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQwBTrqThkoK; Mon, 14 Apr 2025 13:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168774092B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168774092B;
	Mon, 14 Apr 2025 13:59:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F3F250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0589F60869
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTkuIYbJ_UZY for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F252600CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F252600CD
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F32D38461A; Mon, 14 Apr 2025 13:59:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Apr 2025 09:06:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c2df4231bf2b87de38dc33a25366ba54f33238f6
X-Git-Newrev: fae66b0aa290b9eb62685436da0379049ca3a4dc
X-Patchwork-Hint: ignore
Message-Id: <20250414135948.F32D38461A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xwayland:
 security bump to version 24.1.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fae66b0aa290b9eb62685436da0379049ca3a4dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

23.2.5 fixes the following security issues:

1) CVE-2024-31080: Heap buffer overread/data leakage in ProcXIGetSelectedEvents

Introduced in: xorg-server-1.7.0 (2009)
Fixed in: xorg-server-21.1.12 and xwayland-23.2.5
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0
Found by: Alan Coopersmith of Oracle Solaris, while investigating
       https://debbugs.gnu.org/cgi/bugreport.cgi?bug=69762

The ProcXIGetSelectedEvents() function uses the byte-swapped length of the
return data for the amount of data to return to the client, if the client
has a different endianness than the X server.

2) CVE-2024-31081: Heap buffer overread/data leakage in ProcXIPassiveGrabDevice

Introduced in: xorg-server-1.7.0 (2009)
Fixed in: xorg-server-21.1.12 and xwayland-23.2.5
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645d
Found by: Alan Coopersmith of Oracle Solaris

The ProcXIPassiveGrabDevice() function uses the byte-swapped length of the
return data for the amount of data to return to the client, if the client
has a different endianness than the X server.

3) CVE-2024-31083: User-after-free in ProcRenderAddGlyphs

Introduced in: prior to X11R6.7 (2004)
Fixed in: xorg-server-21.1.12 and xwayland-23.2.5
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/bdca6c3d1f5057eeb3160
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The ProcRenderAddGlyphs() function calls the AllocateGlyph() function
to store new glyphs sent by the client to the X server.  AllocateGlyph()
would return a new glyph with refcount=0 and a re-used glyph would end up
not changing the refcount at all. The resulting glyph_new array would thus
have multiple entries pointing to the same non-refcounted glyphs.

ProcRenderAddGlyphs() may free a glyph, resulting in a use-after-free when
the same glyph pointer is then later used.

https://lists.x.org/archives/xorg-announce/2024-April/003497.html

24.1.4 fixes the following security issues:

1) CVE-2024-9632: Heap-based buffer overflow privilege escalation in
_XkbSetCompatMap

Introduced in: xorg-server-1.1.1 (2006)
Fixed in: xorg-server-21.1.14 and xwayland-24.1.4
Fix:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/85b776571487f52e756f68a069c768757369bfe3
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The _XkbSetCompatMap() function attempts to resize the `sym_interpret`
buffer.

However, It didn't update its size properly. It updated `num_si` only,
without updating `size_si`.

This may lead to local privilege escalation if the server is run as root
or remote code execution (e.g. x11 over ssh).

xorg-server-21.1.14 and xwayland-24.1.4 have been patched to fix this issue.

https://lists.x.org/archives/xorg-announce/2024-October/003545.html

24.1.6 fixes the following security issues:

1) CVE-2025-26594: Use-after-free of the root cursor

Introduced in: Unknown - Prior to X11R6.6 Xorg baseline
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The root cursor is referenced in the xserver as a global variable. If
a client manages to free the root cursor, the internal reference points
to freed memory and causes a use-after-free.

xorg-server-21.1.16 and xwayland-24.1.6 have been patched to fix this issue.

2) CVE-2025-26595: Buffer overflow in XkbVModMaskText()

Introduced in: Prior to X11R6.1
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The code in XkbVModMaskText() allocates a fixed sized buffer on the
stack and copies the names of the virtual modifiers to that buffer.

The code however fails to check the bounds of the buffer correctly and
would copy the data regardless of the size, which may lead to a buffer
overflow.

xorg-server-21.1.16 and xwayland-24.1.6 have been patched to fix this issue.

3) CVE-2025-26596: Heap overflow in XkbWriteKeySyms()

Introduced in: initial version of xc/programs/Xserver/xkb/xkb.c in X11R6
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The computation of the length in XkbSizeKeySyms() differs from what is
actually written in XkbWriteKeySyms(), which may lead to a heap based
buffer overflow.

xorg-server-21.1.16 and xwayland-24.1.6 have been patched to fix this issue.

4) CVE-2025-26597: Buffer overflow in XkbChangeTypesOfKey()

Introduced in: X11R6.1
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

If XkbChangeTypesOfKey() is called with 0 group, it will resize the key
symbols table to 0 but leave the key actions unchanged.

If later, the same function is called with a non-zero value of groups,
this will cause a buffer overflow because the key actions are of the wrong
size.

5) CVE-2025-26598: Out-of-bounds write in CreatePointerBarrierClient()

Introduced in: xorg-server-1.14.0
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The function GetBarrierDevice() searches for the pointer device based on
its device id and returns the matching value, or supposedly NULL if no
match was found.

However the code will return the last element of the list if no matching
device id was found which can lead to out of bounds memory access.

6) CVE-2025-26599: Use of uninitialized pointer in compRedirectWindow()

Introduced in: Xorg 6.8.0.
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The function compCheckRedirect() may fail if it cannot allocate the backing
pixmap. In that case, compRedirectWindow() will return a BadAlloc error
without the validation of the window tree marked just before, which leaves
the validate data partly initialized, and the use of an uninitialized pointer
later.

7) CVE-2025-26600: Use-after-free in PlayReleasedEvents()

Introduced in: X11R5
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

When a device is removed while still frozen, the events queued for that
device remain while the device itself is freed and replaying the events
will cause a use after free.

8) CVE-2025-26601: Use-after-free in SyncInitTrigger()

Introduced in: X11R6
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

When changing an alarm, the values of the change mask are evaluated one
after the other, changing the trigger values as requested and eventually,
SyncInitTrigger() is called.
If one of the changes triggers an error, the function will return early,
not adding the new sync object.
This can be used to cause a use after free when the alarm eventually
triggers.

https://lists.x.org/archives/xorg-announce/2025-February/003584.html

Drop now removed xwayland_eglstream option:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/701284f057b41bba0b0cc4b3f851958af95ac978

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 57d2bdb1238aa1743400e59f2d52efd51f373180)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 5bb26bf17e..2a23891752 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-January/003443.html
-sha256  a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b  xwayland-23.2.4.tar.xz
-sha512  ac3ff208cbef5bbe4637c335cfda226489c93b0a3768f2f4fb0201c588485ede38262fbce77ef1425b3d2a0be61b6580df53341c7b95e6072c8b6371ad29d187  xwayland-23.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-February/003586.html
+sha256  737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7  xwayland-24.1.6.tar.xz
+sha512  b6dcc87f5c4d880cb23216518171a704c2a501803ac2efd9d01760895d755a617cd82313c6516f27a888b0581c64d74e3f8db5c238e1ae0d13da6cc1a547c02f  xwayland-24.1.6.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index c66dd471ac..47dc0b39e6 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 23.2.4
+XWAYLAND_VERSION = 24.1.6
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
@@ -25,7 +25,6 @@ XWAYLAND_DEPENDENCIES = \
 	xorgproto
 XWAYLAND_CONF_OPTS = \
 	-Ddri3=true \
-	-Dxwayland_eglstream=false \
 	-Dxvfb=false \
 	-Ddefault_font_path=/usr/share/fonts/X11/ \
 	-Ddtrace=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

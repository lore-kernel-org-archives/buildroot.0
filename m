Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB72DC282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C444849D7;
	Fri, 28 Feb 2025 16:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nisAXJFdV63; Fri, 28 Feb 2025 16:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C8C484B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8C484B97;
	Fri, 28 Feb 2025 16:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4151DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AD264251D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIEOeNDw3osm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 919EC42519
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 919EC42519
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D64E84C4E; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Jan 2025 22:44:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b26bd08fc4d84c9dbbe4793422c790c9a9d136a6
X-Git-Newrev: 11f4367610923748f078367ad7118a8ead9efe9a
X-Patchwork-Hint: ignore
Message-Id: <20250228162959.8D64E84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: fix Qemu stub
 builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=11f4367610923748f078367ad7118a8ead9efe9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit "stubs: avoid duplicate symbols in libqemuutil.a" [1],
Qemu doesn't build with:

  ./configure --enable-user --disable-system --enable-tools

  /usr/bin/ld: libhwcore.a.p/hw_core_qdev.c.o: in function 'device_finalize':
  [...]output/build/host-qemu-9.2.0/build/../hw/core/qdev.c:689:(.text+0x75c): undefined reference to 'qapi_event_send_device_deleted'
  collect2: error: ld returned 1 exit status

Indeed, with have_system = false and have_tools = true, Qemu needs the
stubs for QAPI events added by stub_ss.add(files('qdev.c')) to provide
qapi_event_send_device_deleted().

Fixes: 388b849fb6c33882b481123568995a749a54f648.

[1] https://gitlab.com/qemu-project/qemu/-/commit/388b849fb6c33882b481123568995a749a54f648

Reported: https://gitlab.com/qemu-project/qemu/-/issues/2766

Fixes:
http://autobuild.buildroot.org/results/260/2608b7cfcedc21269f08063493fe66c0381357f9

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...y-build-stubs-for-QAPI-events-when-needed.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch b/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
new file mode 100644
index 0000000000..e31eb11909
--- /dev/null
+++ b/package/qemu/0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
@@ -0,0 +1,45 @@
+From ffd5e7cbc0cf2d1c0984bb453cc9e125c7259436 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 7 Jan 2025 21:52:51 +0100
+Subject: [PATCH] stubs: only build stubs for QAPI events when needed
+
+Since commit "stubs: avoid duplicate symbols in libqemuutil.a" [1],
+Qemu doesn't build with:
+
+  ./configure --enable-user --disable-system --enable-tools
+
+  /usr/bin/ld: libhwcore.a.p/hw_core_qdev.c.o: in function 'device_finalize':
+  [...]output/build/host-qemu-9.2.0/build/../hw/core/qdev.c:689:(.text+0x75c): undefined reference to 'qapi_event_send_device_deleted'
+  collect2: error: ld returned 1 exit status
+
+Indeed, with have_system = false and have_tools = true, Qemu needs the
+stubs for QAPI events added by stub_ss.add(files('qdev.c')) to provide
+qapi_event_send_device_deleted().
+
+Fixes: 388b849fb6c33882b481123568995a749a54f648.
+
+[1] https://gitlab.com/qemu-project/qemu/-/commit/388b849fb6c33882b481123568995a749a54f648
+
+Upstream: https://gitlab.com/qemu-project/qemu/-/issues/2766
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ stubs/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stubs/meson.build b/stubs/meson.build
+index e91614a874..838a8ca3e3 100644
+--- a/stubs/meson.build
++++ b/stubs/meson.build
+@@ -58,7 +58,7 @@ if have_user
+ 
+   # Stubs for QAPI events.  Those can always be included in the build, but
+   # they are not built at all for --disable-system --disable-tools builds.
+-  if not (have_system or have_tools)
++  if not have_system and have_tools
+     stub_ss.add(files('qdev.c'))
+   endif
+ endif
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A95C83F17
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 14:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4383A60DEF;
	Sat, 26 Jul 2025 14:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85RCcNwtNqMJ; Sat, 26 Jul 2025 14:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 302CF60BDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302CF60BDA;
	Sat, 26 Jul 2025 14:44:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54409198
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 14:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466124011C
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 14:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBTgR4_ePBEB for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 14:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E56A400D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E56A400D5
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 14:44:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4936686B29; Sat, 26 Jul 2025 14:44:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 16:38:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7de76ae8d110e9eef9be060e8b62ccb46b99f07d
X-Git-Newrev: cec0acc84d8357de0bac85b27659566b6cbf692c
X-Patchwork-Hint: ignore
Message-Id: <20250726144434.4936686B29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: fix build failure w/ musl
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8937896329355450719=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8937896329355450719==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cec0acc84d8357de0bac85b27659566b6cbf692c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting GCC14 'implicit-function-declaration' are treated as errors by
default. When building kvmtool with musl libc, the following error
occurs due to missing declaration of 'basename':

```
vfio/core.c:537:22: error: implicit declaration of function ‘basename’ [-Wimplicit-function-declaration]
  537 |         group_name = basename(group_path);
      |                      ^~~~~~~~
vfio/core.c:537:22: warning: nested extern declaration of ‘basename’ [-Wnested-externs]
vfio/core.c:537:20: error: assignment to ‘char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  537 |         group_name = basename(group_path);
      |                    ^
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_KVMTOOL=y
EOF
make olddefconfig
make kvmtool
```

This patch adds the upstream commit that fixes this issue by including
the appropriate header, ensuring compatibility with musl and GCC14.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...o-include-libgen-h-for-musl-compatibility.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/kvmtool/0002-vfio-include-libgen-h-for-musl-compatibility.patch b/package/kvmtool/0002-vfio-include-libgen-h-for-musl-compatibility.patch
new file mode 100644
index 0000000000..e75ede6af1
--- /dev/null
+++ b/package/kvmtool/0002-vfio-include-libgen-h-for-musl-compatibility.patch
@@ -0,0 +1,48 @@
+From ba6830eec0f5ab734b093657b16b555e0437b927 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Sun, 29 Jun 2025 22:22:21 +0200
+Subject: vfio: include libgen.h (for musl compatibility)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Starting GCC14 'implicit-function-declaration' are treated as errors by
+default. When building kvmtool with musl libc, the following error
+occurs due to missing declaration of 'basename':
+
+vfio/core.c:537:22: error: implicit declaration of function ‘basename’ [-Wimplicit-function-declaration]
+  537 |         group_name = basename(group_path);
+      |                      ^~~~~~~~
+vfio/core.c:537:22: warning: nested extern declaration of ‘basename’ [-Wnested-externs]
+vfio/core.c:537:20: error: assignment to ‘char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
+  537 |         group_name = basename(group_path);
+      |                    ^
+
+This patch fixes the issue by including the appropriate header, ensuring
+compatibility with musl and GCC14.
+
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
+Link: https://lore.kernel.org/r/20250629202221.893360-1-thomas.perale@mind.be
+Signed-off-by: Will Deacon <will@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/patch/?id=ba6830eec0f5ab734b093657b16b555e0437b927
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ vfio/core.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/vfio/core.c b/vfio/core.c
+index 3ff2c0b0..8f884898 100644
+--- a/vfio/core.c
++++ b/vfio/core.c
+@@ -3,6 +3,7 @@
+ #include "kvm/ioport.h"
+ 
+ #include <linux/list.h>
++#include <libgen.h>
+ 
+ #define VFIO_DEV_DIR		"/dev/vfio"
+ #define VFIO_DEV_NODE		VFIO_DEV_DIR "/vfio"
+-- 
+cgit 1.2.3-korg
+

--===============8937896329355450719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8937896329355450719==--

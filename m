Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425F9C624D4
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 14:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1678088A;
	Tue,  1 Sep 2026 14:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsBnG4tI4loT; Tue,  1 Sep 2026 14:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788271886;
	bh=d6izjKKq45jXysg0sN6fN1F+E/zNYHfMLO38VlCO9YM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=scSNeULz8+hhjSpwLhLKVxOtocIULM+dh3GvyvtU8t0AL94qcKG+UAM4hbxd/YOGm
	 SAIskbEth/65MTmanY+w8tFDw/1R4GWdUDEBNTqwCRD/1tZI6is7gDohylAOHSpFjW
	 C8la1dYVipsGO07AnvNcFd+viMBnp+nwV3/zAt5JeymJj8n8R18QfdaCOhcKf2uY8B
	 XAwC/UpBCBdgDpD46h6Lo55Vw+CjWYqTFKT1f1JsHtrTL6yYLiUy6sT9Ws8D09oQsN
	 TtHcXFpn2CWZn4Voe2YdPx8EzkUJrmuTemUcGUmq4rud5ZeNS3JS8PXq4JA3gDFO/j
	 kg13GJYNWVj2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3828081E;
	Tue,  1 Sep 2026 14:11:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97808265
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9550C40081
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BebCZkqmCxqK for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E04C40079
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 745BC934EF; Tue,  1 Sep 2026 14:10:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 16:10:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0742e67d2f94118d4227d29e409dc50de0acfb07
X-Git-Newrev: db3d0d44acae1bda1fb5d06cbdd01f7fe3621857
X-Patchwork-Hint: ignore
Message-Id: <20260901141024.745BC934EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: fix example build issue when
 libvirt is present
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
Content-Type: multipart/mixed; boundary="===============2844411745203941478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2844411745203941478==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db3d0d44acae1bda1fb5d06cbdd01f7fe3621857
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When libvirt is present before DPDK is built, some additional examples
are compiled. One of them fails to build due to a missing <stdlib.h>
include. Let's import a patch from OpenSuse, that we have submitted
upstream, to fix this issue.

We couldn't find any autobuilder failure for this issue, but the
following defconfig allows to reproduce the failure:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_DPDK=y
BR2_PACKAGE_DPDK_EXAMPLES=y
BR2_PACKAGE_LIBVIRT=y

The problem exists since DPDK v19.11, so it has been in Buildroot
since DPDK was introduced in commit
d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._power_manager-add-missing-stdlib.h-heade.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/dpdk/0002-examples-vm_power_manager-add-missing-stdlib.h-heade.patch b/package/dpdk/0002-examples-vm_power_manager-add-missing-stdlib.h-heade.patch
new file mode 100644
index 0000000000..899842c2b2
--- /dev/null
+++ b/package/dpdk/0002-examples-vm_power_manager-add-missing-stdlib.h-heade.patch
@@ -0,0 +1,46 @@
+From 9f6c3191b3178294d698cdca859ce9dac78517ff Mon Sep 17 00:00:00 2001
+From: Guillaume Gardet <Guillaume.Gardet@arm.com>
+Date: Thu, 29 Aug 2024 16:33:19 +0200
+Subject: [PATCH] examples/vm_power_manager: add missing <stdlib.h> header
+ include for strtol
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+strtol is defined in stdlib.h
+
+Fixes the following build failure:
+
+../examples/vm_power_manager/guest_cli/vm_power_cli_guest.c: In function ‘cmd_query_freq_list_parsed’:
+../examples/vm_power_manager/guest_cli/vm_power_cli_guest.c:208:42: error: implicit declaration of function ‘strtol’; did you mean ‘strtok’? [-Wimplicit-function-declaration]
+  208 |                 lcore_id = (unsigned int)strtol(res->cpu_num, &ep, 10);
+      |                                          ^~~~~~
+      |                                          strtok
+
+Fixes: 0e8f47491f090f44a4956429cb27f6942b6618b0 ("examples/vm_power: add command to query CPU frequency")
+Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>
+[Thomas:
+- retrieve patch from
+https://build.opensuse.org/projects/openSUSE:42:Factory-Candidates-Check/packages/dpdk/files/0001-examples-vm_power_manager-add-missing-header.patch?expand=1
+- improve commit message]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://mails.dpdk.org/archives/dev/2026-August/344552.html
+---
+ examples/vm_power_manager/guest_cli/vm_power_cli_guest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/vm_power_manager/guest_cli/vm_power_cli_guest.c b/examples/vm_power_manager/guest_cli/vm_power_cli_guest.c
+index 4114593cee..63a59c8b10 100644
+--- a/examples/vm_power_manager/guest_cli/vm_power_cli_guest.c
++++ b/examples/vm_power_manager/guest_cli/vm_power_cli_guest.c
+@@ -6,6 +6,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <termios.h>
+ 
+ #include <cmdline_rdline.h>
+-- 
+2.55.0
+

--===============2844411745203941478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2844411745203941478==--

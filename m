Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BEBC88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 06:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD42D806BA;
	Wed, 16 Sep 2026 06:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GteHB8W82GTj; Wed, 16 Sep 2026 06:52:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C100280790
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789541539;
	b=oVwxHvSQHcqOuE6U/uFNtzlHx9aOHHIX6pnq5t5K/PLZKSaOW9snP7EqdLLEpP9epQW9
	 JnrZ+qYdKUlt1RSiEXR2+FsKo6SpL4cj1V4jWQgfJ5ZY7C6E3Vbc07wyKHh7XamPjwPKT
	 IOZMRZmqfHO7Ytra4xdc53xouDGtKCtSVECFZXpIbVbdkCSWp2DhgfgghNT6oaaMPQbM3
	 fEdzLQV2BCEFAJtJyYNV9Tigr4CE/WR6B2Esw+6b2DKqG+c78HMQU4YceGUs7QWGC5/Ke
	 07YyRGKDqfs0NcC8oM3IeFmsbsiDj8XSSdADMBsm4RykP6aQArnXc15QhvTCU043vGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789541539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Errors-To:Sender;
	bh=0BTDooC1duKpbscR/iYtBtSS/00WVq6qDI3UIf14o2M=;
	b=mBEKGY583jQPDS+I+O9zUjG5CC5xe6tIAMjMIjOnxSHr4O9mcmkYwSZfciDFfQnLMALx
	 RSsM3FaXTSb/9iWTcCs22rjb/Ls9OTYTvOH7kzQVrSIzm2mra9shYuwsq4dAkcu3tlDVQ
	 iDuGXoFXbAmPp6V9DIOYEZX6in5UJYCjMr63sP6LceA17ZzlFgiUBwsGM1TBzj9hQq7sG
	 QkSf0qPpa28qJCEBofC2u9I8Ok053VzBFmk0ak0Vpl0LUui0HOjYyBTUhrrehHu9nn1Ye
	 32Tz+DsLhF4TjeTBX+A8CsPBirMB85HW9QEsfv7xYV8pU9/R3NUzf+Ch6beOGEKOW8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789541539;
	bh=0BTDooC1duKpbscR/iYtBtSS/00WVq6qDI3UIf14o2M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SDl5i7xEy3nQf+7FuoBO0Wlgz0IF1jMQ4VsXJQUlWbk2E2r5/alnFT2ZkBKV74co8
	 lH6JaXWyR5STRiQjvqF04NEbofX5heLc9WsSXnl8zGbgCrpz/7VYGi269iNq9xg8h7
	 O3u42ivIszdGoIIF1UwWytKw5pF/BTjcXNKYrUhZOaLgAMg8GKA6uQ/5BundGhC+jE
	 1l7VvOAquuYRmmyWj6rQV+IPY9C3m24vn8s62KwIB+obFyv5kSexmb+3FTkE8mvsyX
	 lxLwuRytnCt7rPVwbCDxgGLSKZf7AST25WxvBmBhnTU+fPtnNeQ9aiweVicDJpVeqX
	 sNaRyojRLerrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C100280790;
	Wed, 16 Sep 2026 06:52:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F4BC3AF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8579E60689
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zh0dL7E9F8P for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 06:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D2756605E6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789541537;
 b=BvJN/GHkhKUSIcyQzhf7O8OT/6sVyCY9djbVdFU5xyEWHOdyZJd5AXkW0C4LU0It1BgW
 62HlL9SfbVpW71ohoPDDBga8HAikYVss6ZB72osbVpCZpj8gxQrK/tmQrwefhfMNDPnP9
 T0zMkhdRR6U/DicINme6a1g89/IVIVZlg5I5reaPoMNrqKmNSMZKpn4qr7p6C59oahnh3
 d2JkSQxn2oRXwI9nzuyxYLJNL2tBlSqbLo34c1h7ZhcBs831TO+jVN7IrNaadw7b2eUc9
 dYJIorvOTT9mDc8Idf/0JTkPfzdDf6h1ePqM/HzMbs28efudTUYd1gY5TfPqNgJQoKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789541537;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1+CBu4s41Qr/tCalf5afzRnrKwlqJTNC5d0/Ib3ZoTE=;
 b=dv+Q1wckuXV1QtBFEORdRrM9WyQGQbA2RExymhVAb7b3Y3QZRm435/hIKKvlwk+ev8/h
 31l9HyUCtrSTg5S11dwRlpuQjJJuqCL9kAEfBQGRi/Ie53b9ms4jtW5aNbuH53cYqn93z
 PzVeTb5xAfgVw0MDmV5C7dgRqUrtaayYLzgTX8rGgeCYyn11pkp4zr0qG8YEpiZF9LP3g
 8aAIT18otQc4jCyV8h2LlFbqHxi+iYsheZUPtyXk0zEUVI35R5qR7Mu8OyylQ2WpWR+Dx
 0nh0HAUWkJJIe+U0v83knHgndDAxQY2MLmjFNCv0IM5ZjBM2DLn13MMCoKpXP2PGVLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2756605E6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:52:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9793695CC9; Wed, 16 Sep 2026 06:51:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 08:51:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05021d4075ee14b5fb177c6435b3625323b55ef4
X-Git-Newrev: f63e5724327c890c0e5713fc102a4da1e302c587
X-Patchwork-Hint: ignore
Message-Id: <20260916065111.9793695CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
Content-Type: multipart/mixed; boundary="===============2447433546876231591=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2447433546876231591==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f63e5724327c890c0e5713fc102a4da1e302c587
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
qemu-xen dependency will not be handled and the patch will fail to apply with
the following error.

Fixes: build error below
Applying 0002-Update-linker-flags.patch using patch:
patching file tools/Makefile
Hunk #1 succeeded at 36 (offset -1 lines).
Hunk #2 succeeded at 185 (offset -8 lines).
can't find file to patch at input line 76
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
|index 6bcc83ba..2590904e 100644
|--- a/tools/qemu-xen/include/hw/xen/xen_native.h
|+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1

To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
0002-Update-linker-flags.patch so that modifying source from the qemu-xen
package is no longer included.

Instead of patching qemu-xen, a better solution is undefining the
__XEN_INTERFACE_VERSION__ from the qemu-xen package.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
 # BR2_PACKAGE_XEN_TOOLS is not set

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/0002-Update-linker-flags.patch | 16 +---------------
 package/xen/xen.mk                         |  3 ++-
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/package/xen/0002-Update-linker-flags.patch b/package/xen/0002-Update-linker-flags.patch
index ac02722781..3ba678cd9b 100644
--- a/package/xen/0002-Update-linker-flags.patch
+++ b/package/xen/0002-Update-linker-flags.patch
@@ -16,8 +16,7 @@ Upstream: Buildroot specific. This is a temporary patch for an intermediate bump
 Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
 ---
  tools/Makefile                              | 29 ++++++++++++++++++++-
- tools/qemu-xen/include/hw/xen/xen_native.h |  2 +-
- 2 files changed, 29 insertions(+), 2 deletions(-)
+ 1 file changed, 28 insertions(+), 1 deletions(-)
 
 diff --git a/tools/Makefile b/tools/Makefile
 index a9a3196e..5d289651 100644
@@ -69,19 +68,6 @@ index a9a3196e..5d289651 100644
  		--bindir=$(LIBEXEC_BIN) \
  		--datadir=$(SHAREDIR)/qemu-xen \
  		--localstatedir=$(localstatedir) \
-diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
-index 6bcc83ba..2590904e 100644
---- a/tools/qemu-xen/include/hw/xen/xen_native.h
-+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
-@@ -2,7 +2,7 @@
- #define QEMU_HW_XEN_NATIVE_H
- 
- #ifdef __XEN_INTERFACE_VERSION__
--#error In Xen native files, include xen_native.h before other Xen headers
-+#warning In Xen native files, include xen_native.h before other Xen headers
- #endif
- 
- /*
 -- 
 2.51.0
 
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 75252d1123..bddfdbba38 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -40,7 +40,8 @@ XEN_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	HOST_EXTRACFLAGS="-Wno-error" \
 	XEN_HAS_CHECKPOLICY=n \
-	$(TARGET_CONFIGURE_OPTS)
+	$(TARGET_CONFIGURE_OPTS) \
+	EXTRA_CFLAGS_QEMU_XEN="-U__XEN_INTERFACE_VERSION__"
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen

--===============2447433546876231591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2447433546876231591==--

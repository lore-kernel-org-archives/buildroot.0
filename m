Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D868C25B47
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 19:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F2B705AA;
	Tue, 24 Oct 2023 19:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F2B705AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5UnaM72HMAQ; Tue, 24 Oct 2023 19:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBCE5705A2;
	Tue, 24 Oct 2023 19:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBCE5705A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 064A31BF286
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29FC430A2
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D29FC430A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOBfxhzE7PtW for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 19:21:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B26C2405C7
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 19:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26C2405C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92238842BA; Tue, 24 Oct 2023 19:21:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 21:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0cecc326a9649bc3b89153d762c2c2a4382f60d
X-Git-Newrev: 75fa573ef9336b57d1cfb86bfcaaed4872f64ac6
X-Patchwork-Hint: ignore
Message-Id: <20231024192142.92238842BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-kernel-module: add
 BR2_MAKE_HOST_DEPENDENCY
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

commit: https://git.buildroot.net/buildroot/commit/?id=75fa573ef9336b57d1cfb86bfcaaed4872f64ac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
$(BR2_MAKE) to avoid build issue with kernel version >= 6.2 and GNU
Make version < 3.82. However, the same issue is actual for kernel
modules as well.

Using $(BR2_MAKE) should guarantee a consistent behavior between
kernel and kernel-modules builds.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
[yann.morin.1998@free.fr: minor coding style]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-kernel-module.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index fcd6b8bc29..4f64a73f11 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -50,11 +50,13 @@ LINUX_NEEDS_MODULES = y
 endif
 
 # The kernel must be built first.
-$(2)_DEPENDENCIES += linux
+$(2)_DEPENDENCIES += \
+	linux \
+	$$(BR2_MAKE_HOST_DEPENDENCY)
 
 # This is only defined in some infrastructures (e.g. autotools, cmake),
 # but not in others (e.g. generic). So define it here as well.
-$(2)_MAKE ?= $$(MAKE)
+$(2)_MAKE ?= $$(BR2_MAKE)
 
 # If not specified, consider the source of the kernel module to be at
 # the root of the package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

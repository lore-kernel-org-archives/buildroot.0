Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5761E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686A3417B1;
	Sat, 30 Sep 2023 19:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686A3417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7PYgL8KcmVY; Sat, 30 Sep 2023 19:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 427DD417B3;
	Sat, 30 Sep 2023 19:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 427DD417B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 557BB1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3700A60FAF
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3700A60FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2OlmkYy9lTi for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3409A60F9D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3409A60F9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20A5C83CE1; Sat, 30 Sep 2023 19:51:58 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:49:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 379a21b4f445d55466af0d035c6e423fa5bc310c
X-Git-Newrev: 285413fb7bf073f4182e974622689786b37508e1
X-Patchwork-Hint: ignore
Message-Id: <20230930195158.20A5C83CE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add pipewire support
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

commit: https://git.buildroot.net/buildroot/commit/?id=285413fb7bf073f4182e974622689786b37508e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional pipewire support introduced in qemu 8.1.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/qemu/qemu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 87ecad5b52..6aaed32336 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -241,6 +241,13 @@ else
 QEMU_OPTS += --disable-numa
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE),y)
+QEMU_OPTS += --enable-pipewire
+QEMU_DEPENDENCIES += pipewire
+else
+QEMU_OPTS += --disable-pipewire
+endif
+
 ifeq ($(BR2_PACKAGE_SPICE),y)
 QEMU_OPTS += --enable-spice
 QEMU_DEPENDENCIES += spice
@@ -484,6 +491,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-netmap \
 		--disable-oss \
 		--disable-pa \
+		--disable-pipewire \
 		--disable-sdl \
 		--disable-selinux \
 		--disable-vde \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BC8C0219B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1DC40B3E;
	Sat, 14 Sep 2024 14:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78Ogy0Z7KK16; Sat, 14 Sep 2024 14:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B90440CAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B90440CAB;
	Sat, 14 Sep 2024 14:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDD351BF3FC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEEF981B8A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyu2s703YRS6 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1ED8120A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF1ED8120A
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:11:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C59F382B89; Sat, 14 Sep 2024 14:11:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:10:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 812bb30412cb87f3c05048b6a1030af0e4aab40b
X-Git-Newrev: ce4e5fd129b557ac0411d0a0704be43717310d6d
X-Patchwork-Hint: ignore
Message-Id: <20240914141152.C59F382B89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] bluez5_utils: disable asha profile
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce4e5fd129b557ac0411d0a0704be43717310d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

asha profile as it depends on audio profile which isn't selected
by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
below linking failure.

ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
asha.c:(.text.get_transport+0x2c): undefined reference to `media_transport_get_path'

Fixes: http://autobuild.buildroot.org/results/317bf4ad2593b1d1a8aec82cc0b3265285f00b7b/

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
[yann.morin.1998@free.fr: add autobuild reference]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bluez5_utils/bluez5_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index b1caef5cc5..59eb68de61 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,6 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
+	--disable-asha \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

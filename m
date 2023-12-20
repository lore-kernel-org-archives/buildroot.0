Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8084C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 11:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549F74092C;
	Wed, 20 Dec 2023 11:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549F74092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezPDKETE-NMT; Wed, 20 Dec 2023 11:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E8E40921;
	Wed, 20 Dec 2023 11:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E8E40921
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 742531BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B8E443634
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B8E443634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4k3UnownDXj for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 11:03:47 +0000 (UTC)
X-Greylist: delayed 429 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Dec 2023 11:03:46 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B113D43623
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp2.osuosl.org (Postfix) with ESMTP id B113D43623
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 11:03:46 +0000 (UTC)
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 20 Dec 2023 19:56:34 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
 by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id C50B62059053;
 Wed, 20 Dec 2023 19:56:34 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with
 ESMTP; Wed, 20 Dec 2023 19:56:34 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id E7DECAB18B;
 Wed, 20 Dec 2023 19:56:33 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 19:56:23 +0900
Message-Id: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/eudev: add sgx group for
 eudev-3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The eudev has "sgx" group in 50-udev-default.rules as default
since commit 247724da450b.

The group is defined by package/systemd [1], however, when
enabling BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y with
qemu_aarch64_virt_defconfig, the systemd isn't used and the following
warning occurs:

    udevd[153]: specified group 'sgx' unknown

Just add sgx group to the package/eudev.

[1] https://lists.buildroot.org/pipermail/buildroot/2022-April/641079.html

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 package/eudev/eudev.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 235a71967ef5..14e22ee50a1f 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -55,6 +55,10 @@ define EUDEV_INSTALL_INIT_OPENRC
 	@:
 endef
 
+define EUDEV_USERS
+	- - sgx -1 * - - - SGX device nodes
+endef
+
 HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 
 HOST_EUDEV_CONF_OPTS = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

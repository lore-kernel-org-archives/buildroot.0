Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24CAE784BA
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 19:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4531F418B8;
	Mon,  2 Oct 2023 19:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4531F418B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6YuM6ldYfVQ; Mon,  2 Oct 2023 19:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54723417A5;
	Mon,  2 Oct 2023 19:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54723417A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDC431BF336
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 19:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B444060B8F
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 19:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B444060B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXzK_ny86S0Y for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 19:52:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4D8A60AB7
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 19:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D8A60AB7
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EC6D2A4C031A
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 21:51:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49920)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qnOxT-0006Z1-0n
 for buildroot@buildroot.org; Mon, 02 Oct 2023 21:51:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 21:51:59 +0200
Message-Id: <20231002195159.3053254-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696276319;
 bh=yAZ/hG17BJW+91xteJGtJLSloKgXuG5kcMRZ5ZHlHVM=;
 h=From:To:Subject:Date:From;
 b=gunmDIo7R3l98xAYEuoGu2xK8ozd/kY63ZKuxGUG3atWuzEO1Yc9U+mO/npYmn/tO
 78mmZ0CrqOxNS+Hug3rZINDYnPJm0oeIfQ/GTHxqu2RyO+PT69wbQsUIn8eUw5Qk1F
 Q28me/2pyDFm3R9XCQvh4RW9caxHIO+4ZwCc8Ggb/9zQd69RbyXYzxL+MNwHZLfQwc
 USzXulk0th1sQABMVlTsXZCCFYrvvn6lEu61Am/Xn+8Vc84MbmqWpPVsTr3bu4sF9b
 RamSnR3KGjM5CbUkHk9nL3mKYq3b1yyDHlq4X2kRJDqCxML7wpbf3JRW226vuzUXMV
 3imtgNrGq8IQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gunmDIo7
Subject: [Buildroot] [PATCH 1/1] package/dhcp: fix cross build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error

Building dns library in /home/bernd/buildroot/br4/output/build/dhcp-4.4.3-
P1/bind/bind-9.11.36/lib/dns
./gen: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found 
(required by ./gen)
make[4]: *** [Makefile:601: include/dns/enumtype.h] Error 1
make[3]: *** [Makefile:595: include] Error 2

with this defconfig

BR2_x86_64=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y

Please note that this build error only occurs when the target and the
host system have the same arch. For example this defconfig builds fine:

BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y

on a Debian 12 x86_64 host using glibc-2.36:

$ /lib/ld-linux.so.2  --version
ld.so (Debian GLIBC 2.36-9+deb12u1) stable release version 2.36.

The error occurs since buildroot commit 34f8d874ee which bumped glibc
from 2.37 to 2.38.

This patch is inspired by the Yocto Project:
https://patchwork.yoctoproject.org/project/oe/patch/20230715212159.3265080-1-raj.khem@gmail.com/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dhcp/dhcp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 7be40191c8..094d361e45 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -32,6 +32,9 @@ DHCP_CONF_ENV = \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
 DHCP_BIND_EXTRA_CONFIG = \
+	--build=$(GNU_HOST_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--target=$(GNU_TARGET_NAME) \
 	BUILD_CC='$(HOSTCC)' \
 	BUILD_CFLAGS='$(HOST_CFLAGS)' \
 	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A2DE65D03
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 22:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446A540949;
	Thu, 21 Nov 2024 22:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcWUxinPz7D2; Thu, 21 Nov 2024 22:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E3F84098C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3F84098C;
	Thu, 21 Nov 2024 22:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2BEB69
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 22:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9BA340949
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 22:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvJ8VwOqObV0 for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 22:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2D994079B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2D994079B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2D994079B
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 22:54:00 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 910F6B0054E;
 Thu, 21 Nov 2024 23:53:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 21 Nov 2024 23:53:44 +0100
Message-ID: <20241121225344.203867-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732229638;
 bh=43mo0PwOgNi13kjdo4c2Fea5SL1W3V94H0dtZC/xKCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cT6Vd5mKCXbGn99e7+3Nopa7Z2PUNlVtjzMGAmUNd0ePl9w8dmauxUgPm9kwh3oLF
 zR5fbrToKR2qjd94XHSzUhQNMQPsIbjgnxBAe5uef64MaayKGIkvrrxoufqb3rhFSP
 CDZJXHdv51tGXOg78eDXPF+F+0mLhLftiKPSm3pmNy8SVZB9hmK6FNqxR31G3Uu5E6
 kx0chUcgQ+RkR1q49+JQh4kA9jMmMFbNiA6oSzRQlmILjnQJI8zvmmkMNKQBaBRCIC
 zsPknAO2p72R1uszLgZK1HnDSOVS/5IRn1/01xn88vsThe2Q7Dj5FH7G30amrMbGmN
 7k6hyrKFmqi0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cT6Vd5mK
Subject: [Buildroot] [PATCH 1/1] package/util-linux-libs: allowing building
 even on non-Y2038 compliant systems
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of util-linux to version 2.40.2 in Buildroot commit
f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
to 2.40.2"), the build will fail on systems that are not Y2038,
such as uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.

"--disable-year2038" was already added to util-linux in commit
11ae90b00 "package/util-linux: allowing building even on non-Y2038
compliant systems".

Fixes:
https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989

[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 0337e7e13a..1a66f3847a 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -28,7 +28,8 @@ UTIL_LINUX_LIBS_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_LIBS_CONF_OPTS += \
 	--disable-rpath \
-	--disable-makeinstall-chown
+	--disable-makeinstall-chown \
+	--disable-year2038
 
 UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

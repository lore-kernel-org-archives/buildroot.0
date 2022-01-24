Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7334BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3157840A6A;
	Mon, 24 Jan 2022 17:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvXJ6HBpsILg; Mon, 24 Jan 2022 17:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCDA7405F2;
	Mon, 24 Jan 2022 17:36:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 208EA1BF97D
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E5FB40225
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySLuUg9FLWT2 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65EF640209
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BE29381DB9; Mon, 24 Jan 2022 17:29:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 17:28:33 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c2475ccb4ccc4619d83980ea5e3add7cb7c34c9f
X-Git-Newrev: b2619c07f0a479cbdc3739b12d1e7a0cc4ffd562
X-Patchwork-Hint: ignore
Message-Id: <20220124172936.BE29381DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/samba4: add
 optional dependency to icu & libglib2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2619c07f0a479cbdc3739b12d1e7a0cc4ffd562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

icu is used in lib/util/charset/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=lib/util/charset/wscript_configure;hb=HEAD#l40

libglib2 is used in source3/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/wscript;hb=HEAD#l1778

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1c4c68b8fbf471919fbbaf4e688a75c4de36a331)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index b2fb4882cb..5673521836 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -16,8 +16,10 @@ SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
+	$(if $(BR2_PACKAGE_ICU),icu) \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 SAMBA4_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

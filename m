Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4EDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68AA40239;
	Sun, 13 Feb 2022 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEKBh0x1soxS; Sun, 13 Feb 2022 15:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 371FA40352;
	Sun, 13 Feb 2022 15:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33F051BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F36681858
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PcKQ0Rr0eIi for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 934E68184F
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2826382974; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f219cface0b219ae20e149fcf83e643de1793a34
X-Git-Newrev: 39aa793c0f6605586ad522267f97a33428f7de85
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.2826382974@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: enable dane-verify for
 OpenSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=39aa793c0f6605586ad522267f97a33428f7de85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of libopenssl to 1.1.x support for offline DANE
verification can be enabled.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libldns/libldns.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 7deca978da..86e7c0eafc 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -13,11 +13,9 @@ LIBLDNS_CPE_ID_VENDOR = nlnetlabs
 LIBLDNS_CPE_ID_PRODUCT = ldns
 LIBLDNS_INSTALL_STAGING = YES
 LIBLDNS_DEPENDENCIES = openssl
-# --disable-dane-verify can be removed after openssl bump to 1.1.x
 LIBLDNS_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--enable-dane \
-	--disable-dane-verify \
 	--enable-ecdsa \
 	--enable-gost \
 	--enable-sha2 \
@@ -26,6 +24,12 @@ LIBLDNS_CONF_OPTS = \
 	--without-pyldns \
 	--without-pyldnsx
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+LIBLDNS_CONF_OPTS += --enable-dane-verify
+else
+LIBLDNS_CONF_OPTS += --disable-dane-verify
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBLDNS_DEPENDENCIES += host-pkgconf
 # missing -lz breaks configure, add it using pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

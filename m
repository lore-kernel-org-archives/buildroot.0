Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353C6C43602
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8CB86062B;
	Sun,  5 Jul 2026 16:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFwrhCr4YChA; Sun,  5 Jul 2026 16:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04369606BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783269939;
	bh=A1OmXB05qY5XaIJvT58JdTtgzyWX6TiX61wFXcjQZws=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KCfqVPwbNGZVjpCosM82WihGjqZ4a2NndLkQmUcTl12ZPSR9T/NvTzRHvGZoeVlwJ
	 gCOWBi/u3/2mPp41ekoiKNEeGAlBTIUWY82Jb2Kl7y0i90aJC8xOU09TKkyTV7d/64
	 lWjZnUhpXGvRHVHjuD4dJS5a072Jva1HfmHIs4oL0incH+pQEleyAuHGxHQ7wQJBY0
	 jM6j3109CJGbuMXQiZLYhS3pTfi4Oici5xi+Wx8cZONptbFht9nL88SxoX34q8EzqA
	 4KllsgPJ7722wddQEWMOWenNeipRU1CSIEsi3crwiVLLEP7oD/MQEWKIWopqiMT8G/
	 3oVnGdwDBqc9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04369606BF;
	Sun,  5 Jul 2026 16:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E37F316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43F0D40538
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjZ2D7FtBrSH for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27DC140515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27DC140515
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27DC140515
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:45:35 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9C8F731E0B0E; Sun, 05 Jul 2026 18:45:33 +0200 (CEST)
Date: Sun, 5 Jul 2026 18:45:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <akqKLbhp-5ANsPNj@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1783269933; bh=vEKOCF6LZLTsUl8c0BxWLTTcT2Md6Eni2VNa9hkZmZ4=;
 h=Date:From:To:Cc:Subject:From;
 b=fDIvzWYImi8RSCeqR9dKipR1DJxz2Kl+vJDCHuHXoYTgTRN9odvZ72o/Aj3o0iR/C
 Jj/GGj/mELTvPB7dHDK9wjnFcG6zO7z2abps7GNwLUcNGNpUauJIfS89Yn9Zco6d//
 MsTcx2wFvMjIX0GeVvDnBKLGc9yLrPJOwQcijjFNPSLznhj6z2FVf0uI5MiQLwqk5i
 TRgOO5zLcgg/fb5SVY7cJnD9HyT72aBImDN28blBFL/Tqkg4qlLJ/cysRAPS1PNdFH
 OTuOuBW4PRzpFh+LbIzpQ9kBwShy60RxXDN4DfZIVrda1Q64i+CHXHr/34sB97vATM
 Hq8JaqTpsb8GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/stunnel: fix STUNNEL_CONF_ENV
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

In commit 45d056e7bf69aca4a036aba83e2573301996e9e0 stunnel got an
update to 5.78, but missed a change in configure.ac/configure.

Update STUNNEL_CONF_ENV accordingely.

Fixes:
 - https://autobuild.buildroot.net/results/69b/69b87d600ef9fa1d4eb8f65a7282c53808faf362/
 - https://autobuild.buildroot.net/results/b87/b87040d5264befa18da213d460f28a214410386b/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/stunnel/stunnel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8bd680af32..59321f910a 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -10,7 +10,7 @@ STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
 STUNNEL_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
+	ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

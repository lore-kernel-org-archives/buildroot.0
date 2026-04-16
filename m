Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C235F8E48C
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 22:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 989D481215;
	Thu, 16 Apr 2026 22:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSrY7UPrzhaO; Thu, 16 Apr 2026 22:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C25981211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776379925;
	bh=7i38j16WoEsbelL8OyzyY/rkcBu04lb5sR7zGFihaq4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pd/3KuE9HTW/Z0XGOMZmJlNVU1ZnJAm8MUn/VZuCWHhjph5ygowV5hixTYpTrEAcR
	 VFj6OcDQj4dI8TGLwpTsJ34Wu/R2R9019/IL/LsgFeSKh2tcBSegIaJ3vtoP7xNA81
	 BnTxlxcp65ADyBSykKN9ZdDCus7xdAwrL+xvxFrTj3EmCpjDcN4wbCGmNX3JaSzc4Q
	 /Rhkt+5Zpdl0F4pdKcIniahRITSrhkk6KKhmsVGBWu9YxMjtU3Eab5ROVe4HZHrF1m
	 99PpUL7OcZXoMDF5SalJFitpOR10CrVk9MW9V5yhhyUwCeYyQRuBevOeGRaa3OJyCV
	 araaHfcnsWTlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C25981211;
	Thu, 16 Apr 2026 22:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BBEB270
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 22:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D5F940C09
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 22:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8AbEvatYFMw for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 22:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 428AB40BF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 428AB40BF3
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 428AB40BF3
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 22:52:03 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 8128CE006E3;
 Fri, 17 Apr 2026 00:52:00 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Fri, 17 Apr 2026 00:51:10 +0200
Message-ID: <20260416225157.25398-2-fl@n621.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416225157.25398-1-fl@n621.de>
References: <20260416225157.25398-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1776379920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtiaZeIAaiqHzXELHuWSh2oPZEeeMWm12go45bZN5s0=;
 b=XZIYyhtMdwtSWRxlpj8Etqk3pe/9J2qvNSN5/kKIvaORhGKGq8dvY7P71dCxPxZsPcPEFn
 lscbf2c4v4OGx9LHDc8X2ZFyKttQfhqhte+Uel2I1PPrFr00m5xlagNZuc8CtsqyqS0qkp
 Q6gZ/06iSemwIm4DrUlZBbkQGxrVbng=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=XZIYyhtM
Subject: [Buildroot] [PATCH 2/2] package/libnfs: link with -latomic if needed
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

Building on SPARC fails with undefined references to
__atomic_fetch_sub_4 and friends.

Link with libatomic to get the required intrinsics.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/libnfs/libnfs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 12afb7c697..6b4106a9b1 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -12,6 +12,10 @@ LIBNFS_LICENSE = LGPL-2.1+ (library), BSD-2-Clause (protocol, .x files), GPL-3.0
 LIBNFS_LICENSE_FILES = COPYING LICENCE-BSD.txt LICENCE-LGPL-2.1.txt LICENCE-GPL-3.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBNFS_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBNFS_DEPENDENCIES += gnutls
 endif
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

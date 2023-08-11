Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE12C001DB
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 09:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C4980B3B;
	Fri, 11 Aug 2023 09:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C4980B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hiPqnJEeM4p; Fri, 11 Aug 2023 09:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FEF5834D5;
	Fri, 11 Aug 2023 09:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FEF5834D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 907B41BF5DF
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 09:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DCC9403E7
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 09:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DCC9403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9HJgV_-pdCe for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 09:43:25 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74256400D1
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 09:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74256400D1
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 08B243525336; Fri, 11 Aug 2023 11:43:22 +0200 (CEST)
Date: Fri, 11 Aug 2023 11:43:22 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNYCuqvdnyJ1p2CB@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691747003; bh=tt2fsRLVgMjh36iIEWF6ieB+R2aDgus2vemlQI8pWac=;
 h=Date:From:To:Subject:From;
 b=Wmra6ZGlmEPhb5XKMDEYyl6zO+QCJ4O7Zz5n5nBx8zTEvDyjjoABKbL5lsh8jEIAe
 RGb4C2Tn8LJ7WWIHiLSl42Si+ONVdMSQfq3fILsyODupZGnGm642qfIGxmhDPa83m8
 Q1a5WjdRjou7EvKYa/CidevWhH52SqUcWK+TYJNDvGJ+Dc+QWPxh15vSJn6tcQEvmO
 aqySXCV4EA4FcjUTaYQ7JqpmRB++XhjIJ7D9tT16XqZ97OVU6RC8JQYdezq0QaBHGI
 3CyfsTg9PSueSaMGYaAYuf3tkZscXAi/L6GHW+innLm/6irAl1azL9Nwzhvf2HtbKD
 O0mtTveOgWm/w==
Subject: [Buildroot] [PATCH 2/2] package/xfsprogs: fix linking error when
 -O0 is used
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

Urcu does not like -O0 it needs gcc optimizations.
Force -O1 in this case. Inspired by package fwts.

Fixes:
 - http://autobuild.buildroot.net/results/3bd/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/xfsprogs/xfsprogs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index e174ac5397..62ea5d3df8 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -27,6 +27,10 @@ else
 XFSPROGS_CONF_OPTS += --disable-libicu
 endif
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+XFSPROGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

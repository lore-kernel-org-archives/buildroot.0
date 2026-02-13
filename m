Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC5AEDF175
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 15:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24491843B4;
	Fri, 13 Feb 2026 15:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAVwMzsKlQYL; Fri, 13 Feb 2026 15:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DDAD843AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770996928;
	bh=ydcxbJoAl4eFBezTrSPdfas7fsJNHQQX/t7nyB2eEhU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HIx6gHU/cJsKj1Jg56a9VKm/iR2KD7aR1b3MAw5UO+/jbRcgpLRrQtmdiTmfP5G/K
	 NA4g2KfsZFN+1pvlNk3x3Px25HU3PRwVkcw+dYfhsRi8ZO0keETf5K2wtDdV30OdCC
	 JbImL3OL1A06Opnj0kNefF80DrFhSBHh6kpKiYvD+iRzVes/6IhDbMGmrpoPkE9pN6
	 PXdk6WhA4yJer+xQlVF8iMSLjHq59CXHdJD27A8ZwQ0h5uwinS1wZUg+T0/opDnM89
	 IW6K++A/FxTWAjegiCu10C1qwNCFAgKvWoHvNjLMuDuJSRj6HNggK4XVJ1D+hVj6Hq
	 JmPDxWO3308YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DDAD843AF;
	Fri, 13 Feb 2026 15:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D8AD255
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 15:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F6CE843AE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 15:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruG5O-lHtshL for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 15:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FA828439A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FA828439A
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FA828439A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 15:35:26 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 55FFE31E0AFD; Fri, 13 Feb 2026 16:35:23 +0100 (CET)
Date: Fri, 13 Feb 2026 16:35:23 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aY9Eu3230TANCBka@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770996923; bh=sLgr1munukc6VXSESJ3I8f2x/xJaH6DugRQw8bboqog=;
 h=Date:From:To:Subject:From;
 b=OnyxSbu3t3V0izc2B/IdaRgQkO6FO40KnUY37nVaFTct1p2kSldgfVOv0qsRlk5Fk
 StNpHa0DG1Ms3ishEHo2IivmS8DPI5PloBNqawqXqzFr5cXg9j48ank/nAm86m7DFP
 ELC7K6RlqmhsHF1aNIUMZ/tt7Kn/AIvGIekJV8Be+fGfZexTJmjR2R5VYYJ1MvlYIB
 3sSu6VyyIIMzPun5yN11DkdDZBxdAGMdaZSDG6YHuJfQfopNHbsVoSeP8bnjytn6u0
 f9UcvoGb1MP6nG49KsFy7JJbfA1Rh5fDpuEgsIE7NXHDuboDw644e/Nkh74/ApdwGj
 gMiorsC44G2ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/libfm: enable udisks support
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

For pcmanfm volume management we need to enable udisks support
in libfm.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libfm/libfm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index 419fce59d8..590542e663 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -22,4 +22,11 @@ else
 LIBFM_CONF_OPTS += --disable-exif
 endif
 
+ifeq ($(BR2_PACKAGE_UDISKS),y)
+LIBFM_CONF_OPTS += --enable-udisks
+LIBFM_DEPENDENCIES += udisks
+else
+LIBFM_CONF_OPTS += --disable-udisks
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897CCD5BC6
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B17D86088E;
	Sat, 23 May 2026 15:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_6DzmTh9la7; Sat, 23 May 2026 15:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F2B60B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549583;
	bh=UsVhmd/5oBRcXMgDtvRrlDV6qRY/C0/tXZ532KU/i2E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=j44PakxD8hEOMiMGLUpNBinQuVB1b9JU6KujenytoTkf60ocBtte/g3yNjDa9YZ58
	 nZayE2v9NxOnM61Wcmv0KeVBJ+M94xZW2bBMO+lYMNXt5Ht5OdJI6gDS8/GwfY2WQW
	 Q1k/0q5zLbhiPsnKAAJK2vl/GeZiAyWl3b1LGp8nFXkXLJTIJygLfM5cyg5qqCZCf4
	 cyezOzbPBJXvPnFYX/xbR4oxTS84o9TvwanXo94ey9jAkbco+WNIaC2hK+MnuEx0W9
	 JfKfJFscCK7jqUvPSiHkWV/OCvwIORgLLxw8gqng7/TJA79+5cmO6FnFRUb/f9BZ78
	 DYVuCk5s1F6AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F2B60B24;
	Sat, 23 May 2026 15:19:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45CCE263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BAF44017C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LQLVC_pWhKg for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB7BD4048A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7BD4048A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB7BD4048A
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79yQ-1xP9ZI3xPQ-00rpsb; Sat, 23
 May 2026 17:19:32 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:05 +0000
Message-ID: <20260523151911.10285-3-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:OiUfshkhtOGcGuBse6/2d/GileA7WpNOl+ZIU3g/1z8gKp6d2JK
 WBdyX36nLiFKeibzkO448Omku6VUUeE9DgQH4SAx0NWhM3bWp0JYdHbM2bWkis90JkKdX7E
 7wvWFnjU2QizjjHVZ7IKXGyK1NhnCEjgi3YxBSPJKHL7p8JwBSE8Bma2TLIrXkGT2MlbPjH
 MyYZD0q6jc3w66GrV8LYw==
UI-OutboundReport: notjunk:1;M01:P0:92eEb+bukWo=;7HGnDuzLa1dC2TLLIOlWtBC86VD
 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
 OFQQEXwWePeNJfrAjUJOT6DY7mcaALx/t78QfZ4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549573; x=1780154373; i=and@gmx.li;
 bh=xHfEOIugV5q890a2dXEgzIvYc/qfLlK/i/qiYwd1hSk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IOmyM0SLajOXxNfLMvMUYXUgaU6IAB/qnUdji4nkhxBaa5Sz3Z3RbxH3B/0r9X/V
 wKBSLZuW2UhVjndH2rhRAgLp6mkFvz9AnVWx0iGoMSSJPyyidKD0h0nroAq2Ej1LO
 WEld8n5np86HkHbBfqOR8M+zbhC8MKT3Iwab7sxbukuKTdgbtLRnoPKc1oVhE3y1f
 8AirXb7eM1dGX7qN7RCPkmUGVpznnF29gxdBpoG3zscp8XlvIId/0FXJZkk0gO6iP
 tN383efnmlsv/4Q+MS5R76MsY14CAhq8vy9N26g1sxCaN9vHe67r4nI0jM0AeNJaE
 jaJLHvfjF4pegJjv1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=IOmyM0SL
Subject: [Buildroot] [PATCH/next v2 3/9] package/containerd: remove lvm2
 !BR2_STATIC_LIBS entry
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS)

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/containerd/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index f014c56e..9712b11b 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -32,14 +32,13 @@ config BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER
 	bool "devmapper snapshot driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  Build the devmapper snapshot driver for containerd.
 
-comment "devmapper snapshot driver needs a toolchain w/ threads, dynamic library"
+comment "devmapper snapshot driver needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_CONTAINERD_DRIVER_ZFS
 	bool "zfs snapshot driver"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

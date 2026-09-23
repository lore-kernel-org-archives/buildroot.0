Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED40CC9830B
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 18:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6404C411E8;
	Wed, 23 Sep 2026 18:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHR-Vz7zKvt9; Wed, 23 Sep 2026 18:24:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0D6DC40C05
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790187867;
	b=mnCxSoT6j4f3UAychAQQn59KVeNa8Vc+e0BErKbGa0j3iEizRTKDa8vZLm+Rd/W5A7SQ
	 L21roUHaigySQNPDFJp+dPYNVS4y1Hf4E4p4ml8Vxlzimu1TdqVqbuVDy6oTu1IIeKGTa
	 dGWVtQ7SwA5xCLUuPXCWdIb7LwJTKBV1llE7FOOGJkF0FHk5QeikzTm4NkVd0NPt0IY6g
	 KiHDC21kqtSyNjjyr/2CLyL9EmyLLhKFJCoh2bOpMqxmQnCkmgxsCsz4qDS9kthbAwKDm
	 tqwgUZ4FYzmZaUF4+zKsdv7uLLlccbLOsFcdlj/BejDPsOXwOZ0pR8FyMzYeXkDKoCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790187867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i5tj5jz8ydZvwfX4xoL7D0iSfNhAnLurqgFumY0NbWI=;
	b=HwAY3KWtkPQ8KbcGmPdR9PZG5byWRBMElRjZIoQ0ax02lm4n8FWWVqnDz/2D+nBo87IF
	 mv6D5lavtVICtKfh7Ce8y+uqWna06H4BZBQHWwNemawzyogWiwwvCPslFywHOa6M5g7gi
	 tuVHgUTJF0wIReUFUhKaPffiHBoTB3TlU3of1y5cV+tE6T4qLCXnnRg1H3XPUTrUJvsdK
	 ieioFD6WvS85wcLSGn4S3ZPvRtaJSgpXGdGrLoacp8ug/u/2nxVyrUg93bOecXHWlG01L
	 rh5TSs3gOfKVTlq8F4f2PX4v13pSuVBuTSwGs3ZrzREnyTpsBhAS3Jsi4bAMpqJXQuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790187867;
	bh=i5tj5jz8ydZvwfX4xoL7D0iSfNhAnLurqgFumY0NbWI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=gW7/+Pi5Y5SZJ4P7Y+oWYvyNna7JxPILnV0JNYzOXe6e/eGitXWXUc/KdMuU6kz33
	 OuJTvSP1rElnE6Yba+KgY3hn/1CAAWVkzFv/lAsy1PMGj0dL+mV64xd2nTkZJaRrKg
	 1Bzo+LNp47pbYjK0vMkj6sFa3r2a9y+jZEAbN63UwM90FbACbpZovbbuuVd4KY5NlG
	 KPXwtGk47AEFph3svUYpx1OwtKsqdAfwTg+OWBgIYisOGCBguPU0W6yFz2RrOWKmlh
	 RXtRMH0g1ZRZjapmqIK22/FoB3a0rjhlYXqjnN/JkwkPYBJrJvSu4c10dw5M1VK0nw
	 5EsuSjNni6Y4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D6DC40C05;
	Wed, 23 Sep 2026 18:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA91328C
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 18:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBADD60B39
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 18:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdUBB-NsjPa9 for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 18:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 16E6460B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790187864;
 b=aLGlXZ/IfzCJ1/cnq0N3OjZzbaH81TxJRmlGhjflaJB+rlxpzTryN6Mm254pyiv2Ktmb
 rhfzw6tG9ZVcbDsMSN3QB2N4R/SeF8PQl6Wcr4gTViosJZMqoo002t3TDUuht3Yc2ru6g
 d31AD2kLhcEiXThiqcHTSZGZXArwZzTNdHcjRXgRK8ZSYyERM6SMwQBQTWTJBEmlOYfCV
 43L4dGFSGcHFhKHsNwXQti82VN9b9p56VeVC07ROQy9Se8ympvK6gxVCp5qqlhu5ilx/j
 oFXgtmXIJy6ScS03xLFsP+mudZ6KJoyGv5GSBUH1mYADSi40K/8964fteBxrDIqYnGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790187864;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=sqpweeEQrMCzXIGazhtPGa+ZbyZIDXkYenQEC6fni6Q=;
 b=pihZylRXhoD2/6epW6FfDJrAv04toowmU07E0jZ3KTF2ZH2VWttGo4FajHnRHdH8dJN+
 ksAMqLAf/lzH4Rtau3az0WBHim1R234k+Y7BZ7w4YzaOUA6Hm+/cqlemiVY5vrhuZeF9F
 kDRqI3rH/BT4+Q9g5qloQmkjDu16HEmkaxHG+hU1wlrybe40oU8p2BGjCkdN2zhMpg7um
 t+51qGYbJARA3sraP9E5sxudH4TV/DAxVb1iA8loTkUE5VonNlAfoFbUk08N09LBULXEU
 80kFN3SCLvHXyRs5AHTjEQzkYH648lLJru6v7t/J6A5g3bOAb+lWiryTbjOxvl2M/zw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=cmyybawf; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16E6460B21
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 18:24:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1wuFAU38yu-00uaI4; Wed, 23
 Sep 2026 20:24:14 +0200
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 23 Sep 2026 20:24:03 +0200
Message-ID: <20260923182403.2143949-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:NYwoSql8leBSW84LrHHrySVFoECe2pS/Ye50whFvLEyV3sVT3yM
 YPr6kULvBjan0jJlGxxHEtmDue+gYji8aRe/UTnXp+y3wcJO2iKZRcN21i1YLs+gJxc+XXo
 vgIdBB4zCiKqYzT16fQvFwojU2Nrre47bZBMYxGeRvlE5tepEos31yS8avqfpCIkKUNUiip
 JjmaA1lSLhNCiigQnXHvQ==
UI-OutboundReport: notjunk:1;M01:P0:fsqXLBeBp6s=;kuN9U3jVHBMHN6fsBL4df1SB5yv
 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
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: fix license information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Split the confusing "and/or" for gnulib, so dual-licensed and GPL-only
parts are clearly noted, and add the missing LGPL license. Lines in
GNU_EFI_LICENSE are ordered the same way as the information is given
in the LICENSE file.

The license situation of inc/subst/elf.h is curious: The file itself
is licensed under LGPL-2.1-or-later, and used in gnu-efi under
LGPL-3.0-or-later (accompanied by the appropriate license files),
which in turn allows using it for object code under different terms
with certain conditions (see section 3 of LGPL 3.0, as noted in the
gnu-efi LICENSE file).

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/gnu-efi/gnu-efi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index f615df91bc..f979b65c31 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -9,8 +9,10 @@ GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
 
 GNU_EFI_LICENSE = \
-	BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
+	BSD-3-Clause or GPL-2.0+ (gnuefi), \
 	BSD-3-Clause (efilib), \
+	LGPL-3.0-or-later (inc/subst/elf.h), \
+	GPL-2.0+ (tests, some IDE & CI files), \
 	BSD-2-Clause-Patent (EDK2 routines)
 GNU_EFI_LICENSE_FILES = \
 	LICENSE \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

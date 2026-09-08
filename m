Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C1C79FA0
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 09:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877B460690;
	Tue,  8 Sep 2026 09:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apFIFYQzw35g; Tue,  8 Sep 2026 09:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 81F2A606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788858487;
	b=JWf/fYS99yRnYeCxLttuVF4LtIT5hal+G4iuP7Hj6eFJ1J56G5bBw/M2w4W02MBSTFlE
	 pQD1G3RtVB9Utlq0g7gVAdcxHcVBd/65bBXML4Ph0L9TmPyq8X1XK68qAo4/4K7shjwlV
	 6JReG/WTBZzW3bP9CatAyAKl+znxH7JeKosgzHkkb517oz0NrzsdEoZT2vJ+SibeR5kne
	 RfGUjnGSkXk+4znIXlK4ZJ4rH4xdA1/+ghBrXD/cr6a3pAiz7qW14fwTufr10ycj3XGYX
	 9xSn/cNaFtTzoNXsCXkbUwE2sbq4FMTlQpXO5BfiOP5UjTu8i4n+BRAjdqcQ6DJDqKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788858487;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:From:To:CC:Date:Message-ID:X-Mailer:
	 MIME-Version:X-C2ProcessedOrg:
	 X-CrossPremisesHeadersFilteredBySendConnector:
	 X-OrganizationHeadersPreserved:X-Df-Sender:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJyRcludYKCelWEMWV58s+Z/+uW7mGTfk3Yxb7jW7QU=;
	b=jIqOFwaul5LBIOaLABqkBO4E4eD42tK61w7bXCWi6ROmaQmK6HmzTYHUhkZQhx1i18Zs
	 TuWczrWrr2EytOXnnNXn//f2QmYaVbw/uYTSfQA/KsXf2cv+OrtC16Ss/6qrKN2f/29hU
	 Q0SZXBHCd7sYdJUTs0oLowOwhqM/cFtPW8h3amlqCtR3Zc/vP4EUheDi2OOtVcesbMcXT
	 ICCFXwPk5bMhwpIl0JzXo9tys2Y1e0H4XI+yXuJh5PRJo9FlJF1ny8ggJIHuwovj7RXBy
	 VS19Hs5USPJPDG5XUtJYdr0qltt5YNggXkhoMCuG9YJ5hDfqQ8NggufIYMzFuxKsd5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788858487;
	bh=WJyRcludYKCelWEMWV58s+Z/+uW7mGTfk3Yxb7jW7QU=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FjYMvc6dn19BrFjqD7BeRMqVHNkxiaT4cGYUo4nvwu6SEiBk4CmLw2THHChdBA/UT
	 rg85ix0C8+sbW2Sc+qrMCt6qsOR+Xr8MyjSW8AYfNFqkTGdqccXzZS4moETOCWCyjj
	 VlfefCHjzriVVhVROePVHcTmCalqkDy9+fF1ZxayH8DL8jSFNZq+QxPVKbJv1J1FGW
	 Y2PhcZSFG4X2F4Mxw2V2JmGhvc7C7r/b8X7TSGf2SMcb9m7Aoj2zORMn0xc44VdjzS
	 r3IpOqwWF8SH873evnMJcoBdJToLaMIpinTg3Ve9wDFgl2iO4WoqQyhsHBnhb0FR3T
	 bdNpp+faCxW+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F2A606A0;
	Tue,  8 Sep 2026 09:08:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 732AF72C
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 09:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 595C240462
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 09:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDYZlVCuKB7e for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 09:08:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1DC8940467
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.67.18.43
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788858485;
 b=hmuXeX/16LWPNdehz80gjJF8rkV0orWTa97hPay31khrXwaBrSlGvJNWk3hakJ+8f9Nx
 j9/s6rrhYMJqASoOSgtxqGDd738gh+wtLf9JQRjqtweKTbQjo0zI1k6d6+R8Iag74pLD4
 3Do1kjSkUL/JqZZ3DJojQUVRJGlH/r6wbgIdKjhar9EGfOvjo7bbOlwJryD172BqciiZa
 jd27LOiSDYG+oCJULTrkvVEqxZcZFHp1JN8roNarEFjiu+eCYmRw+jwJecvNSivrk6Bs6
 udMMyfbUBfmMSDNzvFbdq/qR2JdQvCy0R/Uu3NiszfS8lth4PER+w6ehd0DLhmdW6dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788858485;
 h=X-Greylist:Received-SPF:Received:Received:Received:From:To:CC:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-C2ProcessedOrg:
 X-CrossPremisesHeadersFilteredBySendConnector:
 X-OrganizationHeadersPreserved:X-Df-Sender;
 bh=0pJmGwvgGkYJ5j5tSUSqzzgFLVaiwCIGf2soieMqgvU=;
 b=cfpBwXtOy2kiRLq7JynJbTtPktdh6660+oo77H7F8D4E5GGJdC46CJKu2zdruhPs6O9F
 r5CgiDA7jK0/nHJC+S34Y2NVW1m0nud+wqWqLt9B0vBD2PGGHUbM0NjTL4cbMJxWl7H1y
 VipbC9SJWS4/gJ0iy2ZnVKkodrjfi1yQSbvu+KE+aQcZ3AAfmQpp8eM45kV4mRu6glKuu
 DcS8gs5UlOTzY5IVwUP5MN5NQW8QDClHcOMR3PPkvzto+xdjSbYKo7ITif6oDcdODV4ov
 jGAuxLo7nDYNbJ0EX6+aLAaWYU3CtO5JNGg6A3dsW8/i9fM0XqDulHZ6VWFO1+qnbXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=go-sys.de; 
 arc=none smtp.remote-ip=80.67.18.43
X-Greylist: delayed 1965 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Sep 2026 09:08:04 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=go-sys.de
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.18.43;
 helo=smtprelay01.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.18.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DC8940467
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 09:08:03 +0000 (UTC)
Received: from [80.128.11.17] (helo=mail.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1x3rlB-000000006pZ-2cIa
 for buildroot@buildroot.org; Tue, 08 Sep 2026 11:04:57 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 8 Sep
 2026 11:07:58 +0200
Received: from go-sys.de (192.168.1.122) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 8 Sep 2026 11:07:58 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@buildroot.org>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 8 Sep 2026 11:07:57 +0200
Message-ID: <20260908090757.84261-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 01/1] package/sdl3_image: security bump to
 version 3.4.6
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

3.1.1 was a preview release. Among the changes since, it fixes the XCF
loader issue reported as CVE-2026-35444

The LICENSE.txt hash changes because the copyright year was updated
upstream. The license itself is unchanged (Zlib).

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl3_image/sdl3_image.hash | 4 ++--
 package/sdl3_image/sdl3_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
index 83f5e7eaf1..e0eb2d2cc8 100644
--- a/package/sdl3_image/sdl3_image.hash
+++ b/package/sdl3_image/sdl3_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
-sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
+sha256  d2e4637ae700f72e5196b8fbd749850ed2e5e1e09c5a5be8d06ff55aaccf3b01  SDL3_image-3.4.6.tar.gz
+sha256  e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  LICENSE.txt
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 7832d38fc6..c8802a6bed 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL3_IMAGE_VERSION = 3.1.1
+SDL3_IMAGE_VERSION = 3.4.6
 SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
 SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
 SDL3_IMAGE_LICENSE = Zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

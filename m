Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D2BCC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 16:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A97405BF;
	Wed, 14 Oct 2026 16:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TWhvYIvEvHw; Wed, 14 Oct 2026 16:46:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D02E040483
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791996413;
	b=cjaGX0tRnf9N9/VVSfDV2/qhk5yp+VKGsZMdRoG3gajGfCagHS88Hkrq5UMgHJjzzC3R
	 9/snk4noWu3BsaM5V0j9LGsYCYeIqeDvupxWEXnAb4DyNjXbSKcja2T42Znn6PtPfqrUZ
	 d779tsSiL0iToxtRBZ0q7gDBoFxkUPwfdY/vR6qEukCnDav/ntirifPlo4MRkx2LVm9BQ
	 y0IawP6B7Env2z0cCaZLnInw8mS3EbZAVtdIi/My2/12PCu1A/Nohb+LKy4zopk5NM+iz
	 Gfa/OyAa19QL5/y5b9gxTRaFsS+X595V7N93BG5DLWKdDVvOTOcbSlK4M/p8Zm+n0wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791996413;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=30TK3RA2so+yaj65dMGQ4MZQirpoQfCVbV8GpUV9W4M=;
	b=FRO8lOK5bWza8gbi1Pmw7vTc3gZAgYdBZQaqvKdh54nxuvIp4vzt08Lkz0Ud6swV3VXS
	 SDwl9L4AxTehcR48SFMPA5irAqmeNDe7Ng5lmrBfla4cmHDefYXOF8v9hqUDv2Nb+BEmC
	 M97jLLWwr6T1SE+8lg3lUyPEcwJuUSSa3NnHWhpFnpUOgs41baLz+Pdft0psxpT3yDNKq
	 MJQFvmQ6y6efiQqqU+wGiAyyCqVoqwJIutq60rFSFvBxY2OfdJZmR552SokR4Eo/xxwMm
	 2Mjv7/MCds1Pa1VwKY5X8ZLlfVZRcjamxahCF9OvAhpF6spE2RgulrcVm5bNNYZSsyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791996413;
	bh=30TK3RA2so+yaj65dMGQ4MZQirpoQfCVbV8GpUV9W4M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pXuJ+FXLa2zNah/crCzzigpLL8+Vo4vx8blWiQ5XzjeMZChIw8o/I4lrz5sdx3Kk8
	 EuAJC8p7kW4e++/QH74h7zT2q/If6vjIVeMZ4WuKtl0K2jXVuygA/vG4QnGxDaLbQL
	 yFj2GKet1JWLC8rrU65+80LrBu0VG8z/nTg1jo14bHnkJ64vI3Kw+d0nxrm8YDiAlX
	 6fRQ14G+yp/god9yhU34E9lIXaaV+AHiLm0DigblhwZNBYq9UlrxcS+CfcrhV0tVlz
	 wUOZ4VTnbvwDgicT/VaAryXk1dzypPfNTOKxKIBNt3iZbqJ5fpquVExzUVLzj8iyrI
	 HkoqjJY9xe1+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D02E040483;
	Wed, 14 Oct 2026 16:46:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C411DE
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19DEF40363
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlCLSIkqfsQr for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 16:46:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DEDAF401A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791996411;
 b=exrXRmOFSTeyTm1CWg9PQcKvTPJbftyQoITndbmIzdvV54D5WQvM9R10JYVj47oPgmUY
 LKdPBuAhp1Sfiu3fvdRjAjnrk+shem0GNkmxxdqfDO5zUgduk1GnbtcG+oIW/p9qRVybJ
 8JHS+a7ck87BpKFaW7hpoCcnwVrQe1716xhou+lh0zEXFehX0nF8EZTSfxg9dbVjw1EBk
 sZpPY7O8WUeL53Rf28+I/X0m2CD+foHB1HiYwJEX/plApO71XvAP9q6dDvjbLwfNvl6oJ
 75g/0LptaGo0YSwDiR+T6vBrn7TQrfqVjFFBFK3JCw7kRcGOe31wqtGJp6nfSv/YAGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791996411;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=WMKbnPHdGkwDdaxwNjgMj6AXRukLInVA8balu0We8YU=;
 b=IaAQJjKtLfACwgB2YPNqNk/g371gPl2wCvD77OIovMEhCdBKOCIjJKm/RYAnx8pFoTlc
 xWrt5Xmlrqa9B6TtMxQ6ikUrWS8Kc8iprh2B+0ZXIK2Nih44ORnMQjTnSfMHNp9DhYLEk
 wOAJTMWnDGsJZzglhcAXbsHDcbfmGCgcn9hU4RJasfNk0NRFIAeI/pF2kn+RkUm7XjDcP
 q05WOzbhrLg+++Txid+cV4wgrOeV+6H9a09IUdxykPk1QIJ4HoALPQx0aNMPIoFrhsqr+
 vZxtQkHeWqE1O7B2ntkTrHHDU1ffgdS2A32npIvKCmYvugRlcgV9iBrtKQm/Q6I8abg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TzYvufwu; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEDAF401A3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:46:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1xQcMT30kn-000wWY; Wed, 14
 Oct 2026 18:46:44 +0200
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 14 Oct 2026 18:46:23 +0200
Message-ID: <20261014164625.1474866-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9zD/SXrU4zkouGhLlMnLsqG+Rl78WQ2sSxMpsdLmCbSfFBjrRTi
 CRYw4Hja6rtvbLWZwUe4bxOpLP/cn1a5Tb/8meHKaLVvRk9wehqAgdhpcQwlDaXHZNJCybZ
 peLwSSNTSrJfL2bfwR3XtOXRbxXO+YnLFBLZpekr9TvJHdKLsmfCjzxEtDPylGNOIb8pT4l
 AccJ9C2zVw2TaX8u/PpBw==
UI-OutboundReport: notjunk:1;M01:P0:Zk4aYuxNdM4=;k8Ii6VGFBC+9DZeox+TFVvdwC3x
 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
 vbTbFZ1UdYvW6Zr+GQGD3tkVq8CyplsD
Subject: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
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

--with-... arguments need two dashes.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/libtpms/libtpms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 7bc69a50d6..0ece84ae04 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
 # Required because a plain Git clone is used:
 HOST_LIBTPMS_AUTORECONF = YES
 HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
-HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
 
 $(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

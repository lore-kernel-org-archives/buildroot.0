Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1622CF9C69
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 10:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CB36087F;
	Mon, 23 Sep 2024 10:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDmKAkyIu_kM; Mon, 23 Sep 2024 10:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53784606B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53784606B4;
	Mon, 23 Sep 2024 10:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C534B1BF419
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 10:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B43E581292
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 10:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mnq-9LsrczRw for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 10:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE2CE8128F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE2CE8128F
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE2CE8128F
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 10:28:55 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 20B20BFAC1;
 Mon, 23 Sep 2024 12:28:52 +0200 (CEST)
Message-ID: <b5c97a2a-49da-40a8-b546-059ee0bee52e@grenoble.cnrs.fr>
Date: Mon, 23 Sep 2024 12:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1727087332;
 bh=aX52p5YB/eWTt23BAjEZ+JClVkRCWph2VpjRQesSmlo=;
 h=Date:To:Cc:From:Subject:From;
 b=l/4MZ4d2myXLGQ0PkYQUQ3ZUvFVKlbPofcP6/ZSIkBKSqzRQR29uWEU4yLn06vsGN
 bnlQYbykvJUD+lbZUx6E0csWOQYXs1GaoCnD7I4ak9Rgmc2AIdxPq4DJkoqM0TN74e
 fFcWCXMUBMKnjgX/4YUMBJ4meqHDUeWB0JfOuSIneahR1EfU6kXQMx1TtBzifZveBV
 GouT8GeZX4KmirmYitSGvGv+LyQ23cQEWVsWYmzPQb8P+Ap90yNWVnRsJhxILiHAri
 IEpmTDsPAOZvufL6BJkf3Y1HkUzz5m+FN6n/dMpM/UO4yT9cZBYtvASdjy6/EIvfeC
 SOx7GP/SRZpuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=l/4MZ4d2
Subject: [Buildroot] [PATCH 1/1] board/acmesystems/acqua-a5: update device
 tree for newer kernels
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Ethernet MAC address of the Acqua board is stored in an onboard
EEPROM. Its location is described in the device tree as:

        eeprom@58 {  // NVMEM node
                // EEPROM parameters...

                eth0_addr: eth-mac-addr@9A {  // NVMEM cells
                        reg = <0x0 0x06>;
                };
        };

Since Linux 6.5, defining NVMEM cells this way, as direct children of
the NVMEM node, is deprecated. It is instead recommended to wrap the
cells inside a "fixed-layout" node.

The older, deprecated syntax is still supported on Linux 6.6. Since
Linux 6.7 (commit 2cc3b37f5b6d: "nvmem: add explicit config option to
read old syntax fixed OF cells") however, it is only supported by
selected NVMEM drivers. It is not supported by the at24 driver used to
access the Acqua's onboard EEPROM.

Update the device tree to the new, recommended, syntax. This makes it
work with newer kernels, while preserving compatibility with the
currently used 6.6.30.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
index a7a4a20352..411d1942f5 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
@@ -149,8 +149,14 @@
 					#address-cells = <1>;
 					#size-cells = <1>;
 
-					eth0_addr: eth-mac-addr@9A {
-						reg = <0x0 0x06>;
+					nvmem-layout {
+						compatible = "fixed-layout";
+						#address-cells = <1>;
+						#size-cells = <1>;
+
+						eth0_addr: eth-mac-addr@9A {
+							reg = <0x0 0x06>;
+						};
 					};
 				};
 				
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

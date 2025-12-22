Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24804E6ADFE
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07D37408CA;
	Mon, 22 Dec 2025 21:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBq5U2gmIWFp; Mon, 22 Dec 2025 21:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8184408C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766438930;
	bh=88bfbz5L194M++mCSr57NccUUAzwqSGe/RPQLkDiPWM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hXvj8r5WvtfPCh7plDRQtm7ORZSRKqX18OIpHjDh5pIusFiUzfSu8ZRGhuawkTf7X
	 Ys969L8zhUMUTeDFBWbfpx3HLsOx+o+2iL8FzAE2vUiGHEaSWXFDVuDdp+llRo8ZtT
	 LAfLBv7VngeaV96iAP/xEu8JkFfRS0UpKvHAiRmyVdxcf10ZnW4vXfgFrB7OJo7bdt
	 1z858s2CZFCQncBA7e2rSGtdK7SH8sIy5CqBl+dOpPX6j4AhDLh33hdQOKge+ro/hs
	 +wSsFKoSVcCcE6SEXn2y5q63V3iNf3RkiQfMMQ1CIRt3Rumr71egBOtEL3V2MG16XW
	 IB2BU6oroQQdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8184408C0;
	Mon, 22 Dec 2025 21:28:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A01125A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BD2D404B5
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nbf1W-NM6ot for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEAFB4044F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEAFB4044F
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEAFB4044F
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:28:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id XnSNvdPPfgRm2XnSNvrSF1; Mon, 22 Dec 2025 22:28:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Dec 2025 22:28:42 +0100
Message-ID: <20251222212842.2307235-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOyryn/y1krAzr7bFFBUYypi/KQOJl0of5Pga+haioEBXmyJjVgHm1LXrYNcXN/boFGfIuBI1/m4wMDiUHT4S8K/b4rnnlTjjxQGhpb+ONg8Hsz65zpy
 r6h7TIWbhPYd5LFty9i6vxWgC1olscWHCv+iGiXLtAD0Tcu2iuyhFlZq47WFxtck8L09+76CUEmEp8l/WIa+EXjTfpcuajGQwx5u4ume2dyTWAKq+jgx2SxX
 Zv6eDapl466wVJhnHOvgsX3bZaguQyFMXi92QY/JQdE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766438923; bh=VXMtoiAMmBsxNVnNkQ2l9P/d/ZPC6bA32V9pfI3vkQE=;
 h=From:To:Subject:Date:MIME-Version;
 b=kAWwsLtVzWeYcx1hFEz0EQaog/R5LJdgfGDMhu0Q9GbLqpDEYxBqL49UlpItomIrY
 iSubkFZrZdeI4wQySguPu51czZhPjP3GBdTqYwdNUpahSvgU2fAiERnzPl+7eoLjZO
 7R8SUGTK7fON6xYZIp9aHzhLTq5uB6hrvQ6QJ+BpfW6CoNuI1stzV9f1XUVPbt8ZXM
 kcawk/8QqjeXRE7kATSW41PbwDrCdglXaUd5oqUvLSuCduZe2OO9r4PerfdLMOb+EC
 pQw0y6K5IVlifJxguQHyZ6FaI5raw2Gg1YJNdMqFCbBXmfsqK90MuxTgXDFGw0CuuF
 8guCtzEMTXGjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kAWwsLtV
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to libtirpc and
 rpcbind
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 244463efa4..ac7813fc35 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1304,6 +1304,7 @@ F:	package/liblo/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
+F:	package/libtirpc/
 F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
@@ -1316,6 +1317,7 @@ F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
 F:	package/rockchip-mali/
+F:	package/rpcbind/
 F:	package/rtl8188eu/
 F:	package/rtl8189es/
 F:	package/rtl8192eu/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

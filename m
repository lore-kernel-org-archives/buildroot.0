Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D0E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCF26111B;
	Wed, 11 Dec 2024 19:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbrHweWPQIWx; Wed, 11 Dec 2024 19:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A28806110C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A28806110C;
	Wed, 11 Dec 2024 19:16:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D3C8ED7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D4EE6111B
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e1_Z0JX6Ait for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A7686110C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A7686110C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A7686110C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:16:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B914EA4C3C95;
 Wed, 11 Dec 2024 20:16:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47406)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tLSCE-000000003Dg-009h;
 Wed, 11 Dec 2024 19:16:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 20:16:29 +0100
Message-Id: <20241211191630.1414970-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1733944590;
 bh=As17J0aQY8jp7Z+P1vflm4aV8mSZJaIQOE/CNhVFwYM=;
 h=From:To:Cc:Subject:Date:From;
 b=mX7aMtVK85bVEBNBgGliAl1mXRQEy0ye1zUxFxkYW7SiOCzESgL+6iQa5UAZnPtFU
 fctDQuzTue3BdBGe/HF0AgdtR1bEV5uv6huJhVVvAkaUZPDjYOHc+sycaRXoCJCwWg
 tvnf3mLqKeXJllAmC8aEn4tYmVbZFK4qCVOhfxaF8+BklP70uEpI2vOYjnlXckSdMs
 Oxb26NYr8geSE4KnmlNY79w1ACwTrC99zpLBgM6y+xbv5OEMA1yhCyHKXj/QUuLq45
 5jN/G/Nr9MZ6HjKmQh2dRXPxLPTfdg/4HOEiMF8wxNJO2EvM//Amb77T/cKbcFdAAS
 tqyKglYg2i0rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=mX7aMtVK
Subject: [Buildroot] [PATCH 1/2] package/python-pyasyncore: enable host
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for python-emailproxy.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyasyncore/python-pyasyncore.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index 4b1e3c98b6..5a178c37b8 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -12,3 +12,4 @@ PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

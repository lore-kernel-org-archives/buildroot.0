Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECDDCCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDEAD40FD7;
	Sat, 18 Oct 2025 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mYld8_HbMa0; Sat, 18 Oct 2025 19:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14ECD40FD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14ECD40FD4;
	Sat, 18 Oct 2025 19:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C06431CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A391960EC8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZTgLTzqgcM6 for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C62D60E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C62D60E42
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C62D60E42
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7FBBE1A14F2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:44:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 541116069D;
 Sat, 18 Oct 2025 19:44:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23D52102F237E; 
 Sat, 18 Oct 2025 21:44:02 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:06 +0200
Message-ID: <20251018194314.114284-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816642; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kx+ARrg3SfpYxobl4EpX05xLAr10Y+aU91ojoisO05c=;
 b=lkvXVvdB0itIoCJBJJ6d7wb64aXKV7zpyGMFzE55qpth7/nTcQJ6sO1D1lESW5k2wGvz97
 rICkodZHedKw1sXPSL7h+w4bcrnIC91+AyEEI/71ygdoL83mW69OoUyrStJhdA/zmkydhH
 ebh7jfiAR17iHFWIq8+CBqNxCPfpwGV5yBDbJ4SsfnIoS8bjJny2hnpW/aFanUtmJimobv
 Mrmi/REztzVcY4qzK4h5xNsjJNFdnRbFKVUS6XKCUNRspap4v1JZyeTDJT4Ednl8Y8WZIC
 52qNmuLIKb4ipQxTyji0867qK97RR3Xod7nSXEHQRIR1bbyYNQeiBHB6mpXv9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=lkvXVvdB
Subject: [Buildroot] [PATCH 08/11] package/python-appdirs: add host variant
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.gantois@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host variant will be needed by the host-python-fs package, soon to
be added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-appdirs/python-appdirs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-appdirs/python-appdirs.mk b/package/python-appdirs/python-appdirs.mk
index 222aadbb29..3ecf281db0 100644
--- a/package/python-appdirs/python-appdirs.mk
+++ b/package/python-appdirs/python-appdirs.mk
@@ -12,3 +12,4 @@ PYTHON_APPDIRS_LICENSE = MIT
 PYTHON_APPDIRS_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D24FED3CE
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD8AB84770;
	Fri, 24 Apr 2026 13:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7VhLBPnXPNg; Fri, 24 Apr 2026 13:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6FF78475A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037772;
	bh=FLhntr4FvhipZqe1RlYDJrl1np5RwbhcO91/7zcd7bk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hqseVgL88QFCvDO8le5QZkFuv/kRZD2Sw8g3mMYhdUo2g3Egwwd7wYo3PwQDyY3nj
	 v4sctoTVPBttVBbWMCWLGSZqydlqXErVWD5A8LJjfduvp51vimpNh38M1KCpKFgLtW
	 hEqWU9ri6HDA+f6py/g2zhEDoHrfuJAhipHF0U/mRBpraOWO5PUegDy7oIo6F1D5X2
	 XPuYuSEmRILSHslqVMXuB+rS3qaXsDFQkajTr6uhVs65S2+BxlF6E3ueUOQUu2lJho
	 fWoEkhvN9xhqsOB5cxLAXbwFeQni07bDQowka0KAYaCWE+vZNhY/QanrGlVvhGfuo+
	 c0OHV3gxyo+xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6FF78475A;
	Fri, 24 Apr 2026 13:36:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC1C2206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B319661AFA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToJZnXf_8eQZ for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADE1561B09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADE1561B09
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADE1561B09
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id A4A2B583505
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A82DA3EC42;
 Fri, 24 Apr 2026 13:23:44 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:25 +0200
Message-Id: <20260424132326.825570-11-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTE+MSsPo8FDFnZ13gTN9cm4E9MH0yx3hdZATfVr8LSCqGgaCpXiwcgZe6nAZ+bz4dn7xNANWNOWbgh74VqDS43GTWUyqy9NHU2rIaN0ctFpjY/veRXfhmrxryS4n4ZkuoiG6g86S3o+Y6HMoNjW5vSyAMise8IW2iS2awoya7TvOYc2eeifYrF2OH0pCRwlHrz4bxL5WgreuWOz8IN4sMKp4s3D7CKEG4b0onzBAxLP0S0YfaZzUgh0rmkDG9P4UgGO+JjPMi0sju4wi3IJYnMjsw8n0m8X84/U20QapN+Pzzn7ZrZlgPEO2B0YytsjPPgXBRyuaF+Dsg26Q1aDivmYIaxqeHSNGGFEfklXw7cf+wHbgNueQGVWCyjRd55+c2QH3mAybrxmHzX0AUjNHa56aAyfKhzRWmDjSpSdzmOdLi4pypcFEJYhFqYqZHJqAXSGsUByNgs5LzPceHc3IFX2hXUv4MH5/tz/PR8s9RaZ8n58OcUKZ9H1wmyZRREt1DQqYFkBWPOpTqdFVc5+lTKfPJDnEDWntSyu7SHySF9ccW8Iin8mKlpEDt/Xe9Xk+7dumFKSZwGRASQ7wNhxC0TOZsHJxdMUOMilgnY+rO+OMRTBpODoQqKock64SORsemw/Qur6JgyqL0xT9HoDQL9jM8J3SQ5OFlinefB4ZiYqkw
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2uLN9lu6XBNExcJxrRW1et3H3thyPkFSzMUEXmu/ZM=;
 b=ND17IYcujwXVUELqaMyb72LjZEcPx57K+X8O3kxJKCNJQwSF0FD2E+sGE/+i/ek1QVujRW
 3+bJOI77QTLkbRNNFEsuuX0W+/+EpT7M7MfbU+P1l6Z/xQ9zlH0wbhTxtwiGLTqYlfR+nt
 TlENPanRXmUyc5s66fMUhV/8xHsaqDl71nhG1/tzfdwTrE/aaNiaofk6Fel799XSlsI2Ju
 t57gAR/Gw+oaxRNtMQs0MUOO0YIIMZtb0WMQw4pyzXbHTMrFL5shjSWekQDsXxMbKc0len
 P3kaN7icVn4Erwp3DhFaisiHSUMNzdedzRoQSYhahj9kh12G7JrUnbFF4GdrtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=ND17IYcu
Subject: [Buildroot] [PATCH 10/11] package/mawk: create awk symlink on
 install
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many scripts and Makefiles expect 'awk' to be available in PATH.
When mawk is the only awk implementation installed, create a symlink
from awk to mawk so that these scripts work without modification.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/mawk/mawk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index f9f0623904..b21ac16742 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -10,4 +10,10 @@ MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
 MAWK_LICENSE_FILES = COPYING
 
+define MAWK_CREATE_SYMLINK
+	ln -sf mawk $(TARGET_DIR)/usr/bin/awk
+endef
+
+MAWK_POST_INSTALL_TARGET_HOOKS += MAWK_CREATE_SYMLINK
+
 $(eval $(autotools-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

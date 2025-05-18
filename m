Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05A8C54756
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C36D860D53;
	Sun, 18 May 2025 08:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l31EsF1NqDlE; Sun, 18 May 2025 08:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0146D60D68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0146D60D68;
	Sun, 18 May 2025 08:57:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1142FE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B670A60699
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynKIWrlUpzvS for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE1B460A9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE1B460A9E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE1B460A9E
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E5EE2432FF;
 Sun, 18 May 2025 08:57:26 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 18 May 2025 10:56:56 +0200
Message-ID: <20250518085723.23020-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtgedutdfghfetfeelhfdtteevvdeludekkeeiudegjeehgfevudeuudeutefhnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33z5xdCgBgW/jsWGtHMhe4+AtF1k7K0YmYo+O+PDIyU=;
 b=ADS564SyaPrGrCgDB25DxSzOfxhN3CSH7OAmE8BkoGnYlXQqbgLeL4xjlRVHuM3AGoC41N
 uk6uCVeBbLSSxeowOt3mRFhkDja6Zw1q0rwGfsumbeNESvvO8sUpWym4ukkm8DHmPol3ve
 6G+UdVaRNxSMC31J9iNcL9uampOCXildoRcLtwF5DJrbXkh+3Q72GCXQKmuXJRTLgBGlHR
 6xTOWcOiH+iukG5PvBGpWC87INMarweZ/JaxmlJT7hf0EyfkbltiKSwezokaGC+h7rUSg9
 ywKY6ErMuKQDpbnsucs9Yr+XCwt8LjBz/4fvH6GkDBnAvN8bh96wbGSGr8DqXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ADS564Sy
Subject: [Buildroot] [PATCH 03/22] package/dnsmasq: drop stale IGNORE_CVES
 entries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 0001-set-default-maximum-dns-udp-package-size.patch is no longer
in Buildroot since the bump to 2.90 in commit
213cfb34358d86a65deecdb9f5b11a20ad0895d1, which renders the
CVE-2023-28450 ignore CVE entry no longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/dnsmasq.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index abeee36ce4..dec7c9a86d 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -17,9 +17,6 @@ DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 DNSMASQ_CPE_ID_VENDOR = thekelleys
 DNSMASQ_SELINUX_MODULES = dnsmasq
 
-# 0001-set-default-maximum-dns-udp-package-size.patch
-DNSMASQ_IGNORE_CVES += CVE-2023-28450
-
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

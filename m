Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2459CD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 950D5614B5;
	Mon, 15 Jun 2026 18:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1xOlxHAP2tb; Mon, 15 Jun 2026 18:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5AD0614AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781548206;
	bh=kNVVEmI5uLbJp+zyaYDx1Ul0NZAwCmkCbUErKb+9q80=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGFU3hSU89diQT5NPxRVa82jlQeBfy+EX6HB4jaQ7coItGD1uIamtTDHzfbaI13/C
	 FlNFyBrikrmtVu/9GAxe3XZOYokCD//vlfTl7kMdHe9ALO8lvgvR0875trKD92JwOL
	 yIVwKnZ/9m/oJI5Xz+MHgRZkWu2J2FKA0Qai2zuVu3xxY1FYRZWKn+nZQu7FfJwhbL
	 Ry82MsQltMoQqUqIRZsOAdUwCgvDNn4jUg+DUUDEFFUfhQ5gCvmc3ijqIWBzvvBip8
	 Bhgu8rEc3VRUznWUA5K48hDsvyr2pKeEUifSoIkheYw96VBwaGkUPKCvCbbWbfnG61
	 HUhsMjS29pEow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5AD0614AF;
	Mon, 15 Jun 2026 18:30:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A65832F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A40F64031A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I0HqbeLiwzH for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6330E4040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6330E4040A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6330E4040A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:30:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04de.dip0.t-ipconnect.de [91.58.4.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EF51A4C23BE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:30:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50112)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZC3g-000000006g5-0OK3
 for buildroot@buildroot.org; Mon, 15 Jun 2026 18:29:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 20:29:15 +0200
Message-ID: <20260615182915.1888004-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615182915.1888004-1-bernd@kuhls.net>
References: <20260615182915.1888004-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781548201;
 bh=pvohGc+SoFGeIqatCL3ngWaR5Hs4NyFfHVqMNQkLvJM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FneYT3OMp1hIH5vF5l9TfGPayiQc0XHj1QIwn2pVDkW1x/fE5zvKvkR+BMTyGU9M8
 L0rYFZWXBH+nIKTKMEEA9YFX3LjXC4JhNYyYBpePfboEfbSFJVld0krIeCkvbfTXpk
 6AjjsEN84OGS5nbHWHEl0IYwkuXq6E18ELvkRA52UQiCp1EpfR0zIFTJE3jNi7tGI4
 CjBNZtz+Y02VH2CvEH+X/kOElQKoh/dVy4WfzDomWW+eLdPRWDhsWlWOVdRK1rMBNh
 zBCVx012Mw021YeSqZUdmdAhrY9YXSqhd6db9paTTRpWrxDNuCS8K1O4ZMH+RjrP4l
 gUKkjZXEzGpvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FneYT3OM
Subject: [Buildroot] [PATCH 4/4] package/kodi-inputstream-adaptive: bump
 version to 21.5.19-Omega
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

https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.19-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ad40439fbf81d306cc35d33bf35e93c320dbefa8

 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index c2339a3d33..d05e1c217f 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a62ef86fc616c37ff7fa53ff7dfe2a73ee21f48af306a9f82c5bb5fe05245dad  kodi-inputstream-adaptive-21.5.18-Omega.tar.gz
+sha256  20922de1891c9980f9807a10edbe2d1ae9224c298c438a3458d7b7105d5b7c21  kodi-inputstream-adaptive-21.5.19-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 3e0ead12c9..6afbb241a1 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.18-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.19-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

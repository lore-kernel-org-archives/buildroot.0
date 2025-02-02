Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17201C02190
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 08:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80B160870;
	Sun,  2 Feb 2025 08:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOjf6FLK2SKN; Sun,  2 Feb 2025 08:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE1D60881
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE1D60881;
	Sun,  2 Feb 2025 08:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BED9812A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A2E84B36
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qo6g4_OB12CL for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 08:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80DEA84B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DEA84B2F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80DEA84B2F
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b087.dip0.t-ipconnect.de [84.161.176.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A222A4C4872
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 09:44:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34316)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1teVaf-0000000066t-3XDu
 for buildroot@buildroot.org; Sun, 02 Feb 2025 08:44:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Feb 2025 09:44:28 +0100
Message-Id: <20250202084429.259494-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250202084429.259494-1-bernd@kuhls.net>
References: <20250202084429.259494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738485870;
 bh=H8XGZwQMS0z3gc/Knbuo1eiRjshpNIz8MWwbgVvGTA8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M62FmwNUDEsSUVKE1XDTLosjOw/1rYyaFrz72tEQKWh/fMicPhf44pv4oBHPm2er4
 MltRDcUoWCZYUZlNEQOzgAb5hTGpuZHR+2Qk7AycPoTT8JN8WWvNSdP9z5jXNTKBAR
 gsCGVNr6J/23kkqQoUBOymLXzqVtuQQKTE049cgJVVwh8G37g3zV1004G8Wq6hN6Ah
 h/C0FUSYiWrJGvE7TEFZdilhfTEG3xty1r7s/s+VFxjAUcR+2cuCMSAKPtORmr+9tk
 HZT2T7M5DoXiKm2fkzGxtwzLFoJjWvXoaowBYHVzzi7kt3HTWBw3Cj+/9K2kNGo0tZ
 i2xZAoQlc1fuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=M62FmwNU
Subject: [Buildroot] [PATCH 5/6] package/libbroadvoice: switch to github
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

https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/25460805/
"FreeSWITCH project has been moved to GitHub"

Updated hash due to switch to github.

Fixes:
https://autobuild.buildroot.org/results/b4ea75a8bf113409b6c890d422b99c2bb49c3ecf/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libbroadvoice/libbroadvoice.hash | 2 +-
 package/libbroadvoice/libbroadvoice.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 1644fb4ba1..9115a38e07 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  74b7c9bbf90d2d8d8ec9befe73066f5c0d734498f586f6c870eb24dff2edcad7  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-git4.tar.gz
+sha256  39fd8a5f76598f2cb23b759bcd458a45a99e6ff830471576a2485c98b2ab1e48  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.mk b/package/libbroadvoice/libbroadvoice.mk
index 9c6b4e292d..69e235e84e 100644
--- a/package/libbroadvoice/libbroadvoice.mk
+++ b/package/libbroadvoice/libbroadvoice.mk
@@ -9,8 +9,7 @@ LIBBROADVOICE_VERSION = f65b0f50c8c767229fbf1758370880abc0d78564
 # "This library is based on the Broadcom reference code, but has been
 # heavily modified so that it builds into a proper library, with a clean
 # usable interface, on a range of platforms."
-LIBBROADVOICE_SITE = https://freeswitch.org/stash/scm/sd/libbroadvoice.git
-LIBBROADVOICE_SITE_METHOD = git
+LIBBROADVOICE_SITE = $(call github,freeswitch,libbroadvoice,$(LIBBROADVOICE_VERSION))
 LIBBROADVOICE_LICENSE = LGPL-2.1
 LIBBROADVOICE_LICENSE_FILES = COPYING
 LIBBROADVOICE_AUTORECONF = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

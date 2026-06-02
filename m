Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4934BCD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 18:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113C5610B3;
	Tue,  2 Jun 2026 18:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fss7X-AuTay4; Tue,  2 Jun 2026 18:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547E1610AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780425885;
	bh=SwlBjznYMFbWXZgyunf2MmNcWDsYVje+rWkIeV0Mwm4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBO3aQ+ZvosypIfO504DiCFZXp4gTttr7gOrEffjsYZMNcsWOyZztOHM70o+LoOJ4
	 +wtB6LYTHnoDq84Qkifjiops4JOx2IJI3P2xsw+YWl7f/O/tvw+/qPotll7RbHuxzW
	 3KbxdrbZldFG52ajq4HoKjok/dwkFkrXPobqDYHGHKJFTdpX36JSMFBNxaCvQeUps+
	 ESLB4gacwP2LCikhLAmBDVDj4rg3f5uVl4BlqlEpIG+vwcZLlHOqwmtMiY7yQBZMy0
	 qErqNwQ5AkP6nitcrEQX/FhcuORxbHjzWB/1h3EdfQzBSS47hyyY1nUGGy8zMhA5JF
	 XE/VnjkUuHxbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547E1610AF;
	Tue,  2 Jun 2026 18:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87E92187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 18:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7778F4004E
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 18:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nl3CrOWyVsdr for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 18:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1761140026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1761140026
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1761140026
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 18:44:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E98AA4C3A59
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:44:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44618)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUU6E-0000000035n-3YEm
 for buildroot@buildroot.org; Tue, 02 Jun 2026 18:44:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 20:44:27 +0200
Message-ID: <20260602184427.1707888-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260602184427.1707888-1-bernd@kuhls.net>
References: <20260602184427.1707888-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780425867;
 bh=uA3Pq6y1ZANQZZFN1m5K2n2M56qVzfHBFfGOOSYZUk8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mi4MtP0P9hqamLwQi1uZkqPURiVqFOWGcVmsWU7kIBdruKBJoGZhz9KrdhqM4BzFR
 1Rn8UuNhUccKYvGCoBEpCS3B29p7RmT2mvZ5Kb0yShMZ1/ZUkvBaKV6XmaZ5FJfUN7
 Av2GAyp2qVHreXcolQSz2rNOdSNWlX+/j/rygbjEEYpFIBoMO1u9R0hwALXremfkV7
 gLf190iIwLXeclP/kLslDFtN7lixTur9F0y5N99KU7YSMOz0cKi6JEI9/hBFhftnke
 mbqK9f+DJ+rXiSqjzY2z9fDf1AcXsMz5BMk1OueVLHM7RTVQPEY8juH0TmUMp+ViTk
 gM/Tz1DaQPweg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mi4MtP0P
Subject: [Buildroot] [PATCH/next 2/2] package/alsa-utils: bump version to
 1.2.16
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

https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b2539e30e573fb104243141866b5b755d047bc73

 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 5f6ecc2be6..699c8921d7 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a  alsa-utils-1.2.15.2.tar.bz2
+sha256  092399d5e8749a1d5e188e393157521cec4b75693b60ebb79bbce728cff2232c  alsa-utils-1.2.16.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 5a5f18b64f..946f0d8059 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.15.2
+ALSA_UTILS_VERSION = 1.2.16
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42953D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 12:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D0660D8D;
	Sun, 14 Dec 2025 12:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHKTpgFK1GwE; Sun, 14 Dec 2025 12:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDFDE60D58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765715382;
	bh=jCdnVChWyk3acg8Wl7BRbbDNdhEiyaPWxcz3wdsQuaI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mPVR6Q1Aygd4RGzeAI7zAiOf3H7Y9jzcnEj/WVcqrC7GzFQv1ljIZQ7YEV00dhQyL
	 26y/vAzf9ls1mbev6UW8yvR9uJ/NDCSYgQj2IbBCcICiJQTqENJ806MIta2HekV4ta
	 B2jhTco32L9v7RWDhFJSmclvyjXadtNOvIJ1AVaIiG0+Y7bYmaZpriNvPinfBTTPwY
	 jd7Ng0paaxdQuDQnx7vwQ/LJHU6K8KvcDiZimDghu9vnot24EXFfJgWA0NNmUKc5ic
	 OCgkiWTK9aCaqg2L2Bj2QdI6sHlKdm+cvX0SE2tq7b0hY6hHdDGpR9ZRcFoC3rJy/W
	 LKL3wptIQsJwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDFDE60D58;
	Sun, 14 Dec 2025 12:29:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49085117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 12:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 301D2408BF
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 12:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jS5VM8xYuwxm for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 12:29:40 +0000 (UTC)
X-Greylist: delayed 910 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 14 Dec 2025 12:29:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C697740881
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C697740881
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=169.148.134.94;
 helo=sender2-pp-o94.zoho.in; envelope-from=preyas17@zohomail.in;
 receiver=<UNKNOWN> 
Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C697740881
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 12:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765714464; cv=none; d=zohomail.in; s=zohoarc; 
 b=dYYL9OqxKEdxtsSZ4iKqHinhPV4YPOLTZ6IDCiSAOwtlA1J7KRlPSY7a2c5l1D2D4tDOr6vieNdFMi753D8CIku2ArOpmqwyx2Gx1DftU2gv3SnhMBLrWU/OZkYq74car/U4tOSxOVRDXNOUVpFkUeuUlq0DpOVhht/+hq+Q/kc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1765714464;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/Nb5lcF6TlF3C/jlaBsQjwm5OGFAEFgVIajiraesp18=; 
 b=KYbrMg06/UAZEwuF0ks+5zHCys0oMc+TJEx12JmA5Dl4pCyDRl2pRwvsfAcTXlXsTHcLToX43r1pT+U/XkpmvpkPQ0La4T+v6oF1W8SIVa7LGYFi4Rm/ryZODNjZvQ32jJhEbw2BMh4VMeFyyXjKGXMyYgunbxrIkPhUNWUN2LM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=zohomail.in;
 spf=pass  smtp.mailfrom=preyas17@zohomail.in;
 dmarc=pass header.from=<preyas17@zohomail.in>
Received: by mx.zoho.in with SMTPS id 1765714462196380.66336549374546;
 Sun, 14 Dec 2025 17:44:22 +0530 (IST)
To: buildroot@buildroot.org
Cc: Preyas Sharma <preyas17@zohomail.in>
Date: Sun, 14 Dec 2025 12:13:59 +0000
Message-ID: <20251214121359.610963-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1765714464; 
 s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/Nb5lcF6TlF3C/jlaBsQjwm5OGFAEFgVIajiraesp18=;
 b=kNBWGviIUDbU74y6OjmPY7tNZwYohrfTHTQjYE0hzQXdI6hpc/Pw6OwcGrQyzxFu
 4MK7CBX+uYw5VeDVB6O9g44SlsWx9GlPOjeouN1CrOk5KiMX3cDKKeCEiNVogU+RdOJ
 fmPAsoHLGct45Rh8cJbKRC+gwGrvaIalygP5Gk+c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.in
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.in header.i=preyas17@zohomail.in
 header.a=rsa-sha256 header.s=zoho header.b=kNBWGviI
Subject: [Buildroot] [PATCH] package/libwebsockets: bump to 4.5.2
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
From: Preyas via buildroot <buildroot@buildroot.org>
Reply-To: Preyas <preyas17@zohomail.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Preyas Sharma <preyas17@zohomail.in>

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1466c8d9a2..16aa6f7522 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828  libwebsockets-4.4.1.tar.gz
+sha256  04244efb7a6438c8c6bfc79b21214db5950f72c9cf57e980af57ca321aae87b2  libwebsockets-4.5.2.tar.gz
 sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 7806b64bbc..395c869e83 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.4.1
+LIBWEBSOCKETS_VERSION = 4.5.2
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

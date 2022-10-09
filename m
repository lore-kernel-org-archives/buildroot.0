Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3909C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA3A409DE;
	Sun,  9 Oct 2022 21:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA3A409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWxM8B6rfDQM; Sun,  9 Oct 2022 21:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 631C5403D6;
	Sun,  9 Oct 2022 21:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 631C5403D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0B671BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8596F82AF5
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8596F82AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmlkMjjsJH9G for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:32:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759588291C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 759588291C
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:32:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a3so14553863wrt.0
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pF76F+O3Lkio2No1i8St7g1T0TGRLEdgYojjh9v1aLs=;
 b=ihwLT8YQKtVO2hZMK1UH6jn3KCuDfpp2uIeMyrPuNdvR0YTy+PrtcDMqei47MYpY5e
 T96i5RFruttUNauZKrMwzZNafefD2fd6QRDdz3hibAC4z6/7l2z9ohbuTqT3bjNy3I8b
 i6223pePCPdMZ6TMUr48tlifyaeaFOntNI5uyBVSkEZczJJAkBQP5Xk9k2jpBiCAp/II
 Tib7P7DUSXOmx/RuXptgyoTrJUF1l/wdVasmfywCXNqqp1XKZAfJ9ieruga9yC09WDyL
 FbdsQNOrh4CsEXAOibUxRRi5cjx1l2wsBDcVLv2O+WAVkpNxf3iNwTss4pv3t8Yd7ZgX
 ctMg==
X-Gm-Message-State: ACrzQf2kLgknG1FHsn+186qX0nmasxGUcA6f2JXwSoJ8DifDWvTz89TY
 3lw1gJeoXz6LOpaQCS7vqAM2pJH+vLE=
X-Google-Smtp-Source: AMsMyM590VSFU1kHqg7x3dVAtI87duXsAr4CuPABHWL1TkHfcMHE+GdYhiQa4MBpABpCbXA9kIDZVg==
X-Received: by 2002:adf:f58b:0:b0:22e:3c4:cf83 with SMTP id
 f11-20020adff58b000000b0022e03c4cf83mr10005950wro.379.1665351152116; 
 Sun, 09 Oct 2022 14:32:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfe28c000000b0022e51c5222esm7258949wri.86.2022.10.09.14.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:32:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:32:12 +0200
Message-Id: <20221009213212.92009-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pF76F+O3Lkio2No1i8St7g1T0TGRLEdgYojjh9v1aLs=;
 b=bDn6yYo0LuYEw9VpxIz1hZ9o9B8HDznE9wOzkPKKiaWxCqhsFZkwh4i5HA4vg3OGeP
 X2bHo+AIrvxozyO3rJJIykm+7BlFcFgFnrb1ErX7OvLqoSijEpSGOG8J1J2q4yemLv1S
 62YNsfs05whWrSKbaQ1aWEwW/DBw2znBZlP24eJg7MMznhaNlvXg/rp3SbdT2gRiV5uC
 J/7dRTzcJo36jm+Ge63ChIGgixPoxFAsgS0zOHOrMpf+IJyl/bpunwBMJ4T/rm5KSdkv
 jG8e7rt3d9JzRn7qAD5qHSjMm6+Q8r5VeYtDAzGNOhRiDJcwHVlLGtD82lMTZNN10K28
 N0jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bDn6yYo0
Subject: [Buildroot] [PATCH 1/1] package/checksec: bump to version 2.6.0
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE.txt (update in year with
https://github.com/slimm609/checksec.sh/commit/24a81d33b9bc600c676ed96c183e87181e514844)

https://github.com/slimm609/checksec.sh/releases/tag/2.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checksec/checksec.hash | 4 ++--
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index 41aae8188c..a29866ba07 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1034459d7cd2b0ee515c2b6b003375fec566fb59c838fc5e1961e1fcf76b54fa  checksec-2.5.0.tar.gz
-sha256  7888fee828bf56d547fc1f634e40638984148b4fc41373b7626eb465060640de  LICENSE.txt
+sha256  39d4158f96bdc7533ad6595703375c0046951fe4f6367b831ef92d9c66c1a307  checksec-2.6.0.tar.gz
+sha256  55154b4be6dfcb3ff29d1e3648d0d07b3943a5fcc3af7c2e0e799b074734f722  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index 61ef110f90..ed9846ac2d 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.5.0
+CHECKSEC_VERSION = 2.6.0
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

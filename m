Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7675CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DCD040556;
	Sat, 12 Nov 2022 21:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DCD040556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiPFa-O_wgUI; Sat, 12 Nov 2022 21:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FDFA4055E;
	Sat, 12 Nov 2022 21:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FDFA4055E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD4B1BF36F
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 21:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB998400DB
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 21:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB998400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8i_5rTbqMUK for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 21:37:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE08840012
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE08840012
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 21:37:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z14so10918951wrn.7
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 13:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SoWouiyg8sdoub2noFMB3mZYnrseE48lb5dviEKbTt4=;
 b=VPms00OwdaJBmTjP1UezWuieRfqja5MuPzLpSndDnlIB53Ad9Fu8aldZNPJ5FF9/Lc
 WFf1iYJjCS8+YhjbcpPTrpCTSin5gYizg/CUWwqoln5EmLjgOyoSf5/DZDKU96sXjxxe
 LsjWSSjvTeq6SEWiLMEn6x51dMcU0TruGCdAf5iHREPBW7Myb7OJHjBVdhqg5KL5S7gO
 NMtM8BU4FGJFAXfMO1b8BsSnUVz5eHBJdevjuy6gPM4BpOjJA9GkckZnECRJEHgVLzN2
 bP0R4pIQ5CAgs7lvM2lrVAkAwkrAhRJ2BJ1HOvAtVUBWwQqTJ8ZSS3XQO772cxO7mVRm
 ecCw==
X-Gm-Message-State: ANoB5pla+MBrHnlPyoYiQ7aPXhM6miWmM7yAXNH+rtJSfXlfVPxURXTc
 0bXL3ik+SFADCO7v15i+lhRrbUL2Vuo=
X-Google-Smtp-Source: AA0mqf77sHmgSkxc/7DZvFkh4wBxKO04Pbr59gKSDwHO7rS9aXcaRK/V4q0iN+Tvkw0Ry2AEQ2YR6Q==
X-Received: by 2002:a5d:4a8f:0:b0:236:c206:fd6b with SMTP id
 o15-20020a5d4a8f000000b00236c206fd6bmr4208883wrq.56.1668289028600; 
 Sat, 12 Nov 2022 13:37:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k34-20020a05600c1ca200b003b47b80cec3sm14698367wms.42.2022.11.12.13.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 13:37:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Nov 2022 22:36:55 +0100
Message-Id: <20221112213655.110226-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SoWouiyg8sdoub2noFMB3mZYnrseE48lb5dviEKbTt4=;
 b=eArXeeJUhMVuTRmpQa/pTh5fcVZR+cQ9em9MCgq/zeySkusyN/1817u/xSPrfllZuH
 lUZGfEDRvoXEycWiqGHLyDjPlSc04KLCSXnukM8N65efxKxHhZ6dPO66Q3Rer1Rd4gLZ
 RERY6vtii2CZMOBH88oPt+5YMbnZR5EiX/FJxWY5V7qIoCrMXGaUC39SaiD0XTVmDK5n
 Fq+mk5gcCJNz1CbLmF+NkJuMbZZgRrsfEM9A5mTboRwVh9li7/YWaTbQmELaJ8h1TfUG
 EImJdQI/Hk4/M3ROSMu4vL03sl75LdpA1AjjryoHvihaUs6HANcsTbXXyeYloahT8h+W
 rmNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eArXeeJU
Subject: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump to version
 2022.10.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-40284: A buffer overflow was discovered in NTFS-3G before
2022.10.3. Crafted metadata in an NTFS image can cause code execution. A
local attacker can exploit this if the ntfs-3g binary is setuid root. A
physically proximate attacker can exploit this if NTFS-3G software is
configured to execute upon attachment of an external storage device.

https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-v4w8-jv3w-7prm
https://github.com/tuxera/ntfs-3g/releases/tag/2022.10.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntfs-3g/ntfs-3g.hash | 2 +-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 89bce73559..3fcba6af4d 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93  ntfs-3g_ntfsprogs-2022.5.17.tgz
+sha256  f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c  ntfs-3g_ntfsprogs-2022.10.3.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 64800c5eeb..62c515d50f 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2022.5.17
+NTFS_3G_VERSION = 2022.10.3
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

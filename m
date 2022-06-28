Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17881C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 20:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F99C61149;
	Tue, 28 Jun 2022 20:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F99C61149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AX88CzSo5zRT; Tue, 28 Jun 2022 20:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 615A260B20;
	Tue, 28 Jun 2022 20:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 615A260B20
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 137741BF82F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDC6B40256
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 20:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC6B40256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ri0UWKuCWwda for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 20:32:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5879400F3
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5879400F3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 20:32:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q9so19341678wrd.8
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 13:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ph+MNE35ddXXeNRxPONQ/7GuiWu3BQyPegpu8Gv7GgQ=;
 b=iY+Orq0RESYguTljkYUmNNuxGt3WoEuTLRZG86r9ox62wF3jG7IQfvAka5eriVcu9k
 5e7nv/z04PW3IvP6iaFOGWmhf5xLwIrir3otgAkIk1gxRNXsIYlzPfRCPqovS5w2z4L2
 kdXdLflaggiwgZJX95BzjW91edZhfzMvcvf1cMQSl35EasSUi8bThCQguLc8lS9+Vkbh
 FqeXeX0VMqleYJqlnEiM5tLGrEvtV/pgJiBOXyAgdiP0u7rexNW3fYNANOc1u0l/Adfd
 PoR2UVd/3hLGsmPoRrAwzGNd/qJtXBili0dOFmENJJxtXCsKyVK69u/aoNPatftrPJSV
 2GYw==
X-Gm-Message-State: AJIora/R6scdL06tUtCDhtAKfU4z2iQy2bC3+u0B7KQD05+acuMl8MB3
 cBhS72JSPjvfh4SShs+LH0WV9rgHVwM=
X-Google-Smtp-Source: AGRyM1uGhb6sVd5dxoHe9WVnm3mcsSrQFLMd83fxtfiLRSec0Rc+a1VhsGjkyrlIBTOxg23OB//tPA==
X-Received: by 2002:adf:e903:0:b0:21b:9204:c0 with SMTP id
 f3-20020adfe903000000b0021b920400c0mr18984591wrm.443.1656448372779; 
 Tue, 28 Jun 2022 13:32:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b0039c63f4bce0sm710263wms.12.2022.06.28.13.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 13:32:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 22:30:01 +0200
Message-Id: <20220628203001.2840929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ph+MNE35ddXXeNRxPONQ/7GuiWu3BQyPegpu8Gv7GgQ=;
 b=J7ObsugIuSU9/HgcztHz4w415/Ac4H7dbNuM7aReyoScld0/amkytBvE448GFTKuXb
 J6Zf43r4CTkZvV/i0yQfMNEwmdfKEXkcKb02xUBrpCwWQI+hKUfGsiO0cUeHvJe+unVl
 wb+OWSDRSIoXju39X3yaRob6vV2pPWrNt1JmYvCIBTG050t4e+pbiFZ1B+vw+tjuTnXc
 YU/kACsJSxk8Ip9YZLN1U0wfiB+fElfhOk0kfxWDhdxuZldg7APYqjerIbOGT4kxXFNR
 gjP52h3AzPvbgnm9S8nOUbQLuhrK7moHRPpjiCL9vfW7R5KEdoyRv4SjRszxCNgUlGuL
 p+iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J7ObsugI
Subject: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://git.savannah.gnu.org/cgit/dmidecode.git/plain/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmidecode/dmidecode.hash | 2 +-
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index ba72295cae..ec5484e667 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455  dmidecode-3.3.tar.xz
+sha256  43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5ddb779da8837542212  dmidecode-3.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 3f09cc956d..352cdb106c 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.3
+DMIDECODE_VERSION = 3.4
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

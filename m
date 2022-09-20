Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C074AC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F4A60F7E;
	Tue, 20 Sep 2022 19:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F4A60F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGUnIZ0cumpm; Tue, 20 Sep 2022 19:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6E9600CD;
	Tue, 20 Sep 2022 19:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6E9600CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74BFA1BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 468C5825DC
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468C5825DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmmakaz6MFJ9 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:03:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D4F81A3B
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63D4F81A3B
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:03:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hy2so4779261ejc.8
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 12:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QDo/JeuBhP0S5skSsAOf/F/L1UIbHusGJFA5Y5H3qm8=;
 b=c2HZ7PJjpxpFUOvVOPekmS5XlfVI4d7J7jQcCMS0Ugh9qiakhme+THznAXpa95/F5v
 v58H6V5R0lRT88fuMUYZ8INkOFvb2oFq7W6YaZiG9ncwZ3she7k+Btf16PHZU0qDxa1k
 C5tWGOpIAB3OcRJm9srjjmwuvP5AMp3uiysUQyseM1nWSG2ZQLcZdjCv9lkW3ZfTBXxe
 yQSRPMQogGi72z2rPVk+cS3NIBoMY3O+//slQSEw/TqfVTrV++BYaM9lxensxuWy+DV4
 oPB4Ph4rh5l0/d9gXsfuMMU7vBRXIm3ET3HxMTtF8uCHhAQwPK8FdnCknsssXsoYVixS
 1EAA==
X-Gm-Message-State: ACrzQf2yM83pxH0DN+XVLiza653MMqXizyvvxyJMr/VYFykRmfXC/nc6
 /y1KBAp0zvZSUzdYcIAF9HXAvKTwm4E=
X-Google-Smtp-Source: AMsMyM7/LsCTRd4NouwxGyjBPt3qQzZVkZ2RQ6OC4jEkdgDPMh7MjbhglEAvQzQ2KZb5ibQpZHct0A==
X-Received: by 2002:a17:906:4fce:b0:780:e1d8:eacc with SMTP id
 i14-20020a1709064fce00b00780e1d8eaccmr13167690ejw.366.1663700596253; 
 Tue, 20 Sep 2022 12:03:16 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05640226ce00b004544bdd56a4sm295809edd.89.2022.09.20.12.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:03:15 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 20 Sep 2022 21:03:08 +0200
Message-Id: <20220920190308.3688668-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=QDo/JeuBhP0S5skSsAOf/F/L1UIbHusGJFA5Y5H3qm8=;
 b=YLMy+MmW21lSyadltBOsR71M9F/OylBzt11u7Rk8brUBfeFUO3vvM8QFJOYxFaWilw
 s/vi2bqRUDpCaOH7l648MQoNMl137yddgE8IeGNG/nouO4xL2dTcZIkfq7uR2qR8tCRn
 TK2RtO3zya2BP0w2VHXKB9Dbosk+pSdB04ceyt0VnbvMwHATMLPdqcH86ENUr2kkDijO
 3paKpDtCVLhNVQJ8HC0/DQ7/yh6OKnyYmWw+K31pfYw///zR7y8yHlSdXemMN0mdbTiE
 zHxjft05I9+qHn4jByz4rbt2g71v5UOG6+DNB2JI5IeOQQGOd938S2Qc2I8HF+b/+Jjt
 4mWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YLMy+MmW
Subject: [Buildroot] [PATCH] package/chrony: bump to version 4.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 7fa67bf04..9c0e11757 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.tuxfamily.org/chrony/chrony-4.2-tar-gz-asc.txt
-sha256  273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a  chrony-4.2.tar.gz
+# https://download.tuxfamily.org/chrony/chrony-4.3-tar-gz-asc.txt
+sha256  9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804  chrony-4.3.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 15b200aef..379e95a77 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.2
+CHRONY_VERSION = 4.3
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

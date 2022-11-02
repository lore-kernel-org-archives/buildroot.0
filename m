Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D123EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7597B4032B;
	Wed,  2 Nov 2022 23:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7597B4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKeZncDLH49J; Wed,  2 Nov 2022 23:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67F7440A90;
	Wed,  2 Nov 2022 23:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67F7440A90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA4FE1BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E1E41581
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E1E41581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCuOT5t5ritr for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:54:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78EEB4157A
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78EEB4157A
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:54:30 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id p141so124427iod.6
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 16:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MWnQyTNm/mzVg8Yl34KXRNGYELRC8kO/iuX5y1puXO4=;
 b=ZFeYHXby9sRWuKIB6CJp9eUzHJOBxC4Oa3tK6pMFbbFhQjwBkvxo6IBF0Fb4jwslN0
 PvWFQx0fVHstsh4nWCUAZZBW72Iqx4BqaYpdoQOPg7eA86l1IcbQp0no2mJC5cFc86qD
 KkTBBjNsnXuzL3u92C5fENFhv7fagsjJr5obUQoo5tvh5TRt8tUNhY7a54p/ZX0uE/T6
 sV0YSx1unnGpyCrl2lE2A05ZOMR8bsIe1+JEGPah0vhNCN+Z8e3jgN9gEfy3QhN69Au3
 EZeaefNK+LVpxOkiOWt6XEloKh/OGZ41j/KgnRnPWMDWe+SMVuzuTYI4mdBRvGSDWyfV
 fNkA==
X-Gm-Message-State: ACrzQf0+NwB5S7OQ1eJi27cPHdDAwwnbfOly9FpcHnh/is2/Ehiz+03T
 8Kmue7JfV3kip7kMTDZPLt+6e/4orYYIpg==
X-Google-Smtp-Source: AMsMyM7fTOIB5yr97x7/6kVl+snxPbS81klnrXnelqSdxhfZpOfBJej0rwui8fd80coW36Dc/74JcQ==
X-Received: by 2002:a05:6602:2e01:b0:6c6:641e:c13c with SMTP id
 o1-20020a0566022e0100b006c6641ec13cmr17826577iow.27.1667433269256; 
 Wed, 02 Nov 2022 16:54:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a5d9d93000000b0069e1bcbddaesm5588090iob.16.2022.11.02.16.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:54:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 17:54:27 -0600
Message-Id: <20221102235427.143913-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MWnQyTNm/mzVg8Yl34KXRNGYELRC8kO/iuX5y1puXO4=;
 b=VCKERvUgp41pe41uZrUa0NpewFvJd99IcvPtFwA6eiGmTwOTI1PHRMn+qZfnzkEdmx
 k/A4Tamv0vIXIDI4TBRSjm68irjSbHs+dFLU4pCFx4qmgF/5ubvOwhzPPMl2sP1794wH
 dUYgNVP5Aty/S6R9cvEX3q79r1KSl+kG78zjWLMfj1tKAnWaj6ypsKDsyU3JlKJP8caE
 LzIwCJYA0lPiGdF2S5zkm2dCRD7ci51Xm2dQLCtD24broIAyEGkUthchsR96vkT7YXBm
 sukCwLD1AwXlnmGhYhNbdyYHDSrc97MuQ+CainHJfzPBUEFRA4CZEe6r675FVL8TzZOO
 q/Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VCKERvUg
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 23.9.3
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to line wrap:
https://github.com/jaraco/keyring/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/python-keyring.hash | 6 +++---
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 692217f437..45f5bf7c84 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  1eb6d586ee5794de4bf39c1f513a3139  keyring-19.2.0.tar.gz
-sha256  91037ccaf0c9a112a76f7740e4a416b9457a69b66c2799421581bee710a974b3  keyring-19.2.0.tar.gz
+md5  60219a9a22467e15fcd09515b5b2ef39  keyring-23.9.3.tar.gz
+sha256  69b01dd83c42f590250fe7a1f503fc229b14de83857314b1933a3ddbf595c4a5  keyring-23.9.3.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 0e05738605..8d7833e14f 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 19.2.0
+PYTHON_KEYRING_VERSION = 23.9.3
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/ee/46/77fdb7cd2b0f1f684afbc35a59b3d7ebb6961fe528f97b86900002968914
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/2a/ef/28d3d5428108111dae4304a2ebec80d113aea9e78c939e25255425d486ff
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

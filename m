Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E4DEE57D5
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 139C94014E;
	Wed, 11 Sep 2024 20:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVpgEJhqexsu; Wed, 11 Sep 2024 20:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2BF4029F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA2BF4029F;
	Wed, 11 Sep 2024 20:24:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1CC1BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B709402FD
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaNTsaizwjLZ for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09330402C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09330402C9
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09330402C9
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:24:43 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82cf3286261so9521339f.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726086283; x=1726691083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hlo1Ug+YdtyxkD1Cuc0eTg3ypj/TzOYu8GTQYMcgAU8=;
 b=lrCuqqUV9/qi7sisLvje641YxrWyu5NQ6PElWZmVCdzyHH4XtuNKOzwiK4eDTo/5Vh
 3/HMIgYFWYpdZO9Ug+6NG3q+ytH9OhUMgTP34ZSm4b18/kuDqpIz2VpJbL4KRl+hTY5E
 Ii02DVIHLnsnLrXkaqys0F3h/fs6HxgylpBzuvW2hx1OIYkVriIdV7MuFPgxjD5MmS6P
 hN2WF2JlDx8U82nUZYNHKt8E9a9iPKE1b3W3YaNoscJlCzZbfr3dzO6OkWSSfFULwHmO
 MtaBZydOUYD/BTehcVtvbzjc2Jmbr7xcktMeNFreQJ0yeZBnUv+qO2fRiJ+Y/ZO5r+YK
 ZK3g==
X-Gm-Message-State: AOJu0YzNx3+IoHcGZNkalnb6LZ0aNBoVQ/7CjlMJQu9sfRacTUseaSEU
 sVxQ+IlqWaD6415QWVdoo46CbqnS0P2av4DGSNs8Ad9Kf6HIgJ5IPjOAqw==
X-Google-Smtp-Source: AGHT+IGa5clk0wi+NtaDDb+xKyCBbmPucNEWDhs170Q9RSSmX546JclQsnSKiOGvYh99XzFErBEJ0A==
X-Received: by 2002:a05:6602:1611:b0:82a:2053:e715 with SMTP id
 ca18e2360f4ac-82d1f998e38mr105163939f.14.1726086282464; 
 Wed, 11 Sep 2024 13:24:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d35f89227fsm179062173.110.2024.09.11.13.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:24:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:24:39 -0600
Message-Id: <20240911202439.652700-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726086283; x=1726691083; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hlo1Ug+YdtyxkD1Cuc0eTg3ypj/TzOYu8GTQYMcgAU8=;
 b=D9Hg9pz7hPOiy7LyDnTByAkjKMjIJYeCx77+loevovXax34IyF5ig0U6wI62C2kUgg
 YE1LmNh2z2NAQKvHExS7UiHKtC45qT36GxZmCUZfUESq/iDq7K4PmGNvS2qppWbV0Uyy
 xKGstXteQx1dFWZB2rNswiyobhXQJwrthlNqyjrvp915miuf0HFiFSGdw7/AsZr1WuFm
 LD3kIUF+ffP1NfzvtF2dkF5BUQR/C9/t7Yh7WSEf+/kTyyiWmoQpqfhHrL6swsPG4qgO
 9BpCCmRhDtLdiTDNLpKZ+TQk8hOQUrcOwWYGL9OVof8yTYMksAOiTyywahpcZpfS+IXX
 d0RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D9Hg9pz7
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

doc/LICENSE.rst hash changed due to additional details added:
https://github.com/chrysn/aiocoap/commit/cbd0d1feb74b0905b517f0e51d1eb258668bfeb0

Add additional license files as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiocoap/python-aiocoap.hash | 8 +++++---
 package/python-aiocoap/python-aiocoap.mk   | 8 ++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index c9d73cda26..33895b2387 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  baebbc38bc8db31472c438521f7121e3  aiocoap-0.4.7.tar.gz
-sha256  90f3bcaffd454f5421d3ad55ddbe3fe10a686d4b9f3c4445d427b130493a96a4  aiocoap-0.4.7.tar.gz
+md5  09a0cce4b192d861d2becf216f0769fc  aiocoap-0.4.11.tar.gz
+sha256  2603b8ec61caedf008b4a153a94f337262bf89f26d1c030f12c492d085e875f7  aiocoap-0.4.11.tar.gz
 # Locally computed sha256 checksums
-sha256  0ad39132b3529369998eb7493b950dc7452b07ba9d8cca7619766b6c6d8270fa  doc/LICENSE.rst
+sha256  c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  doc/LICENSE.rst
+sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 73a0d61eba..a69722232c 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.7
+PYTHON_AIOCOAP_VERSION = 0.4.11
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/de/14/843232b56c0f09b2ceddae3da37598d9109c4b1d9383b1ab72232018e9e8
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/50/b3/2ea6d3a294ec094da3175aceaa2ad1c2644eab162b48676267e992d4c651
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
-PYTHON_AIOCOAP_LICENSE = MIT
-PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst
+PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
+PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

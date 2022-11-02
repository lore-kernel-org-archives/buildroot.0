Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0076C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5390040A90;
	Wed,  2 Nov 2022 22:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5390040A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psu7fotQczKD; Wed,  2 Nov 2022 22:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65BB84014B;
	Wed,  2 Nov 2022 22:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65BB84014B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4651BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A74F4014B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A74F4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOTH-vtgdNyX for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:03:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7972A400D0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7972A400D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:03:00 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q142so10153248iod.5
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzYba5rzLB23Ns7Sxit0tfX38bcok3DfQsQZcXTFZZM=;
 b=EYyiyx/flewZjkXZdArIPYiX0XlbgqZN2csYKfC2AMJ3Vl6ZBNwOvAzYp5pErNar9F
 i4joi+toNK18pu6zypekCgm37yNkd3px8vWsz/yZMWj96PY9k/8aKiZkm4PPZ1IUNLQA
 5BRTn+KPv3czEin96tLec8qv7whlGAicZQASuh2bohmeyk0peJxvC91vSBLE05UbyV9N
 NptCeJPPXq4DpjF/R3Yvkcf9fEDKtStv57IEf/ycJpqeFCLQrAt+45I1HXiaSTUw2JkY
 g+vQJsiYC8F1xGtmCM6Wy/k1C5B/31f/lfMfaKJIhhl4fhwlcRh89CyVeCUD7M4fZVWS
 rtHw==
X-Gm-Message-State: ACrzQf0K7keTQhkr2f7ppOwgBw2n5Dgh+WPqs4FF9YuWm+98IDHrtfHz
 cvaMPyt9xgYAXSEQytrAv9g4Zijb9zBuCw==
X-Google-Smtp-Source: AMsMyM4ROh02DwK68YPzWR4jLYZjjsNEEWGFbQSFUNmxH2C9Wc1zRMgsKF9S0O/uNGr91/45LZOFSg==
X-Received: by 2002:a05:6602:2d82:b0:6d4:cc5d:b980 with SMTP id
 k2-20020a0566022d8200b006d4cc5db980mr2899418iow.80.1667426579214; 
 Wed, 02 Nov 2022 15:02:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05660208ca00b006bbfb3856d6sm5557889ioz.5.2022.11.02.15.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:02:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 16:02:57 -0600
Message-Id: <20221102220257.1514390-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DzYba5rzLB23Ns7Sxit0tfX38bcok3DfQsQZcXTFZZM=;
 b=NGwNKT6TA87+109NXf14LBr1DI6I/Nrs+0rAPRVg9RaTGOn5VlvEJBV0gwAMdZWQeq
 EsNUk4xdxKM8cepFIVCZw20Iow0v4vxbWb8TLUnQ6MaOWuD5UO7oMh/+VafRd5AMAB6T
 dyKGcw3bqXJQrhOyG67zbu8jv097LBThumhs3JPl+BsY7T4hW3lXo6JM16QNfZpsrCM5
 ty4AkWgxVu/mAzBZyL4cuquBYIl70Pb33G85Fa3doEl3ldP8CRf2UCMYwMor1qoSMY5H
 ekaX6uV4bAJnDIeReBRXWhzr60Esb2rGePBQA+Y0254z9fvClxw90Bk+innC9yWAHthP
 rpvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NGwNKT6T
Subject: [Buildroot] [PATCH 1/1] package/python-huepy: bump to version 1.2.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is no longer needed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-huepy/0001-fix-import-with-python3.patch | 8 --------
 package/python-huepy/python-huepy.hash                  | 7 ++++---
 package/python-huepy/python-huepy.mk                    | 5 +++--
 3 files changed, 7 insertions(+), 13 deletions(-)
 delete mode 100644 package/python-huepy/0001-fix-import-with-python3.patch

diff --git a/package/python-huepy/0001-fix-import-with-python3.patch b/package/python-huepy/0001-fix-import-with-python3.patch
deleted file mode 100644
index e04eacb228..0000000000
--- a/package/python-huepy/0001-fix-import-with-python3.patch
+++ /dev/null
@@ -1,8 +0,0 @@
---- a/huepy/__init__.py
-+++ b/huepy/__init__.py
-@@ -1,4 +1,4 @@
--from hue import COMMANDS
-+from .hue import COMMANDS
- 
- __all__ = list(COMMANDS.keys())
- __version__ = '1.0.1'
diff --git a/package/python-huepy/python-huepy.hash b/package/python-huepy/python-huepy.hash
index 32d0eb2674..74b02864d3 100644
--- a/package/python-huepy/python-huepy.hash
+++ b/package/python-huepy/python-huepy.hash
@@ -1,4 +1,5 @@
-# Locally computer sha256 checksums
-md5  da6514d9d61fb75ac9470f6863ce1aca  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
-sha256  63147cef5ecae5c1ab38000be91def351710e6bef2c5f67b5303418becf6c0f2  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
+# md5, sha256 from https://pypi.org/pypi/huepy/json
+md5  394a1072bec18c27097b053c40ddf0ea  huepy-1.2.1.tar.gz
+sha256  5b29beef797312fb7606188bc5cd98f78ab8f7e01576427a9312f1c9b20b759d  huepy-1.2.1.tar.gz
+# Locally computed sha256 checksums
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/python-huepy/python-huepy.mk b/package/python-huepy/python-huepy.mk
index 5c1041205d..cca3c3429e 100644
--- a/package/python-huepy/python-huepy.mk
+++ b/package/python-huepy/python-huepy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUEPY_VERSION = a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e
-PYTHON_HUEPY_SITE = $(call github,s0md3v,hue,$(PYTHON_HUEPY_VERSION))
+PYTHON_HUEPY_VERSION = 1.2.1
+PYTHON_HUEPY_SOURCE = huepy-$(PYTHON_HUEPY_VERSION).tar.gz
+PYTHON_HUEPY_SITE = https://files.pythonhosted.org/packages/d6/4e/2dae447d8858a31158ca6c313f5d1902bc83b8542bb5f10c0307de2973bc
 PYTHON_HUEPY_LICENSE = GPL-3.0
 PYTHON_HUEPY_LICENSE_FILES = LICENSE
 PYTHON_HUEPY_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

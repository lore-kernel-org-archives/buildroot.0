Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D115C6FD20
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB4040CA8;
	Wed, 22 Mar 2023 01:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB4040CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be_3Rzm8ewtn; Wed, 22 Mar 2023 01:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF4C540CA7;
	Wed, 22 Mar 2023 01:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF4C540CA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 265D41BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0B9840990
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B9840990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ckbnvp49mJX3 for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DB94097E
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3DB94097E
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:19:34 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x6so833026ile.3
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679447973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cdj+xz04yFV8Z3x2L1ZSzQ4lpYh97LSaMOvJ/+Xseo4=;
 b=6BxuF7rGxDFUtLYg/sxUwLUKgJTopwzrHGcdtCxK5m+/JfiwafOom6R1qIFilgXr7N
 +FfwtBoG3Xz/n2hlJPggtAGAsRkwuaI8xXqo7cev+jSYd+roSXUX989jsyiRYuRJaXru
 nCAou5zOn7kQ63/WP8ndTFEc03qy7SXBQ3LRY2sz0YLsNboHMHeSONQMSRjM2MyqaD4r
 Zm+pw5LotniBGWxRZ0fiVDNUgjNxacEzhwaUcv6jqgJorMV9HuugOZN9S6MBSHXdhhIf
 SiPra2tUMtsrXXBCLXnrih8C6+Ymxqgilua0bJPnqJasvei6PoLr7nA3qluRSbu0XKDl
 WxuQ==
X-Gm-Message-State: AO0yUKXClOfDtpSttv95P2nKUa8oxUI9bbJQms+boE4zahgM4Y/HyZPy
 p66fK9cw1tccybv5CCXT5GRi3JQK5SrmUg==
X-Google-Smtp-Source: AK7set/+vlT9uOIreL4FuGHgN6w11nYFqAZbJCqPUXbzQ2IRnRgV08AUMUsZjNvonMoYaXbrDsw3rQ==
X-Received: by 2002:a92:d206:0:b0:325:b96e:66fb with SMTP id
 y6-20020a92d206000000b00325b96e66fbmr1102026ily.1.1679447973602; 
 Tue, 21 Mar 2023 18:19:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 x10-20020a92300a000000b0030c0dce44b1sm3943437ile.15.2023.03.21.18.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:19:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:19:31 -0600
Message-Id: <20230322011931.12599-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679447973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cdj+xz04yFV8Z3x2L1ZSzQ4lpYh97LSaMOvJ/+Xseo4=;
 b=NmMufDRLp5QW2YlL9XPH36VEoZRHz4RCuB6AJZLMHmgVHTSlR3nPc8fIMMZ2rep+Oc
 LEz2KF4DFRmtTpVecK5XeI6PP3PUJItgDYzYaa5+qHw+WhLOYyDZm2dLG/RjspnAewc5
 eKUJXnTlcp5nMovohthiQBPKgn5FCDpUtsdrRv0jNTxw951kHbtL516THoyPZdf/eG2r
 3VYEVAX1riGU7plZd39RqiGoyhtXPHZo6LZ6MK9GhEqBxlVD/JHlkhF/f9TbUC/mzbEx
 Crfeb2MMu+kbHkX9y0A3nLxsrEo/nJff31f5ot92ubzya/6MMfqxjZplZXtH4Sv3B2hN
 02Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NmMufDRL
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 23.1.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to copyright header change:
https://github.com/crossbario/autobahn-python/commit/49c41440e16528ee6ab267df0f9989fb1ed81f7c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 6 +++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index f9b68dcb22..4fa7c451f5 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  98d8451385ccd8ece2d2fac023c61a19  autobahn-22.12.1.tar.gz
-sha256  43b4e8b1aeaeb20a0cc0a81572e613dc958057c0ab248a7d6b41b2763270f925  autobahn-22.12.1.tar.gz
+md5  55cd275bc3d9c7e354f4b6a87b87f466  autobahn-23.1.2.tar.gz
+sha256  c5ef8ca7422015a1af774a883b8aef73d4954c9fcd182c9b5244e08e973f7c3a  autobahn-23.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 4c14151960..c44acb80aa 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 22.12.1
+PYTHON_AUTOBAHN_VERSION = 23.1.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/a8/6f/78b90951f263232e468439627f31a2c0846e36043c95af96dc527a4aeee6
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/53/99/b6e0ffa0e8bafe9dfae1c9ab46d44d07317cbf297fbf8f07aff8a80e5bd8
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

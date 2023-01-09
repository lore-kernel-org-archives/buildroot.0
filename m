Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4D4C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37B1640289;
	Mon,  9 Jan 2023 03:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B1640289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmkM5rKzWtWY; Mon,  9 Jan 2023 03:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656F240127;
	Mon,  9 Jan 2023 03:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 656F240127
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8EF1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA394099F
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA394099F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNbA1BcDzNTa for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0610D40929
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0610D40929
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:02:15 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id i1so843646ilu.8
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HSHRkQn9geUEIcO1B6YVVH94lblEvqOG9RVy1vEBrhQ=;
 b=oLSTMSbFcsw/FgZ8Uy8FV9E+vEyU0OUWBbUBU8pY681opjae8Hz+xaZeancZCg198c
 KAlOO+JfQ/q1/tcHhiH9LhoGlSDlV7F4hoNu3CciME+/8SWp+ifjue7sPaHjkPPI/xnq
 pA+YAbZedORy1P0TGm6rQkwi/PhyvaC7wnDvYYl0+Zpgkx6Hgv5dYJd8RgqRZh3MshBm
 E/ouT8qekaVgijePeKK6qIsRgve8TKE223DV2dfc508LJ+ea6Xh5/gWMJVtrG2sXa5TH
 geMbP9mOntxPGwpKyeOIqToUgVAbBF4RpcTlFDm66N6IXkbz7QUiGdUSDO2QhPvqproX
 Avxg==
X-Gm-Message-State: AFqh2krauWR1uLAh6Cbr1OiHaMggk+0xcYjDoCn+aSVI/VGnQKvidkK6
 BQ0O4Hp2Y3qViTI/vmUYgWcFquIs7EEFBw==
X-Google-Smtp-Source: AMrXdXvk0GN+Oby2qy6yzcWvWsWKjFnrQlBzEZ09osKsptOT5L4fDfuCVcVgywjPEyvKN15ytll76w==
X-Received: by 2002:a92:d1c1:0:b0:30d:899f:aed4 with SMTP id
 u1-20020a92d1c1000000b0030d899faed4mr8022634ilg.21.1673233334762; 
 Sun, 08 Jan 2023 19:02:14 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 r13-20020a922a0d000000b0030258f9670bsm2393249ile.13.2023.01.08.19.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:02:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:02:10 -0700
Message-Id: <20230109030210.1982469-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HSHRkQn9geUEIcO1B6YVVH94lblEvqOG9RVy1vEBrhQ=;
 b=dB4J3PgHA3gHOk/T7rRO4v01AytKNfbki44pJDMiMYYmxYN55wqicQrDBmWtFy05Zx
 2Mj/GXjs89ThS6O4ocotJ1AH2fQlj0/YW8R5F2ZErIiYFH7pVbCn3s76fmWAJ+fDcu85
 SuoZqvK8XOOryYtz+2CoCdSKsX0RdQVyTetRqcqIi62c2rgs+fXvgxFgPm0kWOIagNGh
 ao768IZUVgcxwcoZRN7kPFhJCxCXe+gO4Jmwr1wlpCINsBXz3x7Oh+/26oIF7mPEbGBS
 Wt8zrO/FbFN+tjSdDG5FdSkVIschRdgUWVjVtIYChPZujwS1xWVdLGcaQ9g/eIR79wmM
 JyHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dB4J3PgH
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 22.2.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index d5548c0ed3..66b2082cff 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  0487081b7ead8753fc46cf7c6d1e28e3  attrs-22.1.0.tar.gz
-sha256  29adc2665447e5191d0e7c568fde78b21f9672d344281d0c6e1ab085429b22b6  attrs-22.1.0.tar.gz
+md5  eff16b3bbd0d9b72e118cca83a19d380  attrs-22.2.0.tar.gz
+sha256  c9227bfc2f01993c03f68db37d1d15c9690188323c067c641f1a35ca58185f99  attrs-22.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 33651ee80a..0462f7cb0b 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 22.1.0
+PYTHON_ATTRS_VERSION = 22.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/1a/cb/c4ffeb41e7137b23755a45e1bfec9cbb76ecf51874c6f1d113984ecaa32c
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/21/31/3f468da74c7de4fcf9b25591e682856389b3400b4b62f201e65f15ea3e07
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

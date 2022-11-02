Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F23C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B6A60B3B;
	Wed,  2 Nov 2022 19:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B6A60B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pC-tj7Oh6z9s; Wed,  2 Nov 2022 19:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5260D60AB5;
	Wed,  2 Nov 2022 19:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5260D60AB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19DFD1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7CAA416C3
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CAA416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3rihVTNa6ej for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:37:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D74416BA
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5D74416BA
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:37:27 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id q5so9968399ilt.13
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qsO6c61vQZvBcTAygmJlQA7Fm3+F66fI/4dcBhGyrrg=;
 b=I/ewfM5rIoeHdUXUeIlUfuEUAGwQ8f81kxK9e7fSu6SnaGaPmkZBeEbfRbsOAlPcDg
 UQCppt3QQwgba8wE0KOjjhKfW/GQCjp+iEJjgvZpKnW43D8+U8gswMVYnXctJFvfyqsw
 Erjanghf6v9CsCgiY6XboJDBlrTOwKWWvutY4jSdkA1t0weiXOr0pJSY8woz2U/xCW6q
 k5s9qEczOQI+4Rb0giS1ugnvHkJXREZy8xur8sCDw/Am6p/6hv43kT5ZrAVOTfNncK5y
 1M+UbBVvvkctgK01PnXNA16aZb1jjiYimWTiBGuGvKy/vcsbMKW0hTNgTdnp/3qxAgbH
 jytw==
X-Gm-Message-State: ACrzQf025NHgtROWNpp1GDcvM8yxke/cYJNSBTS6udq+LtVmwflXAdtd
 tZ9A36/0ePjEsLV5aIKLrthYEUi23zFqPA==
X-Google-Smtp-Source: AMsMyM5PpQUBLvm3udgHxBvYMASXOBTDLY33aXyX5G1O7MbJxLWbJ0/dwKWXMOJIqOBPy8DBuRnhVA==
X-Received: by 2002:a05:6e02:149:b0:300:8cc6:778b with SMTP id
 j9-20020a056e02014900b003008cc6778bmr16144109ilr.200.1667417846472; 
 Wed, 02 Nov 2022 12:37:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a25-20020a027359000000b00365d1d1cc58sm5064553jae.118.2022.11.02.12.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:37:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:37:24 -0600
Message-Id: <20221102193724.149880-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qsO6c61vQZvBcTAygmJlQA7Fm3+F66fI/4dcBhGyrrg=;
 b=egw0PUg+izhf1rdP1YgsRKQDslSdUSVhImOiOJfRr2neuwLOjXlWeHBfe+mTFy6/Ua
 LQN5nUVpiQo8nDH8dLU8sqFxL6iI19N276hwNlJbqwfFPCsETqczwShZtiWE3Cc+07ee
 E9/fu78Wz0kIhUXfAxza9zLMdDwS4QUzIZQ0FAm5+3hQVdXIToda2f7DlZ/Z/JzjH9c9
 o41wv28luB3IYcWGv+HJZwBmUmn0bDpByFIQdLN0uNu9FDZFjbGqCG0ET+oBi/RlkWxD
 FQnlPod9kDNlGyCeO+kHfTygXRPpn/2SU7l3meUPCArRDoXZ4RT4bHnCPQ5/VXhojKz7
 1mzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=egw0PUg+
Subject: [Buildroot] [PATCH 1/1] package/python-cssselect: bump to version
 1.2.0
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
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index f0687a4abd..df2523265f 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  fa57704c1cb66cc8e537b782bd6b227e  cssselect-1.1.0.tar.gz
-sha256  f95f8dedd925fd8f54edb3d2dfb44c190d9d18512377d3c1e2388d16126879bc  cssselect-1.1.0.tar.gz
+md5  27fbafacce5447cb867acb240d35002a  cssselect-1.2.0.tar.gz
+sha256  666b19839cfaddb9ce9d36bfe4c969132c647b92fc9088c4e23f786b30f1b3dc  cssselect-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index f6faa94b4c..96f6f98737 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.1.0
+PYTHON_CSSSELECT_VERSION = 1.2.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/70/54/37630f6eb2c214cdee2ae56b7287394c8aa2f3bafb8b4eb8c3791aae7a14
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/d1/91/d51202cc41fbfca7fa332f43a5adac4b253962588c7cc5a54824b019081c
 PYTHON_CSSSELECT_SETUP_TYPE = setuptools
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

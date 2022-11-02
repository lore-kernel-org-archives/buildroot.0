Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF07C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA46416F2;
	Wed,  2 Nov 2022 20:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA46416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lj3FbmSs1Krb; Wed,  2 Nov 2022 20:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A0D416ED;
	Wed,  2 Nov 2022 20:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A0D416ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 218691BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AC0760881
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC0760881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aSqvsUJ9P5h for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:17:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CE2A607D1
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CE2A607D1
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:17:20 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z3so15995829iof.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYcNPuzQwur9SS3hMIIIyEcInFCPwT3m7CRpI4UF8ds=;
 b=vX2HDnx1CYmblqDX6MW/I5lIi3MprFqyL3DE7uDWssnyVJwK4lQBCNcrN6kJQv5gnI
 8Q8H/KIOFZLlIJuLZcIYPU5jtdUgOhoIIINIQOZBA8cosM8wfbOaaCxnk4IA3dgRI4DK
 w1i5n94q90E+dRMwKOnSSwzXpEIXXAIh7/EGOlxoxxMNXGOu1NJdbCps/qqmFcT4+VTI
 NvVTOeD+ihyHdSDY6LrLCOk6hjsFblajTQj8964F2UUPiKBUeNmdgIFDLt/g42FVswFn
 VF4CseEdA2GBRfdXDTfLEvjfougLxkiIqckcVHrauEmOMhJcSQ0TGGqigUrrchR5VW1Q
 L1TA==
X-Gm-Message-State: ACrzQf2KbLISqthLl5j7uko5PjC7YYBiuP+g5odezrDls7an7TqAfB8f
 v8cHy8JpPeBY8fR8h5Vnp4Qmd00yFFRcvw==
X-Google-Smtp-Source: AMsMyM7AFJz+Gs+eJldiQdibWTx+HWL8yMjsGF8wN1G32dDQMVnh7xno/cZpJvxDT3z03Qnkt5p3pg==
X-Received: by 2002:a02:c8cb:0:b0:36e:3514:bdfe with SMTP id
 q11-20020a02c8cb000000b0036e3514bdfemr17454824jao.172.1667420238949; 
 Wed, 02 Nov 2022 13:17:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o10-20020a0566022e0a00b006c0aa1ff1a8sm3137475iow.6.2022.11.02.13.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:17:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:17:17 -0600
Message-Id: <20221102201717.2466949-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QYcNPuzQwur9SS3hMIIIyEcInFCPwT3m7CRpI4UF8ds=;
 b=bYKNAHERS8XrQsmMPjlMXML3XnaUA7AhHSCpHlLhQ8uhxJnZhkm923iPhmoWfiqLfK
 mzkDiB7Abt6bhjmPbQumHvGlsusIpvMFEdI+jPafP1s55xijLGOmBKPL+uRSZDPfnN8z
 01/mwz5lxZ7PZHcy+GMlAht/9rIE0F+55lXeIhxqrzZEsYBz4g4bGSGRdt7xS34FqlOe
 2muY8OpD/UsIxmPJ3Bipwxg3HXFxZpECO5zg2UWVQOOXa9R1jp7QkdKfStAJBGdBqGSt
 E/E/ZavPg7MLU7+QPB3uS4ubF3nILWuDOkVDnTuUwomqm9qQupd159+BWxrz1m1jPJNB
 wOyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bYKNAHER
Subject: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to version
 2022.11
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
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 7b183e28e3..32e6e99fa7 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  ed75defac9a7297a567f278994b14d5b  dtschema-2022.8.tar.gz
-sha256  1befe7c9f74cea248a8b524cf6185ac48912a5b2aae96854d77cb94584433ca4  dtschema-2022.8.tar.gz
+md5  69f39814b2e90809b32cbeafc3e6aaab  dtschema-2022.11.tar.gz
+sha256  825e51b8bb82a2d4833d15c25ff2b9a3f5a53b36a490d7c4b6b136037e823320  dtschema-2022.11.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 263061dc98..90fffd4255 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2022.8
+PYTHON_DTSCHEMA_VERSION = 2022.11
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/95/be/cb576760b9578cb69da020aeb80f3c2d05ff46b4090ab350c1e05691329e
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/9a/15/41ece48fc9524ad815238cfbd164b8ac9dde889759790afbcc4903564dbd
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

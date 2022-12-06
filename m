Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C3DC3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 04:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A597460B13;
	Tue,  6 Dec 2022 04:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A597460B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzsXksr-rHGm; Tue,  6 Dec 2022 04:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD82A60AFE;
	Tue,  6 Dec 2022 04:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD82A60AFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E072B1BF239
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A6640385
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A6640385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgP9CCoHusjC for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 04:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EFD40182
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5EFD40182
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 04:59:00 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id n188so9050259iof.8
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 20:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXQDebOR5OLFDHgRck88aTkXWvrDt5N1jBjbd/fVtvY=;
 b=I6ji6Qco2qxaUEjIGX3C9n2yVPXIFzi7+9EuY/xBrtJkjY0znej8qoDFTRU+9Ky8Gt
 VOpoDgRRHWn1+BXkItfPhN2ta1JEHgLTbh/pFu0MvtYCio8qDNCzWXxnbN8d5WYjJpio
 rPzJvOzQAlmEW8yRKPY9kRrt0pVGNMobqygy+ZZxef8UoVnWWgJmcFHYqDvOyctB3y83
 FzoXoI5JL/FD9uevTChfhGCCAF8tCoCQ0pH9uCCV/NHgTs4SfljK04zfVZjuMdOJpZwF
 6Bmt6TT9m+qwWiM7+WkfZ/o7bFOatDNcRV9ou8qFp3Aeo7SFJvgksuMv/UP+UKvb56+T
 jBmA==
X-Gm-Message-State: ANoB5plVW51zGyZrh0Km3cLuS1LSzfyqmUpCTZYBqQmbYGrRfTctq4sm
 jD6zNQZvwXnAPm+V1TidRQ1qcR6z2Qugz9hs
X-Google-Smtp-Source: AA0mqf5bgBMYo5RjnK640TIpOtpa+eVBPNY/Mn3OHX+6/tGLsW/3EUVAVJ7laIJNp52c2kS/qGvInA==
X-Received: by 2002:a02:a04d:0:b0:372:66fb:26ac with SMTP id
 f13-20020a02a04d000000b0037266fb26acmr37563503jah.312.1670302739645; 
 Mon, 05 Dec 2022 20:58:59 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05660214c500b006df13af1f16sm6504001iow.50.2022.12.05.20.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:58:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 21:58:57 -0700
Message-Id: <20221206045857.2858281-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YXQDebOR5OLFDHgRck88aTkXWvrDt5N1jBjbd/fVtvY=;
 b=kcL1wp540ipBqLMvkIQMXByWPx3MVxmt9rZRp495hv68gXkd5Vn5p813G/ofVOHhLc
 FXM4WA+ZQd64xmzMaSLSnVNDz1T4HJuiOnQlQYpWB666gEVv+iVFMmW9nlBGazeP48mm
 Ivu5QLVifGiVXTVApAdaAvV7TUBIMAEWO8qL4eX2ffjCozrukOC1nDt47YuqKS6lM1Nn
 amivdhE7WFBYijGK6zrbmZj/H5PJReWklq9XFd2twecijhI5cwaVl4hVDvGfDcE/KVz8
 wOmtSA8D2CMfEf21Cnd4k8BwSdjtQ9/eVzy4CNWmrpUNtpUqAs5oIzFnUgOAjhnHV4MD
 6UHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kcL1wp54
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version 3.8.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 8563ed544f..515590795b 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  dc06889b0ce52d5e96253573f6cbdf5939c5902022cbe2538cedc622e9378372  orjson-3.8.2.tar.gz
+sha256  0c8d161dfd8b9e4133beabd81e3e1473c246efe55abec571845f72a2ba7b74e4  orjson-3.8.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index b18a5cdada..bda0a8ab48 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.8.2
+PYTHON_ORJSON_VERSION = 3.8.3
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/13/08/d476fff015ccc0f043d3df6332c807695ae3d6abc1758b24f3d335750550
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/1c/b9/a0b4fb195ded02820e0a933ffe28b782b7e5ef7a4f8c1e1c742d619548e4
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

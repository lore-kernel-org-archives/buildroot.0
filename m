Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8113C636C8
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9009B61178
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9009B61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6399E402BD;
	Tue, 20 Jul 2021 21:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ7WN9MuFSBD; Tue, 20 Jul 2021 21:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19AB401BA;
	Tue, 20 Jul 2021 21:08:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 272771BF313
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23C37605E2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kYrxpDs5m4ZT for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:08:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21D32600B9
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:08:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f17so27443158wrt.6
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 14:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LN67McT5W9LDITFOz7d1wTYtnJ7+5xANpaLQhODC/uA=;
 b=szHT+NVDVuA4zhYeXUt/KSN02YC+xwZv3NsYFPh9nVMuRUFWml+WiKoaVeBiwSM1OD
 xY5+zEP5tu2d+w32OerDpfcNcsjBdl3jhiLp3q8vXBCgLhSsfZT8jywi65mxMxlJo/4r
 pmyFJ9f/geZzQDW2V/JVzCLocRMslESc5ZsQ0M7l1O20wadT4Dzz6fDfdA6kS4UuCgyy
 Jg8uHMNH0w43fr9h4AKImRaBaVnSuU+63Ot20imC9mec+MPkteNLTbilY97Er2v7JyMr
 k3HbtYLGH1HeZZ+J/i9x8vrgB/J5UhEhd//dT4qj/NknIoH6861lymGKBrFLjnr+PTDN
 1eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LN67McT5W9LDITFOz7d1wTYtnJ7+5xANpaLQhODC/uA=;
 b=T9cn5K7mxvnonbAnWliX9zNjzgdXu5fLIiQblTQOhUjftJheBMkhh79bqX7CXvy3MS
 y3nwJTSCIyAaLq14gLiAQneJLuaIPBTT2mAMOkxxo0uw9MXgYyptWm0+5VNaPq2ExMxa
 qmWoPq0lGSV599FBdo4XARFfdo8m+RTzqVxYMj0BmHjK+0Jnz1mF/3AfFAwkWSu67eMc
 kQIeD38Tz6S7cnUfppicLxSQMPoqI4/Zs7vdxZIah9+Fxlr/7uNyFg9lHY74mWvcWPcW
 322OPLeEWxk0loDN5XDhhiaadb0VIdnye1TpK51NBpg2pSXls7shYvo1Dm6NyXc73D+E
 7qEw==
X-Gm-Message-State: AOAM533yVxqgUvJrjHgzy8KywgVcwOI2FSUksDvZUaI0s6GgVNlF8cns
 Tlx5PNiCnYAr/wyyYgnPk9S4ywPwT5kErA==
X-Google-Smtp-Source: ABdhPJw1bQraZwXEVrHnDf5SuEl6leU6WuEKU5NDsBWkGFQZMf5V7FuRx241EfUV60sHMLSxjZ9BbQ==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr19486723wrv.293.1626815289143; 
 Tue, 20 Jul 2021 14:08:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p2sm20328363wmg.6.2021.07.20.14.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:08:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:08:01 +0200
Message-ID: <20210720210801.90649-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ubjson: bump to version
 0.16.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720210801.6vHwxPbWh8VD18oX3ApEoORmaq_w0xyBx-loWW-WrNI@z>

Update indentation in hash file (two spaces)

https://github.com/Iotic-Labs/py-ubjson/blob/v0.16.1/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ubjson/python-ubjson.hash | 6 +++---
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index a7e954ce5d..baf3ce7bdc 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/py-ubjson/json
-md5	26c07be8e4c9f2b0ee7c42a9aca118ed  py-ubjson-0.14.0.tar.gz
-sha256	f742c87bccc8653329d3f79b8b3f40d44d11d17cce7f6d7025a73c52ebf91c66  py-ubjson-0.14.0.tar.gz
+md5  0f9f2b4d68ae8e70c6f624b1cdaca161  py-ubjson-0.16.1.tar.gz
+sha256  b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482  py-ubjson-0.16.1.tar.gz
 # Locally computed sha256 checksums
-sha256	ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
+sha256  ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index 58bba2ac74..93ab9dc139 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.14.0
+PYTHON_UBJSON_VERSION = 0.16.1
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/10/31/0d8297c33d681aafa3fe900ca072a96d5acb97e79082fbb593e835376c93
+PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/1d/c7/28220d37e041fe1df03e857fe48f768dcd30cd151480bf6f00da8713214a
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

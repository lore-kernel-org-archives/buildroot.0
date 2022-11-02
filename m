Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F57C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CD060E64;
	Wed,  2 Nov 2022 19:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CD060E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mMq_iThkbeR; Wed,  2 Nov 2022 19:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D7460B74;
	Wed,  2 Nov 2022 19:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D7460B74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34E781BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1264168B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1264168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjxvRchlT6Ez for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4AF841682
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4AF841682
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:18:13 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id r81so7171597iod.2
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BS0p4JvlWON1HroyAz2yj7+kjpiK6Of1xffS2W3hujU=;
 b=jP+3tTOMEHcHBaJuhTqpi6aUKL1qdt7BVYnWUgTpHmpmy2OB3R1fTR1BZquUVZ8LnE
 jT0n8b9DdE+DJm5HRxaA5kJcktThFVmc3LDVokgjUiD8FdQUZtZe40MBhkOKwunHQzjI
 0MJTfqpWyxLoSOkGBckmUQb/upeUSO2PTEFJMLachnzxCrCr5N9mvrIAZ7SnJctjtcvt
 ZxLWXyYn+MsLi/86PXbYaWuCG3t3DVDjLNyofRupnocannT/VEMA++94uNb/hmFKcdaB
 Cgn7xFEvjl2GRHNEBJU9pk3YybIW30Hlr7++kFWHQQIgAQRJiItZP92cTtEurcKK2mN9
 F7jA==
X-Gm-Message-State: ACrzQf0ZLfDF0XZcxr99y2WOWkZ9PUNnEfvsZeLRoGj+XzDsxcTK7h/a
 w/71JDEseWK/PoRvr0utNV8+3Up6lcAivw==
X-Google-Smtp-Source: AMsMyM6Oj00c6Kx9UQdMpj5i7HhU6Wl85Ia5VObQ4louftJ+9lXcIZ2tPo4JZROl/j73vsW5ae0kRQ==
X-Received: by 2002:a02:94cf:0:b0:363:4a26:8cff with SMTP id
 x73-20020a0294cf000000b003634a268cffmr16993946jah.286.1667416692597; 
 Wed, 02 Nov 2022 12:18:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t20-20020a02b194000000b003738c0a80b4sm5127715jah.144.2022.11.02.12.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:18:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:18:10 -0600
Message-Id: <20221102191810.3545899-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BS0p4JvlWON1HroyAz2yj7+kjpiK6Of1xffS2W3hujU=;
 b=e+5qVktRYvEpm2aCLgQUAIFieo05QT+9QdZ1iV6cdsnmDdP5VKKboCtOfiBjldJyLx
 ofxN3/tgD5sWkJqLP3RtEcA52tAdFgkdY1q8Ctb0BresneANBBfVZhlZ6XKpP7ZwsBMb
 LEUf7vrIjaE5xFQyK2u2ah2PtrazmrMHl0l2hCy9Swa+yePgVJFI3TXH/ek4Sd/EdKb6
 f9fse/SNn67cWM8XDdLVdLDstS28wot1RJxnE8+9P9FAHEgEqpWwqi1y8MRT54ns6hne
 XAP2P7b7HTtG4Iet+Id+b0HhkfCYr3raZgJVUc24uGLCtnfiwAFtSLqttRuEvRJ8Whb5
 q3fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e+5qVktR
Subject: [Buildroot] [PATCH 1/1] package/python-cherrypy: bump to version
 18.8.0
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

License hash changed due to url update:
https://github.com/cherrypy/cherrypy/commit/07aec3c90326e537613e5a77584df201ac5fdb1a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cherrypy/python-cherrypy.hash | 9 +++++----
 package/python-cherrypy/python-cherrypy.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 2e7a92d6f3..cd8f8756d8 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/CherryPy/json, sha256 locally computed
-md5  e21fd0c5706504a8f26c46d808a14255  CherryPy-12.0.1.tar.gz
-sha256  6a3a90a43b1e05bd4634c60acfdcf34efe74f9f8746aca14dbe95a9b69db30ea  CherryPy-12.0.1.tar.gz
-sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE.md
+# md5, sha256 from https://pypi.org/pypi/cherrypy/json
+md5  033c58bf3da497f283b039911d1c882b  CherryPy-18.8.0.tar.gz
+sha256  9b48cfba8a2f16d5b6419cc657e6d51db005ba35c5e3824e4728bb03bbc7ef9b  CherryPy-18.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  45ade933c280ece37e3e01d3a91afeed9505746a456f72ad10b0897c49e65104  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 72b17bc876..9b6ad0e99a 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 12.0.1
+PYTHON_CHERRYPY_VERSION = 18.8.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/be/d8/a8ef56bfe1c39d466b8d55b496b64459cc43dec71361d88edf904901637f
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/60/ea/6c4d16b0cd1f4f64a478bac8a37d75a585e854afb5693ce80a9711efdc4a
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

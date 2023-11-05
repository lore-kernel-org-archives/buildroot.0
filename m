Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE5DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EF660DFD;
	Sun,  5 Nov 2023 02:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EF660DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSlxIwcG8tpc; Sun,  5 Nov 2023 02:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55AB860DF9;
	Sun,  5 Nov 2023 02:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55AB860DF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 542791BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BC394042D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC394042D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klwEQfmdjQ6r for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:11:19 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB5C540105
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB5C540105
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a94de8c70cso106404139f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699150277; x=1699755077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5h/cTxUyec02g0uQxNy9OdXUDLfvavRR7XJSWEdnKH8=;
 b=Sgh4Cc1/Q0jCsVDL8JrssBTlSRAtGNNzRSRcT0Aie30T8HRMM+i/Xp7lzkyzQVs+Cb
 RNyvewZVvZqgFCyyrlKbK6KicrhczAbU/0IeucFGj8Q+y+LwrszZB4HmuLwRoVKAKn7A
 jrHx9hm/g8gHSTYBqCqFnWRug8caGzN1l+Vy6vwE+7l9B9NcSWP2Vom6eXdumIkdDWKW
 +ps0Gzf19Qg5FGujNefgQz2xXqg9XJ2+CASUf3+7OIjvVQEbZNavolqyD/V8pnVjQ41U
 Q/pQh6rgfA4k6IsQEA4veZZaD4ONvpMyLp6UMvMcWeEofU9xlY4Nz2hldpHAmF3wA3jD
 vgwg==
X-Gm-Message-State: AOJu0YwR+C0nI5VaDPV0NuIm2Hjp2wsjZkam0NNhma2K/EPksNeKj+zE
 cblLgoGQhP8IlPPrdkcB1DMmEjl6R8U=
X-Google-Smtp-Source: AGHT+IG6P2fSzn8W/BE2bEsC9eWsAXkNQ9c4pueFzh8AN7AHMQEZSWcVU2VrRWj9XZRj78CSTqoyzw==
X-Received: by 2002:a05:6602:2e8f:b0:7a9:b1ad:8c6e with SMTP id
 m15-20020a0566022e8f00b007a9b1ad8c6emr33017982iow.4.1699150277439; 
 Sat, 04 Nov 2023 19:11:17 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 t4-20020a028784000000b0042bb296863asm1336509jai.56.2023.11.04.19.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:11:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:11:15 -0600
Message-Id: <20231105021115.2740085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699150277; x=1699755077; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5h/cTxUyec02g0uQxNy9OdXUDLfvavRR7XJSWEdnKH8=;
 b=RGxYiYQ+km+F5798g5D78GTbPwFcNMhbA2mWwcrU7X0cWZ+7CxjuHcQuNVIl/p8zP9
 Bzk/vtdMqds5sFjkKJUL12/GQNg0ywT0d2H+UrrQ++g16/el4noAJGTnw5kKjtBG/okl
 JsChE79Q1yyFQV/TNF3Uizf7LqDxQIHEjdVP1vV9EfxAotc7gbYE5sPH+LS4xWSzWM4n
 /qKGXVsRt8Db4Jaml4yPoxySJqJ2QX8f/b8cGZn9w+e99u2WmLDRtaImgkfr+W8ycIIO
 q2KKK5UPBYctjXXhsPW1ZYRKO0cdvAr+0iQaBapRvaEAsgLlbsLFUBTy4+nvgORbvvH0
 EoAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RGxYiYQ+
Subject: [Buildroot] [PATCH 1/1] package/python-bluezero: bump to version
 0.8.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index 6bedf62b27..e9ccb9133e 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  efa07525f1bf6db9af66eb7d9775cdb0  bluezero-0.7.1.tar.gz
-sha256  f146feb65ee9f6fd9f3638ff0a44df9fd6efb48cf66a39ce51a62a7d38ab5206  bluezero-0.7.1.tar.gz
+md5  5c256c89c3973cfd20f340f095525af2  bluezero-0.8.0.tar.gz
+sha256  9bd6706ff6b941c3bedd5b64e0447051120ae8eeac458fb65f56cc6730e1e598  bluezero-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 34efb6155c..8e078f1073 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.7.1
+PYTHON_BLUEZERO_VERSION = 0.8.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/9a/66/d4a92869ed2afd9483a65aff200b2ba0ca4365429bc9a836c5803ab876a5
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/67/e1/15fc417b9828d38aa8e09ba06df61d6889740fe45867510a781df9a8ba35
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

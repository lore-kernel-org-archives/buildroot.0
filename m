Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB2DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45B140942;
	Wed, 27 Jul 2022 06:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45B140942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NzCon81V1Oz; Wed, 27 Jul 2022 06:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB7E40977;
	Wed, 27 Jul 2022 06:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB7E40977
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA5351BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5840400FC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5840400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWDroqcaE8CX for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:46:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01EB6403AC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01EB6403AC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:46:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso617687wma.2
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 23:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcYU4Nls8EvUN2iGlqzldoM6l3ABsbXoDxYkzxtdW0s=;
 b=EnmALJ9Tw0phnmCRO7quyEFQd+PwJ/CcsWKuz9jR8PcsIV+65/iFJbsS6TTlCOvEBv
 /lY4FLvSvZ8bG5k1E1LnhTPjSLyLKr4gfo0SSx0BKC/bbVu5ALJj3UT49zungddTDhs/
 6D5mv7tyZPQleX7HZnnalpwAIMZYwF6b5t8dsjU7JyoSFW/Fm4E3QLSVX/ql0fNoS7Z0
 escDvV5nM06eUI/leAu74M/KtDL/qI22D8mXLL8lK7ugI5BpzepOt1/ao/RDAe5TQfPC
 CigiG+t3nBkdJZbGtjWm5EczNWFz2fa/fbprKWMVoSdxWDk0NMq7UyehJ18z9JwREwsH
 Bvfg==
X-Gm-Message-State: AJIora/E822kQGtmqXr8KeHkO0ej4HGJRKwr7ulGSNXHBNTEP5sZM0EH
 Qjpm8qAgLHbEWIIBhblsef9kK8hvrjk=
X-Google-Smtp-Source: AGRyM1u6a0zq1kzhhzLyyZ5TIREeqIksEqt9lSzpo0Lr5dkt7OJ3ouxPQI2HWWk2noqDPqhG5xM84w==
X-Received: by 2002:a05:600c:4e94:b0:3a3:455b:a277 with SMTP id
 f20-20020a05600c4e9400b003a3455ba277mr1799658wmq.198.1658904364806; 
 Tue, 26 Jul 2022 23:46:04 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff502000000b0021ece43e1besm772931wro.114.2022.07.26.23.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:46:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 08:46:01 +0200
Message-Id: <20220727064601.248159-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcYU4Nls8EvUN2iGlqzldoM6l3ABsbXoDxYkzxtdW0s=;
 b=kCfo3W7g7nv/8SmBQE7/Q8qds3OgHinlEN8/S6Gx3uDnCULBom5VuE4AMgf7vPczom
 lElHQ4Wtae84cOVUwGJtaBxRshL7nWlmRtf3aoE3v0Hz/c2k15O+fCE/oaJRls+46OPJ
 TLAXqhBngvDNYEFrYiZFHTDuwlOOFekT6WksAZ5dMmT3gQFw7MLKJT0gcvw27GAYZ3Ql
 afCIIG10y00je2mRq3lGiqKuXAYljp52bdh/UYIedXBeKd+Y0ZTk1j3c/ctzsaZzJqys
 702dW28uvqmSlsZi9owd+l/xM2i5czbNFMAZOlQnxiz7UVjIOrXcVrj+Kqtw8j9Q2Dvi
 kVIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kCfo3W7g
Subject: [Buildroot] [PATCH 1/1] package/gensio: add openipmi support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 266ac137a2..b27158c61f 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -11,10 +11,16 @@ GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
 GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
 GENSIO_CONF_OPTS = \
-	--without-openipmi \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_OPENIPMI),y)
+GENSIO_DEPENDENCIES += openipmi
+GENSIO_CONF_OPTS += --with-openipmi
+else
+GENSIO_CONF_OPTS += --without-openipmi
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GENSIO_DEPENDENCIES += host-pkgconf openssl
 GENSIO_CONF_OPTS += --with-openssl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

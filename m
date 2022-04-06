Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB84C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 17:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613B083E81;
	Wed,  6 Apr 2022 17:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4D0jKhPyPHlb; Wed,  6 Apr 2022 17:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E52483E76;
	Wed,  6 Apr 2022 17:27:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCCFC1BF4D7
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 17:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA6940635
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 17:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hP15wswK4iH for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 17:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C21FC40141
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 17:27:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso2102422wme.2
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wr1ZW86NeFCKMWd9p8jHsR5AqXzm99GlvUjQp/n3+Lk=;
 b=Xr1zAdq4GQGMHOM6nZeK6q8WqW2nKYifzXQxTuWeLjqHs39R24hLmmGIGmQy7vrvPx
 diVeglryUGMguDX9lbx9M07iUrhLMq5KRto6HJaDBagL0wYE9b9vjhvaVgeeO3+dPLPV
 L8il6/aX7/Dd4T2tVMMjidY+5xjoP3VrV8OP8IGVEpKUkZefT+HEmqxbyLIzJNxiAKAD
 0AxEj4oOI1Tty00a8vLNCQBdWq4pVoeJjQYJ8tl3dUi9wv50B/KHUOCNIY4ddMZPpui7
 dQCHuyqwhU9+8YUgeH4+v/rfW06+CZibCtddq75BIPyHTmVh3jWfHUDUXfxPJl41LYNE
 AI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wr1ZW86NeFCKMWd9p8jHsR5AqXzm99GlvUjQp/n3+Lk=;
 b=qSan94YWs72JZear1zx2VoUZYTJzuEiRr5jJ/pgQ09nhyyTvh87XBUKKGHlNQuroTe
 RNofBGQLw/LuIwKDSbrSBhEdXd0Bm0pjIX2Yf6AX0VDBBWoiJelalSFR+WaA+y4mw7Ko
 1aK+cDzSou5eAqv+QpA4N7C4X22cedNDIAhb/0aWWgkNvagEIhMNb5tR3reNjVNw/AQC
 KAPLj3BVocof3N8F9BFkxltDrXQX3iHOH3oe26YXAiLAqaVlhlG1Sk3bAT8XeblY5SWG
 7a3/PNo/7VSTMq1HLxDIvHn3sR7vlbY1ZbzbmzrNK7axN1y/h25IM6yUWb50fYNqZ0ln
 KJvA==
X-Gm-Message-State: AOAM531F73jP9VzjBftlM69XCKEsku1wE5rT+ioYdLbTfehH83h9jmuG
 GCagk9npJ2i95+9npBE36bdZb+l1nlw=
X-Google-Smtp-Source: ABdhPJx0qZyJiihKga6mpRCzKjdS+ugFdIWBPqCigTrgLB1cBSmlzk0MJt6Da/IfHKRIz9pSq4nuyg==
X-Received: by 2002:a05:600c:1d8e:b0:389:d079:cc0 with SMTP id
 p14-20020a05600c1d8e00b00389d0790cc0mr8521352wms.98.1649266048683; 
 Wed, 06 Apr 2022 10:27:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b002057ad822d4sm15690789wri.48.2022.04.06.10.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 10:27:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 19:25:37 +0200
Message-Id: <20220406172537.4008580-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stunnel: doesn't build with libressl
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl:

In file included from tls.c:39:
prototypes.h:774:8: error: unknown type name 'CRYPTO_RWLOCK'
  774 | extern CRYPTO_RWLOCK *stunnel_locks[STUNNEL_LOCKS];
      |        ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c48ba8e71dc917b2e11051088dd252be81b3609f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stunnel/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index 087fecd930..a46e2f0316 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

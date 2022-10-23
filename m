Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EC7ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 17:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2343813DB;
	Sun, 23 Oct 2022 17:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2343813DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiw6YOLQpycZ; Sun, 23 Oct 2022 17:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCF7812F7;
	Sun, 23 Oct 2022 17:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DCF7812F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 217391BF470
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A2D581391
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A2D581391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0wsxp10U6_T for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 17:04:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E142180AF2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E142180AF2
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 17:04:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bk15so12197647wrb.13
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 10:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZikA2xdW0u0r3NPkJPUCuVgYjUFnCA4uQZEc0SnBc/s=;
 b=x3kd+y3TH2Dk5QYACcAVhxGDXNNyppNbNxjlNzbDvNAewJawI7UeS7qOb9a25Upgi7
 U7+QphIuWbJFA7WhThJivlasSCRoahpfBbAjuQ/UDaPbEodeXOdBFajkwN25T8qo9WM2
 2oZQqf3bFnezUO9Cm3+I6JoV6Xnk00IUNBpbji6hKtkVM0IzqBUxZT1dM/JPxLPBK/mh
 j4enHAJkFiO+a5MCjy9hTA5/iPeUhsFLlZiV0Sv3Y/5YlboO7NcJ13uWEG6ry37PyvFV
 coVri16cPCRRqfdisW0q89TqAogN/flSJCI9PSn2AyIsIL0pYAlNyfQSo/oy1JHKFx8U
 qSNg==
X-Gm-Message-State: ACrzQf3c3xM2xh/g8Gih3X6s6jzz2s3EF1Fk2Bon//fDpGREK5KrwPOQ
 M7RRfSwGIGVuyRRODoK5QAlazS26FE4=
X-Google-Smtp-Source: AMsMyM6qUCLTTgftom2D/IWiNg5ENb23zpWSWwgcQUEjTnpN2y9/yZcy4PKg6ELxcgAWa+a4IpRhHg==
X-Received: by 2002:adf:f491:0:b0:235:894e:8d6c with SMTP id
 l17-20020adff491000000b00235894e8d6cmr12420682wro.209.1666544683769; 
 Sun, 23 Oct 2022 10:04:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d1-20020adff2c1000000b0022ac1be009esm24799099wrp.16.2022.10.23.10.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 10:04:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 19:04:41 +0200
Message-Id: <20221023170441.30650-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZikA2xdW0u0r3NPkJPUCuVgYjUFnCA4uQZEc0SnBc/s=;
 b=Ypmlhp1nNV4prS4k+khUV4Dm+7TA/39Z236UIEbSKOVijHUZ5Ep/GZhyZXkZjntlzD
 yV2oy9jDxy6gDa/7c0wtLg2Xqo87ZUVQ64sJE9umV63McrFtLZunLg3lVMqTqdr9Nbs+
 zFkFCJmtanJM9zVIOcDddPU6UMPmIqKPbZcX5hRbiJHthzPdFhmfHklQj7NtbrRwY2eV
 AcTqVAK2JWxXfuAabFHQlhXFCJMv2i/u0WJIuQVAFm3uCQ2LLbJ+qaCoopLjAqf4c9Mp
 4C/KnpYAwdV8TAYS3ccuOlNYIvPNqpqcfJ45nQiqZobs70A+4TrLjV3QAe0ZEYLkgOdG
 Xe3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ypmlhp1n
Subject: [Buildroot] [PATCH 1/1] package/libssh: bump to version 0.10.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 4dbab11374..90bc4c82d8 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.9/libssh-0.9.6.tar.xz.asc
+# https://www.libssh.org/files/0.10/libssh-0.10.4.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  86bcf885bd9b80466fe0e05453c58b877df61afa8ba947a58c356d7f0fab829b  libssh-0.9.6.tar.xz
+sha256  07392c54ab61476288d1c1f0a7c557b50211797ad00c34c3af2bbc4dbc4bd97d  libssh-0.10.4.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 4cadf83aee..5deb64b82e 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
+LIBSSH_VERSION_MAJOR = 0.10
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

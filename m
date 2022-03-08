Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2B7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 21:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F125A409FD;
	Tue,  8 Mar 2022 21:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id el8RD-EJ8oxl; Tue,  8 Mar 2022 21:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1B9840108;
	Tue,  8 Mar 2022 21:13:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 968C01BF30B
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 21:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8683040192
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 21:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukTnQXAUhT3n for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 21:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 723014013D
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 21:13:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k24so54367wrd.7
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaZdpEfj83bnOGMcRLtsOvL51OCWlBvKAdlAwo3SA6I=;
 b=KTO+T0dX4+Kc75LtZIr/PrMoU6vbaNEP78lCMX+JLn+MEHQB1V1/8ImIa6zNaRNjrl
 MhE3C6xja6VLYNUn2SnnwfRu1uZxq1IoHP3yZtrshpIWEuEu+sPp+bMbLvRqoplp4aqy
 /jlidTJcsip0CSQb24mh2EDUYYsWVD2/9kfgJmBtOJqPq+5e3FXA5oChr+hYiAffzsy6
 imUvHiKGRHkOJP+Z6aYyRL84plA+5K1YEmHbxwDWqype7wA+lw5y+qrdxv1b5Iv53xYK
 1M/OmMDkimIt4l1i6V0HjgenmF0hWX/R3DxmpXG9ucspHJNSzFTetURz82M9fmSRwuQG
 ++oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaZdpEfj83bnOGMcRLtsOvL51OCWlBvKAdlAwo3SA6I=;
 b=gPhaNffwBl6Cdmx/uwGuJXGfKdk/2hDCk8g5zEpK8Zge9uHSHDTZKBll1qvYLIb4GS
 pLiL412zpKUT0ck+RdCHkQvGMvUZcLdzunMz0QtQhd6R+GWIsgx4lwp8sGYv7MuEDAUt
 iMD4/j1z3ZwN+qoi8pmM07+L7yv+IT/c5LoRqMP2xlmUlQNehBpCsoTekQ8QhTfMdtcC
 73M7UPIQCKWIQy0zd278qEv9lcNeo6/1Mg+5dciafxpDdWnhnj7HUF/1dniD2lD1fGwn
 lnFtEV3+54F9S/VVKzMF8VZO+TmuSUGesxZmQNpwFmhssm2xDP60iFSTdlIHyUkWXn23
 zq8Q==
X-Gm-Message-State: AOAM532bt5Shie7/ijl9Rcc9e1ed5eklWA8IVGas8ziMrZT3YFXyP4xY
 JtbVxOyDI0EJBtlI/Xc/aqujW5iqPwE=
X-Google-Smtp-Source: ABdhPJz8v54ochS5zXkC0gylp5KZvRpe/mt6reS8Iuj4MsIwBN+tnVIRDWil3yquM6AHb+9QthBr6A==
X-Received: by 2002:a5d:6d41:0:b0:1ef:f32c:18ee with SMTP id
 k1-20020a5d6d41000000b001eff32c18eemr13595765wri.532.1646774005270; 
 Tue, 08 Mar 2022 13:13:25 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037c0342cb62sm4016617wmq.4.2022.03.08.13.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 13:13:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 22:12:05 +0100
Message-Id: <20220308211205.3682-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boinc: disable fcgi
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libfcgi raises the following build failure with glibc 2.34 and gcc
11.2.0:

In file included from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:488,
                 from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdio.h:27,
                 from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/fcgi_stdio.h:18,
                 from boinc_fcgi.h:19,
                 from coproc.cpp:22:
/home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/wchar.h:582:24: error: 'malloc' attribute argument 1 is ambiguous
  582 |   __attribute_malloc__ __attr_dealloc_fclose;
      |                        ^~~~~~~~~~~~~~~~~~~~~

RawTherapee has the same kind of issue:
 - https://github.com/Beep6581/RawTherapee/issues/6324
 - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101747

Fixes:
 - http://autobuild.buildroot.org/results/232dae62570ed7927a10864d83dccaf9b6214500

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 7f78c427ea..0d992f136c 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -26,6 +26,7 @@ BOINC_CONF_ENV = \
 BOINC_CONF_OPTS = \
 	--disable-apps \
 	--disable-boinczip \
+	--disable-fcgi \
 	--disable-manager \
 	--disable-server \
 	--enable-client \
@@ -38,13 +39,6 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 BOINC_DEPENDENCIES += freetype
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFCGI),y)
-BOINC_DEPENDENCIES += libfcgi
-BOINC_CONF_OPTS += --enable-fcgi
-else
-BOINC_CONF_OPTS += --disable-fcgi
-endif
-
 BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 # Remove boinc-client because it is incompatible with buildroot
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

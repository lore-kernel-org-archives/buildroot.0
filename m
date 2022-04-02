Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB4AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 13:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93F1417AD;
	Sat,  2 Apr 2022 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7GjoZr3hJJ5; Sat,  2 Apr 2022 13:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7076417AF;
	Sat,  2 Apr 2022 13:01:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEC01BF418
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EAE660BDF
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhS8Ep-qbU2s for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 13:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2FD60AF6
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 13:01:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d29so1748564wra.10
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNvkjgYTjX3Rkl7bMInahAfpajIRvc4uy695hd0ePDY=;
 b=P9PTbYGGZS3uwumQmB4PiPCGWbWvyhRN1MLvl/wE1FGWFFh1Q8aXgStDZWpCTrnnnX
 Jxpp24c3fpm0V6CqhfuQF7eaZZyswVlhlJNk1GfBeA1b4Sm4mnGNerHJDybZI3tb4DUR
 8HG9oMz26yZw+1aHZoyKG5ObOySHqbJG+RR/vLOxVhM3/bSYRiqXuPasGKzp+EY++S7k
 rhGEaqErWuZZ3Em/paPnmQeJ2a1Corlukjc4cBhPU1XhGRN4q1DyVciF60tzbHXXWCu/
 HkmKxYKOuD3niGyn206u8Lk+cnJEirSTRCcszRwx5mmIdg1xkYJnfV+KQipioEgT8M9l
 T4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNvkjgYTjX3Rkl7bMInahAfpajIRvc4uy695hd0ePDY=;
 b=jDULNyfnp19Nrjx+jFM374p/z22r8iHr8Hb/StxFKTfR2sWbtP+a0AHbG6Ww6x4Tse
 7qEpexof3jWEbbou0i7QvUyrBEzc0w+JZu/Mbf7mZY0S616huVoz10J5pFM32e+V3tuG
 i6LHDgKed9hE3hXCBtdm7HT5hNueDLDhJpUfMVwnY5oAt7T7hCLCewR8QhctKIf0XcFW
 Bf7sr8QyATD5q6Ggj7SUFNCxLDpIosrPYQcBxbQIZlwgq36UjWCF26HqEgvrh3Vu9fpb
 trOEryY8CCyAzZ39pceJaHY8bK+CeB9Lhnt+pT0AR6II7oKDnoJ984WLSb5PpMPwoHpk
 I45g==
X-Gm-Message-State: AOAM532NQVUOLJuwI1TCYCosu5tltShEaZ8fBjAUHl/MaeBm6SDkFAdg
 mnkmfGmsNJuOV+fOIvx8IpxrHRmD6Zo=
X-Google-Smtp-Source: ABdhPJzsUPKo8r+GDYfJuIInDQfy/ccXc2wHGq0eJ6z4P57bu2NjHC85vtC+UJrcFd0BNGCvGt78RA==
X-Received: by 2002:adf:d08a:0:b0:203:d9c0:d9ed with SMTP id
 y10-20020adfd08a000000b00203d9c0d9edmr11224842wrh.586.1648904493295; 
 Sat, 02 Apr 2022 06:01:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a5d628c000000b00203e2fbb2absm4634049wru.113.2022.04.02.06.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 06:01:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 14:59:58 +0200
Message-Id: <20220402125958.453448-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libkrb5: fix BR2_SHARED_STATIC_LIBS
 build
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with BR2_SHARED_STATIC_LIBS raised since
the addition of the package in commit
7ae94b51ed5d51fb9fa3f5a931bb8435bcbfaa42 and
https://github.com/krb5/krb5/commit/bd13166a4098198832d921b8e50b97008b714b7b

configure: error: --enable-static must be specified with --disable-shared

Fixes:
 - http://autobuild.buildroot.org/results/dadbf9f77ffdcc4d4e48c6d7e6beb5da303a8074

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d14c464b39..0553e9bdb4 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -37,6 +37,11 @@ LIBKRB5_CONF_OPTS = \
 	--without-tcl \
 	--disable-rpath
 
+# Enabling static and shared at the same time is not supported
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBKRB5_CONF_OPTS = --disable-static
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 LIBKRB5_CONF_OPTS += --with-ldap
 LIBKRB5_DEPENDENCIES += openldap
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

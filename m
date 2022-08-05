Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BABC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 14:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 587E360FB8;
	Fri,  5 Aug 2022 14:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 587E360FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73VjAv89KVlM; Fri,  5 Aug 2022 14:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 715C460B93;
	Fri,  5 Aug 2022 14:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 715C460B93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 329F31BF868
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A63183E90
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A63183E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCHreW_y3lgL for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 14:36:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DFF483E85
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DFF483E85
 for <buildroot@busybox.net>; Fri,  5 Aug 2022 14:36:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j1so3513014wrw.1
 for <buildroot@busybox.net>; Fri, 05 Aug 2022 07:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zEWUOvLwSeO6U1OBJlFr/FN6yQySsKjEemGsbJDjPzo=;
 b=zZ/ePmWrkeTtN+SL9pJX4eg5ZeQ5Q8z08ujy0SO5M8UWhrm07RQTqXxdmFJ9nA3/aH
 1zSKvcUsRK+74Jpz1oy5ZoH0mDsyinDzGZTMUwIkj1NdlSy9qzqX+V2+dWHZAcXNOa89
 8K8VFnG3ydmTOu6OYbpoN1BbIduaUyEfb6YL8UA0df6WOi2MpI/1j8t7YiYsvZvCNXM0
 B9ujXO04NyHtY2fLMMJrlTi4snmVBr8s11zC13rjp+X80iZMZQAsopYN9dZHQVsF2d9r
 mQAUNqJHtUPyKg7+hG/3/ieR0m0XCVq6uKm5wWsRZB5jlmluUftMrGQcC/Ep2NCNzpWi
 ok5A==
X-Gm-Message-State: ACgBeo1KikdHpluEau80B6xCLs1J0jLoyWmqFOjAP+zJDeXqsfSDEJPd
 VllKOrG0ivrtcPLsFguy8gzY0ingKjg=
X-Google-Smtp-Source: AA6agR4XgRWhvL+yh6ikZobPp2hnO9fO8R9COgbPlAW9I6gELGDUg65y9Wrm4Nfbnih7Lz7NbfktzQ==
X-Received: by 2002:a5d:6252:0:b0:21e:4457:1bca with SMTP id
 m18-20020a5d6252000000b0021e44571bcamr4487804wrv.287.1659710210116; 
 Fri, 05 Aug 2022 07:36:50 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a05600010c300b002206261cb6esm4082031wrx.66.2022.08.05.07.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 07:36:49 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Fri,  5 Aug 2022 16:36:24 +0200
Message-Id: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zEWUOvLwSeO6U1OBJlFr/FN6yQySsKjEemGsbJDjPzo=;
 b=mr3Nz2vz/201PQ19LX8x7G56V79pv/OwJB7kn5QZpMKL72O3YV4gRUauxewI65KU5J
 z2JLdos53NifewCIvBxk7YavkHwysAR07xTz6mNqL27VzCya3antWN0xdpaVvJekzu7z
 /BL1rMUEqTjcm9xliEV2M5gz6dYZ53FP1rPNoD9YOHTi4BhER1TJgabb/XVDqMMko5Oe
 mGFuN7QoINk0bVtXpyTEEyMkhjpzU0NzMkEz52YqVKP5RKruP9l1zcipA+QsvExnIR4m
 lT/39G5kvcFtxtQX8cipyevD1PNg6A6oPfOmXEYrvsceGnJn/8SIGzUCWmfphkhG387l
 YaOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mr3Nz2vz
Subject: [Buildroot] [RFC v3 1/2] package/pkg-meson.mk: support fortran
 cross-compilation
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-scipy is moving to a meson build infrastructure,
and requires fortran cross-compilation

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/pkg-meson.mk                   | 2 ++
 support/misc/cross-compilation.conf.in | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 156b005fdd..32d41170f3 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -76,10 +76,12 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
         -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
+        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
         -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
+        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 235e5a8495..7053df472b 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -9,6 +9,7 @@ cpp = '@TARGET_CXX@'
 ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
+fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
@@ -18,6 +19,8 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+fortran_args = [@TARGET_FCFLAGS@]
+fortran_link_args = [@TARGET_LDFLAGS@]
 wrap_mode = 'nodownload'
 cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

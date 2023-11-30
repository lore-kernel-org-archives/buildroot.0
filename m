Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DAEC10DC2
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 19:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82014401C0;
	Thu, 30 Nov 2023 19:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82014401C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XF7t9koZ7USK; Thu, 30 Nov 2023 19:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB18F4192A;
	Thu, 30 Nov 2023 19:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB18F4192A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3744F1BF31B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 19:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F1266F75E
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 19:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F1266F75E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ji8c866pnI9Z for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 19:13:18 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D013D6F563
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 19:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D013D6F563
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b595bf5d2so8842885e9.2
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 11:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701371595; x=1701976395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ivdw5vVf04lXT4iZLCERQxJGFWkOyYMmSV8Ur1F/ZVE=;
 b=l0kyQMZdll7nFOjGA2NGiEqDMr0siJ/kp8ec+skv+5KNdqRuHmpLMRu9JBkqs2zbAt
 80OpnZDOeoUWXvxZheWJXoqCWPCo3yzpPxo5m3Vu8EN0LcCZEMJBCEew3VIUSfhf0JnR
 4OZZO4jZxaNofFPpl8PzsjnBGsNSD4Ema9pmXwspgcP4S6DeTYjpCx6iwLWC9wvVC7XM
 7kaz/hrcOtU9QXQErKn1Hc81DjfHA5XyKMfXuCzmwBmkk73PZfjUuDIDwDDPOLwQ7zcs
 FAxQZhaRJ4dYKzpMmmoOWI56DUfeh89nSH8JyHrRoGX4Re3V06Z08BEBp/qZ9jEJTwR2
 3zSA==
X-Gm-Message-State: AOJu0YyDVOYQ5AkSYE7mWyXf5gRon8fhZ7wxlwZWHX6QGsSuQWXjmC9k
 IvhfGMqJB5zoTwGz0OTrbAZTanCT8n0=
X-Google-Smtp-Source: AGHT+IEZFh08d8+F387tasiSV6A2VuxuC5gKlJBVoIcOVf+a+WxGfRQjXTIiQKo+wpU77s3cLp9Otg==
X-Received: by 2002:a05:600c:1989:b0:40b:5e59:99ee with SMTP id
 t9-20020a05600c198900b0040b5e5999eemr5934wmq.270.1701371594879; 
 Thu, 30 Nov 2023 11:13:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b003332037854csm2248028wrt.80.2023.11.30.11.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 11:13:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 20:13:05 +0100
Message-ID: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701371595; x=1701976395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ivdw5vVf04lXT4iZLCERQxJGFWkOyYMmSV8Ur1F/ZVE=;
 b=J16tlx7UTcRe6hIBhjeNobfXap3IT54wWSVALi4KxjU+SJWchziZu0obBsEw4jAfhb
 oh44KyMsDBQpDUl+5XWnZDeoU7cwUj+frSRHI8iuBe6l5QN9Mj9svAclJ0T3Hpcn8sTY
 EEtCv4v97zyAB4TO9M/TP8G9EprVbWa4aMiZhLJFnIfHcJmvkzftCXr9LDckzn7MoVh3
 O4G6lnopl8AlEGeQC3nqWQ/L4/auM5rL4mZYvTFtZgznzlIho71E2QzupThtOhQgXD6+
 RXMbfyCU+ZmJm76h9ml/MxTBIPG+opCxVOMeSodg6+Z5hPnnVCdqYyjmtspKAY0UysA+
 I5bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J16tlx7U
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/stdint.h:26,
                 from /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/include/stdint.h:9,
                 from ../include/selinux/avc.h:9,
                 from avc.c:10:
/home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

This LFS workaround for glibc < 2.23 was added in 2016 by commit
ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
anymore as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23

Fixes:
 - http://autobuild.buildroot.org/results/d85c81f87adf3a5945fa369bcec233e6def2ed12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libselinux/libselinux.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b8de21edaa..529745f82e 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -52,14 +52,6 @@ define LIBSELINUX_BUILD_PYTHON_BINDINGS
 endef
 endif # python3
 
-# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22. We
-# set CFLAGS, CPPFLAGS and LDFLAGS here because we want to win over the
-# CFLAGS/CPPFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_DISTUTILS_ENV)
-# when the python binding is enabled.
-LIBSELINUX_MAKE_OPTS += \
-	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
-
 define LIBSELINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(LIBSELINUX_MAKE_OPTS) all
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

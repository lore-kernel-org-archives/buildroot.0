Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BBCCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0478F414C6;
	Sun, 15 Oct 2023 20:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0478F414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7rgn6FeuMe4; Sun, 15 Oct 2023 20:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CFAC40B22;
	Sun, 15 Oct 2023 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CFAC40B22
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25CD21BF28F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F054240B22
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F054240B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVtybsluemZA for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:12:09 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AF2E402D0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AF2E402D0
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40537481094so39183585e9.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400727; x=1698005527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/F8JeARoO+IzCvzN1CzGsS7Jsir9wGYnTUJJ7DpR30s=;
 b=P4wH1XQxIItFjBMhNNyI+HxuwA8uDN7U7/Buz5PRZOXJD2MV7XSju8SIfxbSPqkCi7
 LDDPYusqHvGEUde/Joz6t9NOcaRfbDptvzaiB9/oYmLp/fLaEQEoYA4G6+oV0/YGVcff
 RgGkPUJDMAUjoC6uKWjZZNg//2K/g8PCZiYaGxV18VIS2hMg4x+e30Qm22Ir2mVB+hei
 2Ewh7JuXNdPEKsaPd/TIWnz5tCKhr5dWHOE1pWNQHR0gHM2RDB6NONDc6k1qf/PebEN6
 KNUtUe9nn0xNq0iFUi4vcbSPmp3oQI7xv/1/+Y0yrV5sZ0Va12K3qVzoYri15himCCE+
 dvVg==
X-Gm-Message-State: AOJu0YyIECy38y93/CukABRknw+Hbjl8AGCjHtNSI3TesTTFcTEDEOg6
 KQxzUaU9iJh2zuEO1uz0PU33WFMTrYI=
X-Google-Smtp-Source: AGHT+IFSuIf4b9yW2LFwk6K4ePaAlbsjY/jMx1ITGRhnPzJ0jzmPEmxht7c4T/Qy1nvkHRj8KNhp1A==
X-Received: by 2002:a7b:cd0a:0:b0:405:3dbc:8821 with SMTP id
 f10-20020a7bcd0a000000b004053dbc8821mr26930215wmj.22.1697400727194; 
 Sun, 15 Oct 2023 13:12:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600c450300b004060f0a0fdbsm5416588wmo.41.2023.10.15.13.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 13:12:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:12:04 +0200
Message-ID: <20231015201204.1277675-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697400727; x=1698005527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/F8JeARoO+IzCvzN1CzGsS7Jsir9wGYnTUJJ7DpR30s=;
 b=kOllpJtG+yCLtbQ/VK+dEFDOiXst8ABA7Mjie1SN1HPudMA1WpD2MY2nJztnXlpqwK
 x/WgTRgIaunKvTjZBnyW9Eg2NsBnPG8gGs1tX0ACA1R7OKiqM6bB0tN/zN9GX5haDP/C
 dxfKy7NvFx2Oab+PkG6m+VRfE/7+4xvnVMpAmPLV4Rgjc3ob8nLHqx/LNjbNeco6d/JQ
 D5FP41mDkf5gIqdDXAyf8RBoju/Xj1XTTX45tSj4uEQ43TJ5R3/a2pup0sKZR8ChAMrX
 9KihY5M6sAWDTD/vHTIiYEpUWCHvt3xbjUMoeptE1mNLZuRGqRawizSVK6XLqNcCpwb1
 A3rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kOllpJtG
Subject: [Buildroot] [PATCH 1/1] package/libgeos: drop DISABLE_GEOS_INLINE
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DISABLE_GEOS_INLINE has ben dropped since version 3.11.0 and
https://github.com/libgeos/geos/commit/1516e42eeae3b3114585f1e94a0e723d835f7757

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeos/libgeos.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index e0931dbb30..70f8ca3495 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -19,10 +19,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 LIBGEOS_CXXFLAGS += -O0
 endif
 
-ifeq ($(BR2_arm)$(BR2_armeb),y)
-LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
-endif
-
 ifeq ($(BR2_or1k),y)
 LIBGEOS_CXXFLAGS += -mcmodel=large
 endif
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

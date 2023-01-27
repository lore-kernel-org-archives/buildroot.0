Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF8C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31CD41D62;
	Fri, 27 Jan 2023 14:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B31CD41D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMg3jiMTVA4i; Fri, 27 Jan 2023 14:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4019041D59;
	Fri, 27 Jan 2023 14:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4019041D59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD2281BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F6CD41D59
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F6CD41D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbmQJbbtCX4n for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0C3741D2D
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0C3741D2D
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:01 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 203so1936141iou.13
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=Q3DVwV1kZP4dejnqIZlblt118yk/a/256aZSR+X1lTznO3mbJanFLr9auisq4JNdKK
 N1J1CDuSGgyX7AgolQdJzfYV2Ox7OnLbk69TqtJvWJQPniWJzYDyISPnWTpyJs3HBDDW
 Xk5TWIlqNtQt08AC2WZkGFP2Hgeqv/H5jgT1jlUBP46wKfjxQJogme2Skir3VbTXj8p8
 TYVJjSdYXcJZrbXILKDwNYv2KJgJg8iTEnGtvozxcfzm6W9QN/PLQgB3ENA3YBqdulUq
 JNEx7OSUNhh8BnPYcSFxJChfOvgSyXMPSP3CXUcQKsRt8wXwB+wjAyPPWrgQedsUBdLU
 ZbHg==
X-Gm-Message-State: AFqh2kop3rqo7cmP9LZhoUWYHgoqoRG5l1ZBTG3gfhcyJxFMp89Br80C
 bg32m6Xf91iZ1yqQ00yadB/Z7gbc8FQgJA==
X-Google-Smtp-Source: AMrXdXuX91hX3kVXYlLkxulLnco7FlisnQpUY5adZcquBGpk+yJQjEVB2EvD13i94EMjQrdO548Enw==
X-Received: by 2002:a5e:db06:0:b0:707:5e8d:6e62 with SMTP id
 q6-20020a5edb06000000b007075e8d6e62mr25042794iop.21.1674828660867; 
 Fri, 27 Jan 2023 06:11:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:46 -0700
Message-Id: <20230127141058.2180747-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=InsxK22i0ljJ9U3zY33dID31FFI6GKILcmWShjOx7NsxkE1r1U5I3FwOkFDs8MvuRi
 T72Bi0wSdVD0r/PUvPtIw+cRjEgEwqjJIm3OPWl4nFmjs1l4KAwyhp+NzySQLTVWP7m9
 6xjBdJ9gAhyukdnOAUbynije2qbCLqo2ObMR8Q9IPdR3d4Cp95fqEh8fhJrGA5JzjlTg
 DQlb6iLTVT8FmumBvJytk9mriD1yylUqNXZUEm77MpacEnE4ejAw5AQeazpUuxSlH61k
 Rt+HfK6xeQz11zZNrG4KhO5QQZw3PP17Cww6Qqtkg91jBlWi/eYkNgIyXjQYPsDHndjt
 jqpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=InsxK22i
Subject: [Buildroot] [PATCH v4 01/13] package/flatbuffers: build position
 independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming tensorflow-lite package requires flatbuffers to be
built with position independent code.

Fixes:
/home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/flatbuffers/flatbuffers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 9d286bf9e1..487d85ee1f 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
 
 FLATBUFFERS_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 	-DFLATBUFFERS_BUILD_TESTS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E43C25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD47C81E16;
	Tue, 24 Jan 2023 09:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD47C81E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64G-13Vsku2K; Tue, 24 Jan 2023 09:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE5481450;
	Tue, 24 Jan 2023 09:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE5481450
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E61D11BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF4D481450
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4D481450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yULLHmlnmsp3 for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:22:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A2FD80BB2
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A2FD80BB2
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:22:44 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id e204so6818970iof.1
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 01:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=W1DMuLj6yJiomU5u0LgEBlDJ4x8EGo8FvHOwgLx1td2ZDCh6FNkR9t1omGb9kWmd/V
 GT6yJ0KYHcZTY9bNmW4Gt9IthbQ7GAWHBSfMJejcqZ7V/WsUjQDzZJB+LWZsDXm3kmAp
 FAT2C8YKXsx5mW/V4qw/A6+JfQTbPprScxRzRgZNG9D+TkbTBZNu1LcyqgdPGNqIEYy7
 g9hBFwxf6QeEbzudNteVU2xiyHM/lo/CnSTjfxxvu9gCiGBfUUKSvPJwInfAPwgFXxoQ
 AkDUXSbK9QTDJL3mM9+6QmlRLFAYo/YlqmBf/LbknDLigUT/jsEHgpSuRI7oLULgbxOI
 HBPw==
X-Gm-Message-State: AFqh2kqAP6P6J9GMeyGuBN6ypwukRIEBrApwiqZL40cpqQzozxH1kOTD
 mnoHOc3hh6Y3gsYb//vjW2C3SxSGS3jhcA==
X-Google-Smtp-Source: AMrXdXttXDlUKLZglpQI5n3cOMtUbO33J4QvmqT1oU1kvQ+oEwQ+n+E0E5eBSTpZ4Ra3FeTqdaKmCQ==
X-Received: by 2002:a5e:df08:0:b0:704:6e8d:4891 with SMTP id
 f8-20020a5edf08000000b007046e8d4891mr21057713ioq.3.1674552162780; 
 Tue, 24 Jan 2023 01:22:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02b91a000000b003a7d5061e1bsm524923jan.111.2023.01.24.01.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:22:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 02:22:28 -0700
Message-Id: <20230124092235.806969-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=mrUB0JdxGK9RcoDtM4Oil/ThUGlzBIff+vd158vfT90C3p/4DnMUqV5DdYhTwwwhhO
 ApfRtFX1zxnZ+x3DlAUTSotQeGykfrd3ud7wywrsvkDhYvwoj240ssbFBrYWlOXnCxfT
 kqV0mnkQ8bi23zAEMjTbzCYDpM+hsYfyIIZehX9LBDcuuo/QnEYwy7F1xTFlUC05kflk
 lvGap0+pg+nmInp5v8ydhFiYNSI/HquTTs4YpRYK1ZjY4azeJt+JVhAq8wVhXlxzeoAD
 ANxJDW+sm5kWyXzJghbek94mJ2S3IhhM1ua9BNmS2gcx7NDptCpUt5tXov3x4JVGbigg
 mt5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mrUB0Jdx
Subject: [Buildroot] [PATCH v3 1/8] package/flatbuffers: build position
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

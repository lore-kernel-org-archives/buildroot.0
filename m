Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A7EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E3A60D71;
	Sat,  4 Nov 2023 22:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E3A60D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DipDuAgdCmX; Sat,  4 Nov 2023 22:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0189E60D58;
	Sat,  4 Nov 2023 22:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0189E60D58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48E591BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC2A821BF
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC2A821BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCStFLfDax2r for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:54:11 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D884F821BC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D884F821BC
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so46185221fa.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 15:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699138448; x=1699743248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Tr8yItlJKPmEvFH3xUuf8vzz2a58ehq1HqQN81h0m4=;
 b=mVmvsXQNmsZTaLMGtAlylOfpLZGhK9vLr4cRKSOOr0ccUIzYU4tP9n83UJS9nwvUaV
 dpR6hSxitEO0Q31IjvYILiuLj0NPCyA9no93sYw36bXG/J7KHEQaNAs1Y3EPhz3F2B4r
 /rxLTKDOHl/0nVAf6pzlfOYT+Wj2j5Fp1FYuzujn70qtY1XTLlq1K7BIMtIhHiOmLajr
 yI+xuHcu4ngGF2GKwL08CKK0EHua2uDHYBHj9wb8wZjcbflN2e3IG/fjqtz40AsR2QWK
 6uwo1rgUUhPEUHWAJUUlIbp/JyPmfF8BgX+fuCXO+iUTt0WiJv6ZeB4wf62Jhc3Yujmi
 5yzA==
X-Gm-Message-State: AOJu0Yz5ksroakIFx8BtVbgT2Mb6Jf2TLJDuqxxlEATfvRM1jMRqnSiw
 3wnjbUBG5u7xtRQ6Vq5f0nz9MTRCKPM=
X-Google-Smtp-Source: AGHT+IGpJrvJ2NemoCNeUhPhYLlSBWVVf9n5KUGmZyjA/17fIcTgHA0WtHkdarUHCjlV0xkLOwlXuw==
X-Received: by 2002:a2e:5358:0:b0:2c5:14e3:f1b8 with SMTP id
 t24-20020a2e5358000000b002c514e3f1b8mr19107769ljd.7.1699138447594; 
 Sat, 04 Nov 2023 15:54:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm7111533wmo.40.2023.11.04.15.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 15:54:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:53:38 +0100
Message-ID: <20231104225339.380802-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699138448; x=1699743248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Tr8yItlJKPmEvFH3xUuf8vzz2a58ehq1HqQN81h0m4=;
 b=khSYxb0O2HZX8FJFJ4oS8naEuJpWqi6MiVjysKsuKtet/rmfI1kpk6oTeJHTcwtEAK
 C3lHTrlCNRYVegAL7qYi6IGxDrOikgs0tdH4NuhVYhGhVjwKEODezbtz+KaYsN7OINcz
 kIrPs8ybfz1JwJC3sj9nGTHPZ9uNevzbRlWy99oShwHXKKZbVTarMHJ/By/pe8NOBznV
 +ZBInxcnej3Pvi2i4BXyhKT3/xaZpOVieEAUIAmmdYS9Z08N+9d8SKq7BCh6zcx+f7xO
 KA80wPk1LoUvX92coEVLKKIC+Ejqimtm0GD36nP+C5hSz4bme+TAoykrk0gejLQ8HuGa
 CZPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=khSYxb0O
Subject: [Buildroot] [PATCH 1/2] package/traceroute: add
 TRACEROUTE_CPE_ID_VENDOR
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:buc:traceroute is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/399C82DE-9AC7-4C48-8E9B-57C480E95FF5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/traceroute/traceroute.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index a02982a6b5..155e134c68 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -9,6 +9,7 @@ TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/tracero
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
 TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB
+TRACEROUTE_CPE_ID_VENDOR = buc
 
 define TRACEROUTE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) VPATH=$(STAGING_DIR)/usr/lib $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

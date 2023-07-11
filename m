Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4461FEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DFEF41EAD;
	Tue, 11 Jul 2023 22:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFEF41EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C66Cv89bFRJY; Tue, 11 Jul 2023 22:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600DC41E90;
	Tue, 11 Jul 2023 22:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600DC41E90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBB21BF2C0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6874D40493
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6874D40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VwBn_cla2EDO for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:14:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DD374000B
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DD374000B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:14:59 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-67ef5af0ce8so5489030b3a.2
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689113699; x=1691705699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=laS6ixc1l1JCpxSm4/R62gh/MoZXZhJJc1PONzaQBfk=;
 b=fGVNQvLrabtKhMQPf2dTmbPJb1DGtvMxD3nYrJ5HTVmvkKS56Nn4L7TXdS8SrzXMMj
 c2Lu5/kkmj0zMsSbU2Au8KEfFBn09HdSog4ixN4jG8KFfbv4Tt5zmhpj75thGHtVBeno
 fOeRfO/l90JxtMQY7DzBIGKhI/Tdt3bxx9iBb8O/j1m9BND6QiowrRXaAxy/+NJjCuBB
 9BxRTpbQX9m6jZCmVPmQJerYP3/gZvxE30KimKeSHwytgOTR2UIA2NKh9jRY9SmLxbWQ
 5kOMLiVpma05w9xDjnO2fmpH1UnAs+YLFJ/x8EMwd2msUKB9Rtf6yc/LQvdjDhybFJcW
 kYEA==
X-Gm-Message-State: ABy/qLaOiiaD0lW4088iPGGFV1vWYoO8SLOiGbslMXK72BrDzUKv04kg
 NgI4UI//YwG6ekGY7QSJxle8+DOkJlFcmVyApq1ndj9Zd6HsAw==
X-Google-Smtp-Source: APBJJlGBy30Pwjp+k+W5C4d4MqwhmJLZemCnG6bIVw4LqEUxl7V42gX4NxQDFKcG+KtZBFIaGZkfYw==
X-Received: by 2002:a05:6a20:8e27:b0:12c:55:b183 with SMTP id
 y39-20020a056a208e2700b0012c0055b183mr21487857pzj.55.1689113698809; 
 Tue, 11 Jul 2023 15:14:58 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 q29-20020a638c5d000000b00543e9e17207sm2067383pgn.30.2023.07.11.15.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:14:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:14:56 -0700
Message-ID: <20230711221456.1703814-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689113699; x=1691705699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=laS6ixc1l1JCpxSm4/R62gh/MoZXZhJJc1PONzaQBfk=;
 b=ZsgBRmH4/hWG7rin/I/l4bOKIfLrhtD01KWcQxYr/lfkyawIYOTXop4UjmC5YOwWKg
 /BPhLutmJmOyOc7hFszHTgjvnJkw3dBniwtBPbJ3SBUplfA8Q/AT2vF/xJBskdutlHIW
 JaGquX40HJQ+OaQ0HFfYBIMCMGpYZ0W6AccgLFLSWdt1DOX1+/sH2ITpEeMDLdjNalBS
 ZzJUN++JKa/32ifkvFY0UtDFSUuTnJDp9s/FH05SJ9L5XDS3fOPknaNtYXp+d+0fH9BE
 lfUaUmFt9wkpF79bOltTNDrLQFYAoNaQXiUZfW1Gn6KRQkc8OVhCESbAde3cJmu++gft
 KlFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=ZsgBRmH4
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to version 1.19.11
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.19.11 (released 2023-07-11) includes a security fix to the net/http package,
as well as bug fixes to cgo, the cover tool, the go command, the runtime, and
the go/printer package.

CVE-2023-29406 and Go issue https://go.dev/issue/60374

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 874737ea2d..6d4c718a40 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 545d2117b7..22b8161e05 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.10
+GO_VERSION = 1.19.11
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11083C2A061
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFAA580C53;
	Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXEzY-4NjkfE; Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D893380C3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480224;
	bh=6OuUpcJoaCk0uV1F+7C+reh4EWAMIT+42/dmfXZIuL4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LSYlaDJ+CkWfsENATUZ1nXigD97trAFQLs+4vWwVp4+aq6ygt3yzQhHx+eBBM0+Sc
	 K3HIWHZZj57HWDcPA/TogUzlAMhyxEGLr+XFu+KxXk+VBFcpmVzxpfnTd5fT5euHu7
	 7EWjjZYAT4vw4bGZI9VG5RN9/eKJaBZpgphV2tXJUXFwTFmxqB8CRkriGO+fLmDSAE
	 0oLwK/dVdP6oj/Bxr/7EpiSONcMMBySE3vXCNDXc4tcp/wllW52pO/hnqLfbgsmzB9
	 dXh96mYev7oBngzdQDxOQgKmkO93x90wZB9l2ZA11TkJZucZBzDdK8zDd/Lc0TJl9C
	 tc8i8ZiMYT6lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D893380C3D;
	Sat,  3 Jan 2026 22:43:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C43CD25B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5FB340237
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pajZrl4BlaZD for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F4B340179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F4B340179
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F4B340179
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C942FC1C95B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF0436072B;
 Sat,  3 Jan 2026 22:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3C8E113B06CC; Sat,  3 Jan 2026 23:43:38 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sat,  3 Jan 2026 23:43:15 +0100
Message-ID: <20260103224330.2933161-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480219; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ZJdTD2cKr1x81V1aGo3IuK+jJjXLE43qtCiZOIaSFhY=;
 b=0wh5FKAqvIvfIzshoNUjf7CLYt9g6cwDuKiZ0QVxRpzx6TUJKqEHlCfPIAEd9mUJWMkvwI
 1w3dN0BPohQQpFp8djl+wvFMtT9RoqTnqOXs0PYvCbWioRuwgyfGBXnOd+dhpyvrStavsB
 jg63HB8JXfOnpvTP8VBUOSN55xCfKEQDd8az9kkoIN2mIBtfWtLUEt8gugg6QCQDiMxBs+
 5lhgoM0Uu9P43CY+0CXHutR294eO49Y+iPlXMDd++paC5TbWH6eRHqyJhK9WwfUePRzvQO
 4gP6E576LG6880Tg/QELnjmqPUhny1tGrIvvp9l9aLhAejKWB0LNPbVJStyYSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0wh5FKAq
Subject: [Buildroot] [PATCH 02/11] package/opencv4-contrib: fix Config.in
 comments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The comments saying that dnn_objdetect and dnn_superres need a glibc
or musl toolchain should be shown when a uClibc toolchain is selected,
not when a toolchain NOT using uClibc is selected (as this is exactly
what's needed).

Fixes: a2e01b23fc441a4be4416e68d91e331e00db3bbd ("package/opencv-contrib: propagate opencv4 dependencies")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4-contrib/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index d992c6d1ac..ad61c3fbe8 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -84,7 +84,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 
 comment "dnn_objdetect needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
@@ -97,7 +97,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 
 comment "dnn_superres needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01FE95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA35C6104D;
	Mon,  9 Oct 2023 14:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA35C6104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_pgwPk33cbh; Mon,  9 Oct 2023 14:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1229B61142;
	Mon,  9 Oct 2023 14:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1229B61142
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 017011BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAC0B41989
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC0B41989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5RenjHcWD3L for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:22:47 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 680AF41951
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680AF41951
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5334f9a56f6so7937165a12.3
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861365; x=1697466165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTONiaATtK/vtP47KRw/E9+t5UO2nh66/pDHf5LxKKc=;
 b=TnFclestsDZxl+QrwnIPUqb4T/6qNsPo0W5QWFqhV0VM4KryW2NCKsK8oqblbSJ7LV
 bm0U7QpKMAg5WxnJ/4HctPr9nKQCt6o1kG9v0ujrtgQk9RXh5dtDgtHSj0fWZXkzEtJu
 t5lcZb0WtQV0A/6TI8RdTGiu+qHjMKdZZxK5lDJ3Q7IHcrAt+dXFYQH+rGOnThHVTNif
 QJva3tsVNTkRyZsVUBNy1iiNpE5lSJSgiNB5kT/QqOzGSgJEyK/dTCfFXQtt1KMn9OIw
 fqaUWKSy8wQHXqgK0r4JSKLAiBeJm6w+qnukwaDntix4Ur3FGJZnalpr2Vqb+0uYNVpG
 4i+Q==
X-Gm-Message-State: AOJu0YztzHxZHTsvWHzQHPF66/nYwZ3GyB/05QWKcmk7XK5TWPVFgJag
 rc0sCTuAfTDpSGPds6z7S8O+b62zO0CJGqbCfpGNyg==
X-Google-Smtp-Source: AGHT+IEmSdDgXe7S+nECcToxvf9b88YoxvF7+aTVxSZd7MB1MtE5p6YWGk9EVE0VlBEsUdDpx/p+HA==
X-Received: by 2002:a17:906:d9:b0:9a1:c991:a521 with SMTP id
 25-20020a17090600d900b009a1c991a521mr14440841eji.4.1696861364427; 
 Mon, 09 Oct 2023 07:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a1709067c4700b0099c53c4407dsm6856509ejp.78.2023.10.09.07.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:22:43 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:22:33 +0200
Message-ID: <20231009142233.1773833-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861365; x=1697466165;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MTONiaATtK/vtP47KRw/E9+t5UO2nh66/pDHf5LxKKc=;
 b=Ruu8yCOaYnvdL8/ZxvVRBSY1U+oL+SCAnbC0O3SYm1njW0lYhgW7YmWgvWtqOV1VBr
 XhIv4d7iKFG1V3W3c754au+vhdZGZny3lB5psaSfqKlIa0ncNlzky9pdvS8Xopntt0UB
 xuQA3CZpzozspibrsiWn6SLjxwNdD5uEjSQs0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ruu8yCOa
Subject: [Buildroot] [PATCH 1/1] package/sysvinit: bump version to 3.04
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sysvinit/sysvinit.hash | 2 +-
 package/sysvinit/sysvinit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index f81e55fc44..67b0ab38f0 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757  sysvinit-2.99.tar.xz
+sha256  2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5  sysvinit-3.04.tar.xz
 
 # Hash for license files:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 1bf10deb63..b7fe39ca43 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSVINIT_VERSION = 2.99
+SYSVINIT_VERSION = 3.04
 SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
 SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
 SYSVINIT_LICENSE = GPL-2.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D0C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 12:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24DA560808;
	Sat,  1 Jun 2024 12:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhZxbdYgVneq; Sat,  1 Jun 2024 12:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33CBC60814
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CBC60814;
	Sat,  1 Jun 2024 12:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4D0D1BF239
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCEF5845E3
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9WIld0urZRF for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 12:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C14FF845C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C14FF845C9
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C14FF845C9
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 12:59:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35dcd34a69bso1881938f8f.3
 for <buildroot@busybox.net>; Sat, 01 Jun 2024 05:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717246785; x=1717851585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZR4e1hudEz6g6LEhj95rpOX9YdNo9XabUav2M2Ce9A=;
 b=FccGxxVPqLYDQydI8gIOpxU7pgypmc1N/bmFUFYWqQJYwKg1H07BCVQmJfP1tRSxw8
 4aUGxoLcNau7m6bSwUY0MnQF9upXLZtiPvI2zntq5ER8E3qwN1sA6gJ27ndkDkRFhczp
 nwkH2f9vG4ZlgOnMf44EdYwewsBIAWZAZAS03LWTdVfbGUKxoah6wbTBziv2IgtzoN+J
 KxKBdmVPhtlXeH/6Rba/b1akhXp+oJ7gfQX/bVS/MVYauozXMfxpi9yLHOkgnyNAA699
 rcCESbO5LSGGLHdEwLm5IlClAp+8f8Sxlf2rAwIT9t7b+l+IfkJKm1WliGubdwn1f6pS
 o6Gg==
X-Gm-Message-State: AOJu0YwRoeqG/wL/aem/0dry19Nafi6eEdMyQOrisG/KVPpcnXA5qn8l
 3cF/SpyX0cJ+5+HB6zSyjhdn1ZB8NICJHdBc8lYLtRaWyCWkAa3+8ux8SdWmI/TK8aBw6BUzWsV
 BRw==
X-Google-Smtp-Source: AGHT+IHUAfymcgMmkX6rwRUc1JQdhtLAIfWLGWT8Em2waXaJhVTwAxbe7UaDkq3U4w9vkaxsv7O2LQ==
X-Received: by 2002:a5d:45c8:0:b0:354:c483:a469 with SMTP id
 ffacd0b85a97d-35e0f259028mr3075272f8f.1.1717246784576; 
 Sat, 01 Jun 2024 05:59:44 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm4042265f8f.76.2024.06.01.05.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 05:59:44 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  1 Jun 2024 14:59:41 +0200
Message-Id: <20240601125941.29768-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717246785; x=1717851585; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TZR4e1hudEz6g6LEhj95rpOX9YdNo9XabUav2M2Ce9A=;
 b=TlD2Ksj7G+hjqr7EIGneJZksIxKlMgb4vFNQBm6HcxDarAZvT+9bEp5A0fwUdEv5S1
 pz+vj33/FZjx7VFf0szdpNTfwUW6bNI55L2QL9IaLHOrPr7kDsRouGCYXATtvN0sxz9Y
 yPjhGrFsaevJluM9DPN5GVd/ZXt410JZUYiEpRJHCE0vmzrVDM2uEVyPNEJ8PLi2ca5z
 bdTKAVFlAHSOixnbwx+cDABnFiOmGpQpinAvcb1xLeQbNDEPqwqgdheCyCa56jsGdsCn
 n81VETkwZGvtD+a9qIv1lXMn8B2lYoghVXjN5AZX4TtQzp0p9QeiLJHMiGVGxa/KvSeV
 xdjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=TlD2Ksj7
Subject: [Buildroot] [PATCH] package/libfribidi: bump to version 1.0.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 9187112ce..b37fb9223 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2  fribidi-1.0.13.tar.xz
+sha256  76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a  fribidi-1.0.14.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index ba0859c93..7c6d32fb7 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.13
+LIBFRIBIDI_VERSION = 1.0.14
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

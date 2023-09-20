Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD283C27C7B
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 21:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C2A61374;
	Wed, 20 Sep 2023 21:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70C2A61374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQq87EDNfL47; Wed, 20 Sep 2023 21:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E4D61355;
	Wed, 20 Sep 2023 21:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E4D61355
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6671BF239
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2210240153
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 21:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2210240153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJBQNsR7Oa_x for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 21:18:55 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B2BF40133
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 21:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B2BF40133
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso2791205e9.2
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 14:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695244733; x=1695849533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b8CxztVqk8pdCPCFWT9qH6LPUB0Xdxhfh2o2jG3o5V8=;
 b=Od+X0+2+lsG9Oj8Xcxe85TdALTJpWiUepfHibU1Da+ISlo2hU8JsT+tOchJ8AjSnQT
 jYAyOXde9HRBtRHJynFLt9aG1brrZRNRbPQG9K7WVKt+4vUe7EKhNXizrf96qLOLwDvY
 P6T5HU2CtUwQQsXm82SJ+7dBi01XKz0wl1F3HbIEoEV08m4HOsobpum+l5sRs5SEABbb
 zLAzXtJjY0nLTQjP3p8Mxj+EPjibClBvSibihOrDpFt/5GAKTgjPEInDq0NkjdKoE5hS
 3WAtB8tZIGzmYbFt59lts55mcFLNBQnbvcUPWgH1XntCZjB7TxGSPLYlK4i6b0233gtL
 Rytw==
X-Gm-Message-State: AOJu0YyNar0vWzDGSVzZPyL503dojfaGq/heDIA8m22gPEXNClgZJgUG
 /L/QgXJMHPtQSFKhsVzBEqrPAOe16zM=
X-Google-Smtp-Source: AGHT+IF+NBinIT1Aa3SwRuhvuFi73w0xC0sMYG1CZHIdhygGN7gmgRd7yStaL4Znej2D35K3zGEKZg==
X-Received: by 2002:a1c:4b18:0:b0:402:98cd:aa22 with SMTP id
 y24-20020a1c4b18000000b0040298cdaa22mr3514961wma.41.1695244733098; 
 Wed, 20 Sep 2023 14:18:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m14-20020a7bca4e000000b003fefb94ccc9sm133423wml.11.2023.09.20.14.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 14:18:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 23:18:44 +0200
Message-Id: <20230920211844.47690-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695244733; x=1695849533; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b8CxztVqk8pdCPCFWT9qH6LPUB0Xdxhfh2o2jG3o5V8=;
 b=MZVUSuGMBHELre/vctdcB856qr4+LtCB1qNSsW/Fs3HCIPyRHY9pOzt069PLwJ6m9O
 Jc4Ysbrjn9OD8PlbLGZrOvyzZ+AIPQoNHnRn3raJQcuul7mhUzLbUYNhvVCuCTMFI29H
 UAzhrBnz5ERUpV/d9bZpNfmxBvAU38ey5bcaH73vjRnjn5w7JA5u2G4PWYCTp015TyrJ
 tei3NYkI2HXa5qFkY2ixYeLUjIpu5zrx9Y6vz0Hdy0pXDxeUVQry4rt4Gz0mwrNdggue
 Mysh8bnCx5gKjTi2aB46WbrNVOffAQ51DWZ2avGawNzmF+L84V8ZiiNpFzO1ybAK1UVE
 dLIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MZVUSuGM
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: update hash of
 README.md
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9ca60c004d69e1f38000e3a74151b0a90aca7f21 forgot to update hash of
README.md (multipathc added with
https://github.com/opensvc/multipath-tools/commit/f220ab6678184b156b800c2885c0147acc9b2aa8)

Fixes:
 - http://autobuild.buildroot.org/results/633ceb38996af7c95331ebe878ae8ba8a4b9b7de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 158f0faa96..06aa5ccc80 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  b8b4369c539d6a61ad2a5a359a1ecdfb9f630a89590216d490314e19bf07aa0c  README.md
+sha256  5887418b2e0e595da5aca08b2dff25298f20618f9894d5e26ce852d9d1ae90c4  README.md
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

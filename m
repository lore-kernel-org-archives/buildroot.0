Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC9CC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E206840510;
	Sun, 14 Jan 2024 12:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E206840510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QnPgYTkwdZuG; Sun, 14 Jan 2024 12:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2DA404EF;
	Sun, 14 Jan 2024 12:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2DA404EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0041BF59E
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A4FD60AC1
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A4FD60AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNF9I-JS9-Bo for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 12:38:51 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ED5160ABD
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 12:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED5160ABD
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so4709202f8f.1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 04:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705235928; x=1705840728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nh9/8spEKRUxCxU11KK70ArSZtJ4qkv/zDh1j+g1spM=;
 b=GTYnt8bIIgKw87/LPutU8ii4I+75q2ieh++ZhHgII8KPIs5PCbLUv+r2F0Hmo2NTd1
 HuiaRxCK+SGFeT9CWv50E4BbgZI97zb5RRtSUbCqMUmLuoqJE+d+UbrC7PKURmuU+HrO
 ImQ4ipremUTOQ9P119MLjd8GUT7qtjx2+7WoZ1PruQkf5FVDjVHvHuJRkSdjenohpe45
 E6ak2jw72kVYxoDX/ihfRj/yWcSLLDP4CzRiPa+0i/VLSTyhVdvPRdJ/nj9j64kZERP/
 NW+dvLUaQumfaF0ifPE1fUhVOGqT/E4GNjzfIr/8KBL6IQBZ1UK+FH0UPuevw4cNqdqD
 TO7g==
X-Gm-Message-State: AOJu0YxmYlQhsTD3SSW/qnK5R7NC6P8NLpEkViai6jLG9D0dGOix61lf
 tB9N528UjFx1HWKbhhGRqrej9q/v6GI=
X-Google-Smtp-Source: AGHT+IETuvMq6qSQwt4goVSWEaoOITllRUAs93kz4w77M4fp4YQo3NeqynWSjpMXvdihuLixsfnQOw==
X-Received: by 2002:adf:a3d9:0:b0:336:7a5c:ffc3 with SMTP id
 m25-20020adfa3d9000000b003367a5cffc3mr3065345wrb.14.1705235928362; 
 Sun, 14 Jan 2024 04:38:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b003365fc41bcasm9030648wrq.51.2024.01.14.04.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 04:38:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 13:38:45 +0100
Message-ID: <20240114123845.810225-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705235928; x=1705840728; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nh9/8spEKRUxCxU11KK70ArSZtJ4qkv/zDh1j+g1spM=;
 b=SjqxZhwk78bRiG7JjuztoCVkej/C2ped/ozd5KgpOQZIvDXKkJ3z3oBuxgH14TYYkM
 wlYara7Zt6858uWYSEW9ETzF9hd+joqrItYFv/AYvUqUVM40KbAknkYgmYQs7T0NU2Vn
 0YqNeyA74aY08Lf+YOcEL5Cciib8hFKqZQT7zmaj8Nfsep87HbUWJz+7/1xdkWO9rgRu
 XM5MNoOxhknEvknAu0Mc/JmQY4AJZZ06VO2JsW89F6c5kH47NG35/nBEHXm/oPRHTx2f
 jfW+4mM0bC2ggCOO9NiZPteWSwTJY5oZVhfvTJE+8YTX0o55Xas3mYntdf43MH7OUI98
 vSdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SjqxZhwk
Subject: [Buildroot] [PATCH v2,1/1] package/criu: disable on aarch64_be
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

armv8a aarch64_be raises the following build failure since the addition
of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

Error (compel/arch/aarch64/src/lib/handle-elf-host.c:30): Unsupported Elf format detected

Fixes:
 - http://autobuild.buildroot.org/results/8eaa881a926d138a0bfd3f1076246088994e883f
 - http://autobuild.buildroot.org/results/8de9b4d6b26e06f6b4457a31366bdc0d8a8c34ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Fix condition to only exclude aarch64_be, not armeb

 package/criu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index 4c295acf4f..a5adc0cedd 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV6
 	default y if BR2_ARM_CPU_ARMV7A
 	default y if BR2_ARM_CPU_ARMV7M
-	default y if BR2_ARM_CPU_ARMV8A
+	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
 	default y if BR2_aarch64
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

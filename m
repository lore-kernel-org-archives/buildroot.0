Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7D2CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C8C4073F;
	Sun,  7 Apr 2024 13:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMk9I4F92IMw; Sun,  7 Apr 2024 13:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF63407EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF63407EE;
	Sun,  7 Apr 2024 13:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2041BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0178F407E2
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8tD8W_yZ8XT for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7519E407E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7519E407E5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7519E407E5
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:05:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so1667951f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712495154; x=1713099954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ZEaY+S8ti7GVboNnHhtmS4IPxcEMikA6FyNkY66emA=;
 b=bEleObC6SgsHZLR0vqLXolr+UCISwaAhxfvyOw34HDW4+ORyVIcu+H1MG4ObNvJcWC
 UdhwTAwZycsTPDm9Fq7JbK7huhQasiJFEV3QmFmgV4jLWVFaXUMwKdWjwfj3SAaO6DLX
 Fir7cbFnP0ijy+Ps8BxhkpsKS5pWkVkLK8+uNWNW8LQ+bM7TU1iITtv4amRDwPA2tR4R
 jgHm8Ey3J/gkITJq2vPlxSj7tonfPAoZud1SN1TbGMT/nRvlUW8CT4D2BJGMRgFzeFVp
 SlMo+Tq13aMPLfQ1XNNCmuUPG8QuqfbGFTjeTG+MIN5d512RsCPAK2y/yboUN4ZLyMg1
 f23Q==
X-Gm-Message-State: AOJu0YzDzngiifSNtIQoaEL8zDHav63SES4WkjymnB3wibVr+xvq4RAP
 nZDcTAMumLOmKghCH6O1bnQAuzzRPdiP9cY/JENZNzDtUQdjtalsen6LFFGq
X-Google-Smtp-Source: AGHT+IEoydS8yDb25jVMrAm9Wi08aJia9CW5DnUZiUUY0GMPIcY3z6Pi2QUy8UykYAEG7oS6kbNpsA==
X-Received: by 2002:adf:a48f:0:b0:343:688d:2cbf with SMTP id
 g15-20020adfa48f000000b00343688d2cbfmr4275301wrb.60.1712495154459; 
 Sun, 07 Apr 2024 06:05:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e27-20020a5d595b000000b003445bb2362esm4030053wri.65.2024.04.07.06.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:05:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:05:50 +0200
Message-ID: <20240407130550.1356070-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712495154; x=1713099954; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZEaY+S8ti7GVboNnHhtmS4IPxcEMikA6FyNkY66emA=;
 b=Vx+89bd1PJZD4JchiiERHR63CQEqw8RJokvQyDMe8bzHSXTAmSv+jKE8IsO7BGXte0
 5Rx3O501Y5Auaemfal7+LzyZHyDbdru6Fx20s+tOLtjuk7nbax6fkaVbiZES38M1UM3N
 5hWkYUabQY7IVQ4X4US7rxMUe5C643hxLLcaWP+VBFXZH1OoFQvyYs+eJei7OSNyQg4V
 OED7R+wUXWWMtpC4HFDfVL5kysPk8xsRL2CjNs/35i60WsxFmr3H5IZLYBcYq6J04Ov2
 NLz7p5KckJZUmMtpSKmUs9AjoYS/4W5tNahUw5QapodA9Pdow0JelsZAy4nGlHP9h7iw
 awlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vx+89bd1
Subject: [Buildroot] [PATCH 1/1] package/nginx: select libxcrypt with glibc
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

In file included from src/core/ngx_config.h:26,
                 from src/core/nginx.c:8:
src/os/unix/ngx_linux_config.h:55:10: fatal error: crypt.h: No such file or directory
   55 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/a186fffc468f9c901626c47c4ce216ae501085b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 8e888baa1c..1c74f6e116 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_NGINX
 	bool "nginx"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBATOMIC_OPS if BR2_sparc_v8 || BR2_sparc_leon3
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  nginx is an HTTP and reverse proxy server, as well as a mail
 	  proxy server.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

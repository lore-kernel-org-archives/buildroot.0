Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64903C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358C341E86;
	Sat,  4 May 2024 21:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM4F0TB2wa26; Sat,  4 May 2024 21:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEF441EAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEF441EAC;
	Sat,  4 May 2024 21:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2ADA11BF86B
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2576C606AF
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFbBjB7K_VXS for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C3AD6068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C3AD6068F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C3AD6068F
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41bab13ca4eso5319065e9.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858835; x=1715463635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jws2P9S5L61HamfaeDTcFNUJXvUKt7WZWzqObJKuCd4=;
 b=DgzEyY10srFnGWkeBTM2xRCz/KgiKUrja5D2Yc6DDfQy5ZMKm8/G/BoQOeX9MGmgTR
 /bJScEbyq/o++FueuTWL0glaXvoK93AKBJLiSLkkTUyONq+/2u3qqFPYr6GEuJsFTc+c
 FXsbLKbNsVt2naD6yIfgKrei4SawYiMKbxxYw20pxvu988yba8QMYI/yZc0EYFNT4ZhV
 U/31B/tB20qXjCPQfjI/+jNAum0U0ONV+2sGbAxokgBRYXts5bWpq7tIpu/v3HdOkpYX
 jj1xrddrMwLxrHT8YlyDntPikRG+47Azed1mP1000TPZ1wGMIQhLYVx/BwB8KhJPtERx
 0nJg==
X-Gm-Message-State: AOJu0Yyk/DjZ5bFLYSXjXuJrhQefouOSZ+KlSetjc9Gdzo0A4QxkaJq/
 LWFUhGBZzLNgjE1Rjda0DvfdaMGf4hP0oQKj9RqEpDhXM4jUhHdEdz1qGQ==
X-Google-Smtp-Source: AGHT+IHMcla/d/NRbE9kmrc9MtGmizDG965fa1Gj5OpOt+aLHhUemrjkwT0NRYEHASdbbazA0na85w==
X-Received: by 2002:a05:600c:3b8c:b0:41c:13f6:206a with SMTP id
 n12-20020a05600c3b8c00b0041c13f6206amr5424161wms.7.1714858835194; 
 Sat, 04 May 2024 14:40:35 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:34 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:18 +0200
Message-ID: <d54290c132c7aff74486913b6d3c1a15067a8aa8.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858835; x=1715463635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jws2P9S5L61HamfaeDTcFNUJXvUKt7WZWzqObJKuCd4=;
 b=QL/oAkmzrCxn0IBg5aJSWuKUAwNzXdxwh+TVHXcHOdsBWwG2R+Geiduf5WoWf4qV1Y
 P4ZqFm5pfiAzrX/J08nRQGbQ9dJ6ypsthj4TiJ1QU0QurJd8h3Cy4++zX1ApKc/yJY/X
 vcj9vIQWplmmsxF9SenE+SC1zhQUMRAu4OK3jPtqww9sF7R+fIfQOwt74+rWvyKIYVO0
 JAg+sCz0RH9BaPSBrFghfRdi8B8iSv0Vf4K3SZzIGWO9UcJDUqKNzb0nH77jqMICG2Vs
 Mbgp1ryUzEWsWNM37lbbiEheuYks1WrfD5TuIOLEusMcEeOuiy6yfiDaXlGACusQwT98
 b/4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QL/oAkmz
Subject: [Buildroot] [PATCH 17/22 v3] support/dependencies: require tar >=
 1.35
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can't stay in the past forever and ever...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/dependencies/check-host-tar.sh | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 7d6b3bf688..271080e365 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -27,18 +27,12 @@ if [ -n "${version_bsd}" ] ; then
     exit 1
 fi
 
-# Minimal version = 1.27 (previous versions do not correctly unpack archives
-# containing hard-links if the --strip-components option is used or create
-# different gnu long link headers for path elements > 100 characters).
-major_min=1
-minor_min=27
-
-# Maximal version = 1.34 (1.35 changed devmajor/devminor for files)
+# Minimal version = 1.35 (1.35 changed devmajor/devminor for files)
 # https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
-major_max=1
-minor_max=34
+major_min=1
+minor_min=35
 
-if [ $major -lt $major_min -o $major -gt $major_max ]; then
+if [ $major -lt $major_min ]; then
 	# echo nothing: no suitable tar found
 	exit 1
 fi
@@ -48,10 +42,5 @@ if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
 	exit 1
 fi
 
-if [ $major -eq $major_max -a $minor -gt $minor_max ]; then
-	# echo nothing: no suitable tar found
-	exit 1
-fi
-
 # valid
 echo $tar
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

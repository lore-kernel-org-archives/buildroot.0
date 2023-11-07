Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D4AC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 22:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F31D60D6B;
	Tue,  7 Nov 2023 22:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F31D60D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Tcyfo1JFhVz; Tue,  7 Nov 2023 22:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0325660D62;
	Tue,  7 Nov 2023 22:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0325660D62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1021BF59B
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 22:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D0D416BA
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 22:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D0D416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eE_DFSEbjEyj for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 22:23:18 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65E01415FF
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 22:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65E01415FF
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so5716324b3a.0
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 14:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699395797; x=1700000597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrfbaLaFYl8Um8yKFnoFnQb0Ec3rceIfWprwc9PqbpI=;
 b=OQgA1/Rh1llci2iMiehtUM61+aKaGLnvHxZr4j08Xd+S4VctYppGjud1xUzDfL/rtl
 qFflL+udgPoimYq/qYftuxxVHn3xwEFy02fG6Me+P8FM3WsfZcvacrUxhwOidgOQ8Uzm
 5ux+dRr0dDdMnFLIi9wtMFv6VVPJzmWyb0qt6da/SocPuyAM6nOFocfmmil+wXhZNQyb
 T94q8Mjn9NBSdeqRULgFhwTESPaEZVmBEnWTE4wZBANcWwBqWAJvWIBtc6k2orI/Wd/c
 qP55pgO+KYwHvUA9VvA6yBmc4CM6EWYtl1osiAUtYlSzwiGMTPmxb9x88p0zNefRuDYk
 IgmA==
X-Gm-Message-State: AOJu0YwxiKn4i62s+u6ySoMVgRk51jqdGRMIZilRpUZKMxL/dnWivQ/g
 48VEgA/sEmgaBZrOOsZs3FoLGhDRm5Rcq+oAgn0Qkw==
X-Google-Smtp-Source: AGHT+IEecc2nn/Ken0NHvXw40JYpApa2q97Brc3uH8BESezWp8+1JWxK9lf/3veyem3jeiben96KmQ==
X-Received: by 2002:a05:6a21:66c7:b0:181:b23a:b88c with SMTP id
 ze7-20020a056a2166c700b00181b23ab88cmr372570pzb.49.1699395797521; 
 Tue, 07 Nov 2023 14:23:17 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c12-20020aa7880c000000b006c33ae95898sm7704294pfo.78.2023.11.07.14.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:23:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 14:23:01 -0800
Message-ID: <20231107222301.2757057-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1699395797; x=1700000597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XrfbaLaFYl8Um8yKFnoFnQb0Ec3rceIfWprwc9PqbpI=;
 b=kCQYjTgzeaxS9XDK/IPyh4biHqOci5xoY1MSVhBR/8lcLVp6LwYJEWc9PQm70fLeI7
 3y/LQ2xgQ6sDR50u2tuFsjYDK5hTW+doA9NjeLZ1eV3cfDtSm9J0QBGENoGvji8nxKm5
 CQXKXaa0EgLeGh5klJxWLwI60T5kRbbqwuos5ASqSHBrlVwGCLTNkTxAPML0TD68MLcR
 6Izg9I9KLoqI9CTLkiXCje7np8/7amWTyPPjTfi//XyfTVvi4TJo2gwrqwW3soc7JZ+T
 m6TC7iK95ifu1UqQEF6PQdB+PIqTs61uejhG7MNO4TYIC7KqmbhBvWaeYzfjjNcBYBaq
 k7NA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=kCQYjTgz
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.8
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The eighth patch release for containerd 1.7 contains various fixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.7.8

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 450d1d1081..5524a1a44e 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  4c6042b13746a803766d76b07f756d03678a33a944b52c0b832c238609db1b2e  containerd-1.7.7.tar.gz
+sha256  891b84e614b491ab1d3bd5c8f4fb119e4929c24762e149e83e181e72d687f706  containerd-1.7.8.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 7c130770c0..61a8472ddd 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.7
+CONTAINERD_VERSION = 1.7.8
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

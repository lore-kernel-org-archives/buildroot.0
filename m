Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D26C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CF283E37;
	Sat, 17 Sep 2022 21:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CF283E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-dlgdLJsaSB; Sat, 17 Sep 2022 21:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A9D83495;
	Sat, 17 Sep 2022 21:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A9D83495
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39C511BF3CE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB4E83495
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB4E83495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4JW0PBzZ3_6 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:56:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADA048343F
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADA048343F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:56:19 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so57085483fac.0
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=4+fu00H5P0b3WdCKYX2xfTFc0LugwOxPrfypQzKE3F4=;
 b=pN8J2EFpJIH8i7jUxFM2uB6iJX6nGMTM+m6B3XgFipHX9Mv+sbBqvVtbIkfy3F717m
 bwt1UJ20nrTB5sFYvZh3l0PwdbJUXjqzDSc9LopWrgGpU7RpGA4lsL6xUt22Uh28YnOQ
 psAzdGtmdC6wkbnIUl8QVprXqby4pUjtDNHmQlRFHcQGGGw+Tw+tgjAN0UvrSXrIcrMO
 JyJj9gEpAmlfHizmAU5YzcRAfl7qPjxxBTCHxn9tTQcb+dk2mPx+jgLR0xKXfyzNNzot
 YERHSh44A58GgKFH3DmJoThvX5JzOUC2Lr6i7dR/booP54ZOlPPdr9jy7xexvoUOBg4k
 NDiw==
X-Gm-Message-State: ACgBeo1XDFoeV7aEY44K9S2d4rYJgI6bQtzhsvd+K9oB3muHNSKMkkyX
 rwmzANcRRri2s2fVcX/nuM2s5gss8PY=
X-Google-Smtp-Source: AA6agR7Tfn7NJMEwxmuj2wjpKkiT3Ghd4SaOrOSpo+cVbe3AZez0/wUwJxiHMf2smYv3zIeLK1CDhQ==
X-Received: by 2002:a05:6870:6027:b0:101:696e:d594 with SMTP id
 t39-20020a056870602700b00101696ed594mr12374326oaa.245.1663451778106; 
 Sat, 17 Sep 2022 14:56:18 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 y16-20020a9d6350000000b0065689e13f52sm6677375otk.71.2022.09.17.14.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 14:56:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:56:15 -0600
Message-Id: <20220917215615.1351902-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=4+fu00H5P0b3WdCKYX2xfTFc0LugwOxPrfypQzKE3F4=;
 b=Hq56AHcQOJpIQquQQv0n7dO4m2Mu2gh78Kum6TaIhDg3wBMPN8bySP3A2AjwLgNLXK
 BVzDD36sRMzIWlHoH7h7H3RUAZcIF9R632shYo1YF3TwshFdUhHv53EsX+7GzLJtfw2m
 vUQQRxQgtedEYxvoKpJRergVMYkBlEOO/LPZtLeA+LDSxtP6PuMl9D7VdVL1cmSCxmK8
 9M93bQOxABzMn4Epojvo5Qe79TLFImn1tB+L5tUB9tLbwcwxvm4fNhV74s2iwMBti8Tb
 6LacjErjP46/BAocTuHivd4KpIF3mOArQj+HO0HNXXfzUndfniYlrE+UkmBQwrZLHZmU
 iqvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hq56AHcQ
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to version
 1.26
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 1262f0f9d7..2d98c47c6f 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-January/042102.html
-md5  0c192bf32de09ec30de4a82d1c65329c  wayland-protocols-1.25.tar.xz
-sha1  275298332d124e40e345aa82bc8f48ef8cad3480  wayland-protocols-1.25.tar.xz
-sha256  f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460  wayland-protocols-1.25.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-July/042270.html
+md5  0c6b3e037f3881650d9a53610dd235c7  wayland-protocols-1.26.tar.xz
+sha1  8aeb1a629d847ec26e26d5a59c150add41e482bd  wayland-protocols-1.26.tar.xz
+sha256  c553384c1c68afd762fa537a2569cc9074fe7600da12d3472761e77a2ba56f13  wayland-protocols-1.26.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 746d82e308..8e6d72480f 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.25
+WAYLAND_PROTOCOLS_VERSION = 1.26
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

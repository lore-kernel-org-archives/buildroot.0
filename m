Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC31C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4711F81279;
	Sun, 30 Oct 2022 22:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4711F81279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GnUnWsCXWec; Sun, 30 Oct 2022 22:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D0EA8126C;
	Sun, 30 Oct 2022 22:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0EA8126C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D68A1BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 736CF60687
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 736CF60687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_J3J5oJNcOG for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:11:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EAE605A4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75EAE605A4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:11:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g12so13617057wrs.10
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JZhoZMQvGlkE/G0Yb7nEAFHFZeP2hHfe3Ubeg0QwIo=;
 b=WrZzl3wkfbd6UokA4IwCQ9RtnP12nx9PDMTTHNLoQzDJfXPNEVKxeu+nNY3PjQ8ysj
 E4CaUxltIoJeY/dJyJNngiuz6mmHp6Kvs8Kvl7ho4z7U91aUfOhYaZQhO4+b76B/z5Xk
 MRwIHgjZwlejkrNIUB0ssjM09z8s7uxn/hId/KMsaVHd6tFhtWNUMk7zFHoJLeXCJmX4
 NQHTHdYDO5nFplyOIl8pKI01xP8KylGuS6zhjaqQA7YCaoWVorLBemiPpDuFG5IDZbwI
 LAztqkjQEgooJ5gu20zpbEk6paPUXhmJI6S0yjCAq+4M8+RniuImT9nkK5Q+wpG7fGSl
 DJEQ==
X-Gm-Message-State: ACrzQf1WVPTx5p8VQcYTBW4hWtMWtr29lzhBBalSmWIJ6HgT4eC6Ftuo
 cmdqvU/cOxubkd5IdaoviDdqxKP8mPs=
X-Google-Smtp-Source: AMsMyM53nxmxxPjUSK8KPxZjw0gM8qHRyHOjHIw/ngjOGOimhT8uTCqLqtQ/QPu5SXTk5rNT/F6z8g==
X-Received: by 2002:adf:f883:0:b0:236:a6a3:d6ac with SMTP id
 u3-20020adff883000000b00236a6a3d6acmr6151230wrp.538.1667167884255; 
 Sun, 30 Oct 2022 15:11:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bq13-20020a5d5a0d000000b002365921c9aesm5235260wrb.77.2022.10.30.15.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 15:11:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:11:21 +0100
Message-Id: <20221030221121.474743-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6JZhoZMQvGlkE/G0Yb7nEAFHFZeP2hHfe3Ubeg0QwIo=;
 b=oIPMSW7CtY5Svo0LFeSyY26939GEAqnRWLanojLK23WwbjK712pWl614SkiPKbGLH3
 N28noPciewj6dil8TtOmnwX+TnLg6uLGujzjIs2H2wNn0gECukSJiUUvglvJ99PDxa9H
 uXKqBcRma+QgSHKBzeROJqbvUwSpzOAYKirEvaTG2WWgy9HrcFDoBqoPJiFEZYlVNGUc
 csgz5HhL3XSeMkjJWmNb7XLGgBpQ+DUBL2MtrJxb93munCZYho7LUEPDRTZbevA+EwSK
 GKI5cALermib8XviYgFQ4eTC4VpwcHD1YOArDuHXvqdxz6DxmO4ozd8cUc3LUV4V8iOo
 vKRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oIPMSW7C
Subject: [Buildroot] [PATCH 1/1] package/igmpproxy: bump to version 0.4
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pali/igmpproxy/releases/tag/0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igmpproxy/igmpproxy.hash | 2 +-
 package/igmpproxy/igmpproxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
index 238de67e88..a7e1a065d9 100644
--- a/package/igmpproxy/igmpproxy.hash
+++ b/package/igmpproxy/igmpproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d1fc244cb2fbbf99f720bda3e841fe59ece9b6919073790b4b892739b1b844eb  igmpproxy-0.3.tar.gz
+sha256  afa4b75a823b82f71ce99f33eae4e8136b906ae8a5ede5caaad93bac38cdae24  igmpproxy-0.4.tar.gz
 sha256  be3d05af93dbbc4650f8d641d8e1bec220af4a729e07ba71e949c25b93a1b4f6  COPYING
 sha256  c4f65d5d396ad518a37d30b83fe33897661858dc174ff64a15d0461630ce64e4  GPL.txt
 sha256  4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  Stanford.txt
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 6a6b56afa0..357c9087e0 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGMPPROXY_VERSION = 0.3
+IGMPPROXY_VERSION = 0.4
 IGMPPROXY_SITE = \
 	https://github.com/pali/igmpproxy/releases/download/$(IGMPPROXY_VERSION)
 IGMPPROXY_AUTORECONF = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

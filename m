Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D7FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 10:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9E460C2E;
	Fri, 31 Dec 2021 10:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZQ41xLVwjOO; Fri, 31 Dec 2021 10:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4FC60BA5;
	Fri, 31 Dec 2021 10:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE9B1BF359
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 10:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F076B4033F
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 10:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfFDKXynhRuF for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 10:08:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB22F400E6
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 10:08:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so14528436wme.4
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agADcrat/BRcU9XrBRMyVll1ykWkcFQAs7koMJIMIrQ=;
 b=laWGPsJrGBo6rYiZVx7ot/e1TcczaKo3AdRxGdbdV1g+Ykf3WwtPOWHC1U02YcQVzm
 IgGYLuVcqBOlE4+1kp7zKmtUqx+N1OsQP9AWe5HylNppRB5r6Ir8eYrOv7msk+OakWTV
 KDODbuzTrTigY82RBN7Ok5mLkZYDd000KieiNFyLfnsY2ySTqP9EwVFheVI0EOfBc920
 Ax14FDyHCxauu6Kz5zszU3EemWRa4S24o5y4L942mAGy1xut7LOKsjR7qoKPNb0JoV9j
 ZNs7LS6C/B5iD6dzrE+eU4nMoSJnJq0rZ8o22YBjXVOvSVajywFY814geZ16G+m12wnA
 uNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agADcrat/BRcU9XrBRMyVll1ykWkcFQAs7koMJIMIrQ=;
 b=cPMZsiW4FnzVeUTjgondfpuZz8ZlcJDsy0hCphldtjSsUwtup0x0aQvluSWVdkzCa5
 IpIZf6XPkGcsoLTGUX1jhO1w3M7+5RaY3iTLt6W5ejL5Lno5/uWvGWfKUKuWZeIGIlKB
 PLBbQ9huSsCjSTa0OgN1yEiUgdnCVPh4Rhpv4VZ+F9ZBX0Vg/uAce/tQy5/rxNYcWup1
 TgWeXfhVuAUg9/9BXrCQuvG3TEwasuhLrd2k8gYwwL6HGpg4G5Er+o2NRZ0ffZMx6LZT
 Jl6z5Ailh8g5cicqBtYDGFYwndln6h/V+4WePa2/kaYcbLM90bXLRPrcRpQBHNH0OKQW
 1Hdg==
X-Gm-Message-State: AOAM5306EvOaA7kSQYuDgyB8DmmaAOj689AxIKC0dxJSJlP5tmfl7LuP
 mr25lRX7yztYfVge32/1nr1fbOG+gMs=
X-Google-Smtp-Source: ABdhPJw2gPeak3+oM+tTA2EaAHVCSxTmmhOl5zlNVO66zHbubi6bVGScv4blsgcLhKp4CNjSFSlgcg==
X-Received: by 2002:a7b:c40f:: with SMTP id k15mr29490161wmi.74.1640945299931; 
 Fri, 31 Dec 2021 02:08:19 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m35sm55603740wms.1.2021.12.31.02.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 02:08:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 11:07:25 +0100
Message-Id: <20211231100725.3662078-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 14.18.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of
python3 to version 3.10.1 in commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:

Please use python3.9 or python3.8 or python3.7 or python3.6 or python3.5 or python2.7.
	/usr/bin/python3.7 ./configure
	/usr/bin/python3.5 ./configure
	/home/peko/autobuild/instance-1/output-1/host/bin/python2.7 ./configure
Node.js configure: Found Python 3.10.1...

https://github.com/nodejs/node/releases/tag/v14.18.2

Fixes:
 - http://autobuild.buildroot.org/results/9e2ebb9c3681ec0485eaa042fa838c8ee62f649b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 3a4571e8e5..f330757341 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
-sha256  3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed  node-v14.18.1.tar.xz
+# From https://nodejs.org/dist/v14.18.2/SHASUMS256.txt
+sha256  3e8a9ce10f8bcd3628eb6dd049f7f03c84ba9219be6f9743e2221154b9cc680b  node-v14.18.2.tar.xz
 
 # Hash for license file
 sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 322eed6d19..7d5c93eb93 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.18.1
+NODEJS_VERSION = 14.18.2
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49C0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA054193F;
	Thu,  8 Dec 2022 21:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA054193F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMdU45DnYOb7; Thu,  8 Dec 2022 21:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EBFC4191A;
	Thu,  8 Dec 2022 21:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EBFC4191A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 325861BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B279400FE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B279400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqtlXuLe90zf for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:25:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EECE7403A5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EECE7403A5
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:25:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso4439791wme.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aXWHbxAB6muHgdKr3jGA4VKdvJr5bt3WXM+p79wXQTg=;
 b=I/Kbm5p/qm2wbpsBSJvRYRuA2uD78elZ+NkmBTcZmWcXAPnRnyMHymGxX02a6Af+XZ
 Aq6pxmhzCrMkrqZiLHpNWciPtPBl3QvwWWZn+A0cxZc3em/RGJccj75gqUoqB1VqppWO
 ojeJFSk+OWuZlPr+VypdVddJUhOIS/sBqBLZDA4PBrpIEwsqNaXwqvq1LmLjs09vvSQu
 EHdwPMKRC8AWXPxHNIJW1diDIo6eeSHP12E9nMePgzFzAAlwGS7OD9gXEoRbnJyJpZom
 tkBdf71sd8nlnH5gkPx803tujkQ8JjsOecdtC5A6dCwAxITQBPJyVjF940uGxyBu0c4x
 M19Q==
X-Gm-Message-State: ANoB5plemZkRZC9Ew23dAzGHX7AA/ZyjL2n2i2/VaMLuK5GjMaNYAJBM
 vvRdbokYjZQcQn052AIzswO2cdKG3vo=
X-Google-Smtp-Source: AA0mqf7qNeeRi8dgSb1uVO5u30GNLPFV4BB1uo0cpB6gNMXpddEIqbNfQ7f3u9CH34vyfXJCM05RoA==
X-Received: by 2002:a05:600c:1c89:b0:3c6:e63e:8157 with SMTP id
 k9-20020a05600c1c8900b003c6e63e8157mr2833953wms.14.1670534707864; 
 Thu, 08 Dec 2022 13:25:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p18-20020a1c7412000000b003b95ed78275sm5935542wmc.20.2022.12.08.13.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:25:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:25:03 +0100
Message-Id: <20221208212503.61937-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aXWHbxAB6muHgdKr3jGA4VKdvJr5bt3WXM+p79wXQTg=;
 b=WhDX+ot2yr0NrHquoEQw4ZnGStaaLZW24FmzTusWEPHpa77apiFdAfwmjkIc/2SyGR
 x96LWmNSzkZKVUkKDHxMaX9tT+f8s6s+jf7OE1aDT3iNBWdE4QOIvQBQeQiSYwmDtqPw
 5Lf+Ool3/gt6EC8o3oINAeSFszONpw8CEwwhYz4LgpE+esKRaq5iW0KGeaVL9AZ9McX9
 hPBAJkgkgX41HzrsQRSqByksXBPxIXBL4uCNQHqBFViwG5zL4O1quU65owIaZeC4L6FX
 Tr4iHzxspZQOPBxdf4vcWnmq1agnyHPCWZP27d7VyFBQZq8KaB87TYK+sz3yhl40LCAG
 WzUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WhDX+ot2
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: bump to version 2.8.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/JuliaStrings/utf8proc/blob/v2.8.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/utf8proc/utf8proc.hash | 2 +-
 package/utf8proc/utf8proc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
index acc73903c8..658ffa1f7c 100644
--- a/package/utf8proc/utf8proc.hash
+++ b/package/utf8proc/utf8proc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4bb121e297293c0fd55f08f83afab6d35d48f0af4ecc07523ad8ec99aa2b12a1  utf8proc-2.7.0.tar.gz
+sha256  a0a60a79fe6f6d54e7d411facbfcc867a6e198608f2cd992490e46f04b1bcecc  utf8proc-2.8.0.tar.gz
 sha256  3b510150d34f248a221bb88e1d811238d6c6c18b51231822c42974c39bb07256  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
index 707e553561..b08c6e7109 100644
--- a/package/utf8proc/utf8proc.mk
+++ b/package/utf8proc/utf8proc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTF8PROC_VERSION = 2.7.0
+UTF8PROC_VERSION = 2.8.0
 UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
 UTF8PROC_LICENSE = MIT
 UTF8PROC_LICENSE_FILES = LICENSE.md
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

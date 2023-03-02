Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF319C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 08:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F764168F;
	Thu,  2 Mar 2023 08:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F764168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHd_9-DDj31D; Thu,  2 Mar 2023 08:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E9A41299;
	Thu,  2 Mar 2023 08:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E9A41299
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E88A61BF34C
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 08:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0BF260A63
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 08:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0BF260A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaqoYg8LVywW for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 08:53:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F5C60746
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2F5C60746
 for <buildroot@buildroot.net>; Thu,  2 Mar 2023 08:53:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so1769083wms.0
 for <buildroot@buildroot.net>; Thu, 02 Mar 2023 00:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677747210;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bE6B4gpAaYWwDqipbwdcpE+TSW3UikbzRfOn7GRt1DQ=;
 b=4Pk02KVHrS9DzZ2PPOqcrwRz2+ZABvwOeW/ay4mdfSINKhKe3VKrz5SGZn/HcWem19
 tTYufKbZyDrZPm4WXhGlqK7Vu4lboGUGIW6ydiIWv3blbZ3l8k1MbP57WXjcCKe15Vdv
 5NYcwz26IXzF5gLlD+8L/sPe5qd7jIBXdgdte1lbwKEkXJWANQq2lh3YO78AyJF9R1s1
 kPlLIK2ofqv0ibj5QgBWLJcLixBNO+SEuaq0y4ea/yy5+TWDP1P9DDKpsO/8InXM4s4p
 wGfD2D9cBsx/T/RnuJ5V2c7Vzu9QWUgo8igQXN33tm8Utbyn0fq2yspIUChK6tmaN9jK
 MDgQ==
X-Gm-Message-State: AO0yUKWxFqHubD85L26gvTOvlErfcyARp+7RmIWpFwefONQbmSm6SM7x
 wkCGx8tWEGhVxI0K8/HQy7ssIpgtGBg=
X-Google-Smtp-Source: AK7set/YQMX9SeCuJ0sMfWd6S/CPa5lca0CXJVYZT8qwNEA1SuRqk9vIRBTQU8jWfy954YRa7sBZxg==
X-Received: by 2002:a05:600c:4fd3:b0:3eb:36fa:b791 with SMTP id
 o19-20020a05600c4fd300b003eb36fab791mr7181447wmq.31.1677747209928; 
 Thu, 02 Mar 2023 00:53:29 -0800 (PST)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002c70e60eb40sm14879858wrm.11.2023.03.02.00.53.29
 for <buildroot@buildroot.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:53:29 -0800 (PST)
Date: Thu, 2 Mar 2023 09:53:27 +0100
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@buildroot.net
Message-ID: <ZABkBwFbFaA/diL7@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677747210;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bE6B4gpAaYWwDqipbwdcpE+TSW3UikbzRfOn7GRt1DQ=;
 b=IlpyYnkNjoM1+PE1bse3pzFEb+N87DaJ3dPKnxT/z1XSECt+oAtvjp0rVSRjUek1iC
 H9OKhfbJafITIb00mGwAkNtwO7CtkHDVmm3GiA0kWXzIB1nATp+RJ7l9PrQ/PR5WFqkd
 UlcZseM5V6DALwtEyv+ITYrBEQsllPMgsHYoPW30K6t8EWebo9ospiWmPH/pCY+wDmtZ
 2oqQoSRya4LXOmi5SJG+NtqSUvrCXn6L6dyvltnfm3inkwn7Z2b/3nLUrR6izUl5nvjN
 xDUpqg9ygVOJ2I9zeksK1dj3xxGy+A3cAncvuwFHBn60AfIXBqUAcBtr7faqTVhT/buv
 roZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IlpyYnkN
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.7.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Includes https://github.com/ndilieto/uacme/commit/fe91f46b620f8c58805fcf48cb4f4a793c8a47a4
Fixes https://github.com/ndilieto/uacme/issues/64

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
  package/uacme/uacme.hash | 2 +-
  package/uacme/uacme.mk   | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 6c71f6b94d..063b0b57ac 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
  # Locally computed:
-sha256  0ec8e5bcb8ed2b532572ca4878d30b2a794f607b995348ebc176d566b64d73f9  uacme-1.7.3.tar.gz
+sha256  a638fe0878dba8fdda62f89e7a284243edbcd31b92c11b5cfdc7d3efd9547bca  uacme-1.7.4.tar.gz
  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index a70ec3a635..9b2360937b 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
  #
  ################################################################################
  
-UACME_VERSION = 1.7.3
+UACME_VERSION = 1.7.4
  # Released versions are on branch upstream/latest, tagged as
  # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
  # include .tarball-version
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

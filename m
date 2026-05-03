Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEABCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 10:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0644158E;
	Sun,  3 May 2026 10:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KryUgKRHN8hd; Sun,  3 May 2026 10:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7416B41415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777802513;
	bh=mIocvXmpZREAatXZ1cBr6GGN2jkgxg1tUgysPfPeWyY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZFK43ixD9cCbdG8lqsIGs6ZQsNB28jl+T28KQgELawIuhSTZ6khB1hoeiKeRLQQOS
	 ZqkubB13qrH9aAmyGKZBRUEWZGZGY7ym1MKeD7hqf88DnT6Cl7uxC8HiHhgP4MAiVz
	 7oNV3XX+InbATsU0evyTZiLzZ25+9futDX1rXo3TtYUdG+cenDXhhaBbkL/dUtmjzj
	 AgC3OL79YSeh2UFgJdLnL59ov0Gw8EdsK+4tnUcmwWo7tN2S8Mky0K8r7QGjSQvT77
	 ki24N360BZkoOaGmFwO4wYNeQppKYIT9/FP5+Z8E3mkw/DGHizFYcPRHzTvqF4yD1j
	 J9BWD8X+GmjtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7416B41415;
	Sun,  3 May 2026 10:01:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4EE9127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66C34066B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3KW5iMknp7N for <buildroot@buildroot.org>;
 Sun,  3 May 2026 10:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5DD4404B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5DD4404B3
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5DD4404B3
 for <buildroot@buildroot.org>; Sun,  3 May 2026 10:01:50 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-82fa8d6425bso1379349b3a.0
 for <buildroot@buildroot.org>; Sun, 03 May 2026 03:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777802510; x=1778407310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vM1agUtqHkRJHtzLlgbgJHnw0du9GBp5gCYUDwz0v+g=;
 b=YRZoYDzU5SAoPdlpVBXa3m8ZdOK1Jciz9Corla8WrInLuRF7cQJ3ecRaweyoKSAF7S
 mXSK5V4iKOOAaf+UgZOMDpsZI8c/Z5+Nh75UoKQNh8MTWaCibq5wM+bGHtcA60V0dZVs
 EWogZeX9h7ZddUvaZttL08iAjcPfHX8Q63L0XEgzIzwD/QMcQNa8aFr+qlO94CbeXVFO
 l2He5mRg5pO8A3x51tM1U7gtQFzsEhlhIc1OdEOo8E3SSnGuCBvYyROxZcgjgZ1+b9f/
 dI46l8TnbwI6xD5Hs8iyDVMyD+/ZLMU90jfy8g3blSIs7YzwUVzySQM95HapLXqN/sqd
 uz+g==
X-Gm-Message-State: AOJu0Yx6sOdwb3tUoWUVENCnzVb5VPzXElFRh2TSJuhfTJ3Z2mwCrKzy
 X0fBoPJ7ntM+0bzthcW5LVRIixrORAJj2JQyCP83ME0QfS2U2OCh94g50pM7a2Kn
X-Gm-Gg: AeBDietsspvDkS51uwSgJhf8IpLQGfIEqXf9qk5dNE44Rgq6A4mqY9pUQesawNeRsgP
 SWrdb/iqvkbcdxxPPhQ9X1IhzlRxcf1fSlmpz3CV5Qst+2Bid+1P6L0GEzUqEcSLDlhXOp1Oqow
 nPu4yX6SmrfgJzp0RGwjvfTfGxiRVUS7M6JXZxu5uQZkofSPzFyLYHTV964UTCmUkCvsJneleb2
 P7VDXNQlL8u3hVK6xyiOHv7VarqPVfkVPlxOX6Et5Ff+OMnzLON3qByHkvYRIFnWY6d7YeAdhA9
 zkuYCWQpD60urfUSPPPzWA/I1HMwesHJoWOpLJfrxTX/rZDzzdAnQTjmgZkfzl8ov1w6PftjTOq
 USH3j2JzE3JDX3DfNszYLkJ+h0XXlUL7cbX9gP6t+02utRq12tCPWtlRTM2rC/D+uWdhSn03n4k
 xb1xbe/nmWlEmVkBMedKkhM3eeT/jAFuOrom8h0rAdS/9m
X-Received: by 2002:a05:6a00:bc8a:b0:82c:249d:d84f with SMTP id
 d2e1a72fcca58-8352d23cac1mr5878092b3a.37.1777802509683; 
 Sun, 03 May 2026 03:01:49 -0700 (PDT)
Received: from fedora ([47.31.117.202]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83515836e8csm7329090b3a.7.2026.05.03.03.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2026 03:01:49 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  3 May 2026 15:31:27 +0530
Message-ID: <20260503100130.1637945-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777802510; x=1778407310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vM1agUtqHkRJHtzLlgbgJHnw0du9GBp5gCYUDwz0v+g=;
 b=EnQRvK3I56KmxWT0yDSJk+yBbEn/FwkImITaIvUrgGGL+Qo4Ho/ZqEY4W9QSr5FtoY
 P/PpK6B6L8wvIaXfy2Kqn57H2XBQBWlpM/DIIeQDOzzW5kdM0F5U7uoUG9PUoPpupphf
 BN+8XxMjSblY+LutQhleweYaudarb4Ecy1UdYvoKTeJ3ZBxCTjhboYQgulj4wIu83cej
 iVHCQDJqtFXPru2EZXjhF+joN8QSPlfCiZRhBjxuG0YUg3vswbk8OnxdEhgeHR3ibBoe
 5+HTEIB5JObMdPjY5GNtoOjtY2DMQjDTMdDftO+7Ph0CWwSXC1vXEsa4YCHVILIpEGtH
 BaRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EnQRvK3I
Subject: [Buildroot] [PATCH 1/2] package/dos2unix: bump to version 7.5.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix dos2unix error on empty input
- Add new option --error-binary to return an error if a binary
  file is skipped

https://dos2unix.sourceforge.io/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/dos2unix/dos2unix.hash | 4 ++--
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index c48f70d574..720a457ce0 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.4.tar.gz.asc
-sha256  f811a2b9e4a0c936c61ef7c1732993d1820e5cf011f4d93861885ccb8101ca21  dos2unix-7.5.4.tar.gz
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.5.tar.gz.asc
+sha256  75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33  dos2unix-7.5.5.tar.gz
 sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 8794aa46bf..99454aa2a3 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.4
+DOS2UNIX_VERSION = 7.5.5
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

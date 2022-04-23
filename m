Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85184C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 362998305C;
	Sat, 23 Apr 2022 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7v8F6_r54hj; Sat, 23 Apr 2022 21:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5E08301F;
	Sat, 23 Apr 2022 21:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08371BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE72B40363
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FA_1LAK-v-0E for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 21:01:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE96B40004
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 21:01:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q7so8008415wrm.5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67gJwtOxt9CkCv9vW5um9Py5CpsZqyqOGHEIt/vH03o=;
 b=EuqP6CB8v0IZoKFu37y7h7HwFAfYL3ZNvp79Ioa87yS6CgWZ8iLYSbwzwZJjWfDAHL
 CFK51e3RA2bLzTK54s6PBaM4EFfkcEu02R8upE0kS3H548o0Y8dpvU1lokss+JV4TCHS
 a0fl6wGJFfEzIcM1VEq1e/caSFe1eLr6A6C9hhDHYQ+grjNQ5L0rd00X+CIPem2/I9qH
 DQSVTZG/2LMYrjstBsde8WDo/8LsxruAEbT7OT3PzCVJoVOK6d80lrel+Jr6HCTgEpY4
 GMN4Bw3S82OAWscSXXc11IMf7qED9teNhLFaFz6wN04QOBv5S5HUqELt8jAhjQoRoOsg
 TA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67gJwtOxt9CkCv9vW5um9Py5CpsZqyqOGHEIt/vH03o=;
 b=ukM8AUSYf1kBqqLjhSv2nWN44Jqmjp9jm65uyN3ZSPUgcO/4SxvUFJ3Pj/rw08rZw9
 DJcOv2W86R1KoX2SoRhU8FfffzIt1BpZQQyzFcz4baTiwgQ0ycbt8sEkKxtGG/BfJZOS
 hmdskoXmzRyUjOOCOoWlcqkm4ldKy0XbSoAi666nC9DZX82NU0/s1lM6t/MCZTDn6ATv
 4CnObKFoJMklkN2jLh6EvqHzCQ9VvkIiF/p8qDWIh1RaTcaN1jMWLrsHu1eHfakh+NbK
 X0lLjbJJK0cvTmKqOLIWFJhSTK8tD1uSz9Lj4TKG+s5Z7Ko1XlJCM/KZy4xdVVE+FPJy
 I3XA==
X-Gm-Message-State: AOAM530JnboCVXRvRjeav/eaVTeK9yQCHMLP4lT6OGRt+oD8+K4uDAs8
 j2iLXGWlyhWvxXr5yZZaI8vL48XPn+A=
X-Google-Smtp-Source: ABdhPJxsI/D6Qk91gdyeS4XZWbfVeRc1c7qwTD+udXFOCGUahaKkbDiPcsm2OO5l7+N6WUe6zy08jg==
X-Received: by 2002:a05:6000:1acf:b0:20a:a0b1:a479 with SMTP id
 i15-20020a0560001acf00b0020aa0b1a479mr8349081wry.228.1650747690810; 
 Sat, 23 Apr 2022 14:01:30 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b0020aad7fd63bsm5875954wry.61.2022.04.23.14.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 14:01:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:59:34 +0200
Message-Id: <20220423205934.446813-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcre2: fix legal info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 10648db92bc5c4bfd49b58ce4f1c213defdfc7de forgot to update hash of
LICENCE file (update in year:
https://github.com/PCRE2Project/pcre2/commit/3103b8f20a3b9944b177e812fde29fbfb8b90558):

 >>> pcre2 10.40 Collecting legal info
 ERROR: LICENCE has wrong sha256 hash:
 ERROR: expected: 15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025
 ERROR: got     : 87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987

Fixes:
 - http://autobuild.buildroot.org/results/275c5478d63d3d4016d440870e96f04230df69d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcre2/pcre2.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index e4f7980749..e3fe6b2d53 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -2,4 +2,4 @@
 # https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.40/pcre2-10.40.tar.bz2.sig
 sha256  14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68  pcre2-10.40.tar.bz2
 # Locally computed
-sha256  15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025  LICENCE
+sha256  87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987  LICENCE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

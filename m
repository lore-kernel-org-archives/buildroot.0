Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8730ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 16:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32B441848;
	Sun, 11 Sep 2022 16:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E32B441848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JltpnRlyNKCa; Sun, 11 Sep 2022 16:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10E274036F;
	Sun, 11 Sep 2022 16:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E274036F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82FC11BF28C
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 16:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 651BC844FB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 16:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651BC844FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P96naXW7_Ih0 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 16:26:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7B3844F6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7B3844F6
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 16:26:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso4528404wma.1
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 09:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dTKNKwkKRXS4SDGd2q+T9UNfRQpwR6XJzEqYUl27WRI=;
 b=Zoqk/iepzFFGk56xWLGjL3i9N86fKzRSzqercK1zy7CMS2m/zNqMs4e9CkHhrLM/gK
 Q6KdVunPeN5PaRidrYZw6bvyd5IF9ZfMqC2W7wH7lXXqdT/dsIQzM+1A943to12BuCRc
 3eDpqsjr4BZm6DEh4d9Ys5PMK8oJoGCbz8fhiYLgDKQH/cotEBrXvCk5h4TjilUdyIC/
 z4sDMP8th+DM5bfNed9lKYzayXg8estKNYtDaU7A1iwqXJRnbiezCXhL8iS3dMQSd1na
 eokT6mJn+ut5pQJC1Ik4qSPLRUEGdMNJ0bNdsehQ08pzb0oDVqLahPxzKGx8ogLRlhky
 nWIQ==
X-Gm-Message-State: ACgBeo2mNPKjGVf7TuRNYvfa8j004vmaBEILn4Q38Tx6BPEasdMC6RMF
 j7NBqOX77GXyfFN9+AXaK0dHWTh2JKY=
X-Google-Smtp-Source: AA6agR5OSjwMFTA8sCkc5TySan/NI6qNIvLRyRWn6gTjaDbttWlid4vEd1ie2NFqlsUdjOR6rfKKLw==
X-Received: by 2002:a05:600c:43d3:b0:3b3:2f1c:f01c with SMTP id
 f19-20020a05600c43d300b003b32f1cf01cmr10705283wmn.152.1662913559506; 
 Sun, 11 Sep 2022 09:25:59 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003b4764442f0sm3937666wms.11.2022.09.11.09.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 09:25:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 11 Sep 2022 18:25:50 +0200
Message-Id: <20220911162550.2257072-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dTKNKwkKRXS4SDGd2q+T9UNfRQpwR6XJzEqYUl27WRI=;
 b=FIvkO7P4lECluhCSHAoZ6IOhzRAWcTma9qwY9X0NxZbMd3gtmHVSdofbWD+nuPKU9G
 cWEI3vjkW5rs63ww1shkdROvkXxmx1bE9bxHS7Jtrew8L96hqjZqysVYy5qHelOvaL2q
 dVmEHGUuffoX9LS1T26+Om8WGV6xrre3Im8B+FW67Swvz67hAMgKyo2aqJA5ETTGOb3g
 xfxJcvtIjo2abmO4CSKJvRF+0GCCninRNb8JKAB2fxjwBLZn6w13qLHDUfIyN8F0RUjo
 HoJ/Y8Uc293rnRG7E/UHuW1sPiLrVgDReDzpfKFMNYSpencbwOWanG85GrB6g9SB33cQ
 O14w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FIvkO7P4
Subject: [Buildroot] [PATCH] package/luarocks: use two spaces indentation in
 hash file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/buildroot.lua | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 2d160f02b..3c044d89b 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -265,10 +265,10 @@ local function generate_hash (rockspec, lcname, rock_file, licenses, digest)
    local f = assert(io.open(fname, 'w'))
    util.printout('write ' .. fname)
    f:write('# computed by luarocks/buildroot\n')
-   f:write('sha256 ' .. digest[rock_file] .. '  ' .. rock_file .. '\n')
+   f:write('sha256  ' .. digest[rock_file] .. '  ' .. rock_file .. '\n')
    for i = 1, #licenses do
       local file = licenses[i]
-      f:write('sha256 ' .. digest[file] .. '  ' .. subdir .. '/' .. file .. '\n')
+      f:write('sha256  ' .. digest[file] .. '  ' .. subdir .. '/' .. file .. '\n')
    end
    f:close()
 end
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

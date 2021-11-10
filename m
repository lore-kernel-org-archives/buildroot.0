Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1B0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 17:54:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83DEB6113D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 17:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83DEB6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CD660B1C;
	Wed, 10 Nov 2021 17:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7ILHWyc8HDJ; Wed, 10 Nov 2021 17:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B333E60AF7;
	Wed, 10 Nov 2021 17:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93B6E1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 17:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 818E74008C
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 17:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6qFj3Z66jFB for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 17:54:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF3C940023
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 17:54:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so5412991wra.12
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0+rF2l2wYotmsLvJrHXHVbu21pPzMUZqvBAASao814U=;
 b=O2c+Ydg+wpCalTnq5vv4YzF/D/6XfUueaDJZl7TgEeazDZ9AaKDcEf/f5Rhpe3AhzH
 V9ypmiiNPu16Zpaj+Wi/6ISFN+OtMruSaCWCIt1AZHbe/IfL4sFlPabZMl2ioctyGyz6
 UAIn0HV80EHJHqscZbp0qvx6I1Rr0qHgMmVzUpjzvKybTB/iHSQ4RPBQppmP2G7fClgg
 Tw9negGHgITa+rd4O4Nx58sTnU6bqMMP1vlkrgFd4Q2nbgeBmuv07hTGrLkd3tOshTVh
 ocQD+NG3mbouDJT/h//WshVCtMoeVLsbMWTvJpbTDidDHlbe6D8vPzA8ewvmEXKNmt+x
 /eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0+rF2l2wYotmsLvJrHXHVbu21pPzMUZqvBAASao814U=;
 b=rrVK/1NNT7UalNrTz4xL3uNSKMFDZdZJdtBCZ5vqmSs6uRYKWEhUb7IdcPrw4d9ImZ
 qvAo9YJKoHuCsxRn9cMzIguPIM4aLuDGPxUINNMpkMLo1vmdbTbC43hCiA7R0b6kiyyb
 9o5BA5nYx8LJXjZO0VKeZ5IJrXff/mdT1X77w2CP+ap0t9K0sZ9N2iFZPUgig0XY0p6A
 6MneXrbuvetvmhezZKGMQvPHdSBqWfFLLXmLPZbY1tOoJCVSVISqRkQNtsA1kEzZPXAC
 sQVYIeECofL3pnfxp/TO54Cgcmw0/op8yp+118IHnsKQ2exRh3Fooc7OQ03YOtSj7Zzq
 vUVg==
X-Gm-Message-State: AOAM532LSQ5MJGqxkbOa4+tt5FIxg0kOYbmvyQcRz48JJeq5s1TchsvV
 IDB6alB6KFdHVmgZlUz59Abvdig2dP8=
X-Google-Smtp-Source: ABdhPJwwkYdyEpWnU7u79+JSen86MSgUj2wHzr74/xBGIKPjUfRmApsfcnAWIAoEXpT8sp7SYVOPzQ==
X-Received: by 2002:adf:f681:: with SMTP id v1mr930633wrp.367.1636566854750;
 Wed, 10 Nov 2021 09:54:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j38sm6882894wms.29.2021.11.10.09.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 09:54:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 18:52:18 +0100
Message-Id: <20211110175218.1927678-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib/lib_mk.py: check
 DEPENDENCIES
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
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Check that {FOO}_DEPENDENCIES are never overriden in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 0278354434..d09922f724 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -88,6 +88,8 @@ class OverriddenVariable(_CheckFunction):
         r"_SITE\s*=\s*",
         r"_SOURCE\s*=\s*",
         r"_VERSION\s*=\s*"])))
+    FORBIDDEN_OVERRIDDEN = re.compile(r"^[A-Z0-9_]+({})".format("|".join([
+        r"_DEPENDENCIES\s*=\s*"])))
 
     def before(self):
         self.conditional = 0
@@ -123,6 +125,10 @@ class OverriddenVariable(_CheckFunction):
                         .format(self.filename, lineno, variable),
                         text]
         else:
+            if self.FORBIDDEN_OVERRIDDEN.search(text):
+                return ["{}:{}: conditional override of variable {}"
+                        .format(self.filename, lineno, variable),
+                        text]
             if variable not in self.unconditionally_set:
                 self.conditionally_set.append(variable)
                 return
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

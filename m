Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F09AC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 06:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C4E84C5C;
	Thu,  7 Aug 2025 06:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKDqjgWG45ei; Thu,  7 Aug 2025 06:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5641E84C56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5641E84C56;
	Thu,  7 Aug 2025 06:23:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C846D84
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A2274009B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysaRgrJ25WWF for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 06:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39A3240095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39A3240095
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39A3240095
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:38 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso4133115e9.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 23:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754547816; x=1755152616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EV2AeU9i1DBnQBTJLL2pLWHcbyKRNhqdN5mjcK3d01c=;
 b=qT78xRjlqSi+Ncvd4uug2Y5/f086EjUfw8kUZcgz/7whPlTtxe1dJ2aDQmUNKSSzYE
 HWAsEJmplW1elOKvrRUaMQ/X27SLYkgW+7CRUgw9XR94rIq2W1cWSb4tnmZpyEmo7Mzi
 X+3X+CzZKWa8C2yHt4slzRjir3IqRIXw6hlEWL3HE3lbzNR9FXTHYJNd/bkzcw/0M6hU
 zJLTnqMfAPievOFb2aW1eOQTyeE+p60Aetymci86VXnb9xQodwhjtEa2fSepdasjIFP5
 xHgsdvrCMvG209Lo+bH6VIbQCSIBqBlFZvq7bfGI5qO1IhoQoneBcENOpNu9wI3xr9eo
 oXsQ==
X-Gm-Message-State: AOJu0YzlZDvxKnO27r8ObGETw+qJWvZYLPd2ydXsjnytIdTBa1VEanSW
 3ocuFf63S1VivpIV4w4zNZ9o4YznifybClek6QFk+auCVHzl0hYpq6p/VZ7dYhVu7O6RUHK/bDI
 j1Hzngaw=
X-Gm-Gg: ASbGncvsLiLKHI6/ns4Cfke97PQw9RZNHUR2aTxKCEWmp65F+tQSn061Z9Rv6u6d4Q0
 5KgAT3yxYwmIb1qDZJ/zUW5/iDxkMKFSdWQ5u4YukChtLcFfZ3zEC/qImKUvnGP16+9/FEghgRs
 H2CR667jcL/1MCwWkAjYi5D3qxqncFZcs01m57wdjvkAPEJsUiUXoqkZAlceCscbV5f2Rt0bdtn
 Q9yIfPjfvvajzhtss2Mt8bEQL5r9vPPQqk6rcW0NA33IWRv/M9ErCQj2BzSY6T0Tg13zYVFdEeZ
 VZlyZd9aCZxDjB10rKOxXvD7s6qsquCZoXJJs9Cu2HxBNxEgCrbz26qZnpOxcObE8m2fb4cGzUh
 uV9Y9sFmxhXlsOM7meS5IOjVCRXV5vy5JlqfxkSbKMlQFDw==
X-Google-Smtp-Source: AGHT+IEzxfcKPTB8NMQ4ne6iK0Yhkg4ygDt8Bphtrh7WDXwGsv1YdepBHkIGmRjapP7gM22/29wT0g==
X-Received: by 2002:a05:600c:35cb:b0:459:d645:bff7 with SMTP id
 5b1f17b1804b1-459ee8172a4mr13083545e9.12.1754547815775; 
 Wed, 06 Aug 2025 23:23:35 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:43e4:39a6:e147:9926])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm217803345e9.9.2025.08.06.23.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 23:23:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu,  7 Aug 2025 08:23:24 +0200
Message-ID: <20250807062327.1637333-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
References: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754547816; x=1755152616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EV2AeU9i1DBnQBTJLL2pLWHcbyKRNhqdN5mjcK3d01c=;
 b=Xfjj7j0hEV2XaCeSbHXtStJl1Faj7ozCFiGtzoKMeMfKguSN5OCggUHnYhkqV8TBcC
 8+9lchXrZrINLwaoSp1n5IuXg3GdXi6ikJJU1Cbuho15YV6xYMYx2BBBJxp4JX2Ojnvd
 eTgOpAAKghdEiNsdP7jAxUSfNckSNFpDeBFn4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Xfjj7j0h
Subject: [Buildroot] [PATCH 2/5] utils/generate-cyclonedx: sort dependencies
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 3ff318f11a..7fa369d7c7 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -203,7 +203,7 @@ def cyclonedx_dependency(ref, depends):
     """
     return {
         "ref": ref,
-        "dependsOn": depends,
+        "dependsOn": sorted(depends),
     }
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

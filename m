Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A7CC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748D884232;
	Sun,  2 Jun 2024 20:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blR4dE17MAuD; Sun,  2 Jun 2024 20:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7653E8336F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7653E8336F;
	Sun,  2 Jun 2024 20:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1444D1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2AC4831DE
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9I14VYOGGxRY for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEB4481F2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB4481F2B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB4481F2B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4212b4eea2eso21566335e9.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360795; x=1717965595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YUVrcIXkKL9rqErODej2j/3g8E4koN0kFEHhkbNLxk0=;
 b=Md7uDEdl9autV/uWa/CAAFOTuTse4ww2v8b5nOWqAUb0S4Xn5AJsT9Y0lPhQPWz/1K
 HFlTftLzvM3BS8ao4szM/uOaMZ0ZzCzw+unNDt3LGEpUOTRJ5Eb4O0QRM8SD3KbZJzWy
 /3f8flQtrSr90qLsr5m3v0JWMWeGmQQU2OOcut2K07BsVjUgBN3w1/372brMwsnBsdJX
 hPkAw6jZw37sOnzZEvk8bPkK3aTUD40H4VUM8Y+2gLfSg/V3qEOaW9j39R+K3n3Vmhe2
 pQ0wrPH4SaTyKX4MKEf6AmjNtH8/24C1QAMI8/qsYnrOGaTe9ngL5jkSpfv+sZK4GADK
 px4w==
X-Gm-Message-State: AOJu0YzxMgV3sQotkb78GDEOs++E+/+7wSyQvCxYCrZ8wA4gLU8vHQkc
 +eOKi9c4CHPZ8zzjtoqBaC/pbb+fwY7YCaAp4h+gpa4rQ0dMlDXa/SZO9A==
X-Google-Smtp-Source: AGHT+IF4etplQPpTp9ezXoGFRz1oWwxxPLIy4HlmL31VxjmFAh0vNgrv8eYH+I2VF80NIhoh93hgag==
X-Received: by 2002:a05:600c:1ca6:b0:41c:7bd:5a84 with SMTP id
 5b1f17b1804b1-4212e07548amr64358035e9.17.1717360794656; 
 Sun, 02 Jun 2024 13:39:54 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:40 +0200
Message-ID: <06cc653141aae6a1aa7daaed0828e5eda40f1d15.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360795; x=1717965595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUVrcIXkKL9rqErODej2j/3g8E4koN0kFEHhkbNLxk0=;
 b=nL81Wevlj1+8QoaQGAeldKMMkEam8oEA7zkplL2EfJEOoQHkHPXcbAnVCPI6iDdc7o
 SgzJINQh0M7DCB67M8TVgI6cHkGDJusLnNizccgy27IJMlM4+iqaQVl4LzbRP1Q7KXMd
 5WsiCoG5c6ZhsYZAvARuKkTl6PFMr0juffcNxiEZ9dLO4BUoRUvE9LscP4juwsGqad6k
 UzPebe3FEM0/29gO/Y+sLmsfzo9lEiPqJ1zgkaFU+K6XNQKPj1XyN7pPI9fXLaMCTTeX
 wKD6pXAoU4vtUTXLgyFPjd++qpffzXIta13xI4G6YvushBF2qmM8r5lVWj3jXRzKOUqo
 sG/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nL81Wevl
Subject: [Buildroot] [PATCH 04/16] utils/checkpackagelib: instruct
 shellcheck to follow included files
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We do have a few shell scripts that have source directives (either with
'source' or with '.'), and they all are currently either globally
ignored in .checkpackageignore, or have shellcheck directives to ignore
the source statement (SC1090).

So, we can safely instruct shellcheck where to lookup for sourced files;
that does not trigger any new error.

This will alow fixing some shellcheck errors in later commits.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/checkpackagelib/tool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index 907ada704f..e12e1fa406 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -31,7 +31,7 @@ class Flake8(_Tool):
 
 class Shellcheck(_Tool):
     def run(self):
-        cmd = ['shellcheck', self.filename]
+        cmd = ['shellcheck', "-x", self.filename]
         try:
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             stdout = p.communicate()[0]
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

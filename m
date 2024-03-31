Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C344CD128A
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 20:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 090BF811E8;
	Sun, 31 Mar 2024 20:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSuJaPb_rr80; Sun, 31 Mar 2024 20:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F2F8120C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F2F8120C;
	Sun, 31 Mar 2024 20:34:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 509621BF422
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AB1240545
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpFzDj8lHfjG for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 20:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10C2740539
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C2740539
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10C2740539
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 20:33:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso2559578f8f.2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 13:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711917236; x=1712522036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OF9P8b/R7U5coqZ+aZRXyLuq3r5WCYXGyJ0q7FRdsIw=;
 b=t2MKN/8tKu6LNxTSXy8rEK3MLNcEWq42oaHXvm8CncRheyXMlWcLLxdg6HofI7dO2c
 jQGa4uI6KNF1CZ+nvjo2dkUxTk2U4nzwVD9J3JT4lDwl0TtZ1mzqyyBRtusLah3oosot
 VcOAFkUsFbKkKmNvsFIOYCPa8pjdwVNlAlN98nEx3Nhp08LotcVJUDtF7KMVBKtci8L1
 fYZn62XBtZdgikmlflrJ/nsPXmefxZ4M4jZlTP8uUPzntHI1ZRo/YIuQmMzcG2D6VqUP
 83WB7i+Ln4pjvNXOhbDLlMm8bBY8XoLHB88SFgNDcLykCyXsdPPKt+6XNPE+WnbnsNA1
 lGSg==
X-Gm-Message-State: AOJu0YxgvKIp/h6Bmt9LJKjkxxG+brKAeHCkK+kVkjDU/N4K9Q/68Aiv
 aDk1sixrfbDFlM6hSe6QjI7dXgEQtVATYz6cE9suStdEapx7VXRlriMKNgFA
X-Google-Smtp-Source: AGHT+IFDufKMKEOyt8H8myjgb3ORTdHyRuZhoZQr3ZPtKUwyCbyf4Xa4CP2dALr6DwExdHQX6z4Yug==
X-Received: by 2002:a05:6000:1143:b0:341:ba31:b8bf with SMTP id
 d3-20020a056000114300b00341ba31b8bfmr5513773wrx.58.1711917235623; 
 Sun, 31 Mar 2024 13:33:55 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600003ca00b00341c563aacbsm9934825wrg.1.2024.03.31.13.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:33:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 22:33:54 +0200
Message-ID: <20240331203354.815139-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711917236; x=1712522036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=OF9P8b/R7U5coqZ+aZRXyLuq3r5WCYXGyJ0q7FRdsIw=;
 b=FEA0fIBvwtxk3ySHNoNuiqQmSVafP3/81Dj0XQE7hCTJXt75RAat/6njOyHKAMLyna
 ou2M19YnutP85FyOrw59sDf55nDxUT0cnMtWEeAUjN6WsmtRhDsQo/HPEdAMtcVavKLX
 M1XYfnGxcnGsUAQiJw17p1t6TSZRpwB85QpVpuqw93fQYtou2/HrTrMuALcBwbYO86Lh
 i5qA2C7FW894tfB7nVM4GbCQEgpZPUai/DN5aIqLOpzibQfa5/OyIqLiiVHmsIb7f+UM
 Ug08DXDEJBVGBH/B+u0NquLUvjdOzMTMKgAJAHWO6K611fus5dHPJ9WuzuMdfVmKjo0C
 3AMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FEA0fIBv
Subject: [Buildroot] [PATCH] utils/check-package: emit library name along
 with check function name
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

Currently, when we generate .checkpackageignore, we store, for each
error, only the name of the function that generated that error.

Although we currently do not have two check libs that have same-name
check functions, there is nothing that would prevent that, and there
is no reason why two unrelated libs could not implement checks with
the same name.

If such a situation were to arise, we'd have no way, when parsing the
ignore list (in-tree: .checkpackageignore), to know which of the libs
the exclusion would apply to.

Fix that by storing both the library and function names together. The
leading "checkpackagelib." (with the trailing dot, 16 chars) is removed
for brevity, because it's present in all libs' names.

As a consequence, regenerate .checkpackageignore.

Note: people using that script to validate their br2-external trees will
also have to regenerate their own exclusion list if they have one.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

---
Note: for ease of review, .checkpackage has *not* been regenerated in
this commit; I'll re-submit the patch after reviews, or comitters can
decide to regenerate it when applying.

Note: for example, hypothetically, we could have a lib_hash (that checks
.hash files) and lib_mk (that check .mk file) that both implement a
CheckHash() function, the first to validate that hashes are of a valid
form, the second to validate that a git hash (in _VERSION) does exist in
the repository pointed to by _SITE.
---
 utils/check-package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index de41891b56..373bc63f52 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -224,7 +224,7 @@ def check_file_using_lib(fname):
         print("{}: would run: {}".format(fname, functions_to_run))
         return nwarnings, nlines
 
-    objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
+    objects = [[f"{lib.__name__[16:]}::{c[0]}", c[1](fname, flags.manual_url)] for c in internal_functions]
 
     for name, cf in objects:
         warn, fail = print_warnings(cf.before(), name in xfail)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18625F4180E
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 16:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDBDC40D54;
	Mon,  9 Mar 2026 16:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34DHNuJFVp0c; Mon,  9 Mar 2026 16:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E041041193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773074494;
	bh=bJPXCdcGUqEz3+cohY00nXY0nZsp229wHArL7al0zoU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GjZASAzIpSBZ2t7m+k4zAEfhp4GPjMrRWVhzCZAnEK7QpVXv+pq9c3+z7N14hcN44
	 KJaJ8UOgqmdrK1DgfTBfkO8JcJeVBuxCaej53kSKm432WCus7Rk1gO9W46CeSvK1uq
	 ZShSlmbCKMvkGj2LUr60joIhnE4tKmHiV+texl2QiT8igsBycayYLFol/9qKBFLOp1
	 uPL/wqqnvuEYx4zLRgR9A/cxWvw3kz4cPZT4ZKi3nZ1HfuLxJByDpdt/pN9TOANhY+
	 CRMNtmYrlCiOuXu+oPbAUiYzkHhJf6t0A90t8QDtqV35tLNaQe6dr9ygtEVFg0X4BW
	 1Gb4eZ2WAAhhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E041041193;
	Mon,  9 Mar 2026 16:41:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 359D9158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 16:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B41E41193
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 16:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSv1V0wxLCyw for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 16:41:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A6C340D54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6C340D54
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A6C340D54
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 16:41:32 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3599126be32so4930051a91.1
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 09:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773074491; x=1773679291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjJW6SoyihdW8WDUZi3jCzuVqCzuxOWbJ8gHZICW7jo=;
 b=vTbFpyBgAbMdWPYXZps8W9+SM4RZEo72v6O2tyeVNFK/T8m+nSpTFjP6OWeOWlKOhb
 Hibh+Pc1ggQPtp7VUDBqXRFY/0kuAGKa5vS1OIoHQJUWpV+jBMWZCDzBvDs1GdoWizFk
 xfmZ4WqT9iDIqWF1emDww7aey9rHoMMG8aFupwpkx+qvMGJV+GA/Z/2l/OLQ4ye2K7xA
 txd/byM+hfkAnKEpyXZZP1A5nNtim+JqieF8+wmpeCN04mURT91SD5NKdW4yU1mw5y5N
 pD8J9wK6Kzy+x4voqnmzLCZ0es7ThsWSRemA0lmxITCciasjSvoZA/p+Oaxy7WxcYoX+
 ZqQA==
X-Gm-Message-State: AOJu0YyIcn54iq1ffmPbX7max7Sb37BgmPSvk7sWSHhRMk/Tx0ZJ9ewR
 FdN1ndlWhOcTSL2NwKpQP1ytNhagN0McI/YKul626iSd8iIb3wRaa1h1szuee70e
X-Gm-Gg: ATEYQzztd68ZYHSj2I9gGI7K2Kv9/njMvxglibnz7SgJJ0oSV5kdLr7iENTWl9sPJxA
 nsYbOPXYMbrARZKrrIlpzLqjcvr4iEDLd6yrPTmI8xPsL5+y/ildQiiL4cl3lmrkTGhYjPGDqNW
 js0e6ELF3YPrfDMB7/FFGxM9FqtCcb/nleSyib4H2nG6fkTpoJbm5Fblcvv6sBlBqc/sfazby4B
 nARbY/ErAA/Rd6arlHpRUvDoalrJirt7qpVgJR8OGKA0vqAL0kYu+P6VA0vyqfh+OdARBJ27qKC
 LT7+xy5Fr7zHDK4IFG09bDUrr6gim2vxf2xfm3S4XGfPoC3BUAAYfFZT3x2fli1HPbzTPR4Yl14
 rJ/x5GVPvyheBYs04/ur4iZI6XcP99/Cvh1UcxOz8nvptRROZxLk7N321uvA/g6/rpehcUGOyf3
 QfFheaL5zSpEfu4gul88H7oojmeTPFerGpQfc=
X-Received: by 2002:a17:90b:38d0:b0:34c:fe57:2793 with SMTP id
 98e67ed59e1d1-359be344cbamr10575307a91.20.1773074490686; 
 Mon, 09 Mar 2026 09:41:30 -0700 (PDT)
Received: from fedora ([2409:40e5:11e4:ac38:b8af:cc76:7422:f4a9])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c739e0cb73dsm9974774a12.11.2026.03.09.09.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 09:41:30 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon,  9 Mar 2026 22:11:14 +0530
Message-ID: <20260309164114.58833-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773074491; x=1773679291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tjJW6SoyihdW8WDUZi3jCzuVqCzuxOWbJ8gHZICW7jo=;
 b=XUmtqaBg/Bau0GbYcY4Dx3V9WL4yUvo1mQyuqX8rCbWzCGT/CWChKoyc3GPt3UZttC
 M5v3F4D2uAIrCVZb5yCnB71nqBvRJalfGLqHba2289fP0gyQDehPDz7rUNzSsaQdnvS8
 n14sRAkH6zJqQA02cm8Hf3WqLDeuXyMs/UB4VMRyKSlFfE3z760nfHoKxvJPIRp09ykR
 y1pOt+wxjNkYSakuat8Nxe0SZeE51ohTNIOUHm3+ZFEARfUEQNvBq+nBslCX8+C7f72p
 tnVRZ9sG6xrEW1B+k6eWpZL5Y7vxQpBkzKefmvpUNTMHVdP8b3Ug6bLOV5tZO1AVh/t2
 30gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XUmtqaBg
Subject: [Buildroot] [PATCH v3] package/which: fix build with GCC 15
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

GCC 15 enforces C23 semantics where extern int getopt() is
equivalent to extern int getopt(void), which conflicts with the
typed prototype provided by system headers.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v2 -> v3:
- Fixed patch file format to include proper description and Signed-off-by
- Corrected to identify GCC 15 as the root cause (not musl)
---
 package/which/0001-fix-getopt-prototype.patch | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/which/0001-fix-getopt-prototype.patch
index af9597242f..afae321ce7 100644
--- a/package/which/0001-fix-getopt-prototype.patch
+++ b/package/which/0001-fix-getopt-prototype.patch
@@ -1,8 +1,26 @@
+From f1d07e5630628a7d218936b3ac3292daf6a7ba77 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Mon, 9 Mar 2026 21:43:58 +0530
+Subject: [PATCH] package/which: fix getopt prototype for GCC 15
+
+Older C standards allowed empty parentheses in function declarations,
+but GCC 15 enforces C23 semantics where extern int getopt() is
+equivalent to extern int getopt(void), which conflicts with the
+typed prototype provided by system headers (e.g. musl's unistd.h).
+
+Fix by providing the full prototype in the non-GNU fallback branch,
+matching the standard getopt() signature.
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ getopt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/getopt.h b/getopt.h
-index f080053..f080054 100644
+index f080053..081334f 100644
 --- a/getopt.h
 +++ b/getopt.h
-@@ -102,7 +102,7 @@
+@@ -102,7 +102,7 @@ struct option {
     errors, only prototype getopt for the GNU C library.  */
  extern int getopt(int argc, char *const *argv, const char *shortopts);
  #else  /* not __GNU_LIBRARY__ */
@@ -12,4 +30,5 @@ index f080053..f080054 100644
  extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
  extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
 -- 
-2.43.0
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

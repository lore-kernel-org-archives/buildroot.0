Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3BFEDA6B2
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30357600B3;
	Tue,  3 Mar 2026 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALzYnKwrWMHo; Tue,  3 Mar 2026 17:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F95A60604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558394;
	bh=F6QdxSHcCNY8cb9Nh6AdZoleowMyeaie/CUP1vlwbbI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bpyhNOrvFYYybA24IEgSGuUuKcZKmmlhQzbmHTu4hdbD7RS8014ZQqQQGdCNPqQh1
	 lrtxU3EdjdeXWvz6Z1M2QAEmygEELkMSpYmY/GR7FCc+M4Hd54uSYJU3sgQJtUlIhQ
	 hx8mVIBHJtzbzJiQGDy6AZ8O0HwwRPuJF5wayCgO146gLJPZ9vLlGalqhVi7a8Z12X
	 Gbx9yIihbMjKxry6H3g0pfKaAVCi6Z5+0VATDvtNaXOu93QWh09p9cVHjF2JRupuJa
	 VzmOpx0ANxHVwKGPopo00Dzy+WHEE1+XmlslF+71uyMDsrhB8yx8nXY4saUSOjwx6u
	 QkMjVRBzOTBZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F95A60604;
	Tue,  3 Mar 2026 17:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A25F25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47BE183196
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gWQrfWZn8PM for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D35182D0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D35182D0F
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D35182D0F
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:19:51 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3598e065d8dso1163053a91.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 09:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772558390; x=1773163190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+QJq6WCrN3ZlgVyHUqhYW11Roz8Q9xX3i4IZ1NXB5Q=;
 b=dGCx9/jnOHIAoFuXi/wnaeUpoOve2jP6yMhRsWKYPt17uL8OI9XS/UN3AfAw7Vqvlr
 Gv0i9BnzUWSmV3Pafh5x3VITWO5FflS8AoqA4l+OhCC8PYJV0hLS6CSm4A+uLmtZRkps
 vBmeCjrrLCuyyQt/p+QUryqwCHqFaC9TtAf2baGHOk8qmdv6/Qb7lX6afPgCYyQstIut
 abrKeJt+4omO6NYvuU13DyceRMvCiN74PXjNzaPLBR6VjgpDgCN8pnsirTSvVk72PMaC
 GM72Oz4X2Cl2+17a1+BBfrNZQv2fcMR2YFjrFsk863ZJIIx1uOF1KX22g1cPQCIME8yv
 VR8w==
X-Gm-Message-State: AOJu0YwQlOAquN4lTcT8jShQqYAFUaEatv3Em2QDFpi/JnlWsXNdf3Ye
 PO30IFw3Y8n6/5U62MZK8NjKHWSKEyJY0Aghr/vr0NsnIhkQWCv4YvhEnT9tyw==
X-Gm-Gg: ATEYQzyNsHsvN3JZoAg3SY5h5Wita6ZlsqUD1bhQSc/d6W6KLvtAWBMiCicwnJ1+qFR
 +xkzSUvwLE08rB19HaRUJKpkfRbJGF86G09Yv8vUloBJhwW5TdFE3AmuXt+nJENlQpyiIu7xvCN
 eoWwvZoxxtws+Rj6SX4CXs9rau+HYLA4paJ8VLrHZ5hjNIc3Z8jCqlL1lAJ99b3Fd26fMr6Hxtf
 iYrJZDZ5fM69S3EX4cosd+zL2W/rJ5WiVFKGeFQh1gDpaPQcG4u2o9BznD811v6m5iBnHTMVLj5
 2kct9pI9cVmm+uJ2IXVtbSvjjrPAkxDbqhNEVWH6sgDaYz+tmP0TuMr99x06mBqHj4g8yaHcZbP
 1vkjqITcI3F7SBTdr/A0e8ZaT6AKlInIugF/uaeru2RUX1OsHQFs7XK1n4LflrX+fp26zGbdICm
 1xnwepnhPuFrRIY8pgxFaFCqUfCfojfOM1
X-Received: by 2002:a17:90a:e18f:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-35965cd0f39mr16143590a91.16.1772558389952; 
 Tue, 03 Mar 2026 09:19:49 -0800 (PST)
Received: from fedora ([47.31.83.111]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3599c3f1e0bsm2720793a91.2.2026.03.03.09.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 09:19:49 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue,  3 Mar 2026 22:49:31 +0530
Message-ID: <20260303171931.1065151-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772558390; x=1773163190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5+QJq6WCrN3ZlgVyHUqhYW11Roz8Q9xX3i4IZ1NXB5Q=;
 b=bYFHM2V7Zf69c7f+8qjAs9XzQBsA0gsYtCZ2/dTDrqeBiCNVGzAiW6RmN53eOVNysy
 JN/ZROm89xBvnFpMpPhUMrEiWqDeb2b60bQWWK6xPy5RdGtJwlFqgopCtmkrycnVynXS
 JyiGKcdG2DOnpXg0s7tGoEeKY+xFaad3gXtZc28xVGs0xFDIfmVvF2Z8PcVTc6TQL36+
 BGkyROrbuxF4ZcO0URG5dwd8RcLpNN1srHi4u3EvLuL7CPsSFhqSd6tMI63uyrvDxVgP
 pjFjTAauXWTjwFJ1drF40nBmIIr6SHHcy0tCq7EGTagGf6MK0ZEi0AqbOB8hdFWlxZhf
 6YoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bYFHM2V7
Subject: [Buildroot] [PATCH] package/libenca: fix getopt declaration for
 musl static builds
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

libenca ships its own getopt.h with an incomplete prototype:
  extern int getopt ();
This conflicts with musl's unistd.h which declares the full prototype.
Fix by providing the correct declaration.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...declaration-musl-statically-building.patch | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/libenca/0001-fix-getopt-declaration-musl-statically-building.patch

diff --git a/package/libenca/0001-fix-getopt-declaration-musl-statically-building.patch b/package/libenca/0001-fix-getopt-declaration-musl-statically-building.patch
new file mode 100644
index 0000000000..4971a7e9e2
--- /dev/null
+++ b/package/libenca/0001-fix-getopt-declaration-musl-statically-building.patch
@@ -0,0 +1,22 @@
+diff --git a/src/getopt.h b/src/getopt.h
+index 12b7ad5..e3b54ab 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -144,7 +144,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int __argc, char *const *__argv, const char *__shortopts);
+ # else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int, char * const[], const char *);
+ # endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+@@ -161,7 +161,7 @@ extern int _getopt_internal (int __argc, char *const *__argv,
+ 			     int __long_only);
+ # endif
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int, char * const[], const char *);
+ # ifndef __need_getopt
+ extern int getopt_long ();
+ extern int getopt_long_only ();
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

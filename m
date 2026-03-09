Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02576EF36F1
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 07:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B32DB8187F;
	Mon,  9 Mar 2026 07:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMD0qqyL8V-S; Mon,  9 Mar 2026 07:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA672818AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773040079;
	bh=FDsRowpJvjwL33ur/jD4b+BhK2V5dnvdTIKfg4lXHOs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZ73L19r5F/86PK6lTMAVDF0z/ErkB1w0tBdbCTIuNH7Q5DiYCEoxZow1PnmD1nrl
	 d1p+vgfU1tBAxC91UCZOJueBcuu0fkySoEycIYyjNwBrbRFIY58md8MpqQOczCC5bJ
	 wtOZoXI1qPRTjUu8ToT+TDD35amslXIgIRPXAhegwhxBEAEMaQbalavotN9Fl+ABaX
	 slfYBIWQSdiUaDQ3B3mGpNOib8lAkK9m13qnO3jqoedc9fetNb5nbqQyaRbiCkFxLJ
	 znQm1Kde2ZwbV0OIu4o4G2CKpBjZ+uL7gHo1c0TCbcES39P4tXQSw2sQxzVL8GTSpQ
	 3jJug8WXtZI2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA672818AC;
	Mon,  9 Mar 2026 07:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04CBC119
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAAA740A77
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0SczQwWUaDz for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 07:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 491F840A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491F840A56
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 491F840A56
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:07:57 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-829b2018c94so1150451b3a.0
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 00:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773040076; x=1773644876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvdEqYuCGm7MmJlpiLdXgN/oToptF1ThHkyT0KWcOvk=;
 b=DMnyOkAaaGP68tMGSOjffQc53tiZBit5MR/ZrVYfthhYRvHeKqaHjQqdhpRFY2HPjB
 mrnIII9XuE/Q8SDryjr7GnVH2M/VLshjxhrRlj62OAdyCrURThZhNJs+tO4Xo5r9DZfK
 jv178z4HxLG/sbNRBQlRSioSn+xyjeQxFZwVKZ8As56+hViRVmDO4MNsgVqBRvlu/PJQ
 npsaY1C+lWaLDQ32VQInRxmejTuZyhj77DtEnaWoA8naqoTkjZi92WGWCrlMHKPmvFqq
 /1ZFvB2O5JnwImLyp4GExXgKPJfcvZ2yhyX+srwbppygyTjTKvFewAy2Zm67z4gpkBV5
 PGqw==
X-Gm-Message-State: AOJu0Yzw0jnJlDduEZEmGXvsdXoe5gDL3lZi1DNm4JAsH95nqNeI1Fwv
 gX58Txv//n49BRyijWJ7AGVrNGPAvmWNb0peVL8HYiK0+ax8cb5XNphQdgw5B8cl
X-Gm-Gg: ATEYQzx2iehIJ3PjWtef2wrIoOKQiTXT818m2hxiabvY1t4G0NU3xiw1MZDL2zUowC1
 t20OL/Rk2SCOMGdoWIIBjk7XciuySFyz9hr3zeH7V04DMkIDearyJXiXcWuctrKXsviluCIZKEE
 M/ZR2kCJnN/SAgcO94f5wisgaVTMlwLV26cieICieBa2438/ndRi7tMoCjn3y/OxndHQD+/VFfn
 sPMXmr8VJXHlp6fhNIONBLY3cOX5SDYV3lSQZqEOH/Ii/4YE+28UAYmRmxB8lQM5eqg4gecu6P0
 PbVm2eCZPGCn6Xnb0Y/MuYQYhkN/1eYhDk4RlpQnJlr2dzTLILSO23vTOyZ3ltnrnYxT0C8K6kN
 5EIpVRprrj/9aPcxV7na6QwkXkbLdIycc9jnKltB5uZ0K8+tBNFjKzX91pPa4NaFJ85sWKyiIFq
 D715urJSUFl+aRKg2cWLJC7tGuPC4gdVK2yRVv
X-Received: by 2002:a05:6a00:2d19:b0:827:2b3f:f9c0 with SMTP id
 d2e1a72fcca58-829a2e11113mr8996946b3a.22.1773040076021; 
 Mon, 09 Mar 2026 00:07:56 -0700 (PDT)
Received: from fedora ([2409:4064:2dc8:f3fe:2a16:d3b5:be55:778d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48a24b2sm8900756b3a.47.2026.03.09.00.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 00:07:55 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon,  9 Mar 2026 12:37:40 +0530
Message-ID: <20260309070741.34152-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773040076; x=1773644876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gvdEqYuCGm7MmJlpiLdXgN/oToptF1ThHkyT0KWcOvk=;
 b=ZLnoASKFVdibdW7Vc1mUpu3NfEL35hupSAIG6Sjop3xuCXPB7StJOlNk2w00iODK0L
 lm6eZcDfJ1Vzc2j+swruiFRHuUy06vmSoOIFgwvnhisqHnMXBo/vL2kAQGD06CZK2qmc
 qLQ7SiHAvPVKunWFubqjZTKDLSB9vMlxl7lRFuSJyIKXG0/uUfotwb0J+fx00b9WCp+z
 57QPLB4TBpgnK5OYqCZLJT8t4CEfFstMa9llfCBwcaHUMpIzaweldlk/5xwp9VnPKpSH
 2ybR2Rx4+vo+xxt5stbfBBaGWINP9HQc+yVVp/K7u59U7PvhlL5lpOwgEGH/v7+bEOSk
 vgeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZLnoASKF
Subject: [Buildroot] [PATCH v2 1/2] package/which: fix getopt implicit
 prototype conflicting with system headers
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

Older C standards allowed empty parentheses in function declarations,
but modern C (C23) treats extern int getopt() as equivalent to
extern int getopt(void), which conflicts with the typed prototype
provided by system headers (e.g. musl's unistd.h).

Fix by providing the full prototype in the non-GNU fallback branch,
matching the standard getopt() signature.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes in v2:
- Correct commit message title and body
- Use git format-patch format
---
 package/which/0001-fix-getopt-prototype.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/which/0001-fix-getopt-prototype.patch

diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/which/0001-fix-getopt-prototype.patch
new file mode 100644
index 0000000000..af9597242f
--- /dev/null
+++ b/package/which/0001-fix-getopt-prototype.patch
@@ -0,0 +1,15 @@
+diff --git a/getopt.h b/getopt.h
+index f080053..f080054 100644
+--- a/getopt.h
++++ b/getopt.h
+@@ -102,7 +102,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #else  /* not __GNU_LIBRARY__ */
+-extern int getopt();
++extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
+ extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
+-- 
+2.43.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

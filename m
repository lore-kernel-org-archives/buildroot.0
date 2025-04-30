Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE6C369DC
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 09:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB098203F;
	Wed, 30 Apr 2025 09:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K37CbddNENgL; Wed, 30 Apr 2025 09:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5095F8204D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5095F8204D;
	Wed, 30 Apr 2025 09:15:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F364943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60C1F40C24
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhBMoaISDcyn for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 09:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E272E40C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E272E40C1C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E272E40C1C
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:15:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so62236975e9.3
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 02:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746004548; x=1746609348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Eq9tRz2slR8WyxwC67F4gugWgB8eaxgsrSC9hlh3OM=;
 b=i/sOWb0VmBUd5pheVcjajHMPh7UIG6QZB12+U0AX8T8nDMwfaD4eFwLKtd92Kv1ZVl
 TvziafZejWykSQQLo7PjQWGmvE8A1UeNADooVTueLJObc+TmrJ5l/IQqYM7YoSYlpZJn
 QNb5YhSPdYdbFKStwd88Yf7GlVlNXQlnMrOioA170QXSPmSP75JRNl+9gqbHEPqKABQM
 nN0z0x6JoycuS7OfLXMNOb2n17CbklCwvBvzP46yg6GTyYC1C11NlYPUkLqcM7dtBLdS
 2DFfRniOQA2MWWCKrHwOsuMEwYFDWACeJvocVjj9k+ND9Uh2Aayb5XmxDPDyfbAsEaNK
 LOfQ==
X-Gm-Message-State: AOJu0YxfxzlcRz9hG/g0kXF1eJ3IANVyvvpsffG3PBRdQRNOI3jZp+Xm
 xr7kPvLhP+wnAGmusTnNICZlyjtpDvoFXz70UxNtjYPrE4lNyXrPzPMvHzzlkyhPrN+uMeX5uhB
 gABE=
X-Gm-Gg: ASbGncthvCar5htdl2Ra0mSiY431CilGJDO9CSScTeGJP3aUQakYvlXEIEtbfNhUmUy
 APz8nnwtbaO2PfUucxJTHaqqKU34zR6sKJMJW/qQFj4AnvB3ww2Z8605ZI7rCPAYhgwtSSQ9Nyl
 eNwlbJnEccBojb72cGENsgTX/fdSzid5LT1fzAEbittsxAnu6wBLZflzVq44eD7soiSCs7Vvqva
 l+ZYtV8McYvpPtbBZ3kdW44mJpQRTKBZBWL72Gmt/E131yOA/abMY/LcUzUdl3jaRVbTuH18PlZ
 IQ4mEAPXTavij9ATLdn/LZxDzkmjskSVQIx5g4gTDIorK/2n81ut2H/LxpXZ9iQcFlKYdqjLRsS
 sTo8J//9hS0E/ftGT1a1HJHBAcWh3oBPTEA==
X-Google-Smtp-Source: AGHT+IH8Ycq+AyEvkZs4KtSPX5LkjsC/+s4Fy4hnAiaMNcYLGo9rXHx6aaJEZmtHvB54zIpoGx78SA==
X-Received: by 2002:a05:600c:444c:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-441b1f61dbcmr22255825e9.30.1746004548408; 
 Wed, 30 Apr 2025 02:15:48 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2ba4b1fsm17353605e9.15.2025.04.30.02.15.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 02:15:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 30 Apr 2025 11:15:23 +0200
Message-ID: <20250430091523.96309-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746004548; x=1746609348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Eq9tRz2slR8WyxwC67F4gugWgB8eaxgsrSC9hlh3OM=;
 b=hzZ3qr4QZe+GLFd8A/GU7MYAG8/FsxuchrV2bpvJ51gZA+cm5eAZ5NSe+0UDn5IZjp
 vH3JPDq1Cg/yshDhhWrF3nkYqn0C5TKTZ1lQCD7IZqP5BB8i2ZMV08OLDMOcTH22Tac2
 ZZJl+M/0SqFucL/FHksFlUVoXcxI0/Api1+O6eTIeOvRmbJJN4yQ2vMcd/81lhqZkxhh
 ULtPPIUX9E6rwHGB8yjwGGOU+ZnfwFA3NpYokY4OKZswxki2AQbMALVgBSkmkaAFD9e9
 441MA2eMurdLQV7o6uwf34HI3SLcxT0koXxiJSsa3mZhauPvs98Yb05FcTeDsgJ0bDEp
 rYjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hzZ3qr4Q
Subject: [Buildroot] [PATCH] package/yasm: add patch for CVE-2021-33454
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes a potential NULL pointer dereference

As a side note, this package has many opened CVEs, but upstream doesn't seem
to really consider them as security issues, see their disclaimer here:
https://github.com/yasm/yasm/blob/master/SECURITY.md

We could speculate that this disclaimer has been written as a consequence of
the many small CVEs opened in a short time, that don't have a substantial
security impact (besides the command line tool crashing). All of these small
CVEs have been opened for bug reports issued by a third party who used a
fuzzy tester to manipulate the assembler input

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-dereference-in-yasm_expr_get_intnum.patch | 32 +++++++++++++++++++
 package/yasm/yasm.mk                          |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/yasm/patches/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch

diff --git a/package/yasm/patches/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/patches/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
new file mode 100644
index 0000000000..976c2f7a13
--- /dev/null
+++ b/package/yasm/patches/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
@@ -0,0 +1,32 @@
+From 48ced849ed621a05cec4c04d4567323af3a76e81 Mon Sep 17 00:00:00 2001
+From: dataisland <dataisland@outlook.com>
+Date: Fri, 15 Sep 2023 18:20:49 +0000
+Subject: [PATCH] Fix null-pointer-dereference in yasm_expr_get_intnum
+
+Fixes the following CVE:
+  - CVE-2021-33454: NULL pointer dereference in yasm_expr_get_intnum() in libyasm/expr.c
+
+For more info see:
+  - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
+  - https://github.com/yasm/yasm/pull/244
+
+Upstream: https://github.com/yasm/yasm/pull/244
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libyasm/expr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libyasm/expr.c b/libyasm/expr.c
+index c2c868ede..6838eca56 100644
+--- a/libyasm/expr.c
++++ b/libyasm/expr.c
+@@ -1260,7 +1260,7 @@ yasm_expr_get_intnum(yasm_expr **ep, int calc_bc_dist)
+ {
+     *ep = yasm_expr_simplify(*ep, calc_bc_dist);
+ 
+-    if ((*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
++    if (*ep && (*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
+         return (*ep)->terms[0].data.intn;
+     else
+         return (yasm_intnum *)NULL;
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index cdb8e15bee..766d29df3b 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -10,6 +10,9 @@ YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 YASM_CPE_ID_VENDOR = tortall
 
+# 0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
+YASM_IGNORE_CVES += CVE-2021-33454
+
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
 # that are only of use on Microsoft Windows.
 define YASM_PRE_CONFIGURE_FIXUP
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

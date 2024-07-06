Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEE1C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 15:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD0C0405FA;
	Sat,  6 Jul 2024 15:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqmxzuUIC4Ml; Sat,  6 Jul 2024 15:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BDD94022F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BDD94022F;
	Sat,  6 Jul 2024 15:10:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 310661BF2F3
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 15:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5084022F
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 15:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1LP7VAqJolY for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 15:10:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A1A44016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A1A44016B
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A1A44016B
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 15:10:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so3256756a12.0
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 08:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720278608; x=1720883408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5VdjC1vpR6JkSaUp4PVZXQOKEJCXxolOj1mDh7mq7wc=;
 b=h+SGq5EbK+cScJFspQHTkhELDenWkFUvgazQ+c+lN5ApyENMNwjbe+6sBlvgFtVpUB
 +yGCxkTzwYWUoGYOyyTPvBMUmItFg6T1p8bBkDEiKI4gTS027TVhKLYOKyFPGZu64+a7
 YAZEivqTDK/0DYosXSBK60javtCCVvfAewPPVOuo3Hzboa+u9OM/u+QpszmGyoJ5622B
 XZj2uK39umXm3Ou8bAs4uOF1axZgE7NOq9DnUP2BnsiyJ7Sin8jYwIB2xYBwpi1KH7Vw
 3+VJzRhR62XWQHod/iSxztL/a961A1i5aS94iCFNS/PWqDnecMq9C5axdsxYIeQ2Az/Q
 g83g==
X-Gm-Message-State: AOJu0YwJUuY19K7teIIq2eNKPVo3jDWjpr/EoyNfifdrCaYzZRTmdjDT
 ZknR0G2aY60Wjl72UquoE/p7nkbNWj8xQ6IKjk3M4RLG+Nc7sN+olCRMZvY65bB93iqR9GUoseu
 e4Pk=
X-Google-Smtp-Source: AGHT+IH/g6e8l7fsnuiNUld6/MqfnRYFU6OSrUk26yuSjItvDaELA0l1W4IjboA8wi9R1mmnhG8k+Q==
X-Received: by 2002:a05:6402:35d0:b0:58a:e810:227d with SMTP id
 4fb4d7f45d1cf-58e5b3a7c0fmr5517209a12.21.1720278607707; 
 Sat, 06 Jul 2024 08:10:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5903c7ac61csm1481891a12.4.2024.07.06.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 08:10:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 17:10:04 +0200
Message-ID: <20240706151004.3818101-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720278608; x=1720883408;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5VdjC1vpR6JkSaUp4PVZXQOKEJCXxolOj1mDh7mq7wc=;
 b=V4Dp5QCjbDk25dx9zFRJZZeturBVEsnSAtzPNr+QvrkgHBG6Ejq8kRpe8w6MfUpXt/
 RHhocduiHIVm/41JtAvBn2UoIntRBXC6c+B+sPwjW0oEhgDEgsYIkOxKWTwvBffktBtD
 rdMvPSrysbQjszWSdA5af2TOcs+51d8wx1nWI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V4Dp5QCj
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: update the
 patches to be applied with fuzz 0
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, freeradius-server fails to build with output:

    Applying 0001-jlibtool-cross-with-host-CC.patch using patch:
    patching file scripts/libtool.mk
    Hunk #1 FAILED at 43.
    1 out of 1 hunk FAILED -- saving rejects to file scripts/libtool.mk.rej

    Applying 0009-src-modules-rlm_python-fix-build-with-Ofast.patch using patch:
    patching file src/modules/rlm_python3/configure.ac
    Hunk #1 succeeded at 44 (offset -15 lines).
    Hunk #2 FAILED at 73.
    1 out of 2 hunks FAILED -- saving rejects to file src/modules/rlm_python3/configure.ac.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-jlibtool-cross-with-host-CC.patch             |  5 +++--
 ...9-src-modules-rlm_python-fix-build-with-Ofast.patch | 10 ++++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
index 0cd55071c4e6..94205754c2df 100644
--- a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
+++ b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
@@ -11,6 +11,8 @@ Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 [Fabrice: update for 3.2.3]
 SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  scripts/libtool.mk | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -19,8 +21,7 @@ diff --git a/scripts/libtool.mk b/scripts/libtool.mk
 index 57915e1053..c28260dd7e 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
-
+@@ -48,8 +48,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
      # binary!
      ${JLIBTOOL}: ${top_makedir}/jlibtool.c
  	$(Q)mkdir -p $(dir $@)
diff --git a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
index c92b4171d2bb..2c1f07cb66a1 100644
--- a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
+++ b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
@@ -18,15 +18,17 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/5263
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- src/modules/rlm_python/configure.ac | 4 ++--
+ src/modules/rlm_python3/configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
 index e2f74574fb..ee30b324d9 100644
 --- a/src/modules/rlm_python3/configure.ac
 +++ b/src/modules/rlm_python3/configure.ac
-@@ -59,7 +59,7 @@ else
+@@ -44,7 +44,7 @@ else
  
  	dnl # Convert -I to -isystem to get rid of warnings about issues in Python headers
  	dnl # Strip -systemroot
@@ -35,8 +37,8 @@ index e2f74574fb..ee30b324d9 100644
  	dnl # -D_FORTIFY_SOURCE needs -O.
  	dnl # Strip debug symbol flags (-g[0-9]?). We decide on debugging symbols, not python
  	dnl # Strip -W*, we decide what warnings are important
-@@ -73,7 +73,7 @@ else
- 	mod_cflags=`echo " $python_cflags" | sed -e '\
+@@ -56,7 +56,7 @@ else
+ 	mod_cflags=`echo " $python3_cflags" | sed -e '\
  		s/ -I/ -isystem/g;\
  		s/ -isysroot[[ =]]\{0,1\}[[^-]]*/ /g;\
 -		s/ -O[[^[[:blank:]]]]*/ /g;\
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

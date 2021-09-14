Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3F6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:26:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DAA6112D
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6DAA6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79A0B4037C;
	Tue, 14 Sep 2021 21:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITGhl3heGFYi; Tue, 14 Sep 2021 21:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BBBF40154;
	Tue, 14 Sep 2021 21:25:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E351BF292
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C21440154
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y277EahKSmCD for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:25:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EC034013C
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:25:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3213842wmb.2
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 14:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7afM6sb2ao4vngFFW8oFvo4QA/1eGAie4u0yKdkTSrQ=;
 b=SG9rGOzAUDNX07+ytuSDt+wrt1QkxoXnRalnu+3dnu5qddc8TAUF6AmvrW8h4ypl5n
 WzGI8q1c9PW90HdeWTzA5SFm10n3BW0OObK24i8K5IsyJtDKQJ1TPiDSP/I3kL+G4sYU
 wMRqF60UFw+zsQPZy52IjmCOlGc+PsimPz1wIWBhB7oXF8H+3edTvSbSC2vTzk+x/0vg
 7faR4xWrh/nqf1opijsbIDFS3NqRaE1hz2Vn1+BzyIiOj52ndjnOy8j9yC3sii5v9dyj
 d+WXeLszGTuWgf560aqFTEKZvY78zSIvzyxuYjoJAiF7sM1Wud9seiYLACxEA2ZQUcjI
 1uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7afM6sb2ao4vngFFW8oFvo4QA/1eGAie4u0yKdkTSrQ=;
 b=qlKGxVpUMksLL0pRyXYdk0QAjeXOTSRPTLUmyYJcLmkl2plmrr0DUGdlEA5PSr7SCt
 y7SQUETlrhxwSQvJaA2+H7YQfpKPkbmEwMeyp1u+G92L3eispwrZMeX/bI3ACdwwrvvd
 MY19FSJRIhIt6hwCNuG6Y4Bn0jm9L0pFNJ0GQnGhLkK/fABJGrcVKjX4xoaHZ5dbHJdV
 i3FPGWiBNKig6d72Ma56690G/rEL9U/yejr4VoCIn3DUGB3B+iCoziT7IUVGAzY5l40u
 EYlpzdqSgJZfxlO8nW4E+6Ku3b1valYGwTLG8c5TOW5pSosjv1FMqje7swSd3f3bdmwA
 uWsw==
X-Gm-Message-State: AOAM532G4tjWiRfoPTD1pmu6UFFfEwGdeU5zrabjtUoAFiv/KxXd7fAb
 b8fK/yBHR6H/EQnsuDagmWFY+F+uiFI=
X-Google-Smtp-Source: ABdhPJwxH5eW0CMPF/D6dhJmW/KoQExycX8ZPvK0CpwcF/4mJ/18ux9RJEI+hwg0TODjFW60QyBmdw==
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr1139720wms.186.1631654753637; 
 Tue, 14 Sep 2021 14:25:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l15sm2204931wme.42.2021.09.14.14.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 14:25:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:25:48 +0200
Message-Id: <20210914212548.412430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.6.20
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/a-j-wood/pv/releases/tag/v1.6.19
https://github.com/a-j-wood/pv/releases/tag/v1.6.20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure.in-tighten-AIX-test.patch  | 57 -------------------
 package/pv/pv.hash                            |  2 +-
 package/pv/pv.mk                              |  2 +-
 3 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 package/pv/0001-configure.in-tighten-AIX-test.patch

diff --git a/package/pv/0001-configure.in-tighten-AIX-test.patch b/package/pv/0001-configure.in-tighten-AIX-test.patch
deleted file mode 100644
index 2e0d2af247..0000000000
--- a/package/pv/0001-configure.in-tighten-AIX-test.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From cd7605723eb8e6d8231644f1cf62f1e80badf074 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 20 Aug 2018 15:57:22 +0200
-Subject: [PATCH] configure.in: tighten AIX test
-
-Depending on the configuration, the cpp output may contain the string 'yes'
-in a comment if built under a path containing 'yes', confusing the _AIX
-test:
-
-${CROSS}-cpp conftest.h
-\# 1 "conftest.h"
-\# 1 "<built-in>"
-\# 1 "<command-line>"
-\# 31 "<command-line>"
-\# 1 "/home/peko/source/buildroot/output-yes/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/stdc-predef.h" 1 3 4
-\# 32 "<command-line>" 2
-\# 1 "conftest.txt"
-
-Fix it by only matching on 'yes' on a line by itself.
-
-Upstream-status: submitted to author
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
-
- autoconf/configure.in | 2 +-
- configure             | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/autoconf/configure.in b/autoconf/configure.in
-index bd45004..487c42b 100644
---- a/autoconf/configure.in
-+++ b/autoconf/configure.in
-@@ -86,7 +86,7 @@ AC_PROG_MAKE_SET
- 
- dnl AIX needs -lc128
- dnl
--AC_EGREP_CPP([yes], [#ifdef _AIX
-+AC_EGREP_CPP([^yes$], [#ifdef _AIX
- yes
- #endif
- ], [LIBS="$LIBS -lc128"])
-diff --git a/configure b/configure
-index 7c11be0..59267b9 100755
---- a/configure
-+++ b/configure
-@@ -3377,7 +3377,7 @@ yes
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then
-+  $EGREP "^yes$" >/dev/null 2>&1; then
-   LIBS="$LIBS -lc128"
- fi
- rm -f conftest*
--- 
-2.11.0
-
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 1ce1191d54..b3dd71f74b 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1  pv-1.6.6.tar.bz2
+sha256  e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603  pv-1.6.20.tar.bz2
 
 # Hash for license file
 sha256  280e182171df3e9bb4a9b407326e88521151fcb8f4f8557255f26177d5900ccf  doc/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 122cc0c5ca..27060cf07e 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.6.6
+PV_VERSION = 1.6.20
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

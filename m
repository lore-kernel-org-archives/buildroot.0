Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEC6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F339C61163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F339C61163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C4F40DAA;
	Wed,  6 Oct 2021 20:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLQmHgLZT4wz; Wed,  6 Oct 2021 20:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6EA640DEC;
	Wed,  6 Oct 2021 20:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAE681BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F5C40566
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3cKnQ03oK1f for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F40ED404EA
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r7so12409765wrc.10
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ndp/aBqf29PfLpfM6XmRCoKCK7ocSsxmuDzBGWQA5c=;
 b=KG4adBgYw47Puxg8cYVBBSL+jRWRvWsro0XFKUKrAX+N6K3THZaVQod28MqJddhEjN
 bZ6/kRZRV7f6JFv/ysMkOQzEIH+phV77o2HLG9pfRn1TMy8QmEaF6GgtO2gCNA3ECk0N
 stn+PxwKqViD2I8sYkUh4EO3oo8L5tMsik4Wy32VrrKAm0qMNyrEu8cCSz9J/42UGXCc
 wZoJT13QB0vNEvyOnwWQq3jd6Vtacs65dLj7wudbj7jlmaDZmX0XqZia4388tsdP2FqW
 PQzCFTLQ18lqElswYeAYN7RqJ0E02lBLAYYHEnThc3BL5kNJsQ9AyHIY9zCVrbVk2rBk
 O6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ndp/aBqf29PfLpfM6XmRCoKCK7ocSsxmuDzBGWQA5c=;
 b=MXJKvtDueYXcEFtVBiQaHLa2JqLTFs8jZP4+jWhee3xeCc0zXn+AQ+0Er9UklPnUuo
 gOkzPmYeyC7bJpNQGwvJN0xUwy4ucRDCRh8eLlU+jKMDMz0cCp051v9efobYSYf/CJN5
 z+GjQlAi7cWKn0/SzZQL28PmkgTJr5IZ8hQUK4ZNdM5rtQcfXm5SUpT1vosUHic1KhMS
 /T01hTdnf74idJSuA2f0r4yrjzsfrbRL1t5vuGWrOHlqEop+3kDyAoOLLNgoJe6ZeAE0
 BsmHXNVbBkLPi6JcC6WGsfLJYB+vHBmiAIGNi+7KpyoWgcRdswNDx934XKbd9EDWphMU
 aqSg==
X-Gm-Message-State: AOAM5319Ji2SB8bk6nfbRPtWNAQwt0PSCBZ4vFFRkW+KyuKVJLxEHrQG
 bzlgRVAyZaOzRlg35RcPlxnI1T5U4Cc=
X-Google-Smtp-Source: ABdhPJw7WsiTpnxKUDsCpFvzFDnjumLyjmQpT63FAKyaTL3nKalBiuyzqWi3tFVQCgArecDFVtA6Hw==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr5235351wmc.69.1633552876817; 
 Wed, 06 Oct 2021 13:41:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id v13sm18872826wrp.64.2021.10.06.13.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 22:40:23 +0200
Message-Id: <20211006204023.3185616-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ruby: fix build with autoconf >=
 2.70
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

checking whether the C++ compiler works... no
configure: error: in `/home/buildroot/autobuild/instance-3/output-1/build/ruby-3.0.2':
configure: error: C++ compiler cannot create executables

Fixes:
 - http://autobuild.buildroot.org/results/63f32033aff5c800a933d8b1c805be0d9d6abea6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ruby/0002-Needs-AC_PROG_CC.patch | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ruby/0002-Needs-AC_PROG_CC.patch

diff --git a/package/ruby/0002-Needs-AC_PROG_CC.patch b/package/ruby/0002-Needs-AC_PROG_CC.patch
new file mode 100644
index 0000000000..647358be70
--- /dev/null
+++ b/package/ruby/0002-Needs-AC_PROG_CC.patch
@@ -0,0 +1,28 @@
+From 912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 30 Sep 2021 18:24:37 +0900
+Subject: [PATCH] Needs `AC_PROG_CC`
+
+Although `AC_PROG_CC_C99` has been obsolete, `AC_PROG_CC` is not
+and the latter is necessary not to make C++ compiler mandatory.
+
+[Retrieved from:
+https://github.com/ruby/ruby/commit/912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b24a8f59b0d2..c7059ee1ecf4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -218,7 +218,7 @@ rb_test_CXXFLAGS=${CXXFLAGS+yes}
+ # BSD's ports and MacPorts prefix GNU binutils with 'g'
+ 
+ dnl Seems necessarily in order to add -std=gnu99 option for gcc 4.9.
+-m4_version_prereq([2.70], [], [AC_PROG_CC_C99])
++m4_version_prereq([2.70], [AC_PROG_CC], [AC_PROG_CC_C99])
+ 
+ AC_PROG_CXX
+ AC_PROG_CPP
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

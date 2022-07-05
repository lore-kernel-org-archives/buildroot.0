Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A8C43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 12:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBDB640AA2;
	Tue,  5 Jul 2022 12:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBDB640AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsrEcdgPps76; Tue,  5 Jul 2022 12:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B94AD40A8F;
	Tue,  5 Jul 2022 12:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B94AD40A8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E96451BF859
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 12:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D21FE40A8C
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 12:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21FE40A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QN_rh5CfKSmr for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 12:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D194D40A95
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D194D40A95
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 12:33:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h17so4197618wrx.0
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 05:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nGVhfOMwo3Kr0cPmI+8qLT1Y/RoZP+6TYMTFdHTDla0=;
 b=aqqVknQBHCpwNDnyzAeHhoNRuRbyX2aKVtEeHqxdO/TCU4olAwpRNT2yjz/yIH9WOQ
 DaIFWm/aiCEAsQZ3SxRt217VBuQkfq9DgSLap0DbP9UMRKAE+3SBrZXAiHZmHE3Y44WV
 ochMM4gVFFxc/NlOlFMUUeZVCxPBH/TQ1ho3V4qP7hHGrLkNhOYlwAheJSOAH0jn8RoD
 TziN8qqS3SCryk9Ku7r10w9htRwUKFsWZ8zeFnlEiKudola5qbZOtDjQPhQn6gZha8BV
 S/rJ4jUC5ciB6hlywaBq3GzKZMrTJgfE/HIOmT9lFUQDRgA/bAmzDCSs+y4XHAln4Jcy
 6+0A==
X-Gm-Message-State: AJIora//GhDcFzaGadT7UcCZx3JkO2Fzp+zjybyCI0yhkCkQAhfnlSZ1
 F3oFOrhqCQdkIioQLz65IObyuYpkx2w=
X-Google-Smtp-Source: AGRyM1vCFXZJxTMDeSWxVeOaPBKxPvJO7dZT/FLYS5rBox+rzNxJcNkb7hD9BJ2jt6T8spg4GLpoSg==
X-Received: by 2002:adf:e691:0:b0:21d:416f:8d16 with SMTP id
 r17-20020adfe691000000b0021d416f8d16mr24983377wrm.338.1657024387774; 
 Tue, 05 Jul 2022 05:33:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2a04:cec0:11d2:38f8:9191:99da:ee67:6052])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a5d59a5000000b0021d20461bbbsm22549317wrr.88.2022.07.05.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:33:07 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
X-Google-Original-From: David GOUARIN <david.gouarin@thalesgroup.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 15:44:01 +0200
Message-Id: <20220705134402.5914-2-david.gouarin@thalesgroup.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nGVhfOMwo3Kr0cPmI+8qLT1Y/RoZP+6TYMTFdHTDla0=;
 b=kfJSKCJieUeBHARxTqvgwltcecGluK6gyEgHuz76KN5aSogVF7P5+28VgGJaukaLHr
 UoSLoHzfbTrdbsn7N1VyBJ6qh7uAZiIketwAu6eWwqa7euRQJiNi9iPu3TBAtilHLLR0
 rpMaruYTs+LE8WAY4DQwlJfX6LQo8shLAVl6JNVuxlWeVXmYgAzbbc7XhdccNFjeYK2f
 2lIlNriqko78uHaElPkyT0OEAp906iJY9CnharaMWy9aU3AtxKxPcctKkCa3HTmPAaTv
 GbwfRy1TgpEQL9JLuwy9BG5NGw7ziet/B+CaoBL7YKqrjWAFW3g04Pivqwn+pk8e50r6
 EozA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kfJSKCJi
Subject: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version needs to define an environment variable in build and install steps.
This requires an upgrade to pkg_waf.mk.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
---
 package/libtalloc/libtalloc.hash | 2 +-
 package/libtalloc/libtalloc.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index cbfd11e63b..0bc8edb695 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
+sha256  179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505  talloc-2.3.4.tar.gz
 sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 8cba699ea1..6a5e1ef4b6 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.3.3
+LIBTALLOC_VERSION = 2.3.4
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+
@@ -40,6 +40,9 @@ else
 LIBTALLOC_CONF_OPTS += --disable-python
 endif
 
+LIBTALLOC_CONF_ENV += PYTHONHASHSEED=1
+LIBTALLOC_MAKE_ENV += PYTHONHASHSEED=1
+
 LIBTALLOC_WAF = ./buildtools/bin/waf
 
 # like samba4, libtalloc uses the waf build system which requires a
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

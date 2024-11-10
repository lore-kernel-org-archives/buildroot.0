Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD7D12D4F
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7BF480D23;
	Sun, 10 Nov 2024 19:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnqvwbkK1CCG; Sun, 10 Nov 2024 19:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451ED80D3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451ED80D3E;
	Sun, 10 Nov 2024 19:37:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C630D8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B4A680D1D
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTtscu7OTjOZ for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 19:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DB5980D2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB5980D2F
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB5980D2F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:37:46 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a3c00f2c75so13924045ab.2
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 11:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731267465; x=1731872265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDdQP70mUP6JSo4xOhhkza4J+U5940P7A4sJ8WIYAaI=;
 b=LghD7Y/nClAxf/26D+5zdlTgGO04DvuXu55P0a+wjwWYNHRzlNCzc24y4uMiuhUzY5
 CaHnw4J/OQ6ZwVURyUGtpMbcWKCkI9eQkKi3duEBH+okTnu0i/h6KnsGL1CxI1mgwAxt
 rgwFx4vsSqp2nFY8E9EecR9Snx9pVN+v6p1gpVE4xdze4fIZiDH4vRONkr4L2JfRToI7
 prA29zTmWx+H0K5Af2uyQaorNJi7KE7NstShajbiukkUnFJbp0ZBvE7GTECHigXEr51r
 tV1w97i5C+q2dPhLoJNsFlEbSBwsN6NVYPKduq4SbetAShoVn21zMQ+XVE/Rwxnn/GOw
 GWPA==
X-Gm-Message-State: AOJu0Yy95C8jv+KfchyqnEMhyi7TJ06ATG15Wp4CpAPGqFgQekmlku+X
 ehx7/UIU7q5Lk/bnK5CYsRKRw69QTPZxsdmOtNAMBTr2PYFTesLazVb2GxCu
X-Google-Smtp-Source: AGHT+IFEaXiJxKegXFJ07OcQkV+Cezd5ejBakfmiUf6TTeQtq3HJ0xTGGT596rSnjRAg+LYTU728Vw==
X-Received: by 2002:a92:c264:0:b0:3a0:a71b:75e5 with SMTP id
 e9e14a558f8ab-3a6f1a039damr115789035ab.7.1731267464774; 
 Sun, 10 Nov 2024 11:37:44 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f987e094sm10352065ab.53.2024.11.10.11.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2024 11:37:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 12:37:34 -0700
Message-Id: <20241110193734.1463141-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241110193734.1463141-1-james.hilliard1@gmail.com>
References: <20241110193734.1463141-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731267465; x=1731872265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDdQP70mUP6JSo4xOhhkza4J+U5940P7A4sJ8WIYAaI=;
 b=BCsh2kHmtUdTealpLqawZwEb7arfprwnpvre4c+ly2CgRkxaVe+f3y3wf0w/M1nqta
 oWdtekGNEhgy1EU/buBKM4QfitMxa3unEhqrakdrLn9N84NvcJ266ouaEGK+K8NGO+MF
 ggqZT1E2dj1YDhQbmtlVnfahrsjNoZL7oVmhyVazn7fq6gdFVV0yG87tQikIptcTRh5O
 TPfoJ4dPJXascgA5ZFHc5hs1B4+RDffnJi88x9AVoSEBKqnZAVw/ysfEYnBtAAm4H4iz
 oPdgAhRxJ4Z1+hK+Pd49bMgGo7SPEWYsRfqGnU1enBwWiRHeIFCvxfxk2SgnJtj3m80y
 8Cdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BCsh2kHm
Subject: [Buildroot] [PATCH v2 2/2] package/swig: bump to version 4.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swig/swig.hash | 2 +-
 package/swig/swig.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 21590c422a..9c1dbcc2fc 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
+sha256  f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e  swig-4.3.0.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index ad585c3f97..7e84bdd431 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.1
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
+SWIG_VERSION_MAJOR = 4.3
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).0
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
 HOST_SWIG_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

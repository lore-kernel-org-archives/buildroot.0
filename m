Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645CBC7EE45
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15E7641A04;
	Fri,  9 Jun 2023 16:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15E7641A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J70sFLa6Lt-v; Fri,  9 Jun 2023 16:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5995D419FC;
	Fri,  9 Jun 2023 16:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5995D419FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A259E1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AC0F83C65
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC0F83C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaO8igVPx4-q for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D06C83B97
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D06C83B97
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f7ebb2b82cso20163785e9.2
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327623; x=1688919623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWJOXRd574iN2WQucbpG6bK+Q/23wiD1dDlUOB84vVc=;
 b=gGQqeGs+GBK+/p9fun83qADW2RzKbitB3GnrC4IXcMGlI/AE9u8b2KnbLUhek+e621
 7mIDPskNoQyMbXoyFxw1w/pkqYc3lgUMIWCdjPhM4D7JtQ8hFO7zFl/DNFpn4Dh4UqO5
 gpx0D7D8S92NcLwJRu+hAK5WeDOc//j+VtwMCRXQy/QqBSHLnjNKYGsLtCPlT2ORCwfj
 sZ3MH9OW1od7+Jdpxc/0DULffsNJ9os3QsPLgCMNQgeNXQiPQvjYQYZh30iI6N/cKoc5
 bd+Zk8GCQOfJKyA+QvXcGXev8kkQyR9H3cTx5OtmxUzvLymraP++jjalNRZYHhYejZen
 kiLQ==
X-Gm-Message-State: AC+VfDxIBDaSfKiC7IsmaAYiCnGHqO6uvyOWksyjLm5z7OXChdLUv8Yo
 PwgjEbuJ6m1yCUUMQD7Nt9qGeK7yMC8=
X-Google-Smtp-Source: ACHHUZ4OcVBgooJw5eHbMpLFlOmKwsD5Xf1tz3C6ZqK2UvSfIza7h68uRvZoQB+6u9DBuSUxv6sMJg==
X-Received: by 2002:a05:600c:aca:b0:3f7:f614:9970 with SMTP id
 c10-20020a05600c0aca00b003f7f6149970mr1553690wmr.34.1686327623299; 
 Fri, 09 Jun 2023 09:20:23 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:22 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:11 +0200
Message-Id: <20230609162018.1231615-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327623; x=1688919623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DWJOXRd574iN2WQucbpG6bK+Q/23wiD1dDlUOB84vVc=;
 b=EVR7Wttk94IgYWeTxBw7dIWy3gnn2z3t2aQYLE8rV8bsjywafjIdQ3HUQgKpaXCwP5
 Yw947x79Z3HcsFZpAefohMZ3WnA4NVwxkxJxVGe9WyJtOY0Whyc0y0gEc24I1hgUg958
 0qMTUo/lAml2BQk1Oc/3EJwvmtPJEDQfeXBa5WmR+MoyQ5n3lqGesgEr3a1irrhOxlI7
 KQrnd5cq4cGf0ZWkXG1khtj9q6LYlrvI6xZHz2jTKqI5WdCk5hfzwMM0PZE/F3E9EF6p
 UujCeXRi5bOoRLEjE0sADnbt7j4ifv/eSw1gioQsHbKc+8wa7BUlubtDBL5/KtfoiIAL
 crcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EVR7Wttk
Subject: [Buildroot] [PATCH 1/8] package/perl-data-optlist: bump to version
 0.114
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-data-optlist/perl-data-optlist.hash | 6 +++---
 package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
index ccc05ae4d..6d55d6388 100644
--- a/package/perl-data-optlist/perl-data-optlist.hash
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  cda08370c4058ba56e40c2f21d94d233  Data-OptList-0.113.tar.gz
-sha256  36aebc5817b7d4686b649434c2ee41f45c8bf97d4ca5a99f607cc40f695a4285  Data-OptList-0.113.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  d63ec5d446eff1aaa5ba92bc13a52b77  Data-OptList-0.114.tar.gz
+sha256  9fd1093b917a21fb79ae1607db53d113b4e0ad8fe0ae776cb077a7e50044fdf3  Data-OptList-0.114.tar.gz
 
 # computed by scancpan
 sha256  712f3e40537810ba3046533fd71d877f69ab446d5e8e8a1135771804494b8b42  LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 1a9aa05cc..8c22cfe78 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_OPTLIST_VERSION = 0.113
+PERL_DATA_OPTLIST_VERSION = 0.114
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E86CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0AD940610;
	Sat, 16 Sep 2023 15:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0AD940610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHOjQuje_v8u; Sat, 16 Sep 2023 15:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E557140CC8;
	Sat, 16 Sep 2023 15:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E557140CC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BABB1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED79881CC3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED79881CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiSyW7bh70TK for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:15 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA4DF81CAD
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA4DF81CAD
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32001d16a14so419665f8f.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879053; x=1695483853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qJnEyaJX4hXhTm8ap4jRGH76RxbOcyMD+LikQZ6znI=;
 b=MXR8FTUkxXflizNKuLU1w+Vi5Pp1q9tVNIlUb+IKhDlKxIV+PqhZCBxTtfW6hYC5M3
 9t1jAIbuq6IRyGXCbW+rFY4fU5DRK10eflrT/u6XWqiLd9cjKuvHNPbp9eVSYXHqkK8L
 wwr1ZKaIBmmYSQpKAYd+yeC1Oa9m9Ws5WXNKeN7ao4AZMngExUsh67no1UqCTS2nAT7W
 k14cHC7ZjMgFr8P+NXhAExUvmE4ASdevSLVBnkwfB5jswGAuCSwj/ZvfsegAgJ1JL1KS
 19Mfhrh3p85XFFrBond0TN6qAUBxCVWXVsRrbVmdcAEmmilEHYeLUAHWTtEixxgjgaBM
 18Bg==
X-Gm-Message-State: AOJu0Yy2+Thq+lhMgSC3qcCy074LAylit0knrZDr2OgMwjW3TS6IWgkC
 k9HHnayQXvnxRsBlJcAd2NccdsfhmtM=
X-Google-Smtp-Source: AGHT+IFSNyqKFWGX2svQCDWtusTBXi1kU7NOhNBnWzevFnf3Xt0Fyd9zwXYGfIJN9QI8z/SPObjL+Q==
X-Received: by 2002:a5d:6309:0:b0:315:9e1b:4ea6 with SMTP id
 i9-20020a5d6309000000b003159e1b4ea6mr3358224wru.58.1694879052786; 
 Sat, 16 Sep 2023 08:44:12 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:12 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:41 +0200
Message-Id: <20230916154351.2747233-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879053; x=1695483853; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qJnEyaJX4hXhTm8ap4jRGH76RxbOcyMD+LikQZ6znI=;
 b=blzyDxYxUqrIWPEGL3P6wwSVVqifuaJ0zRnQ7cnJeu6scanrG0OEkHBYu7Crkm/Jbl
 yZoP6Lmi77qkMCF8/MqPjY73igOxBybCtLeoG5zEoVup3nyAmvOEen2S2cQnPuQxk2eI
 YiuBgAzMkTLfUnMQ71Iv78KY3i0/sedf+ZiFv65FJYzdMjSgWpx3m3a83OLR+qpXuZsv
 R/QgirDQ1KEnKl5DLmlSiRkHDBYnlNJro9gs8/V9kjVGEAPcvRWwTQcMnHg9NXCGTbY0
 bl7CyZ6/9SrNqdEa/b4sKSKZEyDJbE/HNkW9O2w2vkT9RQ1PjMcphFNyZ4fzSs8LZAMc
 0LAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=blzyDxYx
Subject: [Buildroot] [PATCH 06/16] package/perl-http-date: bump to version
 6.06
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

LICENSE: update copyright dates & reformated Artistic License part
see https://metacpan.org/release/OALDERS/HTTP-Date-6.05/diff/OALDERS/HTTP-Date-6.06#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-date/perl-http-date.hash | 8 ++++----
 package/perl-http-date/perl-http-date.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index b27842300..a6f770182 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2ecbb3aedf6aef062605191813ca3027  HTTP-Date-6.05.tar.gz
-sha256  365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b  HTTP-Date-6.05.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  60462359bfeb1e6d14602508cfd07885  HTTP-Date-6.06.tar.gz
+sha256  7b685191c6acc3e773d1fc02c95ee1f9fae94f77783175f5e78c181cc92d2b52  HTTP-Date-6.06.tar.gz
 
 # computed by scancpan
-sha256  305b71c4d2fd6380585689c5f1c620737a36a318ce0f9c772badce0fe293a44e  LICENSE
+sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 43583be30..1e46f1414 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DATE_VERSION = 6.05
+PERL_HTTP_DATE_VERSION = 6.06
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DATE_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

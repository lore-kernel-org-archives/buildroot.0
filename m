Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964BEC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC4441870;
	Sat, 21 Jan 2023 16:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC4441870
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6Zc2sG8aQ3u; Sat, 21 Jan 2023 16:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B4B41B39;
	Sat, 21 Jan 2023 16:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B4B41B39
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37E8D1BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20C7681D9F
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C7681D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPlRYJNOlQai for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0B182400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C0B182400
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so7846745wmb.0
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGcrRRQ3CCUE/Y/I7pEQATq2haAN6OlgGpFWRrghL3U=;
 b=cvK6mpAJQgfeaZCUWkUN5QZ9UvkI7CODB8uI/UXqpTj71wogh5P8a7S4S8hFZGQr2l
 N9tapLhr2Jy3lzCLxOdfS2ieLoincC9xTfoeiSMeoWZ9Y0nSR0oTHySdAcKgCDeb/kGt
 qLcSzCJfH75p7nLnkcKiqZz2shUiyEngmLalKVcx1BO+NYD4x37tJOX4uH/qCZbfA/c0
 +s/rNDqGMvLIACEoH/iOjv5DmI4mpcYTSyUh5wToGS7kFnlekBNlGqK8SN2nxH9Z/+5C
 CttWVImW1zIw5Ycfy/Ewp1qNpCEQIqJuQWc+zdlp3eIot0683/REuuXbIMzRh4r3S+Nn
 JaVA==
X-Gm-Message-State: AFqh2kozM2jRuzcl8uqdmqhM2zH89WftcK2a2tF+cCk/B6LpFbxVQiDb
 aHPhzaQOu5ZJ3bLih5GJm+9/Tk4g8uc=
X-Google-Smtp-Source: AMrXdXus5g9gWEb8npmhtse0L7o8friqEg37ZZ+2DkNweAhFklxFqkySNQ4gISC093M564LaHuO/QQ==
X-Received: by 2002:a05:600c:4928:b0:3d3:4aa6:4fe6 with SMTP id
 f40-20020a05600c492800b003d34aa64fe6mr18332143wmp.3.1674318961373; 
 Sat, 21 Jan 2023 08:36:01 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:36:00 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:36 +0100
Message-Id: <20230121163537.147981-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGcrRRQ3CCUE/Y/I7pEQATq2haAN6OlgGpFWRrghL3U=;
 b=FTKqaUOExbYIwNLvaxCdF6cIjoNq1Ia1WRGGtOpLFKefIV7x0CIw074bqeSJcPSH9P
 1a8X769dqTSv8/GK30DPqH++D9hd7+MjgLK9+wS8x2gV7Oi1+nlJ7k/LVSZNZRqrlD6I
 o9ifT5ZY5NP+KneyJKPNNhMnosM06u+guz/JibEfAYDoceJrbTCvUXvt4vkhRlq59o/f
 ZbKSYYXSX1LFrW8SYdnqc7v8tZGl9chraG8EAJM8zmzLDLNR4TisyAhdyH1oeNurUrtN
 hAK0eLbpjjLcUWtR+PX1NqpK0qMu1WBD21ZfQDbTESe5pGyW5LQYaHAFulEoG01Xypfu
 0JDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FTKqaUOE
Subject: [Buildroot] [PATCH 6/7] package/perl-mozilla-ca: bump to version
 20221114
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
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 07966f990..799a531fe 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  843e42f367ea3c7abc5de5b6225791dc  Mozilla-CA-20211001.tar.gz
-sha256  122c8900000a9d388aa8e44f911cab6c118fe8497417917a84a8ec183971b449  Mozilla-CA-20211001.tar.gz
+md5  2f136d096352a418e546e4afb70e7aa9  Mozilla-CA-20221114.tar.gz
+sha256  701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b  Mozilla-CA-20221114.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 6b970c0f9..a124860b7 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20211001
+PERL_MOZILLA_CA_VERSION = 20221114
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
-PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABH
+PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
 PERL_MOZILLA_CA_LICENSE_FILES = README
 PERL_MOZILLA_CA_DISTNAME = Mozilla-CA
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

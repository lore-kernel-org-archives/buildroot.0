Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F4FC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7C041CC5;
	Sat, 21 Jan 2023 16:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7C041CC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXNx6kdPYNul; Sat, 21 Jan 2023 16:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D703D41BB3;
	Sat, 21 Jan 2023 16:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D703D41BB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 172BE1BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6FDC81D9F
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FDC81D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdqdGlPD10_z for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:36:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF80D81836
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF80D81836
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso5716027wmq.5
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UtO4tzCyLuXJuAj+jLSTqhWXAUgiPHbpOxRSIC3elaM=;
 b=223ylnRasMDlrn1uujQdrS4tIMEMurdhyjKuzzkyOP5vrel5bCBmQ9lzjIQyQSDm8I
 CFvuRxkiHOoBvBBacX4V+neEkVAOKc+NfJM5492KTJnZ+Qz6QzWYk+RMClcHsGIXifxC
 PKCroqB7UlmaT0mRPnlBwIY5rUJDHC2eJHfhSltNelulvRlttYZy8wtirvULeQ9rKCtW
 Mc5C1YxQn9QZ3AnhIdM9hZpUVInN0bkL0aw82fOnQyjbsY/TXan1WRwMnZLVzXHQjOnN
 /AkMTAL4VU8gIobBuNaKnTBNlr5N2wAipK2XohCrJb/m1PYEFNfyGfomfvddNZx+JHL6
 8DUA==
X-Gm-Message-State: AFqh2kruX6biPfJWccqrfVxcP9nBhkahOPVecm/uj/nr9R7s/eVg7f5V
 nYcUMw3yKow1+XmLqW/C1wjAslLfl7M=
X-Google-Smtp-Source: AMrXdXvWHlambQO1fIyPM1MJ3TIUnXkHmC1MH2AqptymX67ThVGH8iaXk7VHfByYjsiVRFFCkRtLfg==
X-Received: by 2002:a05:600c:24ce:b0:3da:18c5:e48b with SMTP id
 14-20020a05600c24ce00b003da18c5e48bmr26454031wmu.18.1674318962204; 
 Sat, 21 Jan 2023 08:36:02 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:36:01 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:37 +0100
Message-Id: <20230121163537.147981-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UtO4tzCyLuXJuAj+jLSTqhWXAUgiPHbpOxRSIC3elaM=;
 b=MfXTUhODw/k9TGq5S+vqqbWZtcZnEd3euViJ+vMLVWUfmRTFL8UH/apJDRAlXiVw1R
 RlEqy/8GOiab4uqKdZO2FpSzawlYol0hfBe4uFgsYcuARMce5yvYDaw75vU3Na36Yjpr
 wYxCKvksxWJ8aDHvGX/uOa22WwmTFJH1+Khfwg2ykLVqlZI/1p3Qs33W6atkHjrHEJLJ
 0QHh2a8YGuxo8LNb+VMOlg1jq8P9fq/MUJ7YPvwEeuXK0tTm08Eu5TJhX6qcu3rGEVLr
 pVRjIJl8ZTmB6Tnty7VGWWid8nbipkczDiUI44omaoyanydAK11ve79TByxv9KdHIe3O
 QsSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MfXTUhOD
Subject: [Buildroot] [PATCH 7/7] package/perl-path-tiny: bump to version
 0.144
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
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index c6fe8bf92..7874846b8 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  16dd03cded30d00167a03315d0e11e51  Path-Tiny-0.124.tar.gz
-sha256  fa083144781e46817ec39d21962bbbb0533c201f3baf031d2999a785a2a013fd  Path-Tiny-0.124.tar.gz
+md5  7b2fc4f5edfd29b88d2cc3b96830e7d1  Path-Tiny-0.144.tar.gz
+sha256  f6ea094ece845c952a02c2789332579354de8d410a707f9b7045bd241206487d  Path-Tiny-0.144.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index a0575172f..6d784a0d1 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.124
+PERL_PATH_TINY_VERSION = 0.144
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

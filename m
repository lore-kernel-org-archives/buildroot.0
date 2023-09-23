Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABB4CE7A8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0103C400C5;
	Sat, 23 Sep 2023 07:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0103C400C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YW51uEQce-Cp; Sat, 23 Sep 2023 07:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 286B94148D;
	Sat, 23 Sep 2023 07:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 286B94148D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A00CB1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69B55820F1
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B55820F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwTDVOz6OPmq for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:58 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60318820C3
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60318820C3
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-405524e6768so8949525e9.2
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453716; x=1696058516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dulhpc1soESrVEGdc6ase8grptZGo6QU/7gAL2XaRcc=;
 b=gZpjBC+a/PtvkesemBTRelg0EJ49bHEorPWX5C1JeaxqSAsDe50c4zoLWSdF9Q1X1+
 O2+BRsGAuTBFHlhcgm7i/BbMfn6DoUiNGbntM05cJYMySM1AZ8HXAxO5OKRh92cqx9ZM
 aEIUBCxHEYAYWIlmTEFLXroZQMO7AfHK7+mMiQpQtDL9Pfgc1tJD6Xe6GFA81jRZHZZL
 +PKrrPsg/uTh72CbrAcxODUSNdQqoXPSk5bGIZJ9xlyBSKjkiiQZs6x6ii7U548zPT0Q
 mZzY6AOgeqF87lvZDE/QAfThPzKRbCuCToHyS7SbPkFxz0dIKK+MNr37ep+2TeH4FX/F
 yJyw==
X-Gm-Message-State: AOJu0Yxp3Jnb+wBdHsWyq/Ha+WeJhFktSvYI0EuibArlTMqEv9KF9xXT
 ksMH134vSN+QJFy7Xqwb/UKQXnxI0Zg=
X-Google-Smtp-Source: AGHT+IF3654nzAqGLw4RljIa7biCdCdHXLsefhUeEu+Vk/Iw/dt06nCHj2Psqv+Fsk09Hj1ukRp6hQ==
X-Received: by 2002:a5d:4577:0:b0:31f:f9de:6a4e with SMTP id
 a23-20020a5d4577000000b0031ff9de6a4emr1388669wrc.69.1695453716529; 
 Sat, 23 Sep 2023 00:21:56 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:33 +0200
Message-Id: <20230923072133.3122644-12-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453716; x=1696058516; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dulhpc1soESrVEGdc6ase8grptZGo6QU/7gAL2XaRcc=;
 b=XdKyXxo820chMDCON9raUm+HlkfF4B71eXD8sduKmHicws4EkK0l4oOFSsI4duLNrK
 4b78f0AEkbf6UoUwggZafr84hfKv0K7uByf+bVjlHoVcxCh/v3ZsBsfQDbYwkaYXECU3
 4wi1lS9WWqorwug2dUxXeGM5s0rlUnas+oQpIJ2CfJvpG+6z6pJxtp2BnIBCv9HKM2k4
 5S28h2trPlUIiMugByeJSrjeQ7GqUW/uwC0OtOlWtr5up7pzMd579zT50R5cwfJbJKEd
 /Q7v+86aoCRhAvcYBHxbKmjXVI5bxIws+kpvz3oh39dbVmCiRMOyTYHFSBFdqA8dQowL
 JUyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XdKyXxo8
Subject: [Buildroot] [PATCH v2 12/12] package/perl-tiny-type: bump to
 version 2.004000
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

LICENSE: update copyright dates & remove trailing spaces
see  https://metacpan.org/release/TOBYINK/Type-Tiny-2.004000/diff/TOBYINK/Type-Tiny-1.012004#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 8 ++++----
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 9e5924abb..bca5153a0 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  7a1688c4de07a0ed481a1811e5e82e63  Type-Tiny-1.012004.tar.gz
-sha256  75cd06b612d1830ae9f4b22298b506b3ff04518fa7453f487c248cd62a906a2b  Type-Tiny-1.012004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  08bb43feabaab97dac7a3e59b5c77ff3  Type-Tiny-2.004000.tar.gz
+sha256  697e7f775edfc85f4cf07792d04fd19b09c25285f98f5938e8efc4f74507a128  Type-Tiny-2.004000.tar.gz
 
 # computed by scancpan
-sha256  34427749499bd6d6e5d206089bc03d76c647a1350f8b5f95ea628d2b6ff56e4c  LICENSE
+sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 5efa78f16..31c84a263 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.012004
+PERL_TYPE_TINY_VERSION = 2.004000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

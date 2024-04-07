Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40DCCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 965CF60A3F;
	Sun,  7 Apr 2024 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCKfrjDkROCA; Sun,  7 Apr 2024 14:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7238608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7238608A5;
	Sun,  7 Apr 2024 14:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3072D1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28AD881E47
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7iUTlgc5DUu for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E67C581E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E67C581E54
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E67C581E54
 for <buildroot@busybox.net>; Sun,  7 Apr 2024 14:43:18 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a51c6a911a4so67265066b.0
 for <buildroot@busybox.net>; Sun, 07 Apr 2024 07:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712500997; x=1713105797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAb09UxM9g9HMgsSGpbe4nqkyGrsKLcc4t3xrD01oPA=;
 b=rBzhfpEK21LxGcty/oEIjNjTc5bhBe5PHH+i6N9hUuL9ImFX/g4IrpZT86iD350efV
 iHLSI342dupQXkAxgMnJOqzeWqvFoITzGQLBFfGvIWvpNTjzvJFxk8Xkn77a4Up1iALU
 dLo4xESu6tqf68Fs3KJhHUKEIGrgt5kynRFlcIBeWBv0kqpN3crTlFvlkMKwJLP1ccHS
 qwA/LQlywL1QWrZt9s2udE0esNrq/km8cMaoibIuR/Ko70A65GlfnS6iLSe7pcNiXH7F
 o0kDHrfYkXVovBqp/z/c2nIM8jJ8D0n4QxiOsLNdo/ZYy3VyFlslO+BWKvT+TRSYQvhJ
 pYSg==
X-Gm-Message-State: AOJu0YzVU5BUuM0Qd6KqgUnRdmKOQKyw96OYY6x6RBEcIfP5GKoIRLTR
 LjJf4NEQa+qyr2/VO96HHAfBjAupqkYRivTRXdO7+NDsmpYquHBKmfioFaDB/r/LDv3stQaxu00
 =
X-Google-Smtp-Source: AGHT+IFpww5qvqYL509+xG/BubGPtntUD6B8WVWTmPoMTc6Go8aQIOrztyBugngZa9B2PRrjJJCm6A==
X-Received: by 2002:a17:906:abc6:b0:a51:d0e5:c812 with SMTP id
 kq6-20020a170906abc600b00a51d0e5c812mr935698ejb.17.1712500996733; 
 Sun, 07 Apr 2024 07:43:16 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bv4-20020a170907934400b00a51ce4710c5sm785136ejc.19.2024.04.07.07.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:43:15 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  7 Apr 2024 16:42:49 +0200
Message-Id: <20240407144250.7558-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240407144250.7558-1-francois.perrad@gadz.org>
References: <20240407144250.7558-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712500997; x=1713105797; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAb09UxM9g9HMgsSGpbe4nqkyGrsKLcc4t3xrD01oPA=;
 b=BQQSaBrgw8AdRG1VfKC6CMF+kcnUGZd7UKWGSuN7HU5kol1FJOxdQMdZNUhWcc316x
 hVYyKu+0dT2ngiT9JBvIX8l4v/FtjzAsPvY0Uqg1AbkSuyqikFXnR31s63Lz5xFSZacR
 YseEQ1w+hu24Ed8JmY7KR75IYo851TPkK/dZFdv1yuH1omsRp722R5W6XVeXaGB5JR70
 SSzFpOcbI8L7Xlh0dUABilFkDdVoISdMjKSVg5LzGbHqn+REPbpGDBUSCTWuXTaEFuvv
 ZNX3l0xvDxxfeo5fRdTxUt0V9baIVXCMsMo/5mW8lgo2vpYMkQAd1wK7qu73lSdNNIYY
 IsRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=BQQSaBrg
Subject: [Buildroot] [RFC PATCH 1/2] utils/scancpan: generate PURL package
 variable
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

follow https://github.com/giterlizzi/perl-URI-PackageURL
where the author is used as namespace

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index e7739a8ad..fbf17d0f9 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -754,6 +754,7 @@ while (my ($distname, $dist) = each %dist) {
     }
     if ($force || !-f $mkname) {
         my $version = $dist->{version};
+        my $author = $dist->{author};
         my ($path) = $dist->{download_url} =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
         # this URL contains only the scheme, auth and path parts (but no query and fragment parts)
         # the scheme is not used, because the job is done by the BR download infrastructure
@@ -786,6 +787,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_VERSION = ${version}};
         say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};
         say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
+        say {$fh} qq{${brname}_PURL = pkg:cpan/${author}/${distname}\@\$(${brname}_VERSION)};
         say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname} && $dependencies;
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname} && $host_dependencies;
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

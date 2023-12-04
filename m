Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D720C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 17:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE6AB8207C;
	Mon,  4 Dec 2023 17:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE6AB8207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJ90jXPQgEMP; Mon,  4 Dec 2023 17:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1097782034;
	Mon,  4 Dec 2023 17:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1097782034
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63E051BF322
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 17:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 367E481BBD
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 17:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 367E481BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRTGkBsvKPrc for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 17:41:48 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AB7A81992
 for <buildroot@busybox.net>; Mon,  4 Dec 2023 17:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB7A81992
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso1172310f8f.0
 for <buildroot@busybox.net>; Mon, 04 Dec 2023 09:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701711706; x=1702316506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H11Fe+lhlQ0suV6SARqpWHSXO6p3Epk7bHD5E70/5gc=;
 b=H1ujQTuE7UJvvsSrpvyvNZNcY9DCEtxBWy9UecT9MN7soQ1ZwmQxLrkdpJqNwCHDp2
 /caoweR24JcrW7aDnXrwI0l52/dEKxphH9sYx5J7ADwyVJiQXiQixKuKP4NZa/wXEmI6
 WvsanT1mt6SflYIHRJAJnoXy6k+4bXLNaGCM5Q8mAPVve9Qriy8OJQ4+faLyY3k9803I
 o4bP3H9Jm/Aq/LeCyDA4Bg7A1ixPd3/gceq2vpE9hi+HXoYBrnBaY0PD7TbpBFt70Ust
 zCr7+Q8Y00LSfK+3IWzJSFHkekyoPfUfqx5xHrIBergIFRmIZbB0+arDC2+VVetXHoKv
 h7ng==
X-Gm-Message-State: AOJu0Yz2Rgx2ln/nPxXDzRU3cGN3K3jdRZG/Qo6HKX/FCFycH5VEyVIv
 fhSCHNvnOJjzh8iyq//hyjWTVWWB28M=
X-Google-Smtp-Source: AGHT+IHdSEMxu4NbjmjeINyAO2rI/ScWrTEhiCgwa0sZ5jY9SuAXtYJ2GLqmq7XMmr4A+8smXQS98A==
X-Received: by 2002:a05:600c:5198:b0:408:369a:dad1 with SMTP id
 fa24-20020a05600c519800b00408369adad1mr1946874wmb.4.1701711705933; 
 Mon, 04 Dec 2023 09:41:45 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c451400b004094e565e71sm15959019wmo.23.2023.12.04.09.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 09:41:45 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Dec 2023 18:41:19 +0100
Message-Id: <20231204174119.678774-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701711706; x=1702316506; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H11Fe+lhlQ0suV6SARqpWHSXO6p3Epk7bHD5E70/5gc=;
 b=jZTSyvkNHPsaUzxIckn/5y5FBiqnl7m6wzKNhOQHesdgxHrJqXThjjDXL1AG3TZfKx
 3Zq6M4n5UYxjJv4dd0lSQy7GOlXGt35CLssBSUTZzHd8oHIoKOfK0L2cvq2HLBqtLJWd
 YmglK04Xsx6VIng1P1KugArcXR3iWmxZC9ML6fdmclRoa1Q7X8/x3ExKNKTce89NI/0U
 9bhKAOeoEfkCk4x+NNtg9nonQwk075XHObTBvpCqnNyr6YfbdopwtOF1dLhSRWzs/9+S
 XSKZbNfuHT8y2GjV6H2uVzHnrAub+oPMLGOEqU0Ikuo9/Zuv0sUmuspV40W7xhCCQt56
 nVoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jZTSyvkN
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.38.2
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
 package/perl/perl.hash | 10 +++++-----
 package/perl/perl.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 983b921e2..91abcdeb9 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.3.tar.xz.{md5,sha1,sha256}.txt
-md5  17946060e6279cf32d08edc92c40efc3  perl-5.36.3.tar.xz
-sha1  9949e79c92171b39f4fb2b19ffd4ea293b8dd589  perl-5.36.3.tar.xz
-sha256  45a228daef66d02fdccc820e71f87e40d8e3df1fc4431f8d4580ec08033866bd  perl-5.36.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.38.2.tar.xz.{md5,sha1,sha256}.txt
+md5  d3957d75042918a23ec0abac4a2b7e0a  perl-5.38.2.tar.xz
+sha1  af1d5f9e0499f3cfa4736433631aebf7624714da  perl-5.38.2.tar.xz
+sha256  d91115e90b896520e83d4de6b52f8254ef2b70a8d545ffab33200ea9f1cf29e8  perl-5.38.2.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.2/perl-cross-1.5.2.hash
 sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-cross-1.5.2.tar.gz
@@ -9,4 +9,4 @@ sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-c
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  810c97bea10842d2e47bc79e51acdfa1628cfee34fa0d89330f4eb3a44e3def9  README
+sha256  9519aaeeac509b3fa8778155a63545b6086f8313546b93fe9958d1c434d476a8  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 71aef9997..9de0425e8 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_VERSION_MAJOR = 38
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

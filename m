Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D259BCAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 06:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 504EA844F6;
	Thu,  2 Oct 2025 06:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZymfGk5Rmh0; Thu,  2 Oct 2025 06:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 665CF844F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665CF844F2;
	Thu,  2 Oct 2025 06:57:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 712D9CC0
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 06:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 633C0844F2
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 06:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heY1c2rgoJNu for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 06:57:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76B3D844AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76B3D844AD
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76B3D844AD
 for <buildroot@busybox.net>; Thu,  2 Oct 2025 06:57:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3be330b1f5so138900366b.1
 for <buildroot@busybox.net>; Wed, 01 Oct 2025 23:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759388232; x=1759993032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZNLR3Sgg83B2clr2zBMkhW4uZL2hOPGSpfePyZgS+U=;
 b=P8vY0/JCLPb4cUlKi+aklOxp5TniZGXTp1GqcFx5CB6Djjx+E51ce59uvTZRVY7PIS
 hzPOnlIeOYza04Olk1cX6S4aXaBF4LaSdHOtoJOSxeUfsFgG0StcayNFm4TNffFTsD1M
 YkpAN3ZqiQNBiLpzuVT75ZxWarv9gc9m13Xy/SSWpVXl8clV5Mvx67razUmWexqmbpi2
 6WQ5NMcByzFLs5btkUZMg9iUMseESZikBCm9BLqH6YMwX+BH6qj9CqIEyt8cFI4mUgy3
 i8S//JH3u7dTcdVTXnSg7V3ARYLRp6SqDcU/Oygqz7ZCHCoOkHqcbus//fToRavsLNpC
 TmYA==
X-Gm-Message-State: AOJu0YzuCuZj3ZtR9fabwkrA5eHKm3+y31LMGsN53yg4Z1XD6Y3TD9OS
 RzAXI3NxiNEknDP/aHtn2HfgFoHktKTzlytU6YAa1xPr3w318NSEt0uuQLh57TX3YCuoQqPBtIt
 EUQ4fyA==
X-Gm-Gg: ASbGnctUC7EfSrCvbZlFk63rHKEJlfDuaInbfqqSnJwXmXJ3fPEKpPY7s/qES30dqWi
 EC3poZiMYHIoeOWxB9YpSI4Bv2inof4koLlOvz7FZtkjXVNiysCZNk9SjvINj0+oi6xzVqA6EcL
 lL9zAsP2y8pHvzR1VF4iPOUQtCFVAjA3FUejeb/r75NB/k8kc2coomA3K0JrlDrq1tnyqSmxjeQ
 e6Yp57RBxbdqHqHVQkVOhG+3T+eYHqVTIFJ3blFB1r2j+R8MK3LrsqYoaICoJJJLceYCKd9ntc6
 36yhO48EOTHR5I8Z21vS1SeN9JbGUe9SsF1HZmB/sjcY3qViB6nZKSkCoC4HEC9H5rxBxZuOg4x
 cmIPXc8zaDnh/mXZ8oZxmAcnOZl92cgGMH94dBvrylIrG1FLYKhAiVIwSclQxEhsQHd8vkySDy3
 5QKV+xqb0xqRMa/SY=
X-Google-Smtp-Source: AGHT+IGJ8mW6KlDlafGwNHz3e4QXOu26hXa2ICpHtlKrfYcpl4r1zzbYriCZ8ITrDQRqXDxav9IU9g==
X-Received: by 2002:a17:907:2da8:b0:b3c:a190:b85 with SMTP id
 a640c23a62f3a-b46e632d497mr745524066b.21.1759388231855; 
 Wed, 01 Oct 2025 23:57:11 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9bfcsm140715166b.17.2025.10.01.23.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 23:57:11 -0700 (PDT)
To: buildroot@busybox.net
Date: Thu,  2 Oct 2025 08:57:05 +0200
Message-ID: <20251002065706.1010793-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1759388232; x=1759993032; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zZNLR3Sgg83B2clr2zBMkhW4uZL2hOPGSpfePyZgS+U=;
 b=GyeNgOP4To1G08JhjeXBzdMzr+osqNKMqVILfpbkvMOPabcz6PGY1xPow7jV6Gcf39
 WqPGJ8WvVu7n9ftITtvQgkIO864F13rMRlKgpzA8C8s49BvPq/Y9k2TdFk6C1N2vsv9E
 RFP048UVKTSlHl2lsYqcqgo7l6HB27WNmZJaURqIInBP0NC/qibtX3VPw3DjfXPkS0YU
 tm4Z0h/petJiMFViEXLfKtEk3L9/WoYvlgjTGlu0xA5n4zugxR0Pqa0QFr6hu24uMPRT
 MkaGg5+aH9hamqIrm1Q4/Orf+WcQsRr/4aoRYdgtpjhv/ChRvksnAsnuidkikFoPWaN0
 6FSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=GyeNgOP4
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to version
 3.5.4
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fixes CVE-2025-9230, CVE-2025-9231, CVE-2025-9232
see https://github.com/openssl/openssl/releases/tag/openssl-3.5.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 2 +-
 package/libopenssl/0003-Revert-Fix-static-builds.patch        | 4 ++--
 ...Serialize-install-process-to-avoid-multiple-make-dep.patch | 2 +-
 package/libopenssl/libopenssl.hash                            | 4 ++--
 package/libopenssl/libopenssl.mk                              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 2634d69f3..f74576bea 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,7 +21,7 @@ diff --git a/Configure b/Configure
 index 15054f9..ac3206e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
+@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index e800b782a..10ca97a24 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -18,7 +18,7 @@ diff --git a/Configure b/Configure
 index ac3206e..764ef89 100755
 --- a/Configure
 +++ b/Configure
-@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1807,6 +1803,10 @@ if ($strict_warnings)
+@@ -1808,6 +1804,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
index feb0e21ef..344b8d07b 100644
--- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -26,7 +26,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index e85763ccf8..b671723813 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -650,7 +650,11 @@ depend: Makefile
+@@ -661,7 +661,11 @@ depend: Makefile
  # Install helper targets #############################################
  ##@ Installation
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index d0ca45d30..e78b664aa 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
-sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
+sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b892d4e23..2f844fd44 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.3
+LIBOPENSSL_VERSION = 3.5.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

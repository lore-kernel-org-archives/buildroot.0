Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEBFFF887E
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 17:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD3F84555;
	Wed, 29 Apr 2026 17:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1ftikpQaNrp; Wed, 29 Apr 2026 17:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30C9984551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777482505;
	bh=2967tCB1G3p8QzN/2J2cv1jOy3irsZXIILghhSeqAnA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVO9L9eO0S3fo2/G/WNjZ0nNRiejrpc26RzUO/HPFJmxGWkqxKiCkRvInm3ZEOhpE
	 XT9mooefbDSHsuXwMtVHl95Gc8wtbWWNhKNb0Hu66waF2OUpN3WLxHI6MPspKk7YE+
	 3P/6AQO1PzaeAzcE2KRSZOquL8gkJMAeml3Se5VyyqcwMFtTEILHrrtPwU0eRo7PMU
	 zABKE1T/sW7qDNfNh+IihHovWYrR1qigpVEfIof5h3xYfJyGgOk0XlVSo6Andh16vx
	 4zVelTg1ItWMfRhufuLw0WcAsg461lP0LvCxjXqhWbExPpichpPRrY2j9nAi/JEdEP
	 D73eH31qM8hDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C9984551;
	Wed, 29 Apr 2026 17:08:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C96A91B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFCB34248B
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MECAE1MWEDIv for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 17:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBF3842270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF3842270
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBF3842270
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:08:22 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2aae146b604so115925ad.3
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 10:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777482501; x=1778087301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gvQSGcnBI6gXPMmaemwt+jWhNb8ku48E97KAATStauc=;
 b=bHuiGv/tVdFt+UxMYtGs6/xZHf+Ar09wGwvpJPF2d05dQvTi0eqrR7h73DHAmLsBAA
 KzL/LWpRHJqbipJN5vyUWAcfIRtI0AQeBKNUr9foFC2/YBvI/Tpm2OqO54m7nDd54o2N
 JXgo/nob6HsxGcRrKHttrrRjdmGJlWSh6mO3QnJi2OngoD/ohmn0ejHxGe0oH/k3ev8e
 +CEnlqf0ZTAX7uUu2qdoM+ngfDLp2UsjpD/TXCjoU8dPAp1VOR8RqUeXRi7htUQnzpmB
 EcNjfMBUIpuN2t2D4qAkjPsXn6uHJ3vBOQDKsmrbFwEuXcOgJZWdHZAcjFQGcIvchClb
 qmAA==
X-Gm-Message-State: AOJu0YycC19BkjwVyIOjS/k9jcBTWKifYCPb90r9CQrnbEz467zs75F1
 oVVLfKIZ4NKxLw6RfE5XixERYAlfeEnULr/9/0/T9ZicEjNbMG4agR7qjdCzPnk9
X-Gm-Gg: AeBDieuWHqiGM7TrmoKPBubC9sdU1medOgJlZ0ZC9B1MdgQLm2BvbLaL7DlXt6Q+Tb1
 D2zzd8s0YN+tllv4jb/1ivCpAfZvyrKV/xpIx3Urt5SifjhTOvSpBje18cEDRCschUM/oUCAI94
 //Xm4c8txHzbmZZL7uZ2QWXYJtN2D4T3rLE4zfK4ljkRnbQNgeHTiiaea4uoAmY6wONPNzRtbc2
 0PCHycCP4BsTBqwwJD6OUG+Xbh7K4RxZ8IbMOGncJWcN2WxAilUWBRLsKRFCsjiLgcHf3EkytQM
 UpAx/HUo+JrVcB38QuhwXm+2512ls68ylesC2mh7aFX8J7rI+rJevloNFqgNId+HoJiQQtfIWGc
 JIt2DakLlM/Yj64pwHMUHFC+yg/cv4eLJ2UJPMDR20JP1WV+L3oAioZfDiajebLRk7KnuRXpoYL
 vDrZClISwdaHEWyR4h1ko8KB2YrTvtk1LqrN2+fSMRmiw=
X-Received: by 2002:a17:902:f549:b0:2b9:8d39:5e87 with SMTP id
 d9443c01a7336-2b98d396368mr27550485ad.10.1777482501312; 
 Wed, 29 Apr 2026 10:08:21 -0700 (PDT)
Received: from fedora ([2409:40e5:101a:749:12b4:d7e3:4df:eaa1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b98893f0c2sm28392195ad.51.2026.04.29.10.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 10:08:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 29 Apr 2026 22:38:07 +0530
Message-ID: <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777482501; x=1778087301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvQSGcnBI6gXPMmaemwt+jWhNb8ku48E97KAATStauc=;
 b=TbL5zJ1Vy33OoQBoIwyttCNEbSAxAJZQh0Wh6y1VeLHnMw+Ci0Ns5vzWxvPpKZ2oWv
 u5BMWmELx/VTILIvI6w7IMNQjCygfzT5aB8nM3fPwDdO51+eteaewaCOafDsiU/CvNZx
 /+FNuo2Aea71g8PfrUKpsHgmiaVp2hf9mNBCIm8ANdDa/gbRp4wgm7GHThirUGOeQcVv
 sJs2YBmGcpgS/QtLxi+3hYMrswRojmn2KC2uYMRlFU3OKhrnkH9t8vwFgAFwLNKiA+Fj
 ETlIcUgXoJpxY+JVzx9Jlcw09rG9O4UY8inmqcnvPT4wtEecH9L2ct+B92Mnnj1bS0TC
 Z6xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TbL5zJ1V
Subject: [Buildroot] [PATCH] package/nginx: bump to version 1.29.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Security fixes: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647,
  CVE-2026-27651, CVE-2026-28753, CVE-2026-28755
- Feature: Multipath TCP support via "multipath" parameter
- Feature: "local" parameter of the "keepalive" directive in upstream block
- Change: keepalive in upstream block now enabled by default
- Change: ngx_http_proxy_module supports keepalive by default;
  default proxy_http_version is now "1.1"; Connection header not sent by default
- Bugfix: invalid HTTP/2 request after switching to next upstream
  with buffered body in ngx_http_grpc_module
- Fix bootlin-sparc-uclibc build by adding -latomic when needed this caused
  build errors in "bootlin-sparc-uclibc [24/32]: FAILED"

https://nginx.org/en/CHANGES

Tested Using:
- utils/test-pkg -a -p nginx

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/nginx/nginx.hash |  4 ++--
 package/nginx/nginx.mk   | 13 ++++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 7b79036b20..6d2e957041 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
+sha256  673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139  nginx-1.29.7.tar.gz
 # License files, locally calculated
-sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
+sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 41490caee2..739d3cfe0f 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.1
+NGINX_VERSION = 1.29.7
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
@@ -16,8 +16,15 @@ NGINX_DEPENDENCIES = \
 NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
-	--with-cpp="$(TARGET_CC)" \
-	--with-ld-opt="$(TARGET_LDFLAGS)"
+	--with-cpp="$(TARGET_CC)"
+
+NGINX_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NGINX_LDFLAGS += -latomic
+endif
+
+NGINX_CONF_OPTS += --with-ld-opt="$(NGINX_LDFLAGS)"
 
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

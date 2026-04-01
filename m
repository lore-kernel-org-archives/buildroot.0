Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C8E10FCAD5
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 20:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A05406C6;
	Wed,  1 Apr 2026 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IGhT-pr0Dmp; Wed,  1 Apr 2026 20:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97986406C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775075733;
	bh=om0z4Is6Hx4uAUhsskDnxgcqFsTWgnz0oYguTbpeJvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Y37AtPWTgo7AjSmLZkUb0Q/4o8uCFoxDIXLISKMcEuq9B+2SbExH+4JdkIcubR/7Q
	 CGU0+DgM7xN2k6tmPQzJwZmo+yIDQYYUFc7mRoLHMmU3OPjj+biFg5JKu5g6pZ+AqW
	 rLw4SazpEhRTT3NJYQGgP4gIgNpk2wBvvwJTn6sbICsFRkzHlGIQIl3wQtn+q+zccH
	 ivKeyvJ3wtRpgHBTn8rwpPrVk/notzTD0Bao96qcrcqOavNlTCVXPoOY2PEj2dm2Mi
	 pTKRYqlwMO0pCD7SDBgBeCP8G/9hIy6JR27vMf/UazUbIgi559ly5WqJJI1NSC10nV
	 hfyJPzEUBJ5Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97986406C9;
	Wed,  1 Apr 2026 20:35:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E68992E9
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 20:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6DE040026
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXhIKpWAMl3D for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 20:35:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55B8C40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B8C40012
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55B8C40012
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 20:35:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-66bb6eb28acso398803a12.0
 for <buildroot@buildroot.org>; Wed, 01 Apr 2026 13:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775075727; x=1775680527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJn/z3979YLzKWK6Tnag3ScQkIxGy4rK3icanR6S0Ys=;
 b=IoA0VwG6SqJ2VRzhWGrcBGMN555gOSOUzipwlVYtu6JjfGyHTQZwCECjMcCdanCYEk
 z4Mvp842deZyUuO4wg2o+HPnMZmC8P1Toi6zJCt8oEKHJZXI4l+PLQG7z68lBb50mcwB
 ibMSd/K9hp461t3rdqfJga1Mvz+Pm+Q06QJJqHZeLJ4pmCHh3HkSx0kw0Rs0HHxHZzoy
 wN+zrlp73oBqdY+A5PptcPKcI44fG3Ec0s3pgNr6RtmlKMLR5ogsmwlG/7gldWho1M7u
 pSDoAX4bqjkE35P1lfw6UJB1gf+w6lJS0nhv7HfVmWQ0xuyDZUAi8N1TZqP90O/UP8W/
 XkOw==
X-Gm-Message-State: AOJu0Ywp208MDbtpr5+mawBlQ06RIcH/cvQhs1IH0wofugUc6astSvAj
 TiqRW16dCegUbAzZGIDlV5Xw0n9Yt5Tvt0LQhsYx+my/ZXXZTXOtVQNrb3ZjT5TRbwdTjy4LEbQ
 47wFjKOk=
X-Gm-Gg: ATEYQzyKvK/HvX7CP5/cokTyxwh/m+BrNWg8C/Kw1/ZZu3Ijdpsa3xA0E2gU48bhgG0
 4AO7I8KyKuluhu0cboDnER+RUbLMVnvUqzrc3wWRNNPWiaSrfi/siY0ZZoO8UATINimYfs0m5rd
 PfepxZP2NmsgUuHnMIO4cmG7HV0tRgJGaz+O+l0H07v1I97asugA1Ajz0392ODu4hWNG/SBaj3a
 X2unf7RBZXLCpFcoAM6h3jR8vC0+TmGgPX7duJLuDRYdkSTm4Tq7wcAdNoVKN8XgSrC7YYjJDEw
 EG0hBw6pc5QakAQqlsvGoBwlKN14pRzYEoeikSBIHTaCG9Z4UAgTxJ/I18QMtlQAoXVefZhrx9J
 QOOWDA5fansacj0K6Hkdfl6zokuNTSLS41Y/u0x81G04lvQSEvwt0Cy0DC98v0vDDeIUUJCUAxf
 DUX9QfFBKk0snoxZfxzNYxNElQlzLjSvazkZS0
X-Received: by 2002:a17:907:1983:b0:b8f:f08a:4b80 with SMTP id
 a640c23a62f3a-b9c3edf6a6dmr43133266b.3.1775075726638; 
 Wed, 01 Apr 2026 13:35:26 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3cec6c3csm21379166b.29.2026.04.01.13.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 13:35:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  1 Apr 2026 22:35:24 +0200
Message-ID: <20260401203524.595554-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775075727; x=1775680527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YJn/z3979YLzKWK6Tnag3ScQkIxGy4rK3icanR6S0Ys=;
 b=d+scwjEqz7AQlw1SIy3iFRyNBIyn2V9C+8+ucPEjIRZCey8OkOZhLFQyvC/eKBJRQy
 i1MCezUdbH38EzM8CyQEabw4V5qOgoGAm9gqpfabn3oPRdy5L88bem80Cq0ATGH7uXu8
 SAIRKLGXWZL8Aj0ePHzoSWsMtzApPh8fmhw9QD3vVPk4qdi3zTLyCYh+eCVmGXXttyVo
 hGpoPBrzT6Z4eYRw9tctr8uabibaffFeGrgLAALPwQnhmkAg8CT+o1xzfdG+FgoODest
 W5b4Igcelp92PS/IQMcg97Fbs4mKXCRbh4V4qk+dk+Hy7lHbjWy1yNwlYfEctezWOZ0P
 PxmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d+scwjEq
Subject: [Buildroot] [PATCH for 2025.02.x] package/ruby: security bump to
 v3.4.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Read the announcements:

- https://www.ruby-lang.org/en/news/2025/10/07/ruby-3-4-7-released/
- https://www.ruby-lang.org/en/news/2025/12/17/ruby-3-4-8-released/
- https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/

This fixes a few vulnerabilities in bundled gems (ruby libraires):

- CVE-2025-27221:
    In the URI gem before 1.0.3 for Ruby, the URI handling methods
    (URI.join, URI#merge, URI#+) have an inadvertent leakage of
    authentication credentials because userinfo is retained even after
    changing the host.
    https://www.cve.org/CVERecord?id=CVE-2025-27221

- CVE-2025-58767:
    REXML is an XML toolkit for Ruby. The REXML gems from 3.3.3 to 3.4.1
    has a DoS vulnerability when parsing XML containing multiple XML
    declarations. If you need to parse untrusted XMLs, you may be impacted
    to these vulnerabilities. The REXML gem 3.4.2 or later include the
    patches to fix these vulnerabilities.
    https://www.cve.org/CVERecord?id=CVE-2025-58767

- CVE-2025-61594:
    URI is a module providing classes to handle Uniform Resource
    Identifiers. In versions prior to 0.12.5, 0.13.3, and 1.0.4, a bypass
    exists for the fix to CVE-2025-27221 that can expose user credentials.
    When using the `+` operator to combine URIs, sensitive information
    like passwords from the original URI can be leaked, violating RFC3986
    and making applications vulnerable to credential exposure. Versions
    0.12.5, 0.13.3, and 1.0.4 fix the issue.
    https://www.cve.org/CVERecord?id=CVE-2025-61594

- CVE-2026-27820:
	The zstream_buffer_ungets function prepends caller-provided bytes
	ahead of previously produced output but fails to guarantee the backing
	Ruby string has enough capacity before the memmove shifts the existing
	data. This can lead to memory corruption when the buffer length exceeds
	capacity.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 90faed4c32..e8bf51ea43 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
-sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
+# https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
+sha512  356fb47cc56f2d25198cb95253fc20ff7d9a6fd1fa53bc475e5c440012aebe27562537c399d271357235114ade263fd625029b66cb0f9b526f9c04f169fb9580  ruby-3.4.9.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ffe42968b5..c56d2510be 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

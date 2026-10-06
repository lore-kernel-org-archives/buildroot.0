Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4676ECA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D29A80DF0;
	Tue,  6 Oct 2026 16:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZfklkDax_uD; Tue,  6 Oct 2026 16:37:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F93280DEB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304670;
	b=QxqlUqBQAY+OAgSS3qfivQ+FQGRpugVHPZEaX+BerG7MmK76aFcmlXhIdxc226EGe3O4
	 CF9NFvdu67BQBnldNIrijvMdL5Jv1UUXnR41ifsJm5ZwkbPIAsT4jC7nr2XWhhoXNTu0Z
	 w0LqNz8Gj0rXHXo8eSi2YddSUPFkvNddbNfjDUPpCJfKyy6cBBqUC09aCAv7dS8Y9Fg10
	 j6OWyzg9jysdX4s/bND7PJQUKOf5RGkhRZLKAP/wbsIGMowcDJHtfrMUSUfry2MDj0nIU
	 WJ+XPosDC8llW1FRf1oivhokNmasy3MGFPVw/HjBAxLHD6Nr4ahVrjhjTrBPl6WMNgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=il8HhYK2p/LLnIPYy1NtiA7jofRRuHr8+d3bi/KKo0/rq8xb9yqyTUCUV+i/x0Qh+Z94
	 9knfQjLoootXy1RzBrzAH9wH58hSJxu5zxMJ5hfUaKfJMzs9H5bNPCZ8P49It67mPjpVT
	 S3Hb6Cn6oHR8drpiYdBmBlmdfchjz17o7Gqn/o/JWXA5aHrne05/tCEiitObOOUm2w+xe
	 kupJZ+0R7W3Ov+Q1GPxA9CCJTTonkZJdeT7MD5ZPKxkWkJ6ZbQES+ZZbpXK7YRp++5FL8
	 vGdFphneW7uRUjgqpByfoJYOQcmjxLX2kCkRZ0DWpCmOARCcOWlS94lKAaiVuLtXutA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304670;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcM7gMVSQQ9CGwvR1SymxoL6VCKQduZp7FHpDbC57FVy1Hvv2gYO8+gYamGQ8bafu
	 remZuGwNYMP7ypnrHmVZ4O7ah/n9gbT4yhVn/Rpe9al/ivVY5CxzbMEXSXCFLQasHg
	 JPPwrGIXCKUE/tEAv8/YOJu+OS75WKCAt1sjXPdjGrBcxG9tEKzPzJd8aK7WZTq8tE
	 +WVaGIsOYZU/ZrQYRCaQQVm2/RMo6YH/AkupT+pYROQl4FoFH/ggftwAPnH5aiS28M
	 OefwPZfopWyIiRiBvUceybHV7kVL6l4ig9K2hNKxVdLPZcCyo/yk02PrGiH1CogDs+
	 /I46a6KsysLfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F93280DEB;
	Tue,  6 Oct 2026 16:37:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E34317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02F4E60809
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMgD7tPbrAFY for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:33:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E74C4607E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304429;
 b=eHspfRyo1CjN4EJQMADMUdDwnARmZevmsWMMGJ4fiQKA5TEzbG4ex6A4YjWTl/fTkGT6
 vSGw4IoqFSKytAfOhhpoqHRNOFG9FncP/BLDRd1iauueIoGu8DVKbtZlzMXP/Igl+PuLN
 r45Fk1YcWGvcBhquKQodbiVfd63nby0Uzu7PLFN1OsqVHRl6CBmoA4v53AXlf715T6Lmf
 9I/ukPvqLVt4cNDRXCAyVVJK3w7z57fKP0LP97NYukXzv9PcfR0AIZIpucdskTC/t3Q7y
 hE+RDJ9vJO8bnNj4zsMZmMv9KagZCMzfj4AIwfNvIjoeXhzUFb0YyXX8x5f9Mc2+tKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304429;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=pRRNvXj0veKiDzwUJxPy+YajJmRl82OInOI/Z0UwDIYviFCqcT+URYNO3xY5YtTnYxDE
 PChP+igx+SnIeG6P1P9t9IpDCDkuFawardY/vTPSkHI+NNkLDIjVC5DKMQZj4s5cDA5YI
 PQxiNV2M0xXERFCAMHeBtHOfnjm5vy5ox25jGBG5v/tkj7Jm363mxwxIkrSzKWEbaAgPH
 3dKKg839a1fxNq2OstQL7SgZQnRGBYT6mMgd5wUSSNhaxoudkwOzNuPZZEMnMXXWSbLSF
 xHQOprcRfen8Tm3QzWfAH8T9ZGbI+iFYD9gguE7vJ3YguyYbI4Jfb8Q4F0+TP96Xbvw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uEqXhT9R; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=uEqXhT9R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74C4607E5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303710;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=uEqXhT9R+y1zUYohaiKwlh0iIKJBsUqSQhiyIiMHDuFRMy9ndzMFbaz6Pt2Zmxvlc
 40bqv/1cwUJJvpv35NHOcSkTtO0Js/n/aUlBI78oSZgBzCZ3AH/Y35/NUq1unZvJBT
 Hcq6WeUFkaSkP7PQkmcsqL7K89FoicxOc91ApgQfju5MM0oYQ7vcN7f3/kkDfIQ55Y
 Y8K+MPb/1eUTJa0hy7xgvY4WmiTy1FOkJsiNZsE7OIjNJhH3zwNdJDXrM3J/INXddc
 OTLfu5Yq+fmmQS6ksLtKXE1Cr0a4Rt6b2PT/qpVRdsT3zG84pFkJ4eSTxMfsyGwOqw
 1X9X68PFgYMFg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 xx21Ouu48hjJuG8NOTlIh45CP7F7DNpReJPV+sr1AE/15piZloGCbguyi/i5ocNPCOk1o2RIFsM
 LvMfaN/O/yA3BtnSPIlJHyzV1MK+nJi4db/PV5FpIzxGtA4U92r8tH+InKopHsOvoJowoeNppqy
 YuxcyruTCG6I4MRw7cGugBMRiBzeBItaTEt6bCaBqu4xwtkAm7IUo23LOoM0cIWFue371yIndgL
 VgzZbDG0ElpwbFjtFUWQGoukCswvlhyGHYy14AQfdidKZ1fVcXoUgucndmALSZVc0+otXqG8Xw7
 1lqSuBKihbyml2TCvgvMePVXXtPITGuGKeK/IwAv3Vn7jryxg1WulY2NyqNoLC0XEwo+F7brrQP
 y9dtLUu8QerosAYFtnmWpHuP1EaRjXr44gHNlGwihQalAVlfuHR6d4LmjGEBgAER3Bz0Nv1+XHy
 FvrlDCVoTbGJsK2E5xPZGxn6/SF3KqkvOfYoZrKJjC9TkiqKgBpgXotT6nAcMtUwjMBzzWV0f3v
 IhrAt2yWf7D2IW7znRLyek0/siPQo/ID7lk2/sUpKRpa/NHj5Hr9WJ22mE4+ndiBsqTFW/9T4PY
 yH2loe4=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88ADBA4C5530
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uk-000000000ir-3V1t
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:18 +0200
Message-ID: <20261006162106.3439373-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 37/84] package/luvi: fix build without c++
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

Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
package to 2.15.0 which first included upstream commit
https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
that added the miniz submodule.

The version of miniz used by luvi contains commit
https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
which removed "C" from the project variable causing a dependency to c++
which causes build errors when the toolchain does not support c++:

-- Check for working CXX compiler: /bin/false - broken

This dependency was not intended so we add an upstream commit to fix the
problem.

Fixes:
https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..c68e05bdc7
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,47 @@
+From 383e551cccf41fc2ce1177712d6a37a85d936642 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:56:00 +0200
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag,
+but should instead only have added a simple
+enable_language call for tests only.
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/miniz/CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 156df83..e0933f8 100644
+--- a/deps/miniz/CMakeLists.txt
++++ b/deps/miniz/CMakeLists.txt
+@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+-  project(miniz)
++  project(miniz C)
+   set(CMAKE_C_STANDARD 90)
+   set(CMAKE_VERBOSE_MAKEFILE ON)
+   # set(CMAKE_C_VISIBILITY_PRESET hidden)
+@@ -309,6 +309,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++  enable_language(CXX)
+   set(CMAKE_CXX_STANDARD 20)
+   set(CMAKE_CXX_STANDARD_REQUIRED YES)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
